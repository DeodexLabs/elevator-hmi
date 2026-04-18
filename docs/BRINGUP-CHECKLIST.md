# EM3566 v3 — first Yocto image bring-up checklist

Canonical lab checklist for **Boardcon EM3566 v3** + project **`kas`** workspace. Project context: [`CLAUDE.md`](../CLAUDE.md). Tasks: [`AGENTS.md`](../AGENTS.md). Board collateral index: [`library/EM3566/README.md`](../library/EM3566/README.md).

---

## 1. Build host (TASK-002)

- Use **Ubuntu 22.04 or 24.04 LTS** — both are allowed by [`scripts/setup-build-host.sh`](../scripts/setup-build-host.sh) (TASK-002 originally validated **22.04**; **24.04** uses the same package set in this repo).
- Run **`./scripts/setup-build-host.sh`** once (requires `sudo` for `apt-get`). This installs Scarthgap host deps including **`lz4c`** (`liblz4-tool`), without which BitBake stops immediately (`HOSTTOOLS`). If you skip the script, install at least **`liblz4-tool`** before **`kas build`**.
- Ensure **`kas`** is on **`PATH`** (for example `pip install --user kas` → add `~/.local/bin` to **`PATH`**).
- From the **repository root** (so `KAS_WORK_DIR` is the project root), run builds — see [`README.md`](../README.md).

---

## 2. Build images with kas

Default manifest: **`kas/elevator-hmi.yml`** — **`MACHINE = elevator-hmi-em3566`**, **`target: core-image-minimal`**.

Smoke sequence (same as **TASK-105**; optional one-shot script **`./scripts/kas-build-task-105.sh`** — see [`scripts/README.md`](../scripts/README.md)):

```bash
cd /path/to/elevator-hmi
mkdir -p build-logs

kas build kas/elevator-hmi.yml --target u-boot-rockchip 2>&1 | tee build-logs/u-boot-rockchip.log
kas build kas/elevator-hmi.yml --target virtual/kernel 2>&1 | tee build-logs/virtual-kernel.log
kas build kas/elevator-hmi.yml 2>&1 | tee build-logs/core-image-minimal.log
```

- Logs under **`build-logs/`** are **gitignored**; keep them locally for A1 / diary notes.
- **`kas dump kas/elevator-hmi.yml`** — quick manifest sanity check (no BitBake).

---

## 3. Where outputs land (after a green build)

Typical deploy directory (Yocto default layout under the kas build dir):

- **`build/tmp/deploy/images/elevator-hmi-em3566/`**

Expect (among others) a **`.wic`** eMMC image and Rockchip **`rockchip-image`** artefacts (e.g. **`rootfs.img`** symlink to ext4 — see BitBake log on success). Exact filenames vary by **`IMAGE_NAME`** / version; use **`ls -la`** on that directory after **`do_image_complete`**.

**TASK-105 / lab:** A green **`kas build`** on this manifest has produced **`core-image-minimal-elevator-hmi-em3566.rootfs.wic`** plus **`loader.bin`**, **`idblock.img`**, **`uboot.img`** under the path above — see **`diary/PROGRESS.md`** (2026-04-18 lab milestone) for a stable **`rkdeveloptool`** command block using those symlinks.

**Partition geometry** comes from **`meta-hmi-platform/wic/elevator-hmi-emmc.wks.in`** (TASK-003). Do **not** change the **`.wks`** file without an A1 task spec.

---

## 4. UART console (host ↔ board)

- Use the carrier **serial / debug headers** for **U-Boot + Linux** logs (interim diagnostics — [`CLAUDE.md`](../CLAUDE.md) §8).
- **Pinout / connector table:** [`library/EM3566/Usermanual/EM3566_hardware_manual.md`](../library/EM3566/Usermanual/EM3566_hardware_manual.md) (see TOC **§2.14 UART (J10, J11, J12)** and board overview for **debug** vs **UART1/2**).
- **Baud:** Rockchip BSPs commonly use **115200 8N1** — confirm against **meta-rockchip** / vendor U-Boot defconfig for your exact image if serial is garbage.

---

## 5. Display: MIPI LCD + LMT101

- Attach **LMT101SX006C** (when available) to the carrier **`MIPI LCD`** connector — **not** a generic “LVDS-only” assumption; see [`library/EM3566/README.md`](../library/EM3566/README.md) and **`BLK-002`** in [`diary/BLOCKERS.md`](../diary/BLOCKERS.md).
- **JD9365 XRES / `reset-gpios`:** open **`BLK-006`** — do **not** invent a **`reset-gpios`** line without a **traced** net / cited GPIO.

---

## 6. Flashing / upgrade tools (no invented offsets)

This checklist does **not** document **`rkdeveloptool` / `upgrade_tool` / RKDevTool** partition offsets or loader addresses — those depend on the exact **loader + GPT + image** bundle and are easy to get wrong without the vendor flow.

**In-repo references (owner reads and follows vendor steps):**

- [`library/EM3566/Linux6.1/Usermanual/EM3566 linux6.1 user manual_V1.0.md`](../library/EM3566/Linux6.1/Usermanual/EM3566%20linux6.1%20user%20manual_V1.0.md) — vendor Linux 6.1 bring-up (includes RKDevTool references).
- [`library/EM3566/Linux6.1/Tools/RKDevTool/RKDevTool_Release/RKDevTool_manual_v1.2_en.md`](../library/EM3566/Linux6.1/Tools/RKDevTool/RKDevTool_Release/RKDevTool_manual_v1.2_en.md) — RKDevTool manual (Windows-centric; still authoritative for many Boardcon flows).
- **meta-rockchip** README (in the **`meta-rockchip`** checkout created by **`kas`**) — **`upgrade_tool` / `.wic`** notes upstream.

**Unknown until bench:** which single command-line invocation your lab standardizes on for flashing the **`.wic`** produced above — record the **working** command in [`diary/PROGRESS.md`](../diary/PROGRESS.md) after the first successful flash.

### Lab-verified notes (2026-04-18)

- **`rkdeveloptool db …loader.bin`** may return *“The device does not support this operation!”* on this kit while the device still enumerates as **`2207:350a`**. **`wl`** / **`rd`** can still succeed — **`db` is not always required** for **`wl 0` (WIC)**, **`wl 64` (idblock)**, **`wl 0x4000` (uboot)**. Full copy-paste block: **`diary/PROGRESS.md`** (2026-04-18 lab milestone entry).
- **Deploy paths** (after `kas build` from repo root): **`build/tmp/deploy/images/elevator-hmi-em3566/`** — use symlinks **`core-image-minimal-elevator-hmi-em3566.rootfs.wic`**, **`uboot.img`**, **`idblock.img`**, **`loader.bin`** so commands survive image timestamp bumps.
- **U-Boot:** Vendor **`CONFIG_BOOTDELAY=0`** gives no time to interrupt; project fragment adds **`CONFIG_BOOTDELAY=5`** — rebuild **`u-boot-rockchip`** and reflash **`uboot.img`** to apply.
- **Early shell (`init=/bin/sh`):** `tty` may be **not a tty** → interactive **`passwd`** fails silently; use **`chpasswd`** or fix **`/dev`** (single **`devtmpfs`** on **`/dev`**) or **`openssl passwd -6`** + **`/etc/shadow`** edit. Login banner may show **`ttyFIQ0`** while **`console=ttyS2`** is also on cmdline.

---

## 7. After boot

- Confirm root on expected **eMMC** device (`mmcblk0`, …) vs project partition story in [`CLAUDE.md`](../CLAUDE.md) §5.
- **`/data`** partition intent is documented in the **`.wks`** comments and CLAUDE — validate mount behaviour when you enable that partition in the image.

---

*TASK-107 — last updated 2026-04-18 (§6 lab notes: rkdeveloptool, deploy symlinks, U-Boot bootdelay, rescue shell).*
