SUMMARY = "Elevator HMI Qt 6.8 / EGLFS image"
LICENSE = "CLOSED"
LIC_FILES_CHKSUM = "file://${THISDIR}/files/COPYING;md5=7e5e5df5b9771d704cbe2cd44fcd17b6"

inherit core-image rockchip-image

WKS_FILE = "${ELEVATOR_HMI_EMMC_WKS}"

# TASK-109 lists packagegroup-qt6-minimal; meta-qt6 6.8 LTS provides packagegroup-qt6-essentials
# as the minimal qtbase+declarative (+tools) set instead.
IMAGE_INSTALL += " \
    packagegroup-qt6-essentials \
    qtbase \
    qtdeclarative \
    qtmultimedia \
    gstreamer1.0 \
    gstreamer1.0-plugins-base \
    gstreamer1.0-plugins-good \
    elevator-hmi-app \
"

# No X11, no Wayland, no display manager — EGLFS only.
# DISTRO_FEATURES x11/wayland already removed in meta-hmi-platform/conf/distro/elevator-hmi.conf (TASK-108).
# Do not repeat DISTRO_FEATURES:remove here — it cannot be reliably modified in an image recipe.

ROOTFS_POSTPROCESS_COMMAND:append = "elevator_hmi_qt_eglfs_env;"

elevator_hmi_qt_eglfs_env() {
    install -d ${IMAGE_ROOTFS}${sysconfdir}/profile.d
    printf '%s\n' 'export QT_QPA_PLATFORM=eglfs' > ${IMAGE_ROOTFS}${sysconfdir}/profile.d/qt-eglfs.sh
    chmod 0755 ${IMAGE_ROOTFS}${sysconfdir}/profile.d/qt-eglfs.sh

    install -d ${IMAGE_ROOTFS}${sysconfdir}/environment.d
    printf '%s\n' 'QT_QPA_PLATFORM=eglfs' > ${IMAGE_ROOTFS}${sysconfdir}/environment.d/90-qt-eglfs.conf
    chmod 0644 ${IMAGE_ROOTFS}${sysconfdir}/environment.d/90-qt-eglfs.conf
}
