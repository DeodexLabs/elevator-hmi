# Elevator HMI — kernel patches for linux-rockchip (meta-rockchip BSP recipe).
# Applies JD9365DA-H3 panel driver + DT binding backported from Linux v6.2 (TASK-004).

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "file://0001-drm-panel-add-jadard-jd9365da-h3-driver-backport-6.1.99.patch"
SRC_URI += "file://0002-drm-panel-jadard-lmt101sx006c-compatible-optional-reset.patch"
SRC_URI += "file://elevator-hmi-lmt101sx006c-panel.dtsi"
SRC_URI += "file://elevator-hmi-boardcon-em3566-v3.dts"

# Enable backported Jadard panel driver (TASK-004 / TASK-101).
KERNEL_CONFIG:append = " CONFIG_DRM_PANEL_JADARD_JD9365DA_H3=y"
