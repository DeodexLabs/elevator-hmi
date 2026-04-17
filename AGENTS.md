# AGENTS.md — Multi-Agent Coordination Protocol

**Owner:** Claude Code (lead agent)  
**Last updated:** 2026-04-17 (TASK-109 `[REVIEW]` — A2 Qt EGLFS skeleton on branch `task/TASK-109-qt-eglfs-image`)  

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
**Open:** **BLK-006** (JD9365 `reset-gpios` / XRES — medium; see `diary/BLOCKERS.md`). **Closed this session:** **BLK-007** (Noble **`libegl1-mesa`** / TASK-002 host script — see `diary/BLOCKERS.md`). **BLK-005** closed 2026-04-15 (OV13850 — not in project scope). Phase 1: validate DSI on **EM3566 v3** + LMT101; production carrier schematic + formal −20°C acceptance before shipping hardware.  
**A2 queue (2026-04-17):** **TASK-109** `[REVIEW]` — branch `task/TASK-109-qt-eglfs-image` (Qt image + placeholder app). **TASK-106** `[BLOCKED]` (LMT101 hardware). **Follow-up:** **`./scripts/kas-build-task-105.sh`** green logs → **`diary/PROGRESS.md`**. **`git checkout develop && git pull`** before the next task branch.

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

### TASK-109 — [Phase 1] Qt 6.8 / EGLFS minimal image skeleton
**Status:** `[REVIEW]`  
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
| TASK-105 | kas smoke script + logs (A2 impl, A1 reviewed — green build pending TASK-002 host) | 2026-04-15 |
| TASK-107 | BRINGUP-CHECKLIST.md + README/library links (A2 impl, A1 reviewed) | 2026-04-15 |
| TASK-110 | Fix linux-rockchip_%.bbappend: cfg fragment (replaces KERNEL_CONFIG:append) + do_configure DTS placement (A1 impl, supervisor approved) | 2026-04-16 |
| TASK-108 | RAUC skeleton: system.conf, distro conf, key script, bundle stub (A2 impl, A1+supervisor reviewed; DISTRO_FEATURES fix by A1) | 2026-04-16 |

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
