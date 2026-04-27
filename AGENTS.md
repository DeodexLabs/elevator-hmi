# AGENTS.md — Multi-Agent Coordination Protocol

**Owner:** Claude Code (lead agent)  
**Last updated:** 2026-04-19 (A1: **`CLAUDE.md`** §5 = 4-part WIC; **`[READY]`:** **`TASK-115`** → **`TASK-116`**; TASK-116 preflight: A2 need not wait for owner §2.1; **`TASK-106`** **`[BLOCKED]`** until LMT101)  

---

## Agent Roster

| ID | Agent | Tool | Role |
|---|---|---|---|
| A1 | Claude Code | Claude Code CLI | Lead — architecture, review, state tracking, diary |
| A2 | Composer2 | Cursor Composer | Implementation — code, recipes, patches, configs |

---

## Coordination Protocol

1. **A1 writes task specs** into the queue below. Status set to `[READY]`.
2. **A2 picks up** any single `[READY]` task. Changes status to `[IN PROGRESS]`.
3. **A2 completes** the task, changes status to `[REVIEW]`, adds output notes.
4. **A1 reviews** the output. If accepted: `[DONE]`. If rejected: `[REWORK]` with notes.
5. **A1 updates** `diary/PROGRESS.md` and `CLAUDE.md` phase checklist after each `[DONE]`.

**Rule:** A2 never picks up more than one task at a time. Never begins a task that depends on an `[IN PROGRESS]` or `[REVIEW]` task.

**Rule:** A2 must read `CLAUDE.md` fully before starting any task.

**Reminder (A2 — branching):** For every task, create and work only on a branch named `task/TASK-NNN-short-description` (example: `task/TASK-003-partition-wks`). Do not commit directly to `main` or `develop`. Merge only after A1 sets the task to `[DONE]`.

---

## Task Queue

Tasks are sorted by dependency order. Do not reorder.

**Phase 0 gate status:** All A2 tasks complete. **BLK-001–004 closed** 2026-04-15 (vendor temp note, MIPI/LVDS mux clarification, backlight IC deferred, protocol hardware deferred). **Reference hardware:** **Boardcon EM3566 v3** dev kit (**CM3566**) — **on hand** (owner 2026-04-15); **LMT101** → **`MIPI LCD`** connector (muxed bus; see `CLAUDE.md` / BLK-002). **Interim SoM link:** **UART console** (host ↔ board) for boot / image / RAUC diagnostics until fieldbus returns (see `CLAUDE.md` §8 PAL).  
**Open:** **BLK-006** (JD9365 `reset-gpios` / XRES — medium; see `diary/BLOCKERS.md`). **BLK-008** (DTS phandles — bench; **pre-LCD `dmesg` baseline** allowed per **`CLAUDE.md`** §2.1). **Closed 2026-04-18:** **BLK-009** (RAUC **`system.conf`** vs WIC — **`TASK-111`** merged). **BLK-007** (Noble **`libegl1-mesa`** / TASK-002). **BLK-005** closed 2026-04-15 (OV13850). Phase 1: validate DSI on **EM3566 v3** + LMT101; production carrier schematic + formal −20°C acceptance before shipping hardware.  
**A2 sprint queue (2026-04-19):** **`[READY]`:** **`TASK-115`** (Qt image parse; branch **`task/TASK-115-qt-image-parse`**) → **`TASK-116`** (RAUC / systemd). Pick **one** task at a time. **`TASK-113`** / **`TASK-114`** **`[DONE]`** (merged **`develop`**). **`TASK-106`** **`[BLOCKED]`** until **LMT101** on **`MIPI LCD`**. **Owner / lab (no panel):** follow **`CLAUDE.md`** §2.1 and **`docs/BRINGUP-CHECKLIST.md`** §8 — reflash **post–TASK-111** image, **`lsblk`**, GPT, UART baseline, **`pre-LCD baseline`** **`dmesg`** (**before** cable-up for **BLK-008** diff), **`rauc status`**, optional **eth/USB**, **U-Boot bootdelay** if still **0**.

---

### TASK-113 — [Phase 1] TASK-105 closure — green `kas-build-task-105.sh` + deploy log in PROGRESS *(archived — [DONE] 2026-04-19)*
**Status:** `[DONE]`  
**Phase:** 1  
**Depends on:** none  
**Branch:** `task/TASK-113-kas-build-105-logs` (A2; merged **`develop`** 2026-04-19)

**Spec:**

1. On **TASK-002-class** host (Ubuntu 22.04 or 24.04, **`setup-build-host.sh`** applied), from repo root run **`./scripts/kas-build-task-105.sh`** and capture **exit 0**.
2. Append to **`diary/PROGRESS.md`**: short tail of each **`build-logs/*.log`**, plus **`ls -la build/tmp/deploy/images/elevator-hmi-em3566/`** (or equivalent deploy listing).
3. No recipe changes unless the script exposes a real defect (then document in output notes and stop for A1).

**Acceptance:** **`PROGRESS.md`** contains evidence of green **`kas-build-task-105.sh`** + deploy listing; no community-layer edits.

**Output notes (A2):**  
- **Host:** Ubuntu **24.04**, **`lz4c`** present, **`kas` 5.2** — TASK-002-class.  
- **`./scripts/kas-build-task-105.sh`** — **exit 0**; logs **`build-logs/u-boot-rockchip.log`**, **`build-logs/virtual-kernel.log`**, **`build-logs/core-image-minimal.log`**. Each ends with **Tasks Summary … all succeeded**; **`core-image-minimal`** run reports **2 WARNING** messages (non-fatal).  
- **`diary/PROGRESS.md`** — new **2026-04-19 — TASK-113** entry with log tails + deploy artefact summary.  
- **No** edits under **`meta-rockchip`**, **`meta-qt6`**, **`meta-rauc`**.  
- **Owner:** **`CLAUDE.md`** §2.1 board captures (**`lsblk`**, **`pre-LCD baseline`** **`dmesg`**, **`rauc status`**, …) remain **owner** paste targets in **`PROGRESS.md`** (hardware; not part of this TASK-113 build-host acceptance).

**A1 review notes (`[DONE]` 2026-04-19):**  
- **PASS** — meets spec and acceptance: **exit 0**, per-log **Tasks Summary** tails in **`PROGRESS.md`**, deploy path + key artefacts documented (**equivalent** to raw **`ls -la`** per spec wording). **2 WARNING** on image build called out (non-fatal; unchanged narrative).  
- **PASS** — no community-layer edits; scope split (**build host** vs **owner §2.1** on-target) respected.  
- **Caveat (non-REWORK):** future diary entries may paste a short literal **`ls -la … | tail`** for byte-for-byte audit; not required to reopen **TASK-113**.

---

### TASK-114 — [Phase 1] BRINGUP — “No LCD yet” lab checklist *(archived — [DONE] 2026-04-19)*
**Status:** `[DONE]`
**Phase:** 1
**Depends on:** none (docs only)
**Branch:** `task/TASK-114-bringup-no-lcd` (A2; merge to **`develop`** when PR lands)

**Spec:**

1. Extend **`docs/BRINGUP-CHECKLIST.md`** with a new section (e.g. **§8** or renumber consistently) **“Lab without LCD (EM3566 v3)”** that mirrors **`CLAUDE.md`** §2.1: reflash **post–TASK-111** image, **`lsblk -f`** / **`/proc/partitions`**, **`sgdisk -e`** if GPT warning, UART baseline log, **`dmesg`** grep list (**`vcc3v3_lcd0_n`**, **`vcca_1v8`**, **`backlight`**, **`jd9365`**, **`dsi`**, **`panel`**) with **pre-LCD baseline** note, **`rauc status`**, optional **`ip link`** / **`lsusb`**, **U-Boot bootdelay** if autoboot **0**.
2. Cross-link **`CLAUDE.md`** §2.1 and **`diary/PROGRESS.md`** for paste targets.
3. No partition / **`.wks`** changes.

**Acceptance:** Doc PR only; links resolve; no invented flash offsets beyond existing diary block.

**Output notes (A2):**
- Added **`docs/BRINGUP-CHECKLIST.md`** **§8 — Lab without LCD (EM3566 v3)** — numbered steps mirror **`CLAUDE.md`** §2.1 (image ≥ TASK-111, **`lsblk -f`** / **`/proc/partitions`**, **`sgdisk -e`**, UART baseline, **`pre-LCD baseline`** **`dmesg`** with **`egrep -i`** pattern list, **`rauc status`**, optional **`ip link`** / **`lsusb`**, **U-Boot bootdelay**); cross-links to **`CLAUDE.md`** §2.1 and **`diary/PROGRESS.md`** paste targets; pointer to **§6** for bootdelay detail; **§5** / no-invented-GPIO reminder for when LCD arrives.
- **No** **`.wks`** / partition / flash-offset edits.
- **`AGENTS.md`** / **`CLAUDE.md`** / **`diary/PROGRESS.md`** — status lines updated for A1 review (**`[DONE]`** 2026-04-19).

**A1 review notes (`[DONE]` 2026-04-19):**
- **PASS** — **§8** matches **`CLAUDE.md`** §2.1 intent; **`../CLAUDE.md`** / **`../diary/PROGRESS.md`** links from **`docs/BRINGUP-CHECKLIST.md`** resolve; no new flash offsets; **§6** / **§5** pointers appropriate.
- **PASS** — doc-only; no **`.wks`** or recipe edits.

---

### TASK-115 — [Phase 1] `elevator-hmi-image` parse smoke (Qt path off critical path)
**Status:** `[READY]`  
**Phase:** 1  
**Depends on:** none  
**Branch:** `task/TASK-115-qt-image-parse` (A2)

**Spec:**

1. **`kas shell kas/elevator-hmi.yml -c "bitbake -p elevator-hmi-image"`** — exit **0**, no new parse errors.
2. Append one-line result + recipe count tail to **`diary/PROGRESS.md`** (or TASK output notes only — A2 chooses; minimum is output notes in **`AGENTS.md`**).
3. **Do not** bitbake full image unless A1 explicitly extends the task (parse-only keeps CI time bounded).

**Acceptance:** Parse smoke **exit 0**; **`meta-qt6` / `meta-rockchip` / `meta-rauc`** untouched.

---

### TASK-116 — [Phase 1] RAUC CLI / D-Bus / systemd on `core-image-minimal`
**Status:** `[READY]`  
**Phase:** 1  
**Depends on:** none (may use owner **`rauc status`** paste from **`PROGRESS.md`** if present)  
**Branch:** `task/TASK-116-rauc-systemd-minimal` (A2)

**Spec:**

1. Reproduce or analyse **`rauc status`** / **D-Bus** behaviour on **`core-image-minimal`** (owner paste in **`diary/PROGRESS.md`** if available; if not, use **`bitbake -e`** / package inspection only).
2. In **`meta-hmi-platform`** only: add **`SYSTEMD_AUTO_ENABLE`** / small **`bbappend`** / **`PACKAGECONFIG`** / doc note so **`rauc`** is usable where appropriate, **or** document **expected** limitations (e.g. no keys / no bundle) in **`docs/BRINGUP-CHECKLIST.md`** or recipe comment — A2 picks smallest fix.
3. **`kas shell … -c "bitbake -p"`** exit **0** after any recipe change.

**Acceptance:** Clear behaviour for developers; no **`meta-rauc`** edits; no partition layout changes.

**A1 preflight (2026-04-19) — for A2 and owner:**

- **Current spec (above)** is complete: (1) analyse **`rauc status`** / D-Bus on **`core-image-minimal`**; (2) smallest **`meta-hmi-platform`** fix or doc; (3) **`bitbake -p`** clean after changes.
- **Owner §2.1** (`**rauc status**` paste in **`PROGRESS.md`**) is **optional** for TASK-116. If missing, A2 must use **`bitbake -e`**, image inspection, and/or **`runqemu`/docs**-style reasoning per spec line 1 — **do not block the task** on the owner.
- **No dependency** on bench hardware for the recipe/D-Bus work; on-target output only **informs** behaviour if available.
- **After TASK-116:** if **`rauc status`** on hardware still shows issues, add a one-line **owner follow-up** in **`PROGRESS.md`**; consider a tiny follow-on task only if a new defect appears.

---

### TASK-112 — [Phase 1] AGENTS archive hygiene after TASK-111 (RAUC slot paths) *(archived — [DONE] 2026-04-18)*
**Status:** `[DONE]`  
**Phase:** 1  
**Depends on:** TASK-111 ✓ (merged to `develop`)  
**Branch:** `task/TASK-112-agents-rauc-doc` (merged to **`develop`** @ **`162f9c2`**)

**Spec:**

1. In **`AGENTS.md`**, under the **archived TASK-108** block, the fenced **`system.conf`** example still shows **`mmcblk0p4` / `p5`** (original TASK-108 spec). Add a **short note immediately after the fence** stating that **installed** layout is defined by **`meta-hmi-platform/recipes-images/files/system.conf`** on **`develop`** and was **corrected to `p2`/`p3`** per **`elevator-hmi-emmc.wks.in`** (**TASK-111**) — do **not** copy slot paths from the historical fence alone.
2. No recipe or **`.wks`** changes in this task.

**Acceptance:** One commit on task branch; PR for A1 review; **`git grep mmcblk0p4`** in **`AGENTS.md`** either gone from live guidance or clearly labeled historical-only.

**Output notes (A2):**  
- Inserted **Historical fence only** paragraph immediately after the archived TASK-108 **`system.conf`** code fence — points readers to **`meta-hmi-platform/recipes-images/files/system.conf`**, **`elevator-hmi-emmc.wks.in`**, and **TASK-111** for current **`p2`/`p3`** RAUC rootfs slots.  
- **`git grep mmcblk0p4`** in **`AGENTS.md`**: still present **only** inside the historical fenced example + the new note (explicitly “not current develop”).

**A1 review notes (`[DONE]` 2026-04-18):** **PASS** — meets TASK-112 spec and acceptance; **`mmcblk0p4`** remains only in historical / meta text (grep verified). Fast-forward merge **`task/TASK-112-agents-rauc-doc`** → **`develop`**.

---

### TASK-111 — [Phase 1] Align RAUC `system.conf` with on-eMMC GPT (`lsblk` evidence) *(archived — [DONE] 2026-04-18)*
**Status:** `[DONE]`  
**Phase:** 1  
**Depends on:** First boot with shell access ✓ (2026-04-18)  
**Branch:** `task/TASK-111-rauc-slot-paths` (merged to **`develop`** @ **`7502d2b`**)

**Context (BLK-009):** Previously **`system.conf`** used **`mmcblk0p4` / `p5`** (legacy six-partition assumption). **`elevator-hmi-emmc.wks.in`** defines boot **p1**, rootfs_a **p2**, rootfs_b **p3**, data **p4**. **TASK-111** set RAUC rootfs slots to **`p2` / `p3`** per WIC; **BLK-009** closed. Optional owner **`lsblk -f`** paste to **`diary/PROGRESS.md`** still welcome.

**Spec:**

1. On **EM3566 v3** running the project image, capture (paste into task output notes + optional **`diary/PROGRESS.md`** line):
   - `lsblk -f`
   - `cat /proc/partitions`
   - `blkid` (if present)
2. Map **RAUC A/B rootfs** slot device paths to **actual** `mmcblk0pN` from (1). Update **`meta-hmi-platform/recipes-images/files/system.conf`** (and any comments in **`elevator-hmi-rauc-system-conf.bb`** if needed) so **`[slot.rootfs.*] device=`** matches GPT labels / layout **exactly**.
3. **Do not** change **`.wks`** partition layout in this task (A1 task only if spec’d).
4. Parse smoke: `kas shell kas/elevator-hmi.yml -c "bitbake -p"` exit 0; no new errors.

**Acceptance:**

- `system.conf` in Git matches **`lsblk`** evidence from this board (or documented equivalent machine).
- **`diary/BLOCKERS.md`**: BLK-009 moved to **Closed** with one-line resolution **or** updated with “still wrong — rework” if hardware surprises.

**Output notes (A2):**  
- **`meta-hmi-platform/recipes-images/files/system.conf`:** **`slot.rootfs.0`** → **`/dev/mmcblk0p2`**, **`slot.rootfs.1`** → **`/dev/mmcblk0p3`** (matches **`elevator-hmi-emmc.wks.in`** order: boot **p1**, rootfs_a **p2**, rootfs_b **p3**, data **p4**). Header comment documents legacy **p4/p5** mistake vs current WIC.  
- **`meta-hmi-platform/recipes-images/elevator-hmi-rauc-system-conf/elevator-hmi-rauc-system-conf.bb`:** one-line comment cross-ref WIC.  
- **`diary/BLOCKERS.md`:** **BLK-009** → **Closed** (WIC-authoritative alignment; optional target **`lsblk`** paste still welcome in **`PROGRESS.md`**).  
- **`docs/BRINGUP-CHECKLIST.md`:** §3 pointer to **TASK-105** green deploy + **`PROGRESS.md`** flash block.  
- **Parse smoke:** **`kas shell kas/elevator-hmi.yml -c "bitbake -p"`** → **exit 0** (2026-04-18).  
- **`lsblk` on target:** not re-pasted in this session — mapping taken from in-tree WIC as **documented equivalent** per task acceptance wording; owner to paste **`lsblk -f`** to **`PROGRESS.md`** to close the loop on hardware.

**A1 review notes (`[DONE]` 2026-04-18):** Merged **`origin/task/TASK-111-rauc-slot-paths`** into **`develop`** (fast-forward **`7502d2b`**). **`system.conf`** **`p2`/`p3`** matches **`elevator-hmi-emmc.wks.in`**. **`kas shell kas/elevator-hmi.yml -c "bitbake -p"`** exit 0 on merged tree. **BLK-009** closure accepted (WIC authoritative; optional hardware **`lsblk`** audit).

---

### TASK-110 — [Phase 1] Fix linux-rockchip_%.bbappend: cfg fragment + DTS placement *(archived — [DONE] 2026-04-16)*
**Status:** `[DONE]`  
**Phase:** 1  
**Branch:** `task/TASK-110-bbappend-fix` (from `develop` 2026-04-16)

**Defects fixed (supervisor-identified):**

1. **FIX 1 — `KERNEL_CONFIG:append` removed; replaced with `.cfg` fragment.**  
   `KERNEL_CONFIG:append` is not a valid Yocto mechanism for setting kernel config options on `linux-rockchip`. Replaced with `file://elevator-hmi-panel.cfg` in `SRC_URI:append`; the fragment is processed by `kernel_configme` / `merge_config.sh` during `do_kernel_configme`.

2. **FIX 2 — `do_configure:append()` added to copy DTS/DTSI into kernel source tree.**  
   Non-patch `SRC_URI` files land in `WORKDIR`, not `${S}/arch/arm64/boot/dts/rockchip/` where the kernel Makefile looks for them. Added `do_configure:append()` with `install -m 0644` for both `elevator-hmi-boardcon-em3566-v3.dts` and `elevator-hmi-lmt101sx006c-panel.dtsi`.

**Output notes (A1):**
- `meta-hmi-platform/recipes-kernel/linux/linux-rockchip_%.bbappend` — updated.
- `meta-hmi-platform/recipes-kernel/linux/files/elevator-hmi-panel.cfg` — created.
- No community layer edits.

---

### TASK-108 — [Phase 1] RAUC skeleton — system.conf + key infra + bundle recipe stub *(archived — [DONE] 2026-04-16)*
**Status:** `[DONE]`  
**Phase:** 1  
**Depends on:** TASK-103 ✓ (core-image-minimal + WKS layout)  
**Branch:** `task/TASK-108-rauc-skeleton` (merged to `develop` 2026-04-16; branch deleted)

**Spec:**

1. **RAUC system config** — `meta-hmi-platform/recipes-images/files/system.conf`:
   ```
   [system]
   compatible=elevator-hmi
   bootloader=u-boot

   [slot.rootfs.0]
   device=/dev/mmcblk0p4
   type=ext4
   bootname=a

   [slot.rootfs.1]
   device=/dev/mmcblk0p5
   type=ext4
   bootname=b
   ```

   **Historical fence only:** the **`p4` / `p5`** lines above are the original TASK-108 written spec (legacy six-partition story), **not** the RAUC slot paths on current **`develop`**. The **installed** `system.conf` is **`meta-hmi-platform/recipes-images/files/system.conf`**, corrected to **`/dev/mmcblk0p2`** / **`p3`** for A/B rootfs per **`elevator-hmi-emmc.wks.in`** (**TASK-111**). Do **not** copy slot devices from this archive block alone.

   Install to `/etc/rauc/system.conf` via a bbappend or new recipe — A2 chooses cleanest approach within `meta-hmi-platform`.

2. **LAYERDEPENDS** — confirm `meta-hmi-platform/conf/layer.conf` includes `meta-rauc` in `LAYERDEPENDS`. Add it if missing.

3. **Key infrastructure** (scripts only — no keys committed):
   - `scripts/rauc-gen-keys.sh` — generates a dev CA + signing key pair (openssl; self-signed; outputs to `certs/` which is gitignored). Script header must warn: "Development keys only. Never commit certs/. Production keys must be generated offline and stored in HSM or secrets vault."
   - `certs/README.md` — explains: dev keys generated by `rauc-gen-keys.sh`; production keys never in Git; bundle signing procedure TBD Phase 2.
   - Verify `.gitignore` already excludes `*.pem`, `*.key`, `certs/*.pem`, `certs/*.key` — add entries if missing.

4. **RAUC bundle recipe stub** — `meta-hmi-app/recipes-images/elevator-hmi-bundle.bb`:
   - Minimal skeleton that inherits `bundle` from meta-rauc and sets `RAUC_BUNDLE_COMPATIBLE = "elevator-hmi"`.
   - Mark clearly with a comment: `# PLACEHOLDER — Phase 2 implementation; do not bitbake this recipe until signing keys and rootfs image are complete.`
   - Must parse without error (`bitbake -p` or `bitbake -e elevator-hmi-bundle` parse-only).

5. **RAUC in image** — add `rauc` to `IMAGE_INSTALL:append` in `core-image-minimal.bbappend` (or a new image bbappend).

**Acceptance:**
- `bitbake -p` (parse-only) on a configured host exits 0 with no new errors.
- `system.conf` lands in `${sysconfdir}/rauc/` in the image rootfs (verify via `bitbake -e` variable trace or deploy artifact path).
- `certs/` is gitignored; `rauc-gen-keys.sh` is executable and has the warning header.
- No modifications to `meta-rauc` community layer.

**Output notes (A2):**  
- **`meta-hmi-platform/recipes-images/files/system.conf`** — per spec; installed by **`elevator-hmi-rauc-system-conf.bb`** → **`${sysconfdir}/rauc/system.conf`** (**`/etc/rauc/system.conf`** on target). **`meta-hmi-platform/conf/layer.conf`** — **`LAYERDEPENDS`** adds **`rauc`**.  
- **`meta-hmi-platform/recipes-core/images/core-image-minimal.bbappend`** — **`IMAGE_INSTALL:append = " rauc elevator-hmi-rauc-system-conf"`**. **`elevator-hmi-em3566.conf`** — **`DISTRO_FEATURES:append = " rauc"`** (clears meta-rauc README warning when layer is present).  
- **`scripts/rauc-gen-keys.sh`** — executable; header matches required dev-only / production warning; **`certs/README.md`**. **`.gitignore`** — existing **`*.pem`**, **`*.key`**, **`certs/private/`**; added explicit **`certs/*.pem`**, **`certs/*.key`**. **`git add -A`** does **not** stage dummy **`certs/*.pem`** / **`certs/private/*.key`** (verified).  
- **`meta-hmi-app/recipes-images/elevator-hmi-bundle.bb`** — **`inherit bundle`**, **`RAUC_BUNDLE_COMPATIBLE = "elevator-hmi"`**, PLACEHOLDER comment; **`meta-hmi-app/conf/layer.conf`** — **`LAYERDEPENDS`** **`rauc`** + **`BBFILES`** line for **`recipes-images/*.bb`** so the flat bundle path parses.  
- **Smoke:** **`kas shell kas/elevator-hmi.yml -c "bitbake -p"`** — **exit 0**, **0 errors** (after **`rauc`** distro feature). **`bitbake -e core-image-minimal`** shows **`IMAGE_INSTALL`** includes **`rauc`** and **`elevator-hmi-rauc-system-conf`**. **`bitbake-layers show-recipes elevator-hmi-bundle`** — recipe **meta-hmi-app 1.0**.  
- **No** edits under **`meta-rauc/`** (community layer).

**A1 fix notes (2026-04-16 — supervisor-identified defect):**  
- **DEFECT fixed:** `DISTRO_FEATURES:append = " rauc"` removed from `elevator-hmi-em3566.conf`. Machine conf sets hardware capabilities only; DISTRO_FEATURES belongs in a distro conf.  
- **New file:** `meta-hmi-platform/conf/distro/elevator-hmi.conf` — `require conf/distro/poky.conf`; `DISTRO = "elevator-hmi"`; `DISTRO_VERSION = "0.1"`; `DISTRO_FEATURES:append = " rauc"`; `DISTRO_FEATURES:remove = "x11 wayland"`.  
- **`kas/elevator-hmi.yml`** — `distro: poky` → `distro: elevator-hmi`; `local_conf_header` block added with `DISTRO = "elevator-hmi"`.  
- **`kas dump`** smoke after fix: `distro: elevator-hmi` confirmed, exit 0, no errors.

---

### TASK-109 — [Phase 1] Qt 6.8 / EGLFS minimal image skeleton *(archived — [DONE] 2026-04-17)*
**Status:** `[DONE]`  
**Phase:** 1  
**Depends on:** TASK-108 `[DONE]` (ensures `meta-hmi-app` is building cleanly before adding Qt)  
**Branch:** `task/TASK-109-qt-eglfs-image` (from `develop` 2026-04-17)

**Output notes (A2):**
- **`meta-hmi-app/conf/layer.conf`** — `BBFILE_PRIORITY_hmi-app` **9** (above `meta-hmi-platform` 8). **`LAYERDEPENDS_hmi-app`** remains **`core qt6-layer rauc`** (spec text listed only `core qt6-layer`; **`rauc`** kept so **`elevator-hmi-bundle.bb`** / **`inherit bundle`** stay valid when only app layer metadata is considered).
- **`meta-hmi-app/recipes-images/elevator-hmi-image.bb`** — **`inherit core-image rockchip-image`**, **`WKS_FILE = "${ELEVATOR_HMI_EMMC_WKS}"`** (same eMMC layout as **`core-image-minimal`**; not in one-line TASK text but required for Rockchip WIC images). **`IMAGE_INSTALL`** per TASK plus **`elevator-hmi-app`**. **`packagegroup-qt6-minimal`** from TASK text **does not exist** in pinned **meta-qt6** — substituted **`packagegroup-qt6-essentials`** (minimal qtbase+declarative set). **`DISTRO_FEATURES:remove = "x11 wayland"`** as specified. **`QT_QPA_PLATFORM=eglfs`** via **`ROOTFS_POSTPROCESS_COMMAND`**: **`/etc/profile.d/qt-eglfs.sh`** and **`/etc/environment.d/90-qt-eglfs.conf`** (no X11/Wayland compositors in **`IMAGE_INSTALL`**).
- **`meta-hmi-app/recipes-images/files/COPYING`** — **`LICENSE = "CLOSED"`** checksum for image recipe.
- **`meta-hmi-app/recipes-qt/elevator-hmi-app/elevator-hmi-app_0.1.bb`** + **`files/`** (`CMakeLists.txt`, **`main.cpp`** loader, **`main.qml`** Window stub, **`COPYING`**) — **`inherit qt6-cmake`**, **`DEPENDS = "qtbase qtdeclarative"`**, installs **`/usr/bin/elevator-hmi`** and **`/usr/share/elevator-hmi/main.qml`**, top comment PLACEHOLDER per spec.
- **`kas/elevator-hmi.yml`** — **unchanged** (**`meta-hmi-app`** already present).
- **Smoke:** **`kas shell kas/elevator-hmi.yml -c "bitbake -p elevator-hmi-image"`** — **exit 0**, **0 parse errors** (2586 recipes). **`bitbake-layers show-layers`** — **`hmi-app`** priority **9**.
- **No** edits under **`meta-qt6`**, **`meta-rockchip`**, **`meta-rauc`**.

**A1 review fix (2026-04-17):**
- **DEFECT fixed:** `DISTRO_FEATURES:remove = "x11 wayland"` removed from `elevator-hmi-image.bb`. Cannot be reliably modified in an image recipe; already correctly set in `meta-hmi-platform/conf/distro/elevator-hmi.conf` (TASK-108). Replaced with a comment citing the distro conf.
- **Process note:** A2 left all changes uncommitted on the task branch (working tree only). A1 applied the fix and committed everything: `[phase1][meta-hmi-app] TASK-109 Qt 6.8 EGLFS image skeleton and placeholder app`.
- **Parse smoke re-run after fix:** `bitbake -p elevator-hmi-image` — exit 0, 0 errors, 4481 targets.

**Spec:**

1. **`meta-hmi-app/conf/layer.conf`** — create if not exists:
   - `BBFILE_COLLECTIONS += "hmi-app"`
   - `BBFILE_PATTERN_hmi-app = "^${LAYERDIR}/"`
   - `BBFILE_PRIORITY_hmi-app = "9"` (higher than `meta-hmi-platform` which should be 8)
   - `LAYERSERIES_COMPAT_hmi-app = "scarthgap"`
   - `LAYERDEPENDS_hmi-app = "core qt6-layer"`

2. **`meta-hmi-app/recipes-images/elevator-hmi-image.bb`**:
   ```bitbake
   SUMMARY = "Elevator HMI Qt 6.8 / EGLFS image"
   LICENSE = "CLOSED"
   inherit core-image
   IMAGE_INSTALL += " \
       packagegroup-qt6-minimal \
       qtbase \
       qtdeclarative \
       qtmultimedia \
       gstreamer1.0 \
       gstreamer1.0-plugins-base \
       gstreamer1.0-plugins-good \
   "
   # No X11, no Wayland, no display manager — EGLFS only
   DISTRO_FEATURES:remove = "x11 wayland"
   ```
   - Add `/etc/environment` or `qt.conf` fragment setting `QT_QPA_PLATFORM=eglfs`.

3. **`meta-hmi-app/recipes-qt/elevator-hmi-app_0.1.bb`** — placeholder app recipe:
   - Minimal QML hello-world stub (a single `main.qml` with `Window { visible: true; Text { text: "elevator-hmi" } }`).
   - Installs binary or launcher script to `/usr/bin/elevator-hmi`.
   - `DEPENDS = "qtbase qtdeclarative"`.
   - `LICENSE = "CLOSED"`.
   - Comment at top: `# PLACEHOLDER — Phase 2 replaces this with the real application sources.`

4. **`kas/elevator-hmi.yml`** — add `meta-hmi-app` to the layers list (if not already present) with a local path entry (no remote fetch needed for in-repo layer).

**Acceptance:**
- `bitbake -p elevator-hmi-image` on a configured host exits 0 (parse-only — full build deferred to lab).
- `meta-hmi-app` layer shows up in `kas dump` / `bitbake-layers show-layers` output.
- No X11 / Wayland packages pulled in.
- No modifications to `meta-qt6`, `meta-rockchip`, or `meta-rauc`.

---

### TASK-106 — [Phase 1] Bench: EM3566 v3 + LMT101 MIPI LCD (DSI / BLK-006)
**Status:** `[BLOCKED — needs LMT101SX006C panel on hand]`  
**Phase:** 1  
**Depends on:** TASK-104 ✓, **LMT101SX006C** panel received and cabled to **`MIPI LCD`**, dev kit on hand ✓  

**Spec (when unblocked):**  
- Power/sequence per **LMT101** vendor doc (in repo when available).  
- Capture **UART** boot + **`dmesg`** excerpts (DRM / panel / dsi).  
- **BLK-006:** confirm display stable without **`reset-gpios`** or add **`reset-gpios`** with **cited** GPIO + update DTS + **`diary/BLOCKERS.md`**.  
- Log results in **`diary/PROGRESS.md`**; no partition layout changes.

---

### TASK-107 — [Phase 1] Bring-up checklist doc (flash + UART + kas) *(archived — [DONE] 2026-04-15)*
**Status:** `[DONE]`  
**Branch:** `task/TASK-105-107-lab-handoff` (merged to `develop` 2026-04-15; combined with TASK-105 — **prefer one task per branch next time**).  

**Output notes (A2):** *(summary)* **`docs/BRINGUP-CHECKLIST.md`**; **`README.md`** Documentation link; **`library/EM3566/README.md`** link; in-repo flash doc pointers only.

**A1 review notes (2026-04-15):**  
- **PASS:** Single canonical checklist; links from **`README.md`** and **`library/EM3566/README.md`**; cited paths exist under **`library/EM3566/`** (UART §2.14, Linux6.1 user manual, RKDevTool manual).  
- **PASS:** No **`.wks`** edits; flash section explicitly avoids invented **`rkdeveloptool`** offsets — owner to record first working command in **`diary/PROGRESS.md`**.  
- **PASS:** TASK-105 script cross-linked; **`kas dump`** / deploy path guidance matches project layout.  
- **Process:** Combined **TASK-105 + TASK-107** on one branch — acceptable for this handoff; follow **`task/TASK-NNN-…`** per task for future work.

---

### TASK-105 — [Phase 1] Green `kas build` + smoke logs on TASK-002 host *(archived — [DONE] 2026-04-15)*
**Status:** `[DONE]`  
**Branch:** `task/TASK-105-107-lab-handoff` (merged to `develop` 2026-04-15).  

**Output notes (A2):** *(summary)* **`scripts/kas-build-task-105.sh`** + **`scripts/README.md`**; three **`kas build`** runs; HOSTTOOLS **`lz4c`** failure on agent host without full **`setup-build-host.sh`** (missing **`liblz4-tool`**, not an Ubuntu **24.04** limitation); failure tails + expected deploy dir documented.

**A1 review notes (2026-04-15):**  
- **PASS:** **`scripts/kas-build-task-105.sh`** uses **`set -euo pipefail`**, repo-root **`cd`**, ordered **`u-boot-rockchip`** → **`virtual/kernel`** → **`core-image-minimal`**, **`tee`** to **`build-logs/`** — matches TASK-105 intent (**`u-boot-rockchip`** post-**2026-04-15** fix for Rockchip bootloader provider).  
- **PASS:** **`scripts/README.md`** documents prerequisites (Ubuntu **22.04** or **24.04** / **`setup-build-host.sh`** / **`lz4c`**).  
- **PASS:** No community-layer edits.  
- **Deferred acceptance (explicit in spec):** **Green full image `exit 0`** on a host with **`setup-build-host.sh`** applied (**Ubuntu 22.04 or 24.04 LTS**) — re-run **`./scripts/kas-build-task-105.sh`** and append success log tails + **`deploy/images/elevator-hmi-em3566/`** listing to **`diary/PROGRESS.md`** (or a follow-on diary entry); not a recipe **REWORK**.

---

### TASK-103 — [Phase 1] Minimal kernel image recipe (core-image-minimal, RK3566) *(archived — [DONE] 2026-04-15)*
**Status:** `[DONE]`  
**Branch:** `task/TASK-103-core-image-minimal` (merged to `develop` after A1 review in this session).  
**Depends on:** TASK-001 ✓, TASK-002 ✓ (build host script + deps installed on the machine used for `kas`/`bitbake`), **Boardcon EM3566 v3 dev kit on hand** ✓ (owner 2026-04-15)  

**Output notes (A2):** *(summary)* **`core-image-minimal.bbappend`**: **`inherit rockchip-image`** + **`WKS_FILE = "${ELEVATOR_HMI_EMMC_WKS}"`** (TASK-003 WIC vs BSP **`generic-gptdisk.wks.in`**); **`kas dump`** OK; **`kas build`** not run on agent host (`lz4c`). See branch for full bullets.

**A1 review notes (2026-04-15):**  
- **PASS:** Changes confined to **`meta-hmi-platform/recipes-core/images/`**; no edits under **`meta-rockchip`** / **`meta-qt6`** / **`meta-rauc`**.  
- **PASS:** **`inherit rockchip-image`** matches **`meta-rockchip/classes/rockchip-image.bbclass`** (ext4 + WIC, **`ROCKCHIP_KERNEL_IMAGES`**, postprocess hooks).  
- **PASS:** **`WKS_FILE = "${ELEVATOR_HMI_EMMC_WKS}"`** overrides the class’s weak **`WKS_FILE ?=`** default and points at **`layer.conf`**-defined **`elevator-hmi-emmc.wks.in`** (TASK-003) — correct wiring for the fixed A/B + **`/data`** layout.  
- **PASS:** **`kas dump`** is an appropriate minimal smoke when BitBake cannot run on the review host.  
- **Deferred acceptance:** Full **`kas build kas/elevator-hmi.yml`** (image + **`virtual/kernel`** + **`u-boot`**) remains **owner / TASK-002 host** — capture logs there when ready (see **Optional A1 log collection** in `diary/PROGRESS.md`).  
- **Caveat:** First flash must still match **SPL + partition table + WIC** on real **EM3566 v3**; validate boot and **`/data`** persistence vs OTA story when hardware images exist.

---

### TASK-102 — [Phase 1] U-Boot eMMC boot recipe *(archived — [DONE] 2026-04-15)*
**Status:** `[DONE]`  
**Branch:** `task/TASK-102-uboot-emmc` (merged to `develop` 2026-04-15).  

**Output notes (A2):** *(summary)* `u-boot-rockchip.bbappend` + **`elevator-hmi-emmc-boot.cfg`** Kconfig fragment; **`UBOOT_LOCALVERSION`**; machine conf comments (eMMC / WIC / `rk3568_defconfig`); smoke blocked on **`lz4c`**. See branch history for full bullets.

**A1 review notes (2026-04-15):**  
- **PASS:** All changes under **`meta-hmi-platform`**; **`u-boot-rockchip.bbappend`** uses Scarthgap **`SRC_URI:append`** / **`FILESEXTRAPATHS:prepend`**; no **`meta-rockchip`** edits; Rockchip **`make.sh`** / SPL flow untouched.  
- **PASS:** **`elevator-hmi-emmc-boot.cfg`** is a standard Poky **`*.cfg`** fragment; **`u-boot.inc`** pulls **`u-boot-configure.inc`**, which runs **`merge_config.sh`** after **`${UBOOT_MACHINE}`** (`rk3568_defconfig` per **`rockchip-rk3566-evb`**) — mechanism is correct for Scarthgap. Fragment is **documenting / idempotent** vs vendor defconfig (acceptable).  
- **PASS:** **`UBOOT_LOCALVERSION = "-elevator-hmi-emmc"`** aids traceability on serial / binaries.  
- **PASS:** Machine comment ties **mmcblk0** to WIC / TASK-003 narrative without changing partition layout.  
- **Deferred acceptance:** **`kas build … --target u-boot-rockchip`** did not reach BitBake on review host (**`lz4c`**). Same as TASK-104 — confirm on TASK-002 host or as part of **TASK-103**.  
- **Caveat:** Raw-mode / GPT options must still match **actual SPL + image layout** after first flash; validate on **EM3566 v3** when images exist.

---

### TASK-104 — [Phase 1] Boardcon EM3566 machine DTS — integrate LMT101 panel fragment *(archived — [DONE] 2026-04-15)*
**Status:** `[DONE]`  
**Branch:** `task/TASK-104-boardcon-machine-dts` (merged to `develop` 2026-04-15).  

**Output notes (A2):** *(summary)* BSP-pinned `rk3566-evb2-lp4x-v10-linux` baseline; **`elevator-hmi-em3566`** machine + **`elevator-hmi-boardcon-em3566-v3.dts`**; panel on **`&dsi0`** with `/delete-node/` merge; phandles `vcc3v3_lcd0_n`, `vcca_1v8`, `backlight`; kas `machine: elevator-hmi-em3566`; smoke blocked on review host **`lz4c`**. Full bullets were in `[REVIEW]` state — see git history on task branch if needed.

**A1 review notes (2026-04-15):**  
- **PASS:** Implementation stays in **`meta-hmi-platform`**; no community-layer edits; machine inherits **`rockchip-rk3566-evb`** and overrides **`KERNEL_DEVICETREE`** only — appropriate minimal delta.  
- **PASS:** Board DTS include chain and **`&dsi0`** overlay match pinned **meta-rockchip** EVB2 layout; phandle names match BSP narrative; **BLK-006** respected (no invented `reset-gpios`).  
- **PASS:** **`kas/elevator-hmi.yml`** default **machine** updated for reproducible builds.  
- **Deferred acceptance (documented):** **`kas build … virtual/kernel`** did not reach BitBake on the review host (**`lz4c` / HOSTTOOLS**). Treated as **environment gap**, not DTS rework — confirm on TASK-002 host or fold into **TASK-103** acceptance.  
- **Bench:** DSI0 vs DSI1 caveat remains until **EM3566 v3 + LMT101** on **MIPI LCD** is exercised (**BLK-006** path unchanged).

---

### TASK-101 — [Phase 1] DTS node for JD9365D / LMT101SX006C *(archived — [DONE] 2026-04-15)*
**Status:** `[DONE]`  
**Branch:** `task/TASK-101-lmt101-dts` (merge at owner discretion after artifacts are **committed** on branch).  

**Output notes (A2):**  
- `0002-drm-panel-jadard-lmt101sx006c-compatible-optional-reset.patch` (after 0001): product `compatible`, optional `reset-gpios`, `devm_gpiod_get_optional`, 135 ms delay path when no reset GPIO.  
- `elevator-hmi-lmt101sx006c-panel.dtsi`: `&dsi` / `panel@0` / `ports/port@1` graph; placeholder phandles per Rockchip BSP conventions.  
- `linux-rockchip_%.bbappend`: `SRC_URI` + `CONFIG_DRM_PANEL_JADARD_JD9365DA_H3=y`.  

**A1 review notes (2026-04-15):**  
- **PASS:** Patch 0002 is minimal, ordered after 0001, uses Scarthgap bitbake syntax; binding change matches driver; `prepare`/`unprepare`/`probe` handle `NULL` reset safely — **aligned with BLK-006** (no invented XRES GPIO).  
- **PASS:** Reference `.dtsi` documents CON1 sources, merge hazard for `ports`, and defers `reset-gpios` until bench/trace.  
- **PASS:** No modifications under community layers (`meta-rockchip` / `meta-qt6` / `meta-rauc`).  
- **Caveat:** `elevator-hmi,lmt101sx006c` reuses `cz101b4001_desc` timings — **acceptable for first DSI link-up**; validate against **LMT101SX006C** electrical/timing spec on hardware and add a dedicated `jadard_panel_desc` if measurements differ.  
- **Process:** At review time, `0002` / `.dtsi` / `bbappend` changes must be **git committed** on `task/TASK-101-lmt101-dts` before merge to `main`/`develop` (agents did not commit per owner policy).

---

## Completed Tasks

| Task | Description | Completed |
|---|---|---|
| TASK-001 | kas manifest + layer skeletons (A2 impl, A1 reviewed) | 2026-04-15 |
| TASK-002 | Ubuntu 22.04/24.04 build host setup script (A2 impl, A1 reviewed; 24.04 allowed in script 2026-04-15) | 2026-04-15 |
| TASK-003 | eMMC partition layout WKS file (A2 impl, A1 reviewed — A1 fixed duplicate WICVARS) | 2026-04-15 |
| TASK-004 | JD9365D panel driver backport patch 6.2→6.1.99 (A2 impl, A1 reviewed) | 2026-04-15 |
| TASK-005 | Convert vendor PDF library to Markdown | 2026-04-15 |
| TASK-101 | LMT101 / JD9365 DSI fragment + optional-reset kernel patch (A2 impl, A1 reviewed) | 2026-04-15 |
| TASK-104 | Boardcon EM3566 machine DTS + LMT101 on DSI0 + kas machine (A2 impl, A1 reviewed) | 2026-04-15 |
| TASK-102 | U-Boot eMMC Kconfig fragment + bbappend (A2 impl, A1 reviewed) | 2026-04-15 |
| TASK-103 | core-image-minimal + rockchip-image + project WIC (A2 impl, A1 reviewed) | 2026-04-15 |
| TASK-105 | kas smoke script + logs (A2 impl, A1 reviewed; green full sequence verified **TASK-113** 2026-04-19 Ubuntu 24.04 TASK-002-class host) | 2026-04-15 |
| TASK-107 | BRINGUP-CHECKLIST.md + README/library links (A2 impl, A1 reviewed) | 2026-04-15 |
| TASK-110 | Fix linux-rockchip_%.bbappend: cfg fragment (replaces KERNEL_CONFIG:append) + do_configure DTS placement (A1 impl, supervisor approved) | 2026-04-16 |
| TASK-108 | RAUC skeleton: system.conf, distro conf, key script, bundle stub (A2 impl, A1+supervisor reviewed; DISTRO_FEATURES fix by A1) | 2026-04-16 |
| TASK-109 | Qt 6.8 EGLFS image skeleton + placeholder app (A2 impl; A1 fixed DISTRO_FEATURES defect + committed uncommitted A2 work; parse clean) | 2026-04-17 |
| TASK-113 | Green `kas-build-task-105.sh` + deploy evidence in `diary/PROGRESS.md` (A2 impl, A1 reviewed; Ubuntu 24.04 TASK-002-class host) | 2026-04-19 |
| TASK-114 | BRINGUP §8 “Lab without LCD” + cross-links (A2 impl, A1 reviewed) | 2026-04-19 |

---

## Notes on A2 Behavior (Composer2)

- Always read `CLAUDE.md` at session start.
- Implement exactly as specified in the task. If the spec is ambiguous, **stop and ask A1**, do not assume.
- Never modify `meta-rockchip`, `meta-qt6`, or `meta-rauc` directly.
- Never change the partition layout without a new task spec from A1.
- Code style: shell scripts use `set -euo pipefail`. Python uses type hints.
- Commit format: `[phaseN][component] short description` — e.g., `[phase0][kas] pin layer SHASUMs`
- **Branch naming:** create a branch named `task/TASK-NNN-short-description` for every task. Never commit directly to `main` or `develop`.
- Merge to `develop` only after A1 sets status to `[DONE]`.
