# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="slice-ws2812"
PKG_VERSION="2996ff5"
PKG_SHA256="fbde85a42e36fbbc5a9f560956fe1758eb89b86a2360d0395c6b8ff942c78814"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/4nvjgf39/slice-ws2812"
PKG_URL="https://github.com/4nvjgf39/slice-ws2812/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux"
PKG_NEED_UNPACK="${LINUX_DEPENDS}"
PKG_LONGDESC="linux kernel modules for the Slice ws2812"
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
