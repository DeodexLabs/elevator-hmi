# Elevator HMI — U-Boot BSP tweaks for onboard eMMC bring-up (TASK-102).
# Merges Kconfig fragments after rk3568_defconfig via uboot-config / merge_config.sh.
# Does not replace Rockchip SPL/loader flow (idblock.img, uboot.img) from meta-rockchip.

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append = " file://elevator-hmi-emmc-boot.cfg"

# Traceable builds: appears in `u-boot -v` / loader strings on serial.
UBOOT_LOCALVERSION = "-elevator-hmi-emmc"
