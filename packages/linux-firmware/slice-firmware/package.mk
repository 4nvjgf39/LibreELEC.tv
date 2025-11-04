# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="slice-firmware"
PKG_VERSION="23d854f"
PKG_SHA256="412a11eafff78c7e3d960e1e85173b61ad0fe187af1d866349f65e311cfee599"
PKG_ARCH="aarch64 arm"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/FiveNinjas/slice-firmware"
PKG_URL="https://github.com/4nvjgf39/slice-firmware/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux"
PKG_LONGDESC="BCM270x firmware related stuff for Slice"
PKG_TOOLCHAIN="manual"

make_target() {
  if [ "$DEVICE" = "Slice4s" ]; then
    $(kernel_path)/scripts/dtc/dtc -O dtb -I dts -o dt-blob.bin slice4s-dt-blob.dts
  elif [ "$DEVICE" = "Slice3" ]; then
    $(kernel_path)/scripts/dtc/dtc -O dtb -I dts -o dt-blob.bin slice3-dt-blob.dts
  elif [ "$DEVICE" = "Slice" ]; then
    $(kernel_path)/scripts/dtc/dtc -O dtb -I dts -o dt-blob.bin slice-dt-blob.dts
  fi
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/share/bootloader/
    cp -a $PKG_BUILD/dt-blob.bin $INSTALL/usr/share/bootloader/
}
