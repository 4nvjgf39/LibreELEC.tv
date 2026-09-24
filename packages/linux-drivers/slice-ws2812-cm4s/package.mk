# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="slice-ws2812-cm4s"
PKG_VERSION="3c3c4b70094651ced40c10d51f1d8feb5f0dad20"
PKG_SHA256="3e25478d961493adb013e5e3f6635903e6e76458e09b9f75f042b68c35f0c43b"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/4nvjgf39/slice-ws2812-cm4s"
PKG_URL="https://github.com/4nvjgf39/slice-ws2812-cm4s/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux"
PKG_NEED_UNPACK="${LINUX_DEPENDS}"
PKG_LONGDESC="linux kernel modules for the Slice4S ws2812"
PKG_IS_KERNEL_PKG="yes"

make_target() {
  local kdir=$(kernel_path)
  local dtc=${kdir}/scripts/dtc/dtc
  kernel_make KDIR=${kdir} DTC=${dtc} modules overlays
}

makeinstall_target() {
  mkdir -p ${INSTALL}/$(get_full_module_dir)/${PKG_NAME}
    kernel_make KDIR=$(kernel_path) DESTDIR="${INSTALL}/$(get_full_module_dir)/${PKG_NAME}" modules_install
  mkdir -p ${INSTALL}/usr/share/bootloader/overlays
    cp *.dtbo ${INSTALL}/usr/share/bootloader/overlays
}
