# BLOCKERS.md — Active Blockers and Questions

**Owner:** A1 (Claude Code)  
**Format:** Open blockers at top. Closed blockers moved to archive at bottom.

---

## Open Blockers

### BLK-006 — JD9365 / LMT101 panel reset (XRES) not documented on EM3566 CON1
**Opened:** 2026-04-15  
**Severity:** MEDIUM — display bring-up risk until bench-validated  
**Owner:** A1  
**Details:**  
Public **EM3566 v3** materials (`library/EM3566/Usermanual/EM3566_hardware_manual.md` §2.8 CON1, `library/EM3566/Schematic/em3566_v3sch.md`) name **VCC3V3_LCD**, **LCD_PWREN_H**, **LCD_BL_PWM**, and MIPI DSI lanes, but do **not** map **JD9365 XRES** (driver `reset-gpios`) to a specific RK3566 GPIO. TASK-101 therefore ships a **DSI fragment** without `reset-gpios`, and kernel patch **0002** makes `reset-gpios` **optional** in the binding/driver so the node can parse and probe when reset is hard-wired or tolerates software-only sequencing.  
**Required action:**  
- On first **EM3566 v3 + LMT101** bench session: confirm display init; if unstable, trace **XRES** on the carrier / flex and add `reset-gpios` to `elevator-hmi-lmt101sx006c-panel.dtsi` (or board DTS) with a cited source (schematic or Boardcon BSP `.dts`).  
**Resolution criteria:** `reset-gpios` added with documented GPIO **or** bench log confirms stable operation without it and blocker closed with rationale.

---

## Closed Blockers

### BLK-007 — Ubuntu 24.04 (Noble): `libegl1-mesa` missing from apt (TASK-002 host script)
**Opened:** 2026-04-15 — **Closed:** 2026-04-15  
**Severity was:** LOW (host setup friction, not product silicon)  
**Resolution:**  
On **Noble**, **`libegl1-mesa`** was removed from the archive in favour of the GLVND split (**`libegl1`** + **`libegl-mesa0`**). **`scripts/setup-build-host.sh`** now selects EGL packages by **`VERSION_ID`** (**22.04:** **`libegl1-mesa`**; **24.04:** **`libegl1`** + **`libegl-mesa0`**). **`mesa-common-dev`** unchanged.  
**Tracked in:** `scripts/setup-build-host.sh`, `diary/PROGRESS.md` session notes.

---

### BLK-005 — OmniVision OV13850 datasheet failed PDF-to-Markdown conversion
**Opened:** 2026-04-15 — **Closed:** 2026-04-15  
**Severity was:** LOW  
**Resolution:**  
**Closed — not in project scope.** OV13850 is a dev-kit camera sensor, not used in the elevator HMI BOM or software. No `.md` conversion required unless a future task explicitly needs camera bring-up. The PDF remains in `library/` for reference; OCR or a text-layer vendor PDF is optional follow-up outside current phases.

---

### BLK-001 — R-01: CM3566 minimum operating temperature (vendor response)
**Opened:** 2026-04-15 — **Closed:** 2026-04-15  
**Resolution:**  
Vendor / documentation confirms the CM3566 **can run at −20°C** (reliability test: **4 hours at −20°C ±2°C** passed). **However**, official datasheet limits remain: **recommended operating 0°C–70°C**, **storage −40°C–85°C**. Continuous operation at −20°C is **outside** the stated *recommended* ambient range even though a low-temperature test passed.  
**Project stance:** Treat −20°C as **supported by vendor test evidence** with **residual risk** vs written “recommended” spec — acceptable for Phase 0/1 planning **if** project owner formally accepts this gap (warranty, field profile, or future industrial SKU still optional follow-ups).  
**Tracked in:** `CLAUDE.md` §6 (R-01).

---

### BLK-002 — R-02: MIPI-DSI vs LVDS (hardware manual clarification)
**Opened:** 2026-04-15 — **Closed:** 2026-04-15 (addendum **2026-04-16**: EM3566 v3)  
**Resolution:**  
The CM3566 **SoM does not expose a display FPC** on the module; the connector lives on the **carrier**. Per CM3566 hardware manual, **display data pins 25–34 are multiplexed**: each lane is named **both** `MIPI_DSI_TX0_*` **and** `LVDS_TX0_*` — RK3566 outputs **either** protocol depending on **software and carrier** design, not “MIPI-only” at the SoM ball map.  
**Reference carrier — Boardcon EM3566 v3:** Block diagram / layout (sources in `library/EM3566/`) describe this board as the **CM3566 development kit**. It exposes **HDMI**, **LVDS out** (optional), **MIPI LCD**, **eDP**, BT656, etc. For HMI bring-up: **yes, there is a dedicated `MIPI LCD` connector** — physically intended for **MIPI-DSI** panels. The same muxed **LVDS/MIPI TX** bus from the SoM is **routed both** to that **MIPI LCD** connector **and** to the **LVDS OUT** interface (optional population); therefore the connector is correct for LMT101 **provided** software + hardware mode select **MIPI-DSI** on the SoM mux (DT / strap per Rockchip reference).  
**Project stance:** Use **EM3566 v3 `MIPI LCD`** for bench validation of LMT101; treat **custom production carrier** as a separate schematic review. Debian “LVDS LCD” wording remains explainable as mux + optional LVDS header, not a denial of MIPI.  
**Follow-up (not a blocker):** production carrier schematic + population options; dev kit is not the shipping elevator PCB.  
**Tracked in:** `CLAUDE.md` §1 identity, §6 (R-02).

---

### BLK-003 — Backlight boost IC selection (TPS61187 / RT4813 / MP3309)
**Opened:** 2026-04-15 — **Closed:** 2026-04-15  
**Resolution:**  
**Deferred by product decision:** panel/backlight path is fixed; **constant backlight feed** is acceptable for now — **no boost IC part pick** required for Phase 0/1 gate. Re-open a hardware task when dimming, efficiency, or LMT101 electrical spec demands a dedicated boost design.  
**Tracked in:** `CLAUDE.md` §2 checklist.

---

### BLK-004 — Protocol interface (RS-485 vs RS-485 + CAN-FD)
**Opened:** 2026-04-15 — **Closed:** 2026-04-15 (addendum **2026-04-16**: UART bring-up)  
**Resolution:**  
**Deferred by product decision:** **do not plan elevator fieldbus PHY** (RS-485 / CAN-FD / MCP2518FD) for now. PAL / controller interface remains **abstracted in software**; concrete PHY and connector strategy **TBD** when the product unblocks communications.  
**Addendum — interim link to SoM (Phase 0/1):** use **UART serial console** on the reference board (host ↔ EM3566 v3 debug/UART) to monitor **boot, loaded image behaviour, RAUC, and logs** — **not** a replacement for PAL’s future controller protocol, but the agreed **lab/diagnostic** channel until fieldbus is chosen.  
**Tracked in:** `CLAUDE.md` §1 identity table, §2 checklist, §8 PAL.
