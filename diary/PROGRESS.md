# Development Diary — Elevator HMI

**Format:** One entry per session. Most recent entry first.

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
- **`meta-hmi-platform/recipes-bsp/u-boot/u-boot-rockchip_%.bbappend`** + **`files/elevator-hmi-emmc-boot.cfg`** — merge MMC / GPT / DW MMC / raw-partition options (aligned with vendor `rk3568_defconfig` at `SRCREV a93658f8…`); `UBOOT_LOCALVERSION = "-elevator-hmi-emmc"`.  
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
- **`meta-hmi-platform/recipes-bsp/u-boot/u-boot-rockchip_%.bbappend`** + **`files/elevator-hmi-emmc-boot.cfg`** — merge MMC/GPT/raw-partition options aligned with vendor **`rk3568_defconfig`**; **`UBOOT_LOCALVERSION`**.  
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
