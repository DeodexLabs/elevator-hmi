# Development Diary — Elevator HMI

**Format:** One entry per session. Most recent entry first.

---

## 2026-04-19 — A1: TASK-114 `[DONE]` review

**Agent:** A1  
**Phase:** 1  

### Review
- **PASS** — **`docs/BRINGUP-CHECKLIST.md`** **§8** mirrors **`CLAUDE.md`** §2.1; cross-links valid; no **`.wks`** / partition edits; **§6** / **§5** closure rules consistent with project rules.

### Next
- A2: **`TASK-115`** on **`task/TASK-115-qt-image-parse`** (branch from latest **`origin/develop`**).

**Merge:** **`task/TASK-114-bringup-no-lcd`** fast-forwarded into **`develop`** and pushed (**`bc9ff05`** on **`origin/develop`**).

---

## 2026-04-19 — TASK-114: BRINGUP checklist §8 “Lab without LCD” (A2)

**Agent:** A2  
**Phase:** 1  

### Result
- **`docs/BRINGUP-CHECKLIST.md`** — new **§8 — Lab without LCD (EM3566 v3)** mirroring **`CLAUDE.md`** §2.1; cross-links to **`CLAUDE.md`** §2.1 and **`diary/PROGRESS.md`** for owner paste targets; **§6**/**§5** pointers (bootdelay, no invented GPIO).  
- **`AGENTS.md`** — **TASK-114** → **`[REVIEW]`**; sprint queue next **`[READY]`:** **TASK-115**.  
- **`CLAUDE.md`** — Phase checklist row for **TASK-114** updated (still unchecked until A1 **`[DONE]`**).  

**Branch:** **`task/TASK-114-bringup-no-lcd`** (from **`develop`** @ **`ad4354e`**).

---

## 2026-04-19 — A1: TASK-113 `[DONE]` review

**Agent:** A1  
**Phase:** 1  

### Review
- **PASS** — **`./scripts/kas-build-task-105.sh`** **exit 0** on Ubuntu **24.04** TASK-002-class host; **`build-logs/*.log`** tails + deploy artefact summary in **`diary/PROGRESS.md`** satisfy **TASK-113** acceptance (**equivalent** deploy listing). **2 WARNING** on **`core-image-minimal`** noted by A2; non-fatal.  
- **PASS** — no **`meta-rockchip` / `meta-qt6` / `meta-rauc`** edits. Owner **§2.1** on-target pastes correctly out of scope for **TASK-113**.  

### Next
- A2: **`TASK-114`** on **`task/TASK-114-bringup-no-lcd`** (from current **`develop`**).

**Merge:** **`task/TASK-113-kas-build-105-logs`** fast-forwarded into **`develop`** and pushed (**`b4eebf4`** on **`origin/develop`**).

---

## 2026-04-19 — TASK-113: green `kas-build-task-105.sh` + deploy listing (A2)

**Agent:** A2  
**Phase:** 1  

### Host
- **Ubuntu 24.04** LTS, **`lz4c`** on **`PATH`**, **`kas` 5.2** — TASK-002-class host (`setup-build-host.sh` previously applied on this machine).

### Result
- **`./scripts/kas-build-task-105.sh`** — **exit 0** (full sequence: **`u-boot-rockchip`**, **`virtual/kernel`**, **`core-image-minimal`**). Logs under **`build-logs/`** (gitignored).

### Log tails (last lines; full logs in `build-logs/*.log`)

**`u-boot-rockchip.log`**
```
NOTE: Tasks Summary: Attempted 1082 tasks of which 1063 didn't need to be rerun and all succeeded.
```

**`virtual-kernel.log`**
```
NOTE: Tasks Summary: Attempted 995 tasks of which 994 didn't need to be rerun and all succeeded.
```

**`core-image-minimal.log`**
```
NOTE: Tasks Summary: Attempted 4310 tasks of which 4280 didn't need to be rerun and all succeeded.
Summary: There were 2 WARNING messages.
TASK-105 smoke sequence finished OK.
```

### `ls -la build/tmp/deploy/images/elevator-hmi-em3566/` (excerpt)

Key artefacts (see deploy dir for full listing): **`core-image-minimal-elevator-hmi-em3566.rootfs.wic`** (symlink **`…rootfs.wic`**), **`Image`** / **`zboot.img`**, **`uboot.img`**, **`loader.bin`**, **`idblock.img`**, **`rootfs.img`** → ext4, **`update.img`**, **`elevator-hmi-boardcon-em3566-v3.dtb`**.

### Notes
- BitBake **WARNING** count on image: **2** (non-fatal; unchanged from prior green builds on this tree).
- **Owner (no LCD):** still follow **`CLAUDE.md`** §2.1 — paste **`lsblk -f`** / **`pre-LCD baseline`** **`dmesg`** here when run on **EM3566 v3** (optional **BLK-009** audit trail if you want a hardware cross-check vs WIC).

---

## 2026-04-19 — A1: no-LCD lab plan + TASK-113–TASK-116 `[READY]`

**Agent:** A1  
**Phase:** 1  

### Changes
- **`CLAUDE.md`**: new **§2.1 Phase 1 — Lab without LCD (owner checklist)** — reflash post–TASK-111 image, **`lsblk`**, GPT **`sgdisk -e`**, UART baseline, **`pre-LCD baseline`** **`dmesg`** (grep targets for **BLK-008** prep), **`rauc status`**, optional **eth/USB**, **U-Boot bootdelay** if still **0**; pointer to **TASK-106** when LMT101 arrives. Phase 0 checklist: owner no-LCD line + **TASK-114** pointer.
- **`AGENTS.md`**: **`TASK-113`** (TASK-105 green logs + **`PROGRESS.md`**), **`TASK-114`** (BRINGUP no-LCD section), **`TASK-115`** (`elevator-hmi-image` **`bitbake -p`** only), **`TASK-116`** (RAUC / systemd / D-Bus on minimal — **`meta-hmi-platform`** only). Queue: pick **one** task at a time. **BLK-008** blurb: **pre-LCD `dmesg`** baseline allowed per **`CLAUDE.md`** §2.1.

### Next
- A2: start **`TASK-113`** on **`task/TASK-113-kas-build-105-logs`** (or next in order). Owner: **`CLAUDE.md`** §2.1 on hardware without panel.

---

## 2026-04-18 — A1: TASK-112 `[DONE]` — merge + queue (develop @ 162f9c2)

**Agent:** A1  
**Phase:** 1  

### Review
- **`TASK-112`**: **PASS** — **Historical fence only** note under archived TASK-108; **`mmcblk0p4`** only in fence + explicit historical / TASK-112 spec text (grep).
- **Git:** **`git merge task/TASK-112-agents-rauc-doc`** on **`develop`** (fast-forward **`83ebcc8` → `162f9c2`**). Follow-up commit: **`AGENTS.md`** marks **`TASK-112`** **`[DONE]`**, A1 review line, sprint queue cleared of **`[REVIEW]`**.

### Next
- A2: no **`[READY]`** until A1 specs next task; **`TASK-106`** when **LMT101** arrives.

---

## 2026-04-18 — TASK-112: AGENTS archive note for TASK-108 RAUC fence (A2)

**Agent:** A2  
**Phase:** 1  

### Summary
- **`AGENTS.md`** — under archived **TASK-108**, added **Historical fence only** paragraph after the fenced **`system.conf`** example so **`p4`/`p5`** is not mistaken for current **`develop`** paths (**`p2`/`p3`** per **TASK-111** / **`elevator-hmi-emmc.wks.in`**). **`TASK-112`** → **`[REVIEW]`**; queue line updated.  
- **Branch:** **`task/TASK-112-agents-rauc-doc`** (one commit for PR).

---

## 2026-04-18 — A1: merge TASK-111 → `develop`, sprint handoff (`TASK-112` `[READY]`)

**Agent:** A1  
**Phase:** 1  

### Git
- **`git fetch origin && git merge origin/task/TASK-111-rauc-slot-paths`** on **`develop`** — **fast-forward** **`3775012` → `7502d2b`** (RAUC **`system.conf`** **`p2`/`p3`**, **BLK-009** closed on tree, **BRINGUP** §3, diary handoff entry from branch).
- Follow-up commit on **`develop`**: **`AGENTS.md`** marks **`TASK-111`** **`[DONE]`**, adds **`TASK-112`** **`[READY]`**, **`CLAUDE.md`** / this diary line (A1 sprint prep).

### A2 sprint
- **`TASK-111`** → **`[DONE]`** in **`AGENTS.md`**; **`TASK-112`** **`[READY]`** — archive note under TASK-108 so nobody copies legacy **`p4`/`p5`** from the historical **`system.conf`** fence.
- A2: **`git pull origin develop`**, branch **`task/TASK-112-agents-rauc-doc`**, one small commit, PR.

---

## 2026-04-18 — A2 handoff: `develop` synced, TASK-111 `[REVIEW]`, TASK-105 deploy note, checklist §3

**Agent:** A2  
**Phase:** 1  

### Git / branch
- **`git checkout develop && git pull origin develop`** — already up to date with **`origin/develop`** (**`3775012`**).
- **`TASK-111`** work on **`task/TASK-111-rauc-slot-paths`** (not merged until A1 **`[DONE]`**).

### TASK-105 deferred acceptance (host)
- Green image artefacts present under **`build/tmp/deploy/images/elevator-hmi-em3566/`** (e.g. **`core-image-minimal-elevator-hmi-em3566.rootfs.wic`** symlink, **`uboot.img`**, **`idblock.img`**, **`loader.bin`**, DTB) — matches 2026-04-18 lab milestone flash block.

### TASK-111 / BLK-009
- **`system.conf`:** RAUC rootfs slots **`/dev/mmcblk0p2`** (A) and **`/dev/mmcblk0p3`** (B) per **`elevator-hmi-emmc.wks.in`** (replaces legacy **`p4`/`p5`**). **`kas shell kas/elevator-hmi.yml -c "bitbake -p"`** OK.
- **`diary/BLOCKERS.md`:** **BLK-009** closed with WIC-based resolution; optional **`lsblk -f`** from target still requested for audit trail.

### Docs
- **`docs/BRINGUP-CHECKLIST.md`** §3 — cross-link TASK-105 deploy + **`PROGRESS.md`** flash commands.

---

## 2026-04-18 — Phase 1 lab milestone: U-Boot shell, root login, bring-up learnings (A1 + owner)

**Agent:** A1 (documentation); **execution:** owner on EM3566 v3  
**Phase:** 1  

### Vision / status

End-to-end **reference-board bring-up** is now credible: **flash → SPL/U-Boot → Linux → `root` login** on serial has been demonstrated. Remaining Phase 1 lab work shifts from “can the stack boot?” to **partition/OTA correctness**, **DSI + LMT101** (TASK-106, BLK-006/008), and **image hardening** (password policy, RAUC slot paths).

### Achievements (this cycle)

1. **U-Boot interrupt window** — Root cause of “cannot stop autoboot”: vendor **`CONFIG_BOOTDELAY=0`**. **`meta-hmi-platform/recipes-bsp/u-boot/files/elevator-hmi-emmc-boot.cfg`** now sets **`CONFIG_BOOTDELAY=5`** (rebuild + reflash **`uboot.img`** at sector **`0x4000`** to apply).
2. **Manual kernel boot from U-Boot** — **`booti ${kernel_addr_r} - ${fdt_addr_r}`** (not **`${0x00280000}`**); **`setenv bootargs`** with **`init=/bin/sh`** for one-time rescue when login was locked.
3. **`rkdeveloptool`** — **`db`** may return *“The device does not support this operation!”* while **`wl`** / **`rd`** still succeed; **`db` is optional** for updating **`uboot.img`** / **`.wic`** on this kit (see diary flash block below).
4. **Deploy paths** — Stable symlinks under **`build/tmp/deploy/images/elevator-hmi-em3566/`**: **`core-image-minimal-elevator-hmi-em3566.rootfs.wic`**, **`loader.bin`**, **`idblock.img`**, **`uboot.img`** (no placeholder filenames in lab commands).
5. **Root account** — **`core-image-minimal`** ships **`root:*:`** (locked). Early **`init=/bin/sh`** shell: **`tty` → not a tty** → interactive **`passwd`** exits immediately (reads empty password); **`echo 'root:…' | chpasswd`** works. Avoid stacking **`tmpfs` on `/dev`** over **`devtmpfs`** (hides **`/dev/ttyS2`**). Normal login banner: **`/dev/ttyFIQ0`** (kernel cmdline still uses **`ttyS2`** for UART2 — two consoles; expect interleaved logs if both are active).
6. **Confirmed:** **`root`** login at **`elevator-hmi-em3566 login:`** on **`ttyFIQ0`** after password set.

### Flash command block (copy-paste — repo on host)

Host paths: **`/home/sener/Projects/elevator-hmi/build/tmp/deploy/images/elevator-hmi-em3566/`** (adjust **`REPO`** if clone differs).

```bash
# Optional (often fails in Loader mode — skip if error):
sudo rkdeveloptool db /home/sener/Projects/elevator-hmi/build/tmp/deploy/images/elevator-hmi-em3566/loader.bin

sudo rkdeveloptool wl 0 /home/sener/Projects/elevator-hmi/build/tmp/deploy/images/elevator-hmi-em3566/core-image-minimal-elevator-hmi-em3566.rootfs.wic
sudo rkdeveloptool wl 64 /home/sener/Projects/elevator-hmi/build/tmp/deploy/images/elevator-hmi-em3566/idblock.img
sudo rkdeveloptool wl 0x4000 /home/sener/Projects/elevator-hmi/build/tmp/deploy/images/elevator-hmi-em3566/uboot.img
sudo rkdeveloptool rd
```

**U-Boot-only** (after rebuilding **`u-boot-rockchip`**): omit **`wl 0`** line; keep **`wl 0x4000`** (and optionally **`wl 64`**).

### Next steps on board (owner / A2 — ordered)

| Priority | Check | Command / action | Feeds |
|---:|---|---|---|
| 1 | **Partition map vs RAUC** | `lsblk -f` and `cat /proc/partitions` on target; paste into diary or TASK-111 | **BLK-009**, **TASK-111** |
| 2 | **GPT backup header** | `sgdisk -e /dev/mmcblk0` then `partprobe` (image includes **`gptfdisk`**) | clears **`GPT:… != …`** warning |
| 3 | **Kernel / panel DTS** | Full **`dmesg`** after boot; grep for **`vcc3v3_lcd0_n`**, **`vcca_1v8`**, **`backlight`**, **DSI**, **`jd9365`** | **BLK-008**, **TASK-106** prep |
| 4 | **Reflash U-Boot with bootdelay** | Rebuild **`u-boot-rockchip`** if not yet deployed; **`wl 0x4000 uboot.img`**; confirm countdown **5** | lab ergonomics |
| 5 | **RAUC** | `rauc status` / D-Bus once **`system.conf`** matches real **`mmcblk0pN`** | **BLK-009** |
| 6 | **Ethernet** | `ip link`, `dmesg \| grep -i eth` (expect caveats on dev kit PHY) | optional |
| 7 | **LMT101** | Cable to **MIPI LCD**; power; capture **`dmesg`** + photo of output | **TASK-106**, **BLK-006** |

### Product / process notes

- **Security:** Bring-up passwords must be rotated before any network exposure; prefer **`passwd`** on a real TTY or **`EXTRA_IMAGE_FEATURES`** dev-only recipe for factory flows.
- **Docs:** **`docs/BRINGUP-CHECKLIST.md`** updated with **`rkdeveloptool`** lab notes (see §6).

---

## 2026-04-18 — root=PARTUUID override fix, GPT backup header fix, gptfdisk (A1)

**Agent:** A1  
**Phase:** 1  

### Problems (observed on first boot)

1. **`root=PARTUUID=614e0000-0000` in kernel cmdline** despite extlinux.conf having `root=/dev/mmcblk0p2`. Kernel cannot find rootfs.

2. **`GPT:6075217 != 15155199`** — backup GPT header at wrong sector. WIC image is 2.9 GB (~6,075,217 sectors); eMMC is 7.23 GB (~15,155,199 sectors). Backup GPT in WIC image points to last sector of the image, not the device.

### Root cause analysis — PARTUUID override

Traced through Rockchip vendor U-Boot source:

- `sysboot` (extlinux boot) calls `env_set("bootargs", ...)` with extlinux `append` value — correct `root=/dev/mmcblk0p2`.
- Then `do_booti()` calls `fdt_chosen()` → `board_fdt_chosen_bootargs()` (Rockchip override in `board.c:1335`).
- This calls `bootargs_add_dtb_dtbo()` which reads `/chosen/bootargs` from the **static compiled-in DTB**.
- `rk3568-linux.dtsi` (included by our DTS chain via `rk3566-evb2-lp4x-v10-linux.dts`) sets: `chosen { bootargs = "earlycon=... console=ttyFIQ0 root=PARTUUID=614e0000-0000 rw rootwait"; }`
- `env_update()` (`nvedit.c:406`) performs a **key-match merge**: tokenizes both bootargs strings, replaces matching keys — so `root=PARTUUID=...` replaces `root=/dev/mmcblk0p2`.
- extlinux.conf `append` value is lost for the `root=` key.

### Fixes

**Fix 1 — DTS chosen.bootargs override** (`elevator-hmi-boardcon-em3566-v3.dts`):
```dts
&chosen {
    bootargs = "earlycon=uart8250,mmio32,0xfe660000 console=ttyS2,1500000 root=/dev/mmcblk0p2 rw rootfstype=ext4 rootwait";
};
```
- earlycon address `0xfe660000` verified from `rk356x.dtsi` uart2 node (`reg = <0x0 0xfe660000 0x0 0x100>`).
- ttyFIQ0 replaced with ttyS2 (EM3566 v3 debug UART).
- Overrides the `rk3568-linux.dtsi` `root=PARTUUID=` so `env_update()` merges the correct values.
- NOTE: `UBOOT_EXTLINUX_BOOTPREFIXES` does NOT exist in OE/meta-rockchip — not added. DTS override is the correct fix.

**Fix 2 — `scripts/fix-gpt.sh`**: One-time post-flash script:
```bash
sgdisk -e /dev/mmcblk0   # relocates backup GPT to actual last sector
partprobe /dev/mmcblk0   # reload partition table without reboot
```
Run once after first boot.

**Fix 3 — `gptfdisk` in image**: Added to `IMAGE_INSTALL:append` in `core-image-minimal.bbappend` so `sgdisk` is available on the target.

### Commit

`c297a53` — `[phase1][dts/image] fix root=PARTUUID override, GPT backup header, add gptfdisk`

### Build result

`kas build kas/elevator-hmi.yml` — **4310 tasks, all succeeded** (4225 from sstate). 2 warnings (non-fatal).  
Build time: 12:38:32 → 12:43:21 (~5 min, kernel compile via sstate cache).

### Post-build verification

**extlinux.conf in WIC boot partition** (mtype from WIC `@@32768s`):
```
default Yocto
label Yocto
   kernel /Image
   fdt /elevator-hmi-boardcon-em3566-v3.dtb
   append root=/dev/mmcblk0p2 rw rootfstype=ext4 rootwait console=ttyS2,1500000
```

**DTB `/chosen/bootargs`** (strings on deploy DTB):
```
earlycon=uart8250,mmio32,0xfe660000 console=ttyS2,1500000 root=/dev/mmcblk0p2 rw rootfstype=ext4 rootwait
```

No `PARTUUID` in either. `env_update()` will now merge `root=/dev/mmcblk0p2` (not replace it). ✓

### Next actions

1. Re-flash board with new WIC image.
2. On first boot, run via UART console: `sh /usr/sbin/fix-gpt.sh`
3. Verify kernel cmdline: should show `root=/dev/mmcblk0p2` (not `root=PARTUUID=`).
4. Confirm rootfs mounts and login prompt appears on ttyS2.
5. Expand partition sizes to production (rootfs 2048M, data 4096M) after boot confirmed.

---

## 2026-04-18 — Fix extlinux.conf: explicit fdt via WKS --configfile (A1)

**Agent:** A1  
**Phase:** 1  

### Problem

U-Boot was using `fdtdir /` in extlinux.conf and guessing the DTB filename from `$fdtfile` env var. It chose `rockchip-evb_rk3568.dtb` instead of our `elevator-hmi-boardcon-em3566-v3.dtb`, causing kernel load failure.

### Root cause analysis

Two separate extlinux.conf generators exist:

1. **`uboot-extlinux-config.bbclass`** — U-Boot recipe task (`do_create_extlinux_config`). Writes `${B}/extlinux.conf`. Reads `UBOOT_EXTLINUX_ROOT`, `UBOOT_EXTLINUX_FDT`, `UBOOT_EXTLINUX_CONSOLE` from BitBake. Used by U-Boot recipe deployment only — NOT what ends up in the WIC boot partition.

2. **`bootimg-partition.py` WIC plugin** — Generates `extlinux/extlinux.conf` inside the vfat boot partition. **Completely hardcoded** — ignores all `UBOOT_EXTLINUX_*` BitBake variables. Scans `install_task` for `.dtb` files, always writes `fdtdir /`. Root device comes from `cr.rootdev` (WKS rootdev). The only override hook is `bootloader --configfile <filename>` in the WKS file.

### Fix

1. Created `meta-hmi-platform/wic/elevator-hmi-extlinux.conf` with explicit `fdt` line:
   ```
   default Yocto
   label Yocto
      kernel /Image
      fdt /elevator-hmi-boardcon-em3566-v3.dtb
      append root=/dev/mmcblk0p2 rw rootfstype=ext4 rootwait console=ttyS2,1500000
   ```
   Placed in `meta-hmi-platform/wic/` — `find_canned()` searches layer `wic/` dirs by filename.

2. Updated `elevator-hmi-emmc.wks.in`: `bootloader --ptable gpt --configfile elevator-hmi-extlinux.conf`

3. Kept `UBOOT_EXTLINUX_ROOT / CONSOLE / FDT` in machine conf — required by `do_create_extlinux_config` bbclass (fatal if ROOT is absent). Added `UBOOT_EXTLINUX_FDT` for the bbclass path too. Updated comments to document the two-path architecture.

### Verified extlinux.conf (from new WIC boot partition via mtools)

```
default Yocto
label Yocto
   kernel /Image
   fdt /elevator-hmi-boardcon-em3566-v3.dtb
   append root=/dev/mmcblk0p2 rw rootfstype=ext4 rootwait console=ttyS2,1500000
```

**No `fdtdir` line. Explicit `fdt` confirmed. ✓**

### Commits

| Hash | Message |
|------|---------|
| `c74316d` | `[phase1][machine] set explicit UBOOT_EXTLINUX_FDT to fix DTB lookup` (superseded — was wrong approach) |
| `35a05fb` | `[phase1][wic] fix extlinux.conf — explicit fdt via WKS --configfile` |
| `91a12a4` | `[phase1][machine] restore UBOOT_EXTLINUX_ROOT/CONSOLE/FDT for bbclass` |

### Next actions

- Owner: re-flash board with new WIC (same procedure as 2026-04-18 first boot entry)
- Expected UART boot path: `distro_bootcmd` → `mmc 0:1` → `extlinux/extlinux.conf` → loads `/Image` + `/elevator-hmi-boardcon-em3566-v3.dtb` → kernel start
- A1: monitor for BLK-008 phandle errors in dmesg after first successful boot

---

## 2026-04-18 — WIC bring-up fixes: IMAGE_BOOT_FILES, partition sizes, extlinux, GPT, boot offset (A1)

**Agent:** A1  
**Phase:** 1  

### Summary

Six sequential WIC/build defects identified and fixed during eMMC bring-up, all applied directly to `develop`. Each fix was supervisor-reviewed before proceeding. No flash tonight — session closed with WIC verified and flash procedure documented for next session.

### Fix 1 — IMAGE_BOOT_FILES unset (`do_image_wic` failure)

`bootimg-partition` WIC plugin raises `WicError` when `IMAGE_BOOT_FILES` is unset. `meta-rockchip` never sets this variable. Deploy dir produces `Image` and `elevator-hmi-boardcon-em3566-v3.dtb` flat (Yocto kernel recipe strips `arch/arm64/boot/` prefix).  
**Fix:** Added to `meta-hmi-platform/conf/machine/elevator-hmi-em3566.conf`:
```bitbake
IMAGE_BOOT_FILES = "Image elevator-hmi-boardcon-em3566-v3.dtb"
```
Commit: `5cf6b39`

### Fix 2 — `do_image_wic_ufs` failure (UFS not eMMC)

`rockchip-image` bbclass adds a `do_image_wic_ufs` task for 4K-sector UFS images. This project targets eMMC. Overrode to no-op in `core-image-minimal.bbappend`.  
Commit: `a37356f`

### Fix 3 — WIC image 8.7 GB causing flash tool failure at 83%

Production partition sizes (rootfs_a 2048M, rootfs_b 2048M, data 4096M) produced an 8.7GB image too large for reliable `rkdeveloptool` single-write. Reduced for bring-up:
- `rootfs_a`: 2048M → 1024M
- `rootfs_b`: 2048M → 1024M
- `data`: 4096M → 512M
- Added `IMAGE_OVERHEAD_FACTOR = "1.1"` to `core-image-minimal.bbappend`.

New total: ~2.6 GB fixed + rootfs overhead. Target after first boot confirmed: restore production sizes.  
Commit: `c02c6a1`

### Fix 4 — Boot partition had files but no extlinux.conf (silent scan failure)

`bootimg-partition` without `--sourceparams "loader=u-boot"` copies `IMAGE_BOOT_FILES` into the partition but exits `do_configure_partition` early — no `extlinux/extlinux.conf` generated. `bootimg-efi` attempted first (wrong — requires a loader param, fails with "bootimg-efi requires a loader, none specified"). Reverted and added correct `--sourceparams "loader=u-boot"`.

WKS boot line:
```
part /boot --source bootimg-partition --sourceparams "loader=u-boot" --ondisk mmcblk0 --fstype=vfat --label boot --active --align 4 --size 64M
```
Boot partition verified via `mdir`: `Image`, `elevator-hmi-boardcon-em3566-v3.dtb`, `extlinux/extlinux.conf`.  
Commit: `744a831`

### Fix 5 — Missing GPT declaration (U-Boot cannot find boot partition by GPT label)

WKS was creating DOS/MBR by default. Added `bootloader --ptable gpt` as first line of WKS.  
`fdisk -l` confirmed: `Disklabel type: gpt`.  
Commit: `dc21a6c`

### Fix 6 — Boot partition FAT corrupted by idblock.img at sector 64

Hardware bring-up U-Boot serial confirmed `PartType: EFI` (GPT working) but `fatls mmc 0:1` returned `0 file(s), 1 dir(s)` with a garbage directory entry. Root cause: WIC p1 started at sector 40; `rkdeveloptool wl 64 idblock.img` writes at sector 64 which is **inside** p1, overwriting FAT tables.

Investigation confirmed:
- `bootloader` directive does NOT support `--offset` (checked `ksparser.py` — only `--ptable`, `--append`, `--configfile`, `--timeout`, `--source`)
- `part` DOES support `--offset` via `sizetype("K", True)` — accepts `M` suffix

**Fix:** `--offset 16M` on boot part → forces p1 start to sector 32768 (16 MB), safely past both idbloader (sector 64 = 32 KB) and U-Boot FIT (sector 16384 = 8 MB).  
Commit: `a2acb82`

### Final verified WIC state (supervisor-approved)

| Check | Result |
|---|---|
| Partition table | GPT ✓ |
| p1 (boot/vfat) start sector | 32768 ✓ — clear of idblock (64) and uboot (16384) |
| p1 size | 83.2M ✓ |
| p2 rootfs_a | 1.3G ✓ |
| p3 rootfs_b | 1.0G ✓ |
| p4 data | 512M ✓ |
| Total image size | 2.9G ✓ |
| No overlap with bootloader chain | Confirmed ✓ |
| Boot partition contents | `Image`, `elevator-hmi-boardcon-em3566-v3.dtb`, `extlinux/extlinux.conf` ✓ |

### U-Boot serial findings (from hardware bring-up before Fix 6)

```
PartType: EFI                          ← GPT confirmed
bootcmd=boot_android ${devtype} ${devnum};boot_fit;bootrkp;run distro_bootcmd;
boot_targets=mmc1 mmc0 mtd2 mtd1 mtd0 usb0 pxe dhcp
Scanning mmc 0:1...                    ← reaches our boot partition via distro_bootcmd
fatls mmc 0:1 → 0 file(s)             ← FAT corrupted by idblock overlap (now fixed)
ext4ls mmc 0:2 → Linux root tree ✓    ← rootfs_a correctly populated
```

`bootcmd` path: Android (fails) → boot_fit (fails) → bootrkp (fails) → `distro_bootcmd` → scans mmc0:1 for `extlinux/extlinux.conf`. With Fix 6 applied, this scan should now succeed.

### Tomorrow — First boot flash procedure

```bash
# 1. Enter Maskrom (hold RECOVERY + power on)
lsusb | grep 2207:   # must show 2207:350a

# 2. Load bootloader
sudo rkdeveloptool db build/tmp/deploy/images/elevator-hmi-em3566/loader.bin

# 3. Flash full WIC
sudo rkdeveloptool wl 0 build/tmp/deploy/images/elevator-hmi-em3566/core-image-minimal-elevator-hmi-em3566.rootfs-20260417223520.wic

# 4. Write idbloader at sector 64
sudo rkdeveloptool wl 64 build/tmp/deploy/images/elevator-hmi-em3566/idblock.img

# 5. Write U-Boot FIT at sector 16384
sudo rkdeveloptool wl 0x4000 build/tmp/deploy/images/elevator-hmi-em3566/uboot.img

# 6. Reboot
sudo rkdeveloptool rd
```

Expected:
```
PartType: EFI
Scanning mmc 0:1...
Found /extlinux/extlinux.conf
Retrieving file: /Image
Starting kernel ...
[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x412fd050]
```

### Next actions
- Owner: execute first boot flash sequence above; log full UART output in diary
- A1 (next session): review `dmesg` for BLK-008 phandle errors (`vcc3v3_lcd0_n`, `vcca_1v8`, `backlight`)
- A1 (next session): spec TASK-111 for RAUC slot device path correction (system.conf uses `mmcblk0p4/p5` but WIC GPT p2/p4 are rootfs_a/data; confirm correct slot device numbers after first boot partition listing)

---

## 2026-04-17 — TASK-109 A1 review fix — DISTRO_FEATURES removed from image recipe (A1)

**Agent:** A1  
**Phase:** 1  

### Review outcome
- **All checks passed** except one defect (see below).
- **Process issue:** A2 left all changes uncommitted on `task/TASK-109-qt-eglfs-image`. A1 applied the fix and committed everything as the first commit on the branch.

### Defect fixed
`DISTRO_FEATURES:remove = "x11 wayland"` removed from `elevator-hmi-image.bb`. Image recipes cannot reliably modify `DISTRO_FEATURES`. Already handled in `meta-hmi-platform/conf/distro/elevator-hmi.conf` (TASK-108). Replaced with an explanatory comment.

### STEP 3 check results

| Check | Result |
|---|---|
| `LAYERSERIES_COMPAT = "scarthgap"` | **PASS** |
| `BBFILE_PRIORITY_hmi-app = "9"` | **PASS** |
| `LAYERDEPENDS` includes `qt6-layer` | **PASS** |
| `LAYERDEPENDS` includes `rauc` | **PASS** (acceptable — bundle.bb needs it) |
| `inherit core-image` | **PASS** |
| `inherit rockchip-image` | **PASS** |
| `WKS_FILE = "${ELEVATOR_HMI_EMMC_WKS}"` | **PASS** |
| No X11/Wayland in `IMAGE_INSTALL` | **PASS** |
| `QT_QPA_PLATFORM=eglfs` via profile.d + environment.d | **PASS** |
| `packagegroup-qt6-essentials` (not minimal — documented) | **PASS** |
| `elevator-hmi-app` in `IMAGE_INSTALL` | **PASS** |
| `gstreamer1.0` + `gstreamer1.0-plugins-base` | **PASS** |
| `inherit qt6-cmake` | **PASS** |
| `DEPENDS = "qtbase qtdeclarative"` | **PASS** |
| Installs to `/usr/bin/elevator-hmi` (via `CMAKE_INSTALL_BINDIR`) | **PASS** |
| `LICENSE` set | **PASS** |
| QML: `import QtQuick` (not Qt5 compat) | **PASS** |
| QML: `Window` with visible element | **PASS** |
| `bitbake -p elevator-hmi-image` — exit 0, 0 errors | **PASS** |

---

## 2026-04-17 — TASK-109 Qt EGLFS image + placeholder app (A2)

**Agent:** A2  
**Phase:** 1  

Implemented **TASK-109** on branch **`task/TASK-109-qt-eglfs-image`**: **`meta-hmi-app`** layer priority **9**; **`elevator-hmi-image`** (`core-image` + **`rockchip-image`** + project **`WKS_FILE`**); **`packagegroup-qt6-essentials`** (substitution for non-existent **`packagegroup-qt6-minimal`** in pinned meta-qt6); **`QT_QPA_PLATFORM=eglfs`** via **`profile.d`** + **`environment.d`**; **`elevator-hmi-app`** stub (CMake + QML **`Window`** / **`elevator-hmi`** text) → **`/usr/bin/elevator-hmi`**. **`AGENTS.md`** TASK-109 → **`[REVIEW]`** with output notes.

**Smoke:** `kas shell kas/elevator-hmi.yml -c "bitbake -p elevator-hmi-image"` — exit **0**, **0** parse errors; **`bitbake-layers`** shows **`hmi-app`** at priority **9**.

**Next:** A1 review → **`[DONE]`** / merge; full image **`kas build elevator-hmi-image`** on TASK-002 host when ready.

---

## 2026-04-16 — TASK-108 merged [DONE], TASK-109 released to A2 (A1)

**Agent:** A1  
**Phase:** 1  

### TASK-108 — [DONE]
RAUC skeleton merged to `develop` (supervisor-approved after DISTRO_FEATURES fix). Deliverables:
- `meta-hmi-platform/conf/distro/elevator-hmi.conf` — project distro conf; `DISTRO_FEATURES:append = " rauc"` and `DISTRO_FEATURES:remove = "x11 wayland"` placed here (not in machine conf).
- `meta-hmi-platform/recipes-images/files/system.conf` — `compatible=elevator-hmi`; slots rootfs_a/b on `/dev/mmcblk0p4` / `p5`; `bootloader=u-boot`.
- `meta-hmi-platform/recipes-images/elevator-hmi-rauc-system-conf/elevator-hmi-rauc-system-conf.bb` — installs `system.conf` to `/etc/rauc/`.
- `meta-hmi-platform/conf/layer.conf` — `LAYERDEPENDS` includes `rauc`.
- `meta-hmi-platform/recipes-core/images/core-image-minimal.bbappend` — `rauc` and `elevator-hmi-rauc-system-conf` added to `IMAGE_INSTALL`.
- `scripts/rauc-gen-keys.sh` + `certs/README.md` — dev key generation script (gitignored certs).
- `meta-hmi-app/recipes-images/elevator-hmi-bundle.bb` — RAUC bundle stub (`inherit bundle`, `RAUC_BUNDLE_COMPATIBLE`), PLACEHOLDER comment.
- `kas/elevator-hmi.yml` — `distro: elevator-hmi`; `local_conf_header` block.

**Note:** `local_conf_header` DISTRO line is redundant with kas top-level `distro:` setting. Harmless. Clean up when kas manifest is next touched.

Branch `task/TASK-108-rauc-skeleton` deleted local and remote after merge.

### TASK-109 released to A2
Queue header updated: "TASK-109 `[READY]` — A2 pick up now." A2 should branch `task/TASK-109-qt-eglfs-image` from `develop`.

### Next actions
- A2: pick up **TASK-109** (branch `task/TASK-109-qt-eglfs-image` from `develop`).
- Owner: order LMT101SX006C panel (TASK-106 / BLK-006 unblock).
- Owner: run `./scripts/kas-build-task-105.sh` on TASK-002 host for deferred TASK-105 acceptance.

---

## 2026-04-16 — TASK-108: RAUC skeleton (A2)

**Agent:** A2  
**Phase:** 1  

### Summary
- **`meta-hmi-platform/recipes-images/files/system.conf`** + **`elevator-hmi-rauc-system-conf.bb`** → **`/etc/rauc/system.conf`**; **`LAYERDEPENDS`** **`rauc`**; **`core-image-minimal.bbappend`** installs **`rauc`** + config package; **`elevator-hmi-em3566.conf`** **`DISTRO_FEATURES:append = " rauc"`** (meta-rauc README).  
- **`scripts/rauc-gen-keys.sh`** + **`certs/README.md`**; **`.gitignore`** explicit **`certs/*.pem`**, **`certs/*.key`**; verified **`git add -A`** does not stage ignored key material.  
- **`meta-hmi-app/recipes-images/elevator-hmi-bundle.bb`** stub (**`inherit bundle`**, **`RAUC_BUNDLE_COMPATIBLE`**); **`meta-hmi-app/conf/layer.conf`** **`LAYERDEPENDS`** **`rauc`** + **`BBFILES`** for **`recipes-images/*.bb`**.  
- **Smoke:** **`kas shell … bitbake -p`** — 0 errors; **`IMAGE_INSTALL`** includes **`rauc`** **`elevator-hmi-rauc-system-conf`**. **Branch:** **`task/TASK-108-rauc-skeleton`**. **`AGENTS.md`** TASK-108 → **`[REVIEW]`**.

### Next
- A1: review TASK-108; then TASK-109 per queue (**after** 108 **`[DONE]`**).

---

## 2026-04-16 — TASK-110 merged, TASK-108 released to A2, BLK-008 logged (A1)

**Agent:** A1  
**Phase:** 1  

### TASK-110 — [DONE]
Supervisor-approved bbappend fixes merged to `develop` and synced to `main`:
1. `KERNEL_CONFIG:append` removed; replaced with `elevator-hmi-panel.cfg` fragment in `SRC_URI:append` — correct Yocto mechanism for kernel config options via `kernel_configme`.
2. `do_configure:append()` added to `install -m 0644` both DTS/DTSI files from `WORKDIR` into `${S}/arch/arm64/boot/dts/rockchip/` — required because non-patch `SRC_URI` files land in WORKDIR, not the kernel source tree.
Branch `task/TASK-110-bbappend-fix` deleted local and remote after merge.

### TASK-108 released to A2
A2 queue header updated: "TASK-108 `[READY]` — A2 pick up now. TASK-109 depends on TASK-108 done."
TASK-110 added to completed tasks table in AGENTS.md.

### BLK-007 numbering note
BLK-007 was already used (closed 2026-04-15 — Noble `libegl1-mesa`). New phandle validation blocker logged as **BLK-008**.

### BLK-008 logged
New open blocker: DTS phandle validation at bench — `vcc3v3_lcd0_n`, `vcca_1v8`, `backlight` assumed from BSP EVB2 tree. Must verify no `-ENOENT` errors in first-boot `dmesg`. Owner: A1 at TASK-106.

### Next actions
- A2: pick up **TASK-108** (branch `task/TASK-108-rauc-skeleton` from `develop`).
- Owner: order LMT101SX006C panel (TASK-106 / BLK-006 unblock).
- Owner: run `./scripts/kas-build-task-105.sh` on TASK-002 host for deferred TASK-105 acceptance.

---

## 2026-04-16 — Morning audit: branch cleanup, main sync, R-05, TASK-108/109 queued (A1)

**Agent:** A1  
**Phase:** 0 → 1  

### AUDIT-1 — Stale remote branch cleanup

All 5 merged task branches confirmed **FULLY_MERGED** into `develop` (zero unmerged commits):
- `task/TASK-101-lmt101-dts` — deleted local + remote
- `task/TASK-102-uboot-emmc` — deleted local + remote
- `task/TASK-103-core-image-minimal` — deleted local + remote
- `task/TASK-104-boardcon-machine-dts` — deleted local + remote
- `task/TASK-105-107-lab-handoff` — deleted local + remote

### AUDIT-2 — TASK-104 status

TASK-104 (`boardcon-machine-dts`) is **`[DONE]`** in `AGENTS.md` (archived, A1-reviewed 2026-04-15). My session-start report listed it implicitly under "TASK-101 through TASK-105 `[DONE]`" — terminology was not explicit enough. No action required.

### AUDIT-3 — develop / main sync

`develop` was 10 commits ahead of `main` (all from Phase 1 work: TASK-101 through TASK-107 merges and diary commits). Merged `develop` → `main` via `--no-ff`; pushed to `origin/main`. Both branches now at same commit.

### AUDIT-4 — R-04 checkbox closed

`CLAUDE.md` §2 Phase 0 checklist: R-04 checkbox **closed**. Line updated to: "Accepted — adaptive backlight dimming scheduled for Phase 3 (TASK-3xx). LED lifetime risk documented in R-04."

### BLK-006 → R-05

BLK-006 (JD9365D XRES reset line not mapped on EM3566 v3 CON1) escalated to **R-05** in `CLAUDE.md` §6 open risks table. Risk severity: **Medium**. Status: **OPEN** — bench validation required when LMT101 panel arrives. BLK-006 entry in `diary/BLOCKERS.md` remains unchanged (resolution criteria unchanged).

### TASK-108 and TASK-109 queued

- **TASK-108** `[READY]` — RAUC skeleton: `system.conf` (`compatible=elevator-hmi`, slots rootfs_a/b on mmcblk0p4/p5), `scripts/rauc-gen-keys.sh`, `certs/README.md`, `.gitignore` cert exclusions, `meta-hmi-app` bundle recipe stub, `rauc` added to image install.
- **TASK-109** `[READY]` — Qt/EGLFS image skeleton: `meta-hmi-app/conf/layer.conf` (BBFILE_PRIORITY 9, scarthgap, qt6-layer dep), `elevator-hmi-image.bb` (core-image + Qt 6 packages, EGLFS, no X11/Wayland), placeholder app recipe (`elevator-hmi-app_0.1.bb`). **Depends on TASK-108 `[DONE]`** — A2 must not start TASK-109 until TASK-108 is merged.

### Next actions
- A2: pick up **TASK-108** (branch `task/TASK-108-rauc-skeleton` from `develop`).
- Owner: order LMT101SX006C panel to unblock TASK-106.
- Owner: run `./scripts/kas-build-task-105.sh` on TASK-002 host and record green output here (deferred TASK-105 acceptance).

---

## 2026-04-15 — Session end summary (A2)

**Agent:** A2  
**Phase:** 0 / 1  

### Host / TASK-002
- **Ubuntu 24.04.4 LTS** (`schone`) confirmed as lab build host; repo text and **`scripts/setup-build-host.sh`** now allow **`VERSION_ID`** **22.04** or **24.04** with the same Scarthgap-oriented package list.
- **Noble package drift:** **`libegl1-mesa`** is not in Ubuntu **24.04** archives → script installs **`libegl1`** + **`libegl-mesa0`** on **24.04**, keeps **`libegl1-mesa`** on **22.04**.
- **`setup-build-host.sh`** run completed on owner host; **`command -v lz4c`** → **`/usr/bin/lz4c`**; **`kas --version`** → **5.2** (HOSTTOOLS / **`lz4c`** path unblocked).

### Kas smoke / TASK-105 / TASK-102
- **`kas dump kas/elevator-hmi.yml`**: **exit 0** (machine **`elevator-hmi-em3566`**, pinned layers).
- **Recipe append fix:** **`u-boot-rockchip_%.bbappend`** did not bind to **`u-boot-rockchip.bb`** → renamed **`meta-hmi-platform/recipes-bsp/u-boot/u-boot-rockchip.bbappend`**.
- **Smoke target fix:** Rockchip **`PREFERRED_PROVIDER_virtual/bootloader = u-boot-rockchip`** — **`scripts/kas-build-task-105.sh`**, **`docs/BRINGUP-CHECKLIST.md`**, **`scripts/README.md`** now use **`--target u-boot-rockchip`** and tee **`build-logs/u-boot-rockchip.log`** (not **`u-boot`**).
- **Still open for this host:** let **`kas build … --target u-boot-rockchip`** / full **`./scripts/kas-build-task-105.sh`** finish; then append **exit 0** evidence + **`ls -la build/tmp/deploy/images/elevator-hmi-em3566/`** (expect **`.wic`** after **`core-image-minimal`**) to a new diary line when done.

### Repo / diary / coordination
- **`README.md`**, **`CLAUDE.md`**, **`AGENTS.md`**, **`diary/BLOCKERS.md`** (new closed **BLK-007**) updated in this session.
- **Git:** session changes committed with **`[diary] 2026-04-15 session summary`**.

---

## 2026-04-15 — Phase B (TASK-105): `kas dump` OK; smoke script + U-Boot bbappend fixes (A2)

**Agent:** A2  
**Phase:** 1  
**Host:** Ubuntu 24.04.4 LTS (`schone`), **`lz4c`** + **`kas 5.2`** after **`setup-build-host.sh`**.

### Done
- **B1 / B2:** Repo root **`/home/sener/Projects/elevator-hmi`**; **`kas dump kas/elevator-hmi.yml`** exit **0** (machine **`elevator-hmi-em3566`**, layers as manifest).
- **B3 blockers fixed (repo):**
  1. **`u-boot-rockchip_%.bbappend`** did not apply to **`u-boot-rockchip.bb`** (unversioned recipe filename) → renamed to **`meta-hmi-platform/recipes-bsp/u-boot/u-boot-rockchip.bbappend`**.
  2. **`kas build --target u-boot`** invalid when **`PREFERRED_PROVIDER_virtual/bootloader = u-boot-rockchip`** → **`scripts/kas-build-task-105.sh`**, **`docs/BRINGUP-CHECKLIST.md`**, **`scripts/README.md`** now use **`--target u-boot-rockchip`** and log **`build-logs/u-boot-rockchip.log`**.
- **Docs:** **`README.md`**, **`CLAUDE.md`**, **`AGENTS.md`**, **`diary/PROGRESS.md`** references updated from **`u-boot-rockchip_%.bbappend`** to **`u-boot-rockchip.bbappend`**.

### In progress / next
- **`kas build kas/elevator-hmi.yml --target u-boot-rockchip`** was started to validate fixes (log: **`build-logs/u-boot-rockchip-smoke.log`**); first-from-scratch graph ~**1082** tasks — expect a long run. When it finishes, run **`./scripts/kas-build-task-105.sh`** for the full **u-boot-rockchip → virtual/kernel → core-image-minimal** sequence.
- **B4:** **`.wic`** appears under **`build/tmp/deploy/images/elevator-hmi-em3566/`** only after **`core-image-minimal`** succeeds — append **`ls -la`** of that dir + final log tail here when green.

---

## 2026-04-15 — Build host guidance: Ubuntu 24.04 LTS + script allow-list (A2)

**Agent:** A2  
**Phase:** 1  

### Summary
- Owner PC is **Ubuntu 24.04.4 LTS** with Yocto/poky minimal builds; repo copy still read as **22.04-only** after TASK-002.
- **`scripts/setup-build-host.sh`**: **`VERSION_ID`** may be **22.04** or **24.04** (same package list). **`lz4c`** / **HOSTTOOLS** failure on the earlier agent run was **missing `liblz4-tool`**, not an OS ceiling.
- Docs updated: **`README.md`**, **`scripts/README.md`**, **`docs/BRINGUP-CHECKLIST.md`**, **`CLAUDE.md`**, **`AGENTS.md`** (TASK-105 archive clarification), **`scripts/kas-build-task-105.sh`** header comment.

### Next
- On **24.04**: run **`./scripts/setup-build-host.sh`** once if deps are not pinned, then **`./scripts/kas-build-task-105.sh`**; append green **`exit 0`** + deploy listing to this diary when available.

---

## 2026-04-15 — TASK-105 / TASK-107 A1 review [DONE], merge to `develop` (A1)

**Agent:** A1  
**Phase:** 1  

### Review
- **TASK-107** **`[DONE]`** — **`docs/BRINGUP-CHECKLIST.md`** meets spec; **`README.md`** + **`library/EM3566/README.md`** links; in-repo citation paths verified.  
- **TASK-105** **`[DONE]`** — **`scripts/kas-build-task-105.sh`** + **`scripts/README.md`**; **`lz4c`** / HOSTTOOLS failure on **24.04** documented — **green build** still for owner on **TASK-002 22.04** (append success to **`diary/PROGRESS.md`**).  
- **Process:** combined branch **`task/TASK-105-107-lab-handoff`** — noted in **`AGENTS.md`**; prefer one task per branch later.

### Git
- Committed on task branch; **`develop`** merged (`--no-ff`); pushed **`origin/develop`**.

---

## 2026-04-15 — TASK-105 + TASK-107: kas smoke script + bring-up checklist (A2)

**Agent:** A2  
**Phase:** 1  

### Summary
- **TASK-105:** **`scripts/kas-build-task-105.sh`** + **`scripts/README.md`** section — sequential **`kas build`** (**`u-boot`**, **`virtual/kernel`**, **`core-image-minimal`**) with logs under **`build-logs/`** (gitignored). Ran three builds on Composer host → **HOSTTOOLS** failure (**`lz4c`** missing); logs captured. **Green image acceptance** remains for **Ubuntu 22.04 TASK-002** host. **`AGENTS.md`** TASK-105 → **`[REVIEW]`** with log excerpts.  
- **TASK-107:** **`docs/BRINGUP-CHECKLIST.md`** — TASK-002, kas commands, deploy dir, UART (**`EM3566_hardware_manual.md`** §2.14), **MIPI LCD**, flash doc pointers (**no** invented **`rkdeveloptool`** offsets). **`README.md`** + **`library/EM3566/README.md`** link to checklist. **`AGENTS.md`** TASK-107 → **`[REVIEW]`**.  
- **Branch:** **`task/TASK-105-107-lab-handoff`** (both tasks one linear branch; split commits if preferred).

### Next
- **Owner / TASK-002 host:** **`./scripts/kas-build-task-105.sh`** → confirm **exit 0**; paste deploy paths + log tails into **`AGENTS.md`** TASK-105 output notes (or new session).  
- **A1:** Review TASK-105 / TASK-107; **`[DONE]`** when satisfied.

---

## 2026-04-15 — A1 queue: TASK-105/107 READY, TASK-106 blocked (A1)

**Agent:** A1  
**Phase:** 1  

### Plan (next on roadmap after TASK-101–103)
1. **TASK-105** **`[READY]`** — On a **TASK-002** build host, run a **green `kas build`** (image + optional **`u-boot`** / **`virtual/kernel`**) and save **logs** under **`build-logs/`**; prove the Yocto stack end-to-end.  
2. **TASK-107** **`[READY]`** — Single **bring-up checklist** doc (flash + UART + kas), linked from **`README.md`**, no guessed flash offsets.  
3. **TASK-106** **`[BLOCKED]`** until **LMT101** is on hand — **DSI / BLK-006** bench and **`dmesg`** evidence.

### Later (not yet `[READY]` in queue)
- RAUC signing / bundle recipe (**keys** — new A1 task spec before A2).  
- Qt / EGLFS image + **`meta-hmi-app`** (roadmap Phase 2+).  
- **`main`** promotion vs **`develop`** (owner).

### Git
- **`AGENTS.md`** updated with **TASK-105**, **TASK-106**, **TASK-107** definitions.

---

## 2026-04-15 — TASK-103 A1 review [DONE], merge to `develop`, push (A1)

**Agent:** A1  
**Phase:** 1  

### Review
- **TASK-103** approved: **`core-image-minimal.bbappend`** inherits **`rockchip-image`** and sets **`WKS_FILE`** to **`ELEVATOR_HMI_EMMC_WKS`** (TASK-003); **`kas dump`** smoke OK; full **`kas build`** deferred to TASK-002 host (`lz4c` / BitBake), same as TASK-102/104.

### Git
- Committed on **`task/TASK-103-core-image-minimal`**, pushed; **`develop`** merged (`--no-ff`) and pushed.

### Optional — kas build logs (when a proper build host exists)
- On Ubuntu **22.04** after **`scripts/setup-build-host.sh`**, run e.g.  
  `kas build kas/elevator-hmi.yml --target u-boot 2>&1 | tee build-logs/u-boot.log`  
  `kas build kas/elevator-hmi.yml --target virtual/kernel 2>&1 | tee build-logs/kernel.log`  
  `kas build kas/elevator-hmi.yml 2>&1 | tee build-logs/core-image-minimal.log`  
- Store under **`build-logs/`** (gitignored) or attach excerpts to **`diary/PROGRESS.md`** — not required for TASK-103 **`[DONE]`** sign-off.

### Next
- **A1:** Add next **`[READY]`** tasks in **`AGENTS.md`** (bench validation, image flash doc, RAUC, Qt, etc.).  
- **Owner / lab:** green **`kas build`** + first eMMC flash on **EM3566 v3**.

---

## 2026-04-15 — TASK-103: core-image-minimal + rockchip-image / project WIC (A2)

**Agent:** A2  
**Phase:** 1  

### Summary
- **`meta-hmi-platform/recipes-core/images/core-image-minimal.bbappend`**: **`inherit rockchip-image`** (Rockchip ext4 + WIC + kernel image layout per **`meta-rockchip`** class) and **`WKS_FILE = "${ELEVATOR_HMI_EMMC_WKS}"`** so images use **`wic/elevator-hmi-emmc.wks.in`** (TASK-003) instead of BSP default **`generic-gptdisk.wks.in`**.  
- **Branch:** `task/TASK-103-core-image-minimal` (from **`develop`**). **`AGENTS.md`**: TASK-103 → **`[REVIEW]`** with output notes.  
- **Smoke:** **`kas dump kas/elevator-hmi.yml`** succeeded. **`kas build`** not executed here — **`lz4c`** not on **`PATH`**; install **`liblz4-tool`** / TASK-002 host deps before BitBake (same as TASK-102/104 deferred smoke).

### Next
- A1: review TASK-103; on TASK-002 host run **`kas build kas/elevator-hmi.yml`** (+ optional **`virtual/kernel`** / **`u-boot`** targets).

---

## 2026-04-15 — TASK-102 A1 review [DONE], merge to `develop`, push (A1)

**Agent:** A1  
**Phase:** 1  

### Review
- **TASK-102** approved: `meta-hmi-platform/recipes-bsp/u-boot/` bbappend + **`*.cfg`** fragment merged via Poky **`u-boot-configure.inc`** / **`merge_config.sh`**; **`UBOOT_LOCALVERSION`**; machine comments only. No community-layer edits. **`kas build … u-boot`** not proven on review host (`lz4c`) — deferred to TASK-002 / **TASK-103**.

### Git
- Committed on **`task/TASK-102-uboot-emmc`**, pushed; **`develop`** merged (`--no-ff`) and pushed.

### Next
- **A2:** **`TASK-103`** only in queue — branch from **`develop`**, then **`[REVIEW]`** for A1.

---

## 2026-04-15 — TASK-102: U-Boot eMMC Kconfig fragment + bbappend (A2)

**Agent:** A2  
**Phase:** 1  

### Summary
- **`meta-hmi-platform/recipes-bsp/u-boot/u-boot-rockchip.bbappend`** + **`files/elevator-hmi-emmc-boot.cfg`** — merge MMC / GPT / DW MMC / raw-partition options (aligned with vendor `rk3568_defconfig` at `SRCREV a93658f8…`); `UBOOT_LOCALVERSION = "-elevator-hmi-emmc"`.  
- **`elevator-hmi-em3566.conf`** — comments on eMMC bring-up, WIC, inherited `rk3568_defconfig`.  
- **Smoke:** `kas build kas/elevator-hmi.yml --target u-boot` — **failed** before BitBake (**`lz4c`** / HOSTTOOLS on review host).  
- **Branch:** `task/TASK-102-uboot-emmc`.

---

## 2026-04-15 — TASK-104 A1 review [DONE], merge to `develop`, push (A1)

**Agent:** A1  
**Phase:** 1  

### Review
- **TASK-104** approved: `meta-hmi-platform` machine + board DTS + DSI0 panel overlay + kas machine; community layers untouched. **`kas build … virtual/kernel`** not proven on review host (`lz4c`) — deferred to TASK-002 host / **TASK-103** acceptance.

### Git
- **`task/TASK-104-boardcon-machine-dts`:** A1 status commit (`AGENTS` / `CLAUDE` / `PROGRESS`); **pushed** to `origin`.  
- **`develop`:** merged task branch (`--no-ff`); **pushed** to `origin`.

### Next for A2 / owner
- **`git checkout develop && git pull`**, then **TASK-102** or **TASK-103** (one at a time).  
- Run **`scripts/setup-build-host.sh`** on the build machine, then **`kas build kas/elevator-hmi.yml --target virtual/kernel`** to close smoke.  
- Bench: **EM3566 v3 + LMT101** on **MIPI LCD** for **BLK-006** / DSI0 caveat.

### Next A1 session (prep)
- **Review queue:** When A2 submits **`[REVIEW]`**, run the same gate: community layers read-only, Scarthgap syntax, acceptance vs spec.  
- **TASK-104 follow-up:** Log a green **`kas build … virtual/kernel`** (or attach CI) when available; no new task unless DTS changes after bench.  
- **Specs:** Tighten **TASK-102** / **TASK-103** acceptance in `AGENTS.md` if A2 needs clearer U-Boot vs image boundaries (optional before pick-up).  
- **Product:** **`main`** promotion / release tagging remains **owner** decision; `develop` is now integration head through TASK-104.

---

## 2026-04-15 — TASK-104: A2 verification + commit on task branch (A2)

**Agent:** A2  
**Phase:** 1  

### Verification (against TASK-104 spec)
- **meta-hmi-platform only:** machine `elevator-hmi-em3566.conf`, board DTS include chain, panel `.dtsi` on **`&dsi0`** with BSP phandles, `linux-rockchip_%.bbappend` `SRC_URI`, `kas/elevator-hmi.yml` machine — matches task report.  
- **Community layers:** no `meta-rockchip` / `meta-qt6` / `meta-rauc` diffs in working tree.  
- **Smoke:** not green on review host (no `lz4c`); documented in `AGENTS.md` TASK-104 output notes.  
- **Hygiene:** fixed wrong script path in TASK-103 note (`scripts/setup-build-host.sh`).

### Git
- Committed all TASK-104 changes on **`task/TASK-104-boardcon-machine-dts`** for A1 review (later **`[DONE]`** on 2026-04-15).

---

## 2026-04-15 — Git: TASK-101 commits + merge to `develop` + push (A1)

**Agent:** A1  
**Phase:** 1 prep  

### Actions taken
- On **`task/TASK-101-lmt101-dts`:** three commits — `[phase1][kernel]` TASK-101 artifacts, `[docs]` `library/EM3566/README.md`, `[diary]` queue/blocker/CLAUDE/PROGRESS/BLOCKERS state.  
- **`develop`:** merged task branch (`--no-ff`); **`git push origin develop`**.  
- **`task/TASK-101-lmt101-dts`:** pushed to `origin` for archive. **A2** should **`git checkout develop` && `git pull`** before starting **TASK-104** (or any new task branch from current `develop`).

---

## 2026-04-15 — EM3566 v3 dev kit on hand; TASK-102/103 unblocked (A1 / owner)

**Agent:** A1 (state update — owner input)  
**Phase:** 1  

### Recorded
- Owner confirms **Boardcon EM3566 v3** (**CM3566**) dev kit **on hand**.  
- **`AGENTS.md`:** **TASK-102** and **TASK-103** set to **`[READY]`**; phase gate note updated; suggested A2 order **TASK-104 → TASK-102 → TASK-103**.  
- **`CLAUDE.md`:** Phase checklist — dev kit item checked **on hand**; `bitbake core-image-minimal` line clarified (panel + TASK-103 path).

---

## 2026-04-15 — TASK-101 reviewed [DONE]; TASK-104 queued; BLK-005 closed (A1)

**Agent:** A1 (Claude Code)  
**Phase:** 0 / Phase 1 prep  

### Actions taken
- **TASK-101** (branch `task/TASK-101-lmt101-dts`): A1 code review — **APPROVED → `[DONE]`**.  
  - **0002** patch: optional `reset-gpios`, `devm_gpiod_get_optional`, null-safe `prepare`/`unprepare`, 135 ms rail-delay path — matches **BLK-006** rationale; applies after **0001**.  
  - **`elevator-hmi-lmt101sx006c-panel.dtsi`:** `&dsi` / panel graph + merge guidance for existing `ports`; documents phandle placeholders.  
  - **`linux-rockchip_%.bbappend`:** Scarthgap `SRC_URI` / `KERNEL_CONFIG:append`; no community-layer edits.  
  - **Caveat recorded:** `elevator-hmi,lmt101sx006c` uses `cz101b4001_desc` until LMT101-specific timings are validated on silicon.  
  - **Reminder:** Commit `0002`, `.dtsi`, and `bbappend` on the task branch before owner merges to `main`/`develop` (working tree had uncommitted artifacts at review time).  
- **`AGENTS.md`:** TASK-101 marked done; **TASK-104** `[READY]` — Boardcon machine DTS + `KERNEL_DEVICETREE` + kas/bitbake kernel smoke (spec in queue). TASK-102/103 remain blocked on dev kit + validated build.  
- **`CLAUDE.md`:** Phase 0 checklist — TASK-101 completion + TASK-104 pointer.  
- **`diary/BLOCKERS.md`:** **BLK-005** closed as *not in project scope* (OV13850). **BLK-006** remains open until bench.

### Next actions
- A2: branch `task/TASK-104-boardcon-machine-dts` (or similar), implement TASK-104 when BSP path is known.  
- Owner: commit/merge TASK-101 branch after verifying git state; EM3566 v3 + LMT101 bench for BLK-006.

---

## 2026-04-15 — TASK-102: U-Boot eMMC Kconfig fragment + bbappend (A2)

**Agent:** A2  
**Phase:** 1  

### Summary
- **`meta-hmi-platform/recipes-bsp/u-boot/u-boot-rockchip.bbappend`** + **`files/elevator-hmi-emmc-boot.cfg`** — merge MMC/GPT/raw-partition options aligned with vendor **`rk3568_defconfig`**; **`UBOOT_LOCALVERSION`**.  
- **`elevator-hmi-em3566.conf`** — eMMC / WIC / U-Boot inheritance comments.  
- **`kas build … --target u-boot`:** blocked on host **`lz4c`** (TASK-002 host setup).  
- **Branch:** `task/TASK-102-uboot-emmc`.

---

## 2026-04-15 — TASK-104: Boardcon EM3566 machine + LMT101 on DSI0 (A2)

**Agent:** A2  
**Phase:** 1  

### Summary
- Added **`meta-hmi-platform/conf/machine/elevator-hmi-em3566.conf`** (`require rockchip-rk3566-evb.conf`, `KERNEL_DEVICETREE = rockchip/elevator-hmi-boardcon-em3566-v3.dtb`).  
- Added **`elevator-hmi-boardcon-em3566-v3.dts`** including **`rk3566-evb2-lp4x-v10-linux.dts`** + rewrote **`elevator-hmi-lmt101sx006c-panel.dtsi`** as **`&dsi0`** overlay: `/delete-node/` stock EVB `panel@0` and `ports/port@1`, jadard `panel@0`, phandles **`vcc3v3_lcd0_n`**, **`vcca_1v8`**, **`backlight`** (from pinned `linux-rockchip_6.1` BSP DTS at `SRCREV ea9e2a93…`).  
- **`kas/elevator-hmi.yml`:** default `machine: elevator-hmi-em3566`. **`linux-rockchip_%.bbappend`:** `SRC_URI` for new `.dts`.  
- **Smoke:** `kas build … --target virtual/kernel` failed on this host — missing **`lz4c`** (`HOSTTOOLS`); document install + re-run.  
- **Branch:** `task/TASK-104-boardcon-machine-dts`.

---

## 2026-04-15 — `library/EM3566/README.md` (lab + compliance index)

**Agent:** A2  
**Phase:** 0 / 1  

Added [`library/EM3566/README.md`](../library/EM3566/README.md): folder map, **EM3566 v3 + LMT101 / MIPI LCD** bring-up steps tied to **BLK-006**, in-repo doc pointers, and **owner-only** product/compliance notes (**R-01** / closed **BLK-001**, dev kit vs production carrier).

---

## 2026-04-15 — TASK-101: LMT101 / JD9365 DSI fragment + kernel follow-up patch (A2)

**Agent:** A2 (Composer)  
**Phase:** 1 prep  

### Summary
- Picked up **TASK-101** (DTS for JD9365 / LMT101SX006C). Delivered reference **`elevator-hmi-lmt101sx006c-panel.dtsi`** under `meta-hmi-platform/recipes-kernel/linux/files/` and **`0002-drm-panel-jadard-lmt101sx006c-compatible-optional-reset.patch`** (product `compatible`, optional `reset-gpios` in binding + `devm_gpiod_get_optional` in driver).  
- **Rationale:** EM3566 CON1 / in-tree schematic do not document **JD9365 XRES** → **RK3566 GPIO**; **BLK-006** opened. Patch 0002 avoids inventing a reset line while still allowing a valid DT node.  
- Extended **`linux-rockchip_%.bbappend`** with patch 0002, dtsi in `SRC_URI`, and `CONFIG_DRM_PANEL_JADARD_JD9365DA_H3=y`.  
- **Follow-up:** Boardcon machine DTS must `#include` the fragment (or merge `&dsi` content), align regulator/backlight labels, resolve `ports` merge if VOP `port@0` already exists; bench-validate on EM3566 v3 + LMT101.  
- Work on git branch **`task/TASK-101-lmt101-dts`**.

---

## 2026-04-16 — Interim SoM link: UART serial console (A1)

**Agent:** A1 (documentation)  
**Phase:** 0 / 1 prep  

### Decision captured
- While **elevator fieldbus** (RS-485 / CAN-FD) stays **deferred** (BLK-004), **Phase 0/1 “communication” to the SoM** is **UART serial** from a **host PC** to the board (**EM3566 v3** debug / UART headers per `library/EM3566/`) for **boot trace, image behaviour, systemd, RAUC**, and early logging.
- `CLAUDE.md` §1 **Protocol** row and §8 **PAL** bullets updated; **BLK-004** addendum in `diary/BLOCKERS.md`. Typical Rockchip BSP console **115200 8N1** noted as “confirm in BSP” — not a hardware spec from unverified GPIO numbers.

---

## 2026-04-16 — Reference hardware: EM3566 v3 carrier + MIPI LCD connector (A1)

**Agent:** A1 (documentation)  
**Phase:** 0 / 1 prep  

### Recorded in repo
- **Boardcon EM3566 v3** documented as the **reference development kit / carrier** for CM3566 (sources: `library/EM3566/` schematic, manuals, block diagram).
- Expert / board summary incorporated: multiple display paths (HDMI, LVDS, **MIPI LCD**, eDP, BT656); **LMT101 bench wiring** → **EM3566 v3 `MIPI LCD`** connector; underlying signals remain SoM **muxed LVDS/MIPI TX** (also routed to optional LVDS OUT).
- `CLAUDE.md` identity table + R-02; `diary/BLOCKERS.md` BLK-002 addendum; `AGENTS.md` gate note; **TASK-101** set to **`[READY]`** (R-02 mitigated; dependency is dev kit + panel in hand).

---

## 2026-04-15 — BLK-001–004 closed from owner/vendor inputs (A1)

**Agent:** A1 (documentation)  
**Phase:** 0  

### Blocker resolutions (see `diary/BLOCKERS.md`)
- **BLK-001 / R-01:** Vendor confirms CM3566 **operated 4 h @ −20°C ±2°C** in reliability testing; datasheet **recommended** range remains **0°C–70°C** — closed as **mitigated with documented caveat** (formal acceptance before production still advised).
- **BLK-002 / R-02:** Hardware manual: display lanes on SoM are **MIPI-DSI / LVDS multiplexed** (pins 25–34); FPC is on **carrier** — not “MIPI-only” at module. Closed with action: **carrier must select MIPI-DSI** for LMT101; schematic review on target carrier before layout lock.
- **BLK-003:** Backlight boost IC pick **deferred** — constant backlight acceptable for current LCD path.
- **BLK-004:** RS-485 vs CAN-FD **deferred** — no comms PHY planning for now; `CLAUDE.md` identity + PAL notes updated.

`CLAUDE.md` §2 checklist, §6 risks, and `AGENTS.md` Phase 0 gate note updated. **BLK-005** (OV13850 PDF) remains open, low severity.

---

## 2026-04-15 — TASK-002/003/004 reviewed and merged — Phase 0 A2 queue complete (A1)

**Agent:** A1 (Claude Code / product lead)  
**Phase:** 0 — Foundation & Risk Mitigation  
**Week:** 1  

### Reviews

#### TASK-004 — JD9365D backport patch — APPROVED

| Check | Result |
|---|---|
| Patch non-empty (588 lines), contains panel-jadard-jd9365da-h3.c driver | PASS |
| DT binding YAML (jadard,jd9365da-h3.yaml) included | PASS |
| Makefile + Kconfig hunks present | PASS |
| No 6.2+ specific APIs (`drm_panel_init`, `drm_panel_of_backlight`, `mipi_dsi_*` DCS helpers — all in 6.1.99) | PASS |
| `FILESEXTRAPATHS:prepend` uses colon syntax | PASS |
| `SRC_URI +=` appends patch with correct filename | PASS |
| A2 confirmed `git apply --check` on clean 6.1.99 tree: OK | PASS |

**Backport compatibility note:** Driver uses only standard DRM panel and MIPI DSI APIs present in 6.1.99. No 6.2-specific symbols identified. R-03 closed.

#### TASK-003 — WKS partition layout — APPROVED (with A1 fix)

| Check | Result |
|---|---|
| Boot (64M vfat), rootfs_a (2048M), rootfs_b (2048M), data (4096M) | PASS |
| Total 8256M (~8.06 GB) within 16 GB eMMC | PASS |
| A/B RAUC intent documented in comments | PASS |
| `WICVARS:append` colon syntax, `ELEVATOR_HMI_EMMC_WKS` defined | PASS |
| **Duplicate WICVARS block in layer.conf** | FIXED by A1 before merge |

A1 removed duplicate `WICVARS:append` + `ELEVATOR_HMI_EMMC_WKS` block that appeared twice in `layer.conf` (copy-paste error). Committed fix on branch before merge.

#### TASK-002 — Build host setup script — APPROVED

| Check | Result |
|---|---|
| `set -euo pipefail` at top | PASS |
| Ubuntu 22.04 version check via `/etc/os-release`, clear error on wrong version | PASS |
| `liblz4-tool` in package list | PASS |
| `kas` installed (apt universe + pip upgrade fallback), verified with `kas --version` | PASS |
| `bitbake --version` verified via shallow poky clone + `oe-init-build-env` | PASS |
| Idempotent: apt `-y`, poky clone guard, pip `--upgrade` | PASS |
| `scripts/README.md` documents usage and PATH note | PASS |

### Phase 0 queue state

| Task | Status |
|---|---|
| TASK-001 | `[DONE]` |
| TASK-002 | `[DONE]` |
| TASK-003 | `[DONE]` |
| TASK-004 | `[DONE]` |
| TASK-005 | `[DONE]` |
| TASK-101/102/103 | `[BLOCKED]` — human action required |

**All A2 Phase 0 tasks are complete.** Phase 0 gate is now blocked only on human-action items.

### Phase 0 gate — remaining human actions

- **BLK-001** (HIGH): Contact CM3566 vendor — confirm −20°C operating temp or decide on enclosure heater
- **BLK-002** (HIGH): Confirm MIPI-DSI routing on CM3566 carrier board display connector
- **BLK-003** (MEDIUM): Select backlight boost IC from candidates (TPS61187, RT4813, MP3309)
- **BLK-004** (MEDIUM): Decide protocol interface: RS-485 only vs RS-485 + CAN-FD

Phase 1 (BSP bring-up) cannot begin until BLK-001 and BLK-002 are resolved.

### Next actions
- Project owner: contact CM3566 vendor on BLK-001 and BLK-002 — these are the critical path items
- No new A2 tasks until Phase 1 gate opens

---

## 2026-04-15 — TASK-002, TASK-003, TASK-004 (A2, separate branches)

**Agent:** A2 (Composer2 / Cursor)  
**Phase:** 0  

### Summary
- **TASK-002** on `task/TASK-002-yocto-build-host`: `scripts/setup-build-host.sh` + `scripts/README.md` (Ubuntu 22.04, Scarthgap host deps, `kas`, cached shallow `poky` `yocto-5.0.16` for `bitbake --version` check). `AGENTS.md`: A2 branch reminder + TASK-002 → `[REVIEW]`.
- **TASK-003** on `task/TASK-003-partition-wks`: `meta-hmi-platform/wic/elevator-hmi-emmc.wks.in` + `WICVARS` / `ELEVATOR_HMI_EMMC_WKS` in `layer.conf`. Kickstart syntax checked with poky `wic.ksparser.KickStart` (not `wic ls` on a built image). TASK-003 → `[REVIEW]`.
- **TASK-004** on `task/TASK-004-jd9365d-kernel-backport`: unified patch from Linux v6.2 sources (`panel-jadard-jd9365da-h3.c`, binding YAML, Makefile/Kconfig); `git apply --check` on **v6.1.99** (`github.com/gregkh/linux`, tag `v6.1.99`, commit `cac15753b8ceb505a3c646f83a86dccbab9e33a3`) OK. `linux-rockchip_%.bbappend` applies patch. TASK-004 → `[REVIEW]`. `CLAUDE.md` §7 branching bullet tightened.

### Merge note for A1
Three branches from `main`; merge in any order, but expect sequential conflict resolution in `AGENTS.md` (each branch updates different task blocks — should merge cleanly).

---

## 2026-04-15 — TASK-001 reviewed [DONE], queue advanced (A1)

**Agent:** A1 (Claude Code / product lead)  
**Phase:** 0 — Foundation & Risk Mitigation  
**Week:** 1  

### TASK-001 Review — APPROVED

Reviewed `kas/elevator-hmi.yml`, both `layer.conf` files, sentinel recipes, README, and `.gitignore`.

| Check | Result |
|---|---|
| All 5 external SHAs are 40-char (no floating branches) | PASS |
| meta-openembedded present (required by meta-rockchip) | PASS |
| `LAYERSERIES_COMPAT = "scarthgap"` in both layers | PASS |
| `machine: rockchip-rk3566-evb` (correct RK3566 target) | PASS |
| `build/conf/` in `.gitignore` | PASS |
| `kas dump kas/elevator-hmi.yml` exits 0 — kas 5.2 verified all repos at pinned commits | PASS |

No separate task branch existed (A2 committed on cursor branch, already in develop/main). No merge needed. TASK-001 → `[DONE]`.

Note: A branch naming rule added to AGENTS.md — A2 must use `task/TASK-NNN-*` branches going forward.

### TASK-005 — Already complete
44/45 PDFs converted (run in prior session). All `.md` files committed and pushed. See prior diary entry.

### Queue state after this session
| Task | Status |
|---|---|
| TASK-001 | `[DONE]` |
| TASK-002 | `[READY]` — A2 can pick up |
| TASK-003 | `[READY]` — A2 can pick up (independent of TASK-002) |
| TASK-004 | `[READY]` — A2 can pick up (independent) |
| TASK-005 | `[DONE]` |

TASK-002 and TASK-004 are independent — A2 may work them sequentially in any order.

### Next actions
- A2: pick up TASK-002 (build host script), TASK-003 (WKS file), or TASK-004 (JD9365D patch) — one at a time
- Human: contact CM3566 vendor on BLK-001 (R-01 temp) and BLK-002 (R-02 MIPI routing)
- Human: set branch protection on main at github.com/DeodexLabs/elevator-hmi

---

## 2026-04-15 — Git remote initialized, all branches pushed

**Agent:** A1 (Claude Code)
**Phase:** 0 — Foundation

### Actions taken
- Replaced passphrase-protected `id_ed25519` with new passphrase-free ed25519 key (comment: deodexlabs@gmail.com)
- New public key registered to DeodexLabs GitHub account
- Remote `origin` added: `git@github.com:DeodexLabs/elevator-hmi.git`
- All branches pushed: `main`, `develop`
- Stray `cursor/phase0-workspace-scaffolding` branch deleted; wrong author `Your Name <you@example.com>` rewritten via filter-branch
- SSH connectivity confirmed: `Hi DeodexLabs!`

### Remote URL
git@github.com:DeodexLabs/elevator-hmi.git

### SSH public key fingerprint
SHA256:58mjShl6zipVVJLIfQZb7HF/RF6C0Id3h4azKh9iJmk (ED25519, no passphrase)

---

## 2026-04-15 — TASK-005: Vendor PDF library converted to Markdown (A1)

**Agent:** A1 (Claude Code / product lead)  
**Phase:** 0 — Foundation & Risk Mitigation  
**Week:** 1  

### Actions taken
- Created `scripts/convert-library.sh` — converts all PDFs in `library/` recursively using `markitdown[pdf]`
- Moved script from repo root to `scripts/` (correct location per task spec)
- Fixed initial 45/45 failure: `markitdown` had been installed without PDF extras (`markitdown[pdf]` required)
- Updated `.gitignore`: changed `library/**` (excluded everything) to `library/**/*.pdf` (exclude only PDFs, track `.md` files)
- Ran conversion: **44/45 PDFs converted successfully**
- Added TASK-005 to AGENTS.md, marked `[DONE]`; added BLK-005 for the one failed file

### Conversion results
| Result | Count |
|---|---|
| Converted OK | 44 |
| Failed | 1 |

**Failed:** `EM3566/Datasheet/Sensor_OV13850-G04A_OmniVision_Specification(V1.1).pdf`  
**Reason:** Scanned/image-only PDF — no embedded text layer. markitdown uses pdfminer (no OCR).  
**Severity:** LOW — OV13850 camera sensor is not used in the elevator HMI design. Documented as BLK-005.

### Notable conversions for HMI development
| File | Lines |
|---|---|
| `EM3566/Usermanual/CM3566_Hardware_Manual_V3.md` | 2,036 |
| `EM3566/Datasheet/Rockchip_RK3566_Datasheet_V1.5-20241211.md` | 3,884 |
| `EM3566/Linux6.1/Usermanual/EM3566 linux6.1 user manual_V1.0.md` | 3,011 |
| `EM3566/Datasheet/K101-IM2KYL02-L3_MIPI.md` | 2,042 (MIPI panel — relevant for R-02) |
| `EM3566/Schematic/em3566_v3sch.md` | 1,341 |
| `EM3566/Datasheet/RTL8211F(D)(I)-CG_DataSheet_1.2.md` | 6,166 |

### Next actions
- TASK-001 in [REVIEW] — A1 needs to review A2's kas manifest output.
- Project owner still needs to contact vendor on BLK-001 (R-01) and BLK-002 (R-02).
- TASK-002, TASK-003, TASK-004 remain [READY] for A2.

---

## 2026-04-15 — TASK-001 kas manifest and custom layers (A2)

**Agent:** A2 (Composer2 / Cursor)  
**Phase:** 0  

### Actions taken
- Implemented **TASK-001**: `kas/elevator-hmi.yml` with all upstream repos pinned to full SHAs; added `meta-openembedded` (`meta-oe`, `meta-python`) as required by `meta-rockchip` upstream.
- Added `meta-hmi-platform/` and `meta-hmi-app/` with `conf/layer.conf` and sentinel recipes for BitBake-parseable empty layers.
- Added root `README.md` (kas usage, layer table, `KAS_WORK_DIR` note).
- Verified `kas dump` and `kas shell … --skip setup_environ` (writes `build/conf/bblayers.conf` with correct layer order via kas `prio`). `bitbake-layers` blocked on this host by missing `lz4c` until TASK-002 host deps are installed.
- `.gitignore`: added `build/conf/` so kas-generated BitBake config is not committed.

### Task status
- TASK-001 → `[REVIEW]` in `AGENTS.md` (awaiting A1).

---

## 2026-04-15 — Project workspace initialized

**Agent:** A1 (Claude Code / product lead)  
**Phase:** 0 — Foundation & Risk Mitigation  
**Week:** 1  

### Actions taken
- Created workspace scaffolding: `CLAUDE.md`, `AGENTS.md`, `.cursor/rules/001-project.mdc`, `diary/`, `docs/`
- Loaded and reviewed all project documents: roadmap-v1.md, platform-decisions-v1.md, Vendor_Requirements_Specification.md, CM3566 hardware manual, LMT101 spec, RK3568 TRM, SKD41, ACM reference
- Initialized task queue in `AGENTS.md` with Phase 0 tasks (TASK-001 through TASK-004) and Phase 1 placeholders (TASK-101 through TASK-103, blocked)
- Created NotebookLM source guide at `docs/NOTEBOOKLM_SETUP.md`

### Phase 0 status
All 4 critical risks remain open:
- **R-01** (temperature floor): CM3566 spec is 0°C–80°C. Project needs −20°C. **Must contact vendor this week.**
- **R-02** (MIPI-DSI routing): Vendor Debian docs say "LVDS LCD." Physical confirmation required from CM3566 vendor before PCB layout.
- **R-03** (JD9365D backport): TASK-004 prepared in queue for Composer2. Driver source from Linux 6.2 tag.
- **R-04** (backlight lifetime): Accepted risk, Phase 3 mitigation (adaptive dimming). No action blocking Phase 1.

### Next actions
1. Project owner to contact CM3566 vendor on R-01 and R-02 this week (no agent can do this — requires human vendor contact).
2. A2 (Composer2) to begin TASK-001 (kas manifest + layer skeletons).
3. A2 to begin TASK-002 (build host setup script) in parallel with TASK-001.
4. A2 to begin TASK-004 (JD9365D backport patch preparation) — this is Phase 0 prerequisite.
5. Backlight boost IC selection required from project owner before Phase 1 BOM lock.

### Risks and blockers
- R-01 and R-02 are human-action items. Phase 1 cannot start while these are open.
- No code blockers at this stage.

---

_Diary initialized. Add new entries above this line._
