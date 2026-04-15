# AGENTS.md — Multi-Agent Coordination Protocol

**Owner:** Claude Code (lead agent)  
**Last updated:** 2026-04-15 (TASK-104 → `[REVIEW]`; TASK-102/103 `[READY]`)  

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
**A2 queue:** **TASK-104** `[REVIEW]` — **TASK-102**, **TASK-103`** **`[READY]`** — pick **one** active task at a time; suggested next **102 → 103** after A1 closes 104.

---

### TASK-104 — [Phase 1] Boardcon EM3566 machine DTS — integrate LMT101 panel fragment
**Status:** `[REVIEW]`  
**Phase:** 1  
**Depends on:** TASK-101 ✓, TASK-001 ✓, TASK-002 ✓ (build host packages + kas), pinned `meta-rockchip` tree available locally so the correct **`rk3566-*.dts` / machine** path can be identified **without guessing**  

**Spec:**  
- Wire `elevator-hmi-lmt101sx006c-panel.dtsi` into the **Boardcon EM3566 v3** machine device tree used for bring-up: `#include` or equivalent merge in **`meta-hmi-platform` only** (bbappend, inc fragment, or project-side `.dts` — **never** edit `meta-rockchip` git subdir).  
- Align **`vdd-supply` / `vccio-supply` / `backlight`** phandles to **actual BSP** regulator and backlight node names; add `reset-gpios` only when **BLK-006** is resolved with a cited GPIO.  
- If BSP already defines `&dsi { ports { port@0 { … }}}` for VOP, merge **one** `ports` block per the header comment in `elevator-hmi-lmt101sx006c-panel.dtsi` (avoid duplicate `ports` fragments).  
- Set **`KERNEL_DEVICETREE`** (machine `.conf` / `local.conf` / kas env — follow BSP convention) so the built DTB matches **EM3566 v3 + MIPI LCD** bring-up.  
- **Smoke:** `kas build` / `bitbake virtual/kernel` (or at minimum `bitbake linux-rockchip -c compile`) succeeds on a host that completed TASK-002. Log command + result in task output notes.  

**Acceptance:** Panel fragment included; DT compiles; kernel recipe builds; output notes list files touched and any BSP label renames.

**Output notes (A2):**  
- **BSP baseline (no guess):** `meta-rockchip` @ `5218d6330f5c49724650e63902e569c909df0889` — `rockchip-rk3566-evb` uses `KERNEL_DEVICETREE = "rockchip/rk3566-evb2-lp4x-v10-linux.dtb"`. Kernel `SRCREV` = `ea9e2a9344bfe7f1130dee8100173b6cb95445d2` (`linux-rockchip_6.1.bb`). Inspected `rk3566-evb2-lp4x-v10.dtsi`, `rk3568-evb.dtsi`, `rk356x.dtsi` from that tree: MIPI host is **`&dsi0`**, stock panel is **`panel@0`** under `&dsi0` with **`ports/port@1`** for `dsi_out_panel` ↔ `panel_in_dsi`. TASK-101 fragment incorrectly used **`&dsi`**; replaced with **`&dsi0`** and merge-safe **`/delete-node/`** on stock `panel@0` and `ports/port@1`, then new jadard `panel@0` + `port@1`.  
- **Phandles aligned to BSP:** `vdd-supply = <&vcc3v3_lcd0_n>;`, `vccio-supply = <&vcca_1v8>;`, `backlight = <&backlight>;` (from `rk3566-evb2-lp4x-v10.dtsi` + `rk3568-evb.dtsi`). No `reset-gpios` (BLK-006).  
- **New files:** `meta-hmi-platform/conf/machine/elevator-hmi-em3566.conf` (`require rockchip-rk3566-evb.conf`, `KERNEL_DEVICETREE` override); `meta-hmi-platform/recipes-kernel/linux/files/elevator-hmi-boardcon-em3566-v3.dts` (`#include "rk3566-evb2-lp4x-v10-linux.dts"` + panel dtsi); rewrote `elevator-hmi-lmt101sx006c-panel.dtsi` as **`&dsi0`** overlay only.  
- **`linux-rockchip_%.bbappend`:** `SRC_URI += file://elevator-hmi-boardcon-em3566-v3.dts`.  
- **`kas/elevator-hmi.yml`:** `machine: elevator-hmi-em3566`.  
- **Docs:** `README.md`, `library/EM3566/README.md` — machine string updated / cross-links.  
- **Smoke:** Ran `kas build kas/elevator-hmi.yml --target virtual/kernel` — **failed before BitBake**: host missing **`lz4c`** in `PATH` (kas HOSTTOOLS). Install `lz4` / host deps per TASK-002 script, then re-run `kas build kas/elevator-hmi.yml --target virtual/kernel` on a prepared host; **DTB compile not executed in this session**.  
- **Branch:** `task/TASK-104-boardcon-machine-dts`.  
- **Caveat:** Assumes Boardcon EM3566 v3 MIPI LCD is on **DSI0** like RK3566 EVB2 reference; if vendor routes the FPC to **DSI1**, switch overlay to `&dsi1` and mirror `dsi1_panel` / route patterns from the same BSP files.  
- **Pre-commit verification:** Working tree matches these notes; no edits under `meta-rockchip/` (community layer read-only). Review host: **`lz4c` absent from PATH** — kernel smoke still pending; run **`scripts/setup-build-host.sh`** (TASK-002), then re-run `kas build kas/elevator-hmi.yml --target virtual/kernel`.

---

### TASK-102 — [Phase 1] U-Boot eMMC boot recipe
**Status:** `[READY]`  
**Phase:** 1  
**Depends on:** TASK-001 ✓, **Boardcon EM3566 v3 dev kit on hand** ✓ (owner 2026-04-15)  

---

### TASK-103 — [Phase 1] Minimal kernel image recipe (core-image-minimal, RK3566)
**Status:** `[READY]`  
**Phase:** 1  
**Depends on:** TASK-001 ✓, TASK-002 ✓ (build host script + deps installed on the machine used for `kas`/`bitbake`), **Boardcon EM3566 v3 dev kit on hand** ✓ (owner 2026-04-15)  

**Note:** First successful `kas build` / `bitbake` on that host can be part of TASK-103 acceptance (or TASK-104); if the host is not yet exercised, run **`scripts/setup-build-host.sh`** (TASK-002) before claiming `[REVIEW]`.

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
