SUMMARY = "Sentinel recipe so the empty meta-hmi-app layer parses under BitBake"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2dafaeb6d9"

inherit allarch

SRC_URI = ""
do_fetch[noexec] = "1"
do_unpack[noexec] = "1"
do_patch[noexec] = "1"
do_configure[noexec] = "1"
do_compile[noexec] = "1"
do_install[noexec] = "1"

ALLOW_EMPTY:${PN} = "1"
