# TASK-103: Rockchip BSP image outputs (ext4 + WIC + postprocess) for RK3566 bring-up.
inherit rockchip-image

WKS_FILE = "${ELEVATOR_HMI_EMMC_WKS}"

IMAGE_INSTALL:append = " rauc elevator-hmi-rauc-system-conf"
