# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="Common Lisp IDNA encding / decoding functions"
HOMEPAGE="https://github.com/antifuchs/idna"
EGIT_REPO_URI="https://github.com/antifuchs/${PN}.git"

LICENSE="MIT"
SLOT="0"

RDEPEND="dev-lisp/split-sequence"
BDEPEND="dev-lisp/asdf"

src_test() {
	local -x CL_SOURCE_REGISTRY="${S}:${CLSYSTEMROOT}"
	common-lisp-export-impl-args "$(common-lisp-find-lisp-impl)"

	${CL_BINARY} "${CL_EVAL}" "(asdf:test-system :idna)" \
		|| die "test failed"
}
