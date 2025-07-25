# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="Flexible bivalent streams for Common Lisp"
HOMEPAGE="https://github.com/melisgl/named-readtables"
EGIT_REPO_URI="https://github.com/melisgl/${PN}.git"

LICENSE="BSD MIT"
SLOT="0"
IUSE="test"
RESTRICT="!test? ( test )"

DEPEND="dev-lisp/mgl-pax"
BDEPEND="dev-lisp/asdf
	test? ( dev-lisp/pythonic-string-reader
		dev-lisp/try )"

src_test() {
	local -x CL_SOURCE_REGISTRY="${S}:${CLSYSTEMROOT}"
	common-lisp-export-impl-args "$(common-lisp-find-lisp-impl)"

	${CL_BINARY} "${CL_EVAL}" "(asdf:test-system :named-readtables-test)" \
		|| die "test failed"
}
