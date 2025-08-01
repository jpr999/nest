# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

COMMIT="0a1cd33b658c7101766781c534455d4d9e5972bf"

DESCRIPTION="Cross-platform Common Lisp library for generating PDF files"
HOMEPAGE="https://github.com/mbattyani/cl-pdf"
SRC_URI="https://github.com/mbattyani/${PN}/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${PN}-${COMMIT}"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-lisp/iterate
	dev-lisp/salza2
	dev-lisp/uiop
	dev-lisp/zpb-ttf"
BDEPEND="dev-lisp/asdf"

PATCHES=( "${FILESDIR}/${PN}"-20230620-no-bundled-libs.patch )

src_prepare() {
	default

	# remove non supported implementation
	rm -rf C{CL,MUCL} || die "rm failed"
}

src_install() {
	common-lisp-3_src_install
	insinto /usr/share/fonts/afm
	doins -r afm/*.afm
}
