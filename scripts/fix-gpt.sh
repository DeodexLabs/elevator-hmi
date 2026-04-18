#!/bin/bash
# fix-gpt.sh — Relocate GPT backup header after flashing a smaller WIC image
#              to a larger eMMC (e.g. 2.9 GB image → 7.23 GB eMMC).
#
# Symptom: kernel prints "GPT:6075217 != 15155199" and may refuse to mount
#          rootfs because the backup GPT header is at the wrong sector.
#
# Cause: The WIC image embeds a backup GPT pointing to its last sector.
#        After flashing to a larger device the backup GPT is in the middle
#        of the disk; the primary GPT's alternate_lba field is also wrong.
#
# Fix: sgdisk -e moves the backup GPT to the actual last sector of the
#      device and updates alternate_lba in the primary header.
#      partprobe reloads the partition table without a reboot.
#
# Run once, on the target, after first boot (rootfs mounted read-write):
#   sh /usr/sbin/fix-gpt.sh
#
# Requires: sgdisk (package: gptfdisk, included in the image via
#           meta-hmi-platform/recipes-core/images/core-image-minimal.bbappend)

set -e

DEVICE=/dev/mmcblk0

if [ "$(id -u)" -ne 0 ]; then
    echo "ERROR: must run as root" >&2
    exit 1
fi

if [ ! -b "$DEVICE" ]; then
    echo "ERROR: $DEVICE not found" >&2
    exit 1
fi

echo "Relocating GPT backup header on $DEVICE ..."
sgdisk -e "$DEVICE"
partprobe "$DEVICE"
echo "Done. GPT backup header is now at the end of $DEVICE."
