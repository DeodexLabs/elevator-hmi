# Development Diary — Elevator HMI

**Format:** One entry per session. Most recent entry first.

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
