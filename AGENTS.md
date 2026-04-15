# AGENTS.md — Multi-Agent Coordination Protocol

**Owner:** Claude Code (lead agent)  
**Last updated:** 2026-04-15 (TASK-102 `[DONE]`; TASK-103 `[READY]` — next for A2)  

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
**Open:** **BLK-006** (JD9365 `reset-gpios` / XRES — medium; see `diary/BLOCKERS.md`). **BLK-005** closed 2026-04-15 (OV13850 — not in project scope). Phase 1: validate DSI on **EM3566 v3** + LMT101; production carrier schematic + formal −20°C acceptance before shipping hardware.  
**A2 queue:** **TASK-103** **`[READY]`** only — **`git checkout develop && git pull`** before **`task/TASK-103-…`** branch.

---

### TASK-103 — [Phase 1] Minimal kernel image recipe (core-image-minimal, RK3566)
**Status:** `[READY]`  
**Phase:** 1  
**Depends on:** TASK-001 ✓, TASK-002 ✓ (build host script + deps installed on the machine used for `kas`/`bitbake`), **Boardcon EM3566 v3 dev kit on hand** ✓ (owner 2026-04-15)  

**Note:** First successful `kas build` / `bitbake` on that host can be part of TASK-103 acceptance; if the host is not yet exercised, run **`scripts/setup-build-host.sh`** (TASK-002) before claiming `[REVIEW]`. **Follow-up:** on a TASK-002–prepared host, run **`kas build kas/elevator-hmi.yml --target virtual/kernel`** and **`--target u-boot`** to close smoke gaps from TASK-104 / TASK-102 sign-off (host `lz4c`).

---

### TASK-102 — [Phase 1] U-Boot eMMC boot recipe *(archived — [DONE] 2026-04-15)*
**Status:** `[DONE]`  
**Branch:** `task/TASK-102-uboot-emmc` (merge to `develop` after A1 commit in this session).  

**Output notes (A2):** *(summary)* `u-boot-rockchip_%.bbappend` + **`elevator-hmi-emmc-boot.cfg`** Kconfig fragment; **`UBOOT_LOCALVERSION`**; machine conf comments (eMMC / WIC / `rk3568_defconfig`); smoke blocked on **`lz4c`**. See branch history for full bullets.

**A1 review notes (2026-04-15):**  
- **PASS:** All changes under **`meta-hmi-platform`**; **`u-boot-rockchip_%.bbappend`** uses Scarthgap **`SRC_URI:append`** / **`FILESEXTRAPATHS:prepend`**; no **`meta-rockchip`** edits; Rockchip **`make.sh`** / SPL flow untouched.  
- **PASS:** **`elevator-hmi-emmc-boot.cfg`** is a standard Poky **`*.cfg`** fragment; **`u-boot.inc`** pulls **`u-boot-configure.inc`**, which runs **`merge_config.sh`** after **`${UBOOT_MACHINE}`** (`rk3568_defconfig` per **`rockchip-rk3566-evb`**) — mechanism is correct for Scarthgap. Fragment is **documenting / idempotent** vs vendor defconfig (acceptable).  
- **PASS:** **`UBOOT_LOCALVERSION = "-elevator-hmi-emmc"`** aids traceability on serial / binaries.  
- **PASS:** Machine comment ties **mmcblk0** to WIC / TASK-003 narrative without changing partition layout.  
- **Deferred acceptance:** **`kas build … --target u-boot`** did not reach BitBake on review host (**`lz4c`**). Same as TASK-104 — confirm on TASK-002 host or as part of **TASK-103**.  
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
| TASK-002 | Ubuntu 22.04 build host setup script (A2 impl, A1 reviewed) | 2026-04-15 |
| TASK-003 | eMMC partition layout WKS file (A2 impl, A1 reviewed — A1 fixed duplicate WICVARS) | 2026-04-15 |
| TASK-004 | JD9365D panel driver backport patch 6.2→6.1.99 (A2 impl, A1 reviewed) | 2026-04-15 |
| TASK-005 | Convert vendor PDF library to Markdown | 2026-04-15 |
| TASK-101 | LMT101 / JD9365 DSI fragment + optional-reset kernel patch (A2 impl, A1 reviewed) | 2026-04-15 |
| TASK-104 | Boardcon EM3566 machine DTS + LMT101 on DSI0 + kas machine (A2 impl, A1 reviewed) | 2026-04-15 |
| TASK-102 | U-Boot eMMC Kconfig fragment + bbappend (A2 impl, A1 reviewed) | 2026-04-15 |

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
