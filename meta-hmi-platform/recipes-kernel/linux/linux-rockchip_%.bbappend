# Elevator HMI — kernel patches for linux-rockchip (meta-rockchip BSP recipe).
# Applies JD9365DA-H3 panel driver + DT binding backported from Linux v6.2 (TASK-004).
# TASK-110 fixes: cfg fragment replaces KERNEL_CONFIG:append; do_configure copies DTS files.

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "file://0001-drm-panel-add-jadard-jd9365da-h3-driver-backport-6.1.99.patch"
SRC_URI += "file://0002-drm-panel-jadard-lmt101sx006c-compatible-optional-reset.patch"
SRC_URI += "file://elevator-hmi-lmt101sx006c-panel.dtsi"
SRC_URI += "file://elevator-hmi-boardcon-em3566-v3.dts"
SRC_URI:append = " file://elevator-hmi-panel.cfg"

# Copy DTS/DTSI files from WORKDIR into the kernel source tree so the build
# system can resolve KERNEL_DEVICETREE and the #include in the board DTS.
do_configure:append() {
    install -m 0644 ${WORKDIR}/elevator-hmi-lmt101sx006c-panel.dtsi \
        ${S}/arch/arm64/boot/dts/rockchip/
    install -m 0644 ${WORKDIR}/elevator-hmi-boardcon-em3566-v3.dts \
        ${S}/arch/arm64/boot/dts/rockchip/
}
