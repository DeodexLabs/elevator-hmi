# EM3566 v3 — Flash procedure (`rkdeveloptool`)

Exact lab steps for **Boardcon EM3566 v3** + **`core-image-minimal`** WIC and Rockchip loader artefacts. Project context: [`CLAUDE.md`](../CLAUDE.md), full bring-up: [`BRINGUP-CHECKLIST.md`](BRINGUP-CHECKLIST.md).

Run **`rkdeveloptool` on the host** (not inside a Docker/kas-only environment where `sudo`/USB may not work).

---

## Prerequisites

- **`rkdeveloptool`** installed on the **host** (not inside a build container).
- **USB OTG** cable: **board → host** (recovery / download port per EM3566 v3 silk/markings).
- **Build outputs** present under the kas build tree (paths relative to **repository root** unless noted):

  `build/tmp/deploy/images/elevator-hmi-em3566/`

---

## Required files (all in deploy dir)

| File | Role |
|------|------|
| `loader.bin` | Download-boot (“Maskrom”) helper — **`db`** step |
| `idblock.img` | IDBlock @ flash offset **64** sectors |
| `uboot.img` | U-Boot @ flash offset **0x4000** sectors |
| `core-image-minimal-elevator-hmi-em3566.rootfs-<timestamp>.wic` | Full eMMC image (GPT + partitions) @ offset **0** |

A stable symlink **`core-image-minimal-elevator-hmi-em3566.rootfs.wic`** may exist; prefer **`ls -t *.wic`** to pick the newest timestamped file.

---

## Step 1 — Enter Maskrom mode

1. Power **OFF** the board.
2. **Hold** the **RECOVERY** button on EM3566 v3.
3. Plug the **USB OTG** cable (**board → host**).
4. **Release** RECOVERY after ~**2** seconds.
5. Verify on the host:

   ```bash
   lsusb | grep 2207
   ```

   - **`2207:350a`** — **Maskrom** mode (normal for first **`db`**).
   - **`2207:0006`** — **Loader** mode — **skip** the **`db`** step below (see Step 3).

---

## Step 2 — Identify latest WIC

From the **repository root** (or any directory, using an explicit path):

```bash
DEPLOY=build/tmp/deploy/images/elevator-hmi-em3566
WIC=$(ls -t "$DEPLOY"/*.wic | head -1)
echo "Will flash: $WIC"
```

After **`cd`** into **`$DEPLOY`** (Step 3), resolve again so the name is correct for **`wl`**:

```bash
cd "$DEPLOY"
WIC=$(ls -t *.wic | head -1)
echo "Will flash: $WIC"
```

---

## Step 3 — Flash (run from deploy directory)

```bash
cd build/tmp/deploy/images/elevator-hmi-em3566/
WIC=$(ls -t *.wic | head -1)
```

**Maskrom mode (`2207:350a`):**

```bash
sudo rkdeveloptool db loader.bin
sudo rkdeveloptool wl 0 "$WIC"
sudo rkdeveloptool wl 64 idblock.img
sudo rkdeveloptool wl 0x4000 uboot.img
sudo rkdeveloptool rd
```

**Loader mode (`2207:0006`) — skip `db`:**

```bash
sudo rkdeveloptool wl 0 "$WIC"
sudo rkdeveloptool wl 64 idblock.img
sudo rkdeveloptool wl 0x4000 uboot.img
sudo rkdeveloptool rd
```

**Note:** On some units, **`db`** returns *“The device does not support this operation!”* while the device still shows **`2207:350a`**. **`wl`** may still work — **`db` is not always required** for **`wl 0` (WIC)**; see lab notes in [`diary/PROGRESS.md`](../diary/PROGRESS.md) (2026-04-18 milestone).

---

## Step 4 — Serial console

On the **host** (not inside the container):

```bash
sudo minicom -D /dev/ttyACM0 -b 1500000
```

Settings: **8N1**, **no** hardware flow control, **no** software flow control.

*(If your debug UART enumerates as **`/dev/ttyUSB0`** or uses **115200** baud, match the port/baud from [`docs/BRINGUP-CHECKLIST.md`](BRINGUP-CHECKLIST.md) §4 / vendor docs.)*

---

## Step 5 — Post-flash validation (on board as `root`)

```bash
# Partition layout / labels:
lsblk -f

# Fix GPT backup header mismatch (run once after first flash if kernel warns):
sgdisk -e /dev/mmcblk0

# Display / DRM pipeline (expect defer noise if no panel):
dmesg | egrep -i "iodomain|vccio|vop|dsi|panel|jd9365|drm|defer"

# RAUC:
rauc status
```

---

## Known issues

- **`sudo` blocked inside container** — run **`rkdeveloptool`** from a **host** terminal with USB passthrough as needed.
- **`db`** fails with *does not support* — device may be in **Loader** mode; **skip `db`**, or **`wl`** may still succeed in Maskrom (see Step 3 note).
- **GPT** warning *`6075217 != 15155199`* (or similar backup-header mismatch) — **expected** once; run **`sgdisk -e /dev/mmcblk0`** then reboot.
- **`ttyACM0`: permission denied** — `sudo usermod -aG dialout "$USER"` then **re-login** (or use `sudo minicom`).

---

*Last updated — project doc; offsets align with EM3566 v3 lab validation in [`diary/PROGRESS.md`](../diary/PROGRESS.md).*
