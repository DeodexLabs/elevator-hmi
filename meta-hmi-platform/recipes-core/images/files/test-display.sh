#!/bin/sh
# Elevator HMI — DSI panel modeset smoke test
# modetest -s needs the *connector* id (Connectors: block, column 1), not encoder nor CRTC.
# On RK3566 + DSI-1 this is often 191; encoder 190 / CRTC 112 are wrong for -s.

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
echo "DSI-1 connector id: $DSI_CONN (use this in: modetest -M rockchip -s ${DSI_CONN}:800x1280)"

echo "=== Forcing modeset via modetest ==="
modetest -M rockchip -s "${DSI_CONN}:800x1280" 2>&1 | head -40

echo "=== Panel regulator state (needs debugfs) ==="
if [ -r /sys/kernel/debug/regulator/vcc3v3_lcd0_n/enable ]; then
	cat /sys/kernel/debug/regulator/vcc3v3_lcd0_n/enable
else
	echo "(skip) mount debugfs: mount -t debugfs none /sys/kernel/debug"
fi
