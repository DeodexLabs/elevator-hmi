#!/bin/sh
# Elevator HMI — DSI panel modeset smoke test
# modetest -s needs the *connector* id (Connectors: block, column 1), not encoder nor CRTC.
# On RK3566 + DSI-1 this is often 191; encoder 190 / CRTC 112 are wrong for -s.
# LMT101-style: LED string may be fed from external ~9 V; board still drives LCD_BL_PWM / enables
# (see TASK-118). sysfs backlight only affects pixels if pwm-backlight is wired in DT.

set -eu

echo "=== DRM connectors (sysfs) ==="
for c in /sys/class/drm/card*-*/status; do
	printf "%s: %s\n" "$c" "$(cat "$c")"
done

echo "=== Resolving DSI-1 connector id ==="
DSI_CONN=$(modetest -M rockchip 2>/dev/null | awk '/connected/ && /DSI-1/ {print $1; exit}')
if [ -z "$DSI_CONN" ]; then
	echo "ERROR: no connected DSI-1 line in modetest output. Run: modetest -M rockchip" >&2
	exit 1
fi
echo "DSI-1 connector id: $DSI_CONN (example: modetest -M rockchip -s ${DSI_CONN}:#0)"

echo "=== Backlight (before modeset) ==="
for b in /sys/class/backlight/*; do
	[ -d "$b" ] || continue
	printf "%s brightness=%s max=%s\n" "$b" "$(cat "$b/brightness" 2>/dev/null || echo "?")" "$(cat "$b/max" 2>/dev/null || echo "?")"
done

echo "=== Forcing modeset via modetest (#0 = first listed mode, often 800x1280) ==="
modetest -M rockchip -s "${DSI_CONN}:#0" 2>&1 | head -40

echo "=== Backlight: set to max (often fixes black panel after modeset) ==="
for b in /sys/class/backlight/*; do
	[ -r "$b/max" ] && [ -w "$b/brightness" ] || continue
	maxv=$(cat "$b/max")
	echo "$maxv" > "$b/brightness"
	echo "Set $(basename "$b") brightness -> $maxv"
done

echo "=== Panel regulator state (needs debugfs) ==="
if [ -r /sys/kernel/debug/regulator/vcc3v3_lcd0_n/enable ]; then
	cat /sys/kernel/debug/regulator/vcc3v3_lcd0_n/enable
else
	echo "(skip) mount debugfs: mount -t debugfs none /sys/kernel/debug"
fi
