# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2014 Gordon Hollingworth (gordon@fiveninjas.com)
# Copyright (C) 2019-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="slice-led-tools"
PKG_VERSION="452995c"
PKG_SHA256="076132d1919bdc644e47ea5c16bc8aa7473ab399aa125844cee347ffbcc7b667"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/4nvjgf39/slice-led-tools"
PKG_URL="https://github.com/4nvjgf39/slice-led-tools/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain zlib libpng"
PKG_DEPENDS_HOST="toolchain"
PKG_LONGDESC="LED tools, these are a set of tools to control the LEDs on Slice"
PKG_TOOLCHAIN="manual"

make_target() {
  make CC="$CC" \
       CFLAGS="$CFLAGS" \
       LDFLAGS="$LDFLAGS"
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
    cp led_png $INSTALL/usr/bin
}
