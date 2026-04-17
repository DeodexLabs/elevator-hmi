SUMMARY = "RAUC system.conf for elevator-hmi (A/B rootfs on eMMC)"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

inherit allarch

FILESEXTRAPATHS:prepend := "${THISDIR}/../files:"
SRC_URI = "file://system.conf"

S = "${WORKDIR}"

do_install () {
    install -d ${D}${sysconfdir}/rauc
    install -m 0644 ${WORKDIR}/system.conf ${D}${sysconfdir}/rauc/system.conf
}

FILES:${PN} = "${sysconfdir}/rauc/system.conf"

RDEPENDS:${PN} += "rauc"
