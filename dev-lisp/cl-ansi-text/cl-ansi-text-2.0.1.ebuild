# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="ANSI control string characters, focused on color"
HOMEPAGE="https://github.com/pnathan/cl-ansi-text"
SRC_URI="https://github.com/pnathan/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="dev-lisp/alexandria
	dev-lisp/cl-colors2"
BDEPEND="dev-lisp/asdf
	test? ( dev-lisp/sbcl:*
		dev-lisp/fiveam )"

src_test() {
	sbcl --script "${FILESDIR}"/run-tests.lisp \
		|| die "test failed"
}
