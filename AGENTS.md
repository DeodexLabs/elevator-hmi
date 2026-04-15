# AGENTS.md — Multi-Agent Coordination Protocol

**Owner:** Claude Code (lead agent)  
**Last updated:** 2026-04-15 (TASK-005 added)  

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

---

## Task Queue

Tasks are sorted by dependency order. Do not reorder.

---

### TASK-005 — Convert vendor PDF library to Markdown
**Status:** `[DONE]`  
**Assigned to:** A1  
**Phase:** 0  
**Depends on:** Library PDFs present in `library/`  

**Description:**  
Convert all vendor PDFs in `library/` (recursive) to Markdown using `markitdown[pdf]`. Generated `.md` files are tracked in Git; PDFs are gitignored.

**Deliverables:**
- `scripts/convert-library.sh` — recursive, handles subdirectory structure, installs `markitdown[pdf]`
- `library/EM3566/**/*.md` — 44 Markdown files generated (co-located with PDFs)
- `.gitignore` updated: `library/**/*.pdf` excluded, `.md` files tracked

**Output notes (A1):**
> Ran 2026-04-15. 44/45 converted OK. 1 failure: `Sensor_OV13850-G04A_OmniVision_Specification(V1.1).pdf` (scanned/image-only). Documented as BLK-005 (LOW severity — camera sensor not used in project). Root cause of initial 45/45 failure: `markitdown` installed without `[pdf]` extras; fixed in script.

---

### TASK-001 — Initialize Git repository and kas manifest
**Status:** `[REVIEW]`  
**Assigned to:** A2  
**Phase:** 0  
**Depends on:** —  

**Description:**  
Initialize the project Git repository structure using `kas` as the Yocto workspace manager.

**Deliverables:**
- `kas/elevator-hmi.yml` — kas manifest pinning all layers to exact commit hashes
- Layers to include:
  - `poky` — Scarthgap branch (pin to latest stable tag)
  - `meta-rockchip` — pin to latest commit compatible with Scarthgap
  - `meta-qt6` — pin to latest Scarthgap-compatible commit
  - `meta-rauc` — pin to latest Scarthgap-compatible commit
- Empty layer skeletons created:
  - `meta-hmi-platform/` with correct `layer.conf`
  - `meta-hmi-app/` with correct `layer.conf`
- `README.md` at repo root explaining how to run `kas build`

**Acceptance criteria:**
- `kas build kas/elevator-hmi.yml` resolves all layers without error (dry run is acceptable if build host not configured)
- Both custom layers parse without BitBake syntax errors
- All external layer SHASUMs are pinned (no floating branches)

**Output notes (A2 fills in):**
> - Added `kas/elevator-hmi.yml` (format header 21, kas 5.x) with **pinned SHAs**: poky `yocto-5.0.16` (`1d54d1c4736a114e1cecbe85a0306e3814d5ce70`), `meta-openembedded` scarthgap (`5124ac4a658899158f4a7a2ddf1d2ca931ec7d0e`), `meta-rockchip` scarthgap (`5218d6330f5c49724650e63902e569c909df0889`), `meta-qt6` `lts-6.8.7` (`443684a06b504b94cc85b51b5c70cdb0a87b7e5f`), `meta-rauc` scarthgap (`d63878f20eba7a85ecf53566e7a3377e78bb46ac`). **meta-openembedded** is included because `meta-rockchip` upstream depends on `meta-oe` (documented in manifest comments and root README).
> - `meta-hmi-platform` and `meta-hmi-app`: `conf/layer.conf` (Scarthgap-compatible), plus minimal **sentinel** `.bb` recipes under `recipes-core/sentinel/` so BitBake can parse the layers before real recipes exist.
> - `README.md`: how to run `kas build` / `kas dump`, `KAS_WORK_DIR` note, layer table.
> - Verified: `kas dump kas/elevator-hmi.yml` exits 0; `kas shell kas/elevator-hmi.yml --skip setup_environ` checks out repos and writes `build/conf/bblayers.conf` with **poky → meta-oe → BSP → Qt → RAUC → HMI** order (kas layer `prio` values, max 99 per schema).
> - Full `bitbake-layers show-layers` not executed on this host: missing `lz4c` (expected once TASK-002 host packages are installed). Not a manifest defect.
> - `.gitignore`: ignore `build/conf/` (kas-generated `bblayers.conf` / `local.conf`).

---

### TASK-002 — Yocto build host setup script
**Status:** `[READY]`  
**Assigned to:** A2  
**Phase:** 0  
**Depends on:** TASK-001  

**Description:**  
Create a reproducible build host setup script for Ubuntu 22.04 LTS.

**Deliverables:**
- `scripts/setup-build-host.sh` — installs all Yocto Scarthgap build dependencies
- `scripts/README.md` — one-page setup guide
- Required packages must include everything listed in Yocto Scarthgap host requirements: `kas`, `git`, `diffstat`, `unzip`, `texinfo`, `gcc`, `build-essential`, `chrpath`, `socat`, `python3`, `python3-pip`, `python3-pexpect`, `xz-utils`, `debianutils`, `iputils-ping`, `python3-git`, `python3-jinja2`, `libegl1-mesa`, `libsdl1.2-dev`, `pylint`, `xterm`, `python3-subunit`, `mesa-common-dev`, `zstd`, `liblz4-tool`

**Acceptance criteria:**
- Script is idempotent (safe to run twice)
- Script checks Ubuntu version and exits with clear error if not 22.04
- After running, `kas --version` and `bitbake --version` both work

**Output notes (A2 fills in):**
> _pending_

---

### TASK-003 — Partition layout (WKS file)
**Status:** `[READY]`  
**Assigned to:** A2  
**Phase:** 0  
**Depends on:** TASK-001  

**Description:**  
Create the Yocto WKS (Wic Kickstart) partition layout file in `meta-hmi-platform`.

**Deliverables:**
- `meta-hmi-platform/wic/elevator-hmi-emmc.wks.in`

**Partition layout to implement:**
```
# Elevator HMI eMMC partition layout
# Total eMMC: 16 GB

part /boot    --source bootimg-partition  --ondisk mmcblk0 --fstype=vfat  --label boot     --active --align 4    --size 64M
part /        --source rootfs             --ondisk mmcblk0 --fstype=ext4  --label rootfs_a --align 4    --size 2048M
part          --ondisk mmcblk0 --fstype=ext4  --label rootfs_b --align 4    --size 2048M   # slot B, empty at factory
part /data    --source rootfs             --ondisk mmcblk0 --fstype=ext4  --label data     --align 4    --size 4096M
```

Note: This is a simplified WKS. The final A/B layout will be coordinated with RAUC in Phase 2. For Phase 0, establish the data partition and document the intent clearly in comments.

**Acceptance criteria:**
- File parses with `wic ls` without error
- Comments in file explain A/B intent for Phase 2 RAUC integration
- Added to `meta-hmi-platform/conf/layer.conf` as a WICVARS source

**Output notes (A2 fills in):**
> _pending_

---

### TASK-004 — JD9365D kernel backport patch (Phase 1 prerequisite)
**Status:** `[READY]`  
**Assigned to:** A2  
**Phase:** 0 (prepared), applied in Phase 1  
**Depends on:** TASK-001  

**Description:**  
Prepare the JD9365D panel driver backport patch from Linux 6.2 mainline to 6.1.99. This is a Phase 0 deliverable (preparation only) per roadmap item 1.3.

**Deliverables:**
- `meta-hmi-platform/recipes-kernel/linux/files/0001-drm-panel-add-jadard-jd9365da-h3-driver-backport-6.1.99.patch`
- Source: `drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c` from Linux 6.2 tag
- DT binding: `Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml` from Linux 6.2 tag
- Patch must apply cleanly to 6.1.99 with `patch --dry-run`
- `meta-hmi-platform/recipes-kernel/linux/linux-rockchip_%.bbappend` skeleton that applies the patch via `SRC_URI`

**Important notes:**
- Do NOT modify the kernel source directly — patch only
- The DTS node for this panel is a Phase 1 task (TASK-101) — this task delivers the driver only
- Verify the panel driver has no dependencies on 6.2-specific kernel APIs that do not exist in 6.1.99

**Acceptance criteria:**
- Patch applies with `git apply --check` on a clean 6.1.99 tree
- `linux-rockchip_%.bbappend` is syntactically valid
- A check note is added to `diary/PROGRESS.md` confirming backport compatibility

**Output notes (A2 fills in):**
> _pending_

---

### TASK-101 — [Phase 1] DTS node for JD9365D / LMT101SX006C
**Status:** `[BLOCKED — needs TASK-004 done and R-02 closed]`  
**Phase:** 1  

---

### TASK-102 — [Phase 1] U-Boot eMMC boot recipe
**Status:** `[BLOCKED — needs TASK-001 done and CM3566 dev kit on hand]`  
**Phase:** 1  

---

### TASK-103 — [Phase 1] Minimal kernel image recipe (core-image-minimal, RK3566)
**Status:** `[BLOCKED — needs TASK-001 done]`  
**Phase:** 1  

---

## Completed Tasks

| Task | Description | Completed |
|---|---|---|
| TASK-005 | Convert vendor PDF library to Markdown | 2026-04-15 |

---

## Notes on A2 Behavior (Composer2)

- Always read `CLAUDE.md` at session start.
- Implement exactly as specified in the task. If the spec is ambiguous, **stop and ask A1**, do not assume.
- Never modify `meta-rockchip`, `meta-qt6`, or `meta-rauc` directly.
- Never change the partition layout without a new task spec from A1.
- Code style: shell scripts use `set -euo pipefail`. Python uses type hints.
- Commit format: `[phaseN][component] short description` — e.g., `[phase0][kas] pin layer SHASUMs`