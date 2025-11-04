# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="slice-drivers"
PKG_VERSION="ad6de5f7da9fe8286e1f529cfd3f1ab5408bf979"
PKG_SHA256="1bfbb7767f67969ec12e8b8146bc665b588b6ab721e543b9e5da291a4deac292"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/HiassofT/slice-drivers"
PKG_URL="https://github.com/HiassofT/slice-drivers/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux"
PKG_NEED_UNPACK="${LINUX_DEPENDS}"
PKG_LONGDESC="linux kernel modules for the Slice box"
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
