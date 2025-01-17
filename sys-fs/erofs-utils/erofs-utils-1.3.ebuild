# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

DESCRIPTION="Userspace utilities for linux-erofs file system"
HOMEPAGE="https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git"
LICENSE="GPL-2+"

SRC_URI="https://git.kernel.org/pub/scm/linux/kernel/git/xiang/${PN}.git/snapshot/${P}.tar.gz"

SLOT="0"

KEYWORDS="~amd64"

IUSE="fuse +lz4 selinux +uuid"

RDEPEND="
	fuse? ( sys-fs/fuse:= )
	lz4? ( app-arch/lz4:= )
	selinux? ( sys-libs/libselinux:= )
	uuid? ( sys-apps/util-linux:= )
"

DEPEND="${RDEPEND}"

BDEPEND="virtual/pkgconfig"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable fuse) \
		$(use_enable lz4) \
		$(use_with selinux) \
		$(use_with uuid)
}
