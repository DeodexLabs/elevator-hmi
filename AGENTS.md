# AGENTS.md — Multi-Agent Coordination Protocol

**Owner:** Claude Code (lead agent)  
**Last updated:** 2026-04-15 (TASK-002/003/004 reviewed and merged by A1 — Phase 0 queue complete)  

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

**Phase 0 gate status:** All A2 tasks complete. Remaining blockers are human-action items.  
Phase 1 cannot start until BLK-001 (CM3566 temp range) and BLK-002 (MIPI-DSI routing) are resolved by the project owner.

---

### TASK-101 — [Phase 1] DTS node for JD9365D / LMT101SX006C
**Status:** `[BLOCKED — needs R-02 closed (MIPI-DSI routing confirmed)]`  
**Phase:** 1  
**Depends on:** TASK-004 ✓, R-02 OPEN  

---

### TASK-102 — [Phase 1] U-Boot eMMC boot recipe
**Status:** `[BLOCKED — needs CM3566 dev kit on hand]`  
**Phase:** 1  
**Depends on:** TASK-001 ✓, hardware in hand  

---

### TASK-103 — [Phase 1] Minimal kernel image recipe (core-image-minimal, RK3566)
**Status:** `[BLOCKED — needs TASK-002 complete on build host and CM3566 dev kit]`  
**Phase:** 1  
**Depends on:** TASK-001 ✓, TASK-002 ✓ (build host), hardware in hand  

---

## Completed Tasks

| Task | Description | Completed |
|---|---|---|
| TASK-001 | kas manifest + layer skeletons (A2 impl, A1 reviewed) | 2026-04-15 |
| TASK-002 | Ubuntu 22.04 build host setup script (A2 impl, A1 reviewed) | 2026-04-15 |
| TASK-003 | eMMC partition layout WKS file (A2 impl, A1 reviewed — A1 fixed duplicate WICVARS) | 2026-04-15 |
| TASK-004 | JD9365D panel driver backport patch 6.2→6.1.99 (A2 impl, A1 reviewed) | 2026-04-15 |
| TASK-005 | Convert vendor PDF library to Markdown | 2026-04-15 |

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
