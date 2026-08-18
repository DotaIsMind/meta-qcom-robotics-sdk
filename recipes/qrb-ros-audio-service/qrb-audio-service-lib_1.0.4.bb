inherit pkgconfig cmake

DESCRIPTION = "QRB Audio Service library"
AUTHOR = "Yuchao Pan <yuchpan@qti.qualcomm.com>"
ROS_AUTHOR = "Yuchao Pan"
SECTION = "devel"
LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://../LICENSE;md5=68c28a8a26024c85c589d0de638520b6"

PV = "1.0.4"

DEPENDS = "glog gflags"

SRC_URI = "git://github.com/quic-qrb-ros/qrb_ros_audio_service.git;protocol=https;branch=stable/1.0.3"

SRCREV = "63a46f4c87c34a113912515c1ce14fa747601151"
S = "${UNPACKDIR}/${BP}/qrb_audio_manager"

DEPENDS += " \
    qrb-audio-common-lib \
"

EXTRA_OECMAKE:append = " -DBUILD_TESTING=OFF"

FILES:${PN}-dev += "${datadir}"
