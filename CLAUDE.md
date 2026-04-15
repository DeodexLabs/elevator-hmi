# CLAUDE.md — Elevator HMI Project Master Context

**Read this file fully at the start of every session before taking any action.**
**Update `diary/PROGRESS.md` at the end of every session.**

---

## 1. Project Identity

| Field | Value |
|---|---|
| Product | Elevator Car HMI System |
| Target market | Turkey and regional markets |
| Production volume | 500–1,000 units/year |
| SoM | Compulab CM3566 (RK3566, 2 GB LPDDR4, 16 GB eMMC) |
| Display | LMT101SX006C — 10.1" portrait, 800×1280, 4-lane MIPI-DSI, JD9365D driver IC |
| Build system | Yocto Scarthgap 5.0 LTS |
| Kernel | Linux 6.1.99 (Rockchip vendor fork) + JD9365D backport |
| UI | Qt 6.8 LTS — QML only, EGLFS backend, Mali-G52 GPU |
| Media | GStreamer + gst-plugins-rockchip (zero-copy VPU, H.264/H.265) |
| OTA | RAUC A/B partitioning, signed bundles |
| Protocol | Abstraction layer — CAN-FD (MCP2518FD SPI) or RS-485 Modbus RTU |
| Watchdog | Two-tier: systemd WDT + RK3566 hardware WDT |
| Operation | 24/7 unattended, industrial −20°C to +60°C (pending risk R-01) |
| Field life target | 5+ years |

---

## 2. Current Phase Status

> **Update this section when phase changes.**

| Field | Value |
|---|---|
| **Active phase** | Phase 0 — Foundation & Risk Mitigation |
| **Phase weeks** | Weeks 1–3 |
| **Phase gate** | All risks resolved or accepted. Hardware ordered. Dev environment operational. |
| **Current week** | Week 1 |
| **Blocking risks** | R-01 (temperature), R-02 (MIPI-DSI routing) — must close before Phase 1 |

### Phase 0 Checklist

- [x] Git repo structure initialized (kas manifest) — TASK-001 DONE 2026-04-15
- [x] Vendor PDF library converted to Markdown — TASK-005 DONE 2026-04-15
- [ ] R-01: CM3566 min temp confirmed with vendor (need −20°C or heater decision)
- [ ] R-02: MIPI-DSI routing confirmed on CM3566 carrier board display connector
- [ ] R-03: JD9365D backport patch prepared and tested (panel-jadard-jd9365da-h3.c from Linux 6.2) — TASK-004 in queue
- [ ] R-04: Adaptive backlight strategy documented (accepted — Phase 3 implementation)
- [ ] Protocol interface decided: RS-485 only vs RS-485 + CAN-FD expansion
- [ ] Backlight boost IC selected (candidates: TPS61187, RT4813, MP3309)
- [ ] CM3566 dev kit ordered
- [ ] LMT101SX006C panel ordered
- [ ] `bitbake core-image-minimal` for RK3566 passes clean — TASK-002/003 in queue

---

## 3. Technology Decisions (ADR-001 — Non-negotiable)

These decisions are final. Do not propose alternatives without a new ADR entry.

| Component | Decision | Reason summary |
|---|---|---|
| OS/Build | Yocto Scarthgap 5.0 LTS | Reproducible, minimal, RAUC-compatible, 5yr LTS |
| Kernel | Linux 6.1.99 Rockchip fork | VPU/GPU maturity; mainline deferred to Phase 2 review |
| Qt | Qt 6.8 LTS | Qt 6.5 EOL April 2026; EGLFS, no Wayland/X11 overhead |
| Media | GStreamer + gst-plugins-rockchip | Zero-copy VPU decode mandatory for 24/7 thermal budget |
| OTA | RAUC A/B | Signed, rollback-capable, Yocto native |
| Android 14 | REJECTED | Wrong model, slow boot, no RAUC, poor Qt integration |
| Debian Buildroot | REJECTED | Non-reproducible, no A/B OTA, runtime apt is liability |
| Kirkstone | REJECTED | EOL April 2025 |
| Qt 6.5 | REJECTED | EOL April 2026 |

---

## 4. Yocto Layer Architecture

```
meta-rockchip          # Community BSP. NEVER modified. Pinned to a commit hash.
meta-qt6               # Community Qt 6. NEVER modified. Pinned to a commit hash.
meta-rauc              # Community RAUC. NEVER modified. Pinned to a commit hash.
meta-hmi-platform      # Project BSP extensions:
                       #   - Kernel recipe with JD9365D backport patch
                       #   - Backlight driver recipe
                       #   - Partition layout (.wks file)
                       #   - systemd unit files for platform services
meta-hmi-app           # Application layer:
                       #   - Qt 6.8 QML application recipe
                       #   - GStreamer pipeline configuration
                       #   - Protocol abstraction service (PAL daemon) recipe
                       #   - RAUC bundle recipe
```

**Rule:** Community layers are read-only. All project modifications live in `meta-hmi-platform` and `meta-hmi-app`. No exceptions.

---

## 5. Partition Layout (Fixed at Image Build — Cannot Change Without Full Reflash)

```
/dev/mmcblk0p1   boot        U-Boot + SPL
/dev/mmcblk0p2   kernel_a    Kernel + DTB, slot A
/dev/mmcblk0p3   kernel_b    Kernel + DTB, slot B
/dev/mmcblk0p4   rootfs_a    Root filesystem, slot A (active)
/dev/mmcblk0p5   rootfs_b    Root filesystem, slot B (update target)
/dev/mmcblk0p6   data        Persistent data — NEVER erased by OTA
```

`/data` holds: application config, content manifest, video assets, logs, OTA staging.

---

## 6. Open Risks

| ID | Risk | Severity | Status |
|---|---|---|---|
| R-01 | CM3566 spec says 0°C to +80°C. Project needs −20°C to +60°C. Lower bound not met. | High | **OPEN** — vendor contact required |
| R-02 | Vendor Debian doc references "LVDS LCD." LMT101 is MIPI-DSI. Carrier routing unconfirmed. | High | **OPEN** — physical confirmation required |
| R-03 | JD9365D driver not in Linux 6.1.x. Mainline merge was 6.2. | Medium | **OPEN** — backport patch must be prepared (TASK-004) |
| R-04 | LED backlight lifetime ~2.3yr at 24/7 full brightness. Target is 5yr. | Medium | **ACCEPTED** — adaptive dimming in Phase 3 |

---

## 7. Agent Roles

### This agent (Claude Code) — Lead
- Maintains this file and all files in `diary/`
- Owns `AGENTS.md` task queue — writes task specs for Composer2, marks them done
- Reviews all Composer2 output before it is merged
- Runs integration checks after each Composer2 task
- Escalates risks and blockers to project owner
- Updates phase status and decision log
- Is the single source of truth for project state

### Composer2 (Cursor) — Implementation
- Picks tasks from `AGENTS.md` task queue — only tasks marked `[READY]`
- Implements exactly as specified; does not deviate from architecture
- Reports completion by updating task status to `[REVIEW]` in `AGENTS.md`
- Creates a branch named `task/TASK-NNN-short-description` for every task
- Never commits directly to `main` or `develop`
- Never modifies community Yocto layers
- Never changes partition layout or RAUC key material
- See `.cursor/rules/elevator-hmi.mdc` for full rules

---

## 8. Coding Conventions

### Yocto recipes
- Recipe format: Yocto Scarthgap compatible (no deprecated syntax)
- All kernel patches named: `NNNN-description-of-patch.patch` (4-digit prefix)
- Patch applied via `SRC_URI` in kernel recipe, not by modifying kernel source directly
- All recipes in `meta-hmi-platform` or `meta-hmi-app` — never in community layers

### Qt / QML
- No C++ UI code — all UI is QML
- C++ backend exposes state to QML via `Q_PROPERTY` and signals only
- EGLFS backend — no Wayland, no X11, no window manager
- All QML files in `src/qml/`, mirrored in `meta-hmi-app` recipe

### Protocol Abstraction Layer (PAL)
- PAL is a separate systemd daemon — not part of the Qt application process
- Qt application communicates with PAL via D-Bus or Unix domain socket (TBD Phase 2)
- PAL handles all hardware protocol details (CAN-FD / RS-485 framing, retries, timeouts)
- Application layer never includes CAN or Modbus headers

### General
- All code committed with meaningful messages: `[phase][component] what changed and why`
- No WIP commits to main branch
- Branch naming: `task/TASK-NNN-short-description` for all A2 task branches
- Integration test results logged in `diary/PROGRESS.md`

---

## 9. Key Source References (in library/)

| Document | What it covers |
|---|---|
| `library/EM3566/Usermanual/CM3566_Hardware_Manual_V3.md` | CM3566 hardware manual — GPIO, pinout, interfaces |
| `library/EM3566/Datasheet/Rockchip_RK3566_Datasheet_V1.5-20241211.md` | RK3566 SoC datasheet (latest) |
| `library/EM3566/Linux6.1/Usermanual/EM3566 linux6.1 user manual_V1.0.md` | Linux 6.1 BSP user manual |
| `library/EM3566/Schematic/em3566_v3sch.md` | EM3566 schematic (text extraction) |
| `library/EM3566/Datasheet/K101-IM2KYL02-L3_MIPI.md` | MIPI panel datasheet (R-02 reference) |
| `docs/roadmap-v1.md` | Full 32-week roadmap, phase gates, deliverable list |
| `docs/platform-decisions-v1.md` | ADR-001 — all technology decisions with rationale |

*Note: LMT101SX006C, SKD41, ACM reference PDFs not yet in library/ — add when obtained.*

---

## 10. Session Start Protocol

1. Read this file (`CLAUDE.md`) fully.
2. Read `diary/PROGRESS.md` — last 10 entries minimum.
3. Read `AGENTS.md` — check task queue status.
4. Check `diary/BLOCKERS.md` — any open blockers?
5. Then proceed with the session goal.

## 11. Session End Protocol

1. Update `diary/PROGRESS.md` with what was done, any findings, next actions.
2. Update `AGENTS.md` — add new tasks for Composer2 if applicable, update task statuses.
3. Update `diary/BLOCKERS.md` — add new blockers, close resolved ones.
4. Update section 2 (Current Phase Status) if phase or checklist changed.
5. Commit all diary/status changes with message: `[diary] YYYY-MM-DD session summary`
