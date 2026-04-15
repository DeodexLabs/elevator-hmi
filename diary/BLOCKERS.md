# BLOCKERS.md — Active Blockers and Questions

**Owner:** A1 (Claude Code)  
**Format:** Open blockers at top. Closed blockers moved to archive at bottom.

---

## Open Blockers

### BLK-005 — OmniVision OV13850 datasheet failed PDF-to-Markdown conversion
**Opened:** 2026-04-15  
**Severity:** LOW — camera sensor, not relevant to HMI display or protocol; no current use in project  
**Owner:** A1  
**Details:**  
`library/EM3566/Datasheet/Sensor_OV13850-G04A_OmniVision_Specification(V1.1).pdf` failed `markitdown` conversion. This is the OmniVision OV13850 13MP camera sensor datasheet bundled with the EM3566 dev kit. The file is likely a scanned/image-only PDF with no embedded text layer.  
**Required action:**  
- Low priority: this sensor is not used in the elevator HMI design.  
- If access is ever needed: run `tesseract` OCR on the PDF, or source a text-layer version from OmniVision directly.  
**Resolution criteria:** Either a converted `.md` file is committed, or the blocker is formally closed as "not needed for project scope."

---

### BLK-001 — R-01: CM3566 minimum operating temperature not confirmed
**Opened:** 2026-04-15  
**Severity:** HIGH — blocks Phase 1 gate  
**Owner:** Project owner (human action required)  
**Details:**  
CM3566 module specification states operating range 0°C to +80°C. Project requirement is −20°C to +60°C. The lower bound is not met by the module spec.  
**Required action:**  
Contact CM3566 vendor (Compulab or local distributor) and ask:
1. "What is the rated minimum operating temperature for the CM3566?"
2. "Is an industrial-grade variant rated to −20°C available?"
3. If no: escalate to project owner — options are (a) enclosure heater design, (b) formally narrow operating spec to 0°C.  
**Resolution criteria:** Written vendor response on record. Decision documented in diary.

---

### BLK-002 — R-02: MIPI-DSI vs LVDS routing on CM3566 carrier not confirmed
**Opened:** 2026-04-15  
**Severity:** HIGH — blocks PCB layout and Phase 1 display bring-up  
**Owner:** Project owner (human action required)  
**Details:**  
LMT101SX006C uses 4-lane MIPI-DSI. Vendor's Debian documentation references "LVDS LCD." The CM3566 hardware manual must be checked for display connector FPC pinout, and physical confirmation from vendor is required that MIPI-DSI signals are routed (not LVDS) to the display FPC connector on the carrier board.  
**Required action:**  
1. Check `cm3566_hardware_manual_v3202501.pdf` — locate display connector FPC pinout section.
2. Confirm MIPI-DSI TX0 signals (CLK+/−, D0–D3 +/−) are on the connector.
3. If ambiguous, contact vendor directly with the question.  
**Resolution criteria:** FPC pinout confirmed. Written vendor confirmation if hardware manual is ambiguous.

---

### BLK-003 — Backlight boost IC not selected
**Opened:** 2026-04-15  
**Severity:** MEDIUM — blocks Phase 0 BOM lock and carrier board schematic  
**Owner:** Project owner / hardware engineer  
**Details:**  
Three candidates identified: TPS61187, RT4813, MP3309. Selection requires comparing datasheet specs against LMT101 backlight requirements:
- Input voltage: 3.3–5V
- Output voltage: 9–10V (check LMT101 spec page for VLED)
- Dimming: PWM or I²C
- Temperature range: industrial
- Package: DFN or SOT  
**Required action:** Select part, add to BOM, document choice in diary with rationale.

---

### BLK-004 — Protocol interface decision pending
**Opened:** 2026-04-15  
**Severity:** MEDIUM — blocks carrier board schematic  
**Owner:** Project owner / market analysis  
**Details:**  
Decision required: RS-485 Modbus RTU only, or RS-485 + optional CAN-FD via MCP2518FD SPI controller. This affects carrier board hardware design. Cannot defer past Week 3.  
**Required action:** Decision with rationale documented in diary and `CLAUDE.md` decision log.

---

## Closed Blockers

_None yet._
