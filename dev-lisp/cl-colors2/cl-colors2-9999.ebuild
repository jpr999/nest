# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="Simple color library for Common Lisp"
HOMEPAGE="https://codeberg.org/cage/cl-colors2"
EGIT_REPO_URI="https://codeberg.org/cage/${PN}.git"

LICENSE="Boost-1.0"
SLOT="0"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="dev-lisp/alexandria
	dev-lisp/cl-ppcre
	dev-lisp/parse-number"
BDEPEND="test? ( dev-lisp/clunit2 )"

src_test() {
	local -x CL_SOURCE_REGISTRY="${S}:${CLSYSTEMROOT}"
	common-lisp-export-impl-args "$(common-lisp-find-lisp-impl)"

	${CL_BINARY} "${CL_EVAL}" "(asdf:test-system :cl-colors2)" \
		|| die "test failed"
}
