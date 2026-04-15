# EM3566 v3 — Boardcon reference kit (library)

This tree holds **Boardcon EM3566 v3** collateral used as the **Phase 0/1 reference carrier** for CM3566 bring-up. It is **not** the production elevator PCB. Authoritative project context lives in [`CLAUDE.md`](../../CLAUDE.md); tasks in [`AGENTS.md`](../../AGENTS.md); blockers in [`diary/BLOCKERS.md`](../../diary/BLOCKERS.md).

---

## What lives here (quick map)

| Path | Contents |
|------|----------|
| [`Usermanual/`](Usermanual/) | EM3566 / CM3566 hardware manuals (Markdown): connectors, GPIO mux names, CON1 display. |
| [`Schematic/`](Schematic/) | `em3566_v3sch.md` + `em3566_v3sch.pdf` — carrier nets and CON1. |
| [`Datasheet/`](Datasheet/) | RK3566 and on-board parts (PHY, PMIC, Wi‑Fi, etc.). |
| [`Linux6.1/`](Linux6.1/) | Vendor Linux 6.1 user manual, RKDevTool payloads, **prebuilt images** under `Image/`; `Source/` is **not** a full BSP tree (see gaps below). |
| [`Rockchip Tools/`](Rockchip%20Tools/) | Rockchip application / tuning guides (mostly Markdown conversions). |
| [`Android14/`](Android14/) | Android 14 pack (not used for Yocto HMI per ADR-001). |
| [`Certification/`](Certification/) | REACH / RoHS / related docs. |

**Gap (intentional):** there is **no** full Boardcon **kernel/U-Boot source** or `*.dts` / `*.dtsi` snapshot in this folder. Obtain BSP device trees from the vendor SDK or your Yocto layer checkout when wiring `KERNEL_DEVICETREE` and merging panel fragments.

---

## Hardware / lab — EM3566 v3 + LMT101 (MIPI LCD)

### Physical setup

- **Board:** Boardcon **EM3566 v3** (CM3566 carrier).
- **Panel:** **LMT101SX006C** — 10.1″ portrait, 800×1280, 4-lane **MIPI-DSI**, JD9365D (see [`CLAUDE.md`](../../CLAUDE.md) §1).
- **Connector:** Use the carrier’s dedicated **`MIPI LCD`** connector (not LVDS-only wording from generic docs: the SoM exposes a **muxed** DSI/LVDS bus; this connector is the agreed DSI bench attach point — [`diary/BLOCKERS.md`](../../diary/BLOCKERS.md) **BLK-002**).

### In-repo references for wiring and signals

- **CON1 pinout / signal names:** [`Usermanual/EM3566_hardware_manual.md`](Usermanual/EM3566_hardware_manual.md) §2.8 (e.g. `VCC3V3_LCD`, `LCD_PWREN_H`, `LCD_BL_PWM`, MIPI lanes).
- **Schematic:** [`Schematic/em3566_v3sch.pdf`](Schematic/em3566_v3sch.pdf) and [`Schematic/em3566_v3sch.md`](Schematic/em3566_v3sch.md).

### First bring-up — **BLK-006** (JD9365 XRES / `reset-gpios`)

**Open blocker:** [`diary/BLOCKERS.md`](../../diary/BLOCKERS.md) **BLK-006**.

Public CON1 / in-repo schematic text does **not** map **JD9365 XRES** to a specific RK3566 **GPIO** for `reset-gpios`. The Yocto side ships a DSI panel fragment and a kernel follow-up patch that makes **`reset-gpios` optional** until the net is proven.

**Lab procedure (owner / hardware engineer):**

1. Power the kit safely; use **UART** for console (interim diagnostics — [`CLAUDE.md`](../../CLAUDE.md) §1 / §8).
2. Boot a **known-good** image (e.g. vendor image under [`Linux6.1/Image/`](Linux6.1/Image/) **or** your Yocto image once TASK-103 unblocks) with **DSI + panel** enabled per your DT.
3. **Confirm display:** stable picture, backlight, no random blanking after thermal idle.
4. **If flaky or no probe:** trace **XRES** (panel / JD9365 reset) on the **carrier or flex** against [`Schematic/em3566_v3sch.pdf`](Schematic/em3566_v3sch.pdf) **or** Boardcon BSP **`*.dts`**. Add **`reset-gpios`** to the machine DTS or to [`meta-hmi-platform/recipes-kernel/linux/files/elevator-hmi-lmt101sx006c-panel.dtsi`](../../meta-hmi-platform/recipes-kernel/linux/files/elevator-hmi-lmt101sx006c-panel.dtsi) with a **cited** ball/GPIO (commit message + blocker update).
5. **Close BLK-006** when either: **`reset-gpios`** is present with documented GPIO, **or** bench logs show stable operation without it and A1 records the rationale in [`diary/BLOCKERS.md`](../../diary/BLOCKERS.md).

---

## Product / compliance — decisions only the project owner can make

These are **not** derivable from schematics alone; they need an explicit product / legal / warranty stance.

### −20°C operation and R-01 (closed **BLK-001**)

- **Vendor evidence:** CM3566 **passed** a reliability test **4 hours at −20°C ±2°C**.
- **Datasheet wording:** **Recommended** operating range remains **0°C–70°C**; **storage** −40°C–85°C.
- **Implication:** using the SoM **continuously below 0°C** is **outside** the written *recommended* ambient spec even though a low-temperature test passed — **residual risk** vs datasheet and warranty.

**Owner actions:**

- Decide whether **Phase 0/1** and field targets formally **accept** that gap (warranty language, deployment profile, or future industrial SKU).
- Record the decision where the project keeps compliance / risk sign-off (and keep [`CLAUDE.md`](../../CLAUDE.md) §6 / checklist aligned).

Full narrative: [`diary/BLOCKERS.md`](../../diary/BLOCKERS.md) **BLK-001** (closed).

### Reference carrier (EM3566 v3) vs **production** carrier

- **EM3566 v3** here is for **lab validation** (DSI, kernel, RAUC flow, UART debug) — [`CLAUDE.md`](../../CLAUDE.md) §1 “Reference carrier”.
- **Production elevator PCB** must go through its **own** schematic and layout review (mux mode, backlight, connector, −20°C mechanical, etc.). Do not assume dev-kit routing copies to the shipping board.

---

## Related project files (outside this library)

| Topic | Location |
|------|----------|
| Panel DTS fragment + Boardcon machine DTS + kernel patches | [`meta-hmi-platform/recipes-kernel/linux/files/`](../../meta-hmi-platform/recipes-kernel/linux/files/) (`elevator-hmi-boardcon-em3566-v3.dts`, `elevator-hmi-lmt101sx006c-panel.dtsi`) |
| Yocto machine (`MACHINE`) | [`meta-hmi-platform/conf/machine/elevator-hmi-em3566.conf`](../../meta-hmi-platform/conf/machine/elevator-hmi-em3566.conf) |
| Kernel bbappend | `meta-hmi-platform/recipes-kernel/linux/linux-rockchip_%.bbappend` (repo root relative) |
| Task queue | [`AGENTS.md`](../../AGENTS.md) |
| Blockers | [`diary/BLOCKERS.md`](../../diary/BLOCKERS.md) |

---

*Last aligned with project docs: 2026-04-15. Update this README when BLK-006 is resolved or when new vendor drops add BSP paths.*
