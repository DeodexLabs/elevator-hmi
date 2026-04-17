# PLACEHOLDER — Phase 2 replaces this with the real application sources.

SUMMARY = "Elevator HMI placeholder Qt/QML application"
LICENSE = "CLOSED"
LIC_FILES_CHKSUM = "file://COPYING;md5=6efe49454b90c8ab6739746e8eab1771"

inherit qt6-cmake

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

DEPENDS = "qtbase qtdeclarative"

SRC_URI = "file://CMakeLists.txt \
           file://main.cpp \
           file://main.qml \
           file://COPYING \
           "

S = "${WORKDIR}"

RDEPENDS:${PN} += " \
    qtdeclarative \
    qtdeclarative-qmlplugins \
    qtbase-plugins \
"
