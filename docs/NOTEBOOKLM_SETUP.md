# NotebookLM Setup Guide — Elevator HMI Knowledge Base

This document tells you exactly what to upload to NotebookLM and how to query it effectively.
NotebookLM serves as the always-available technical reference for the team — both agents and human developers.

---

## What to Upload

Upload ALL of the following sources to a single NotebookLM notebook named **"Elevator HMI — Technical Reference"**:

### Hardware

| File | Why |
|---|---|
| `cm3566_hardware_manual_v3202501.pdf` | GPIO pinout, display connector FPC routing, power rails, boot modes, interface locations |
| `LMT101SX006C_SPEC.pdf` | Panel timing parameters (pixel clock, HSync/VSync/porch values), power-on sequence, backlight current/voltage |
| `RK3566_Brief_Datasheet.pdf` | SoC feature overview, peripheral capabilities, package info |
| `Rockchip_RK3568_TRM_Part1_V1_3-20220930P.pdf` | Register-level reference — VOP2 display controller, MIPI-DSI controller, GPIO, I2C, SPI, UART, PWM |
| `Rockchip_RK3568_Datasheet_V1_320220929P.pdf` | Detailed SoC datasheet (RK3566 shares most content) |
| `RK3568_AIoT_REF_SCH_V11_20210611.pdf` | Reference schematic — good for understanding typical peripheral circuit patterns |

### Elevator Protocol

| File | Why |
|---|---|
| `SKD41_ENGTR.pdf` | Elevator controller serial protocol — command set, frame format, baud rate |
| `ACM_REFERENCE_MANUAL_TR.pdf` | ACM elevator controller full reference — register map, status codes, event handling |
| `ACM_V100.pdf` | ACM v1.00 supplement |

### Project Design

| File | Why |
|---|---|
| `roadmap-v1.md` | Full phase plan, deliverables, acceptance criteria, test plans |
| `platform-decisions-v1.md` | ADR-001 — all technology decisions with rationale, rejected options |
| `Vendor_Requirements_Specification.md` | SoM vendor RFQ spec — system requirements, interface requirements |
| `CLAUDE.md` (this workspace) | Current project state, open risks, phase status |

---

## Suggested Query Examples

Once uploaded, use these query patterns to get precise answers:

### Hardware bring-up queries
- *"What are the MIPI-DSI signal names on the CM3566 FPC display connector?"*
- *"What is the power-on sequence for the LMT101SX006C display? Specifically the reset timing."*
- *"What is the pixel clock frequency for the LMT101SX006C at 800x1280?"*
- *"What are the horizontal and vertical front/back porch and sync pulse values for the LMT101SX006C?"*
- *"What GPIO is available for the display reset signal on the CM3566 carrier board?"*
- *"What is the VOP2 MIPI-DSI lane configuration for 4-lane DSI on RK3566?"*

### Kernel and driver queries
- *"What kernel config options are required to enable MIPI-DSI display output on RK3566?"*
- *"How is the JD9365D driver configured in the device tree? What properties are required?"*
- *"What is the RK3566 hardware watchdog register address and timeout configuration?"*

### Protocol queries
- *"What is the SKD41 serial frame format for floor position reporting?"*
- *"What baud rate and frame format does the ACM elevator controller use for RS-485 communication?"*
- *"What command does the elevator controller send to indicate door open/close state?"*

### Project context queries
- *"What are the open risks in Phase 0 that must be resolved before Phase 1 begins?"*
- *"Why was Android 14 rejected for this project?"*
- *"What is the partition layout for the eMMC?"*
- *"What is the adaptive backlight dimming policy?"*

---

## Maintenance

- When project design docs are updated (new ADRs, new roadmap revision), re-upload the updated file.
- When vendor provides new documents (updated CM3566 manual, errata), add them.
- Keep the notebook as the definitive technical reference — both human developers and agents benefit from querying it.
