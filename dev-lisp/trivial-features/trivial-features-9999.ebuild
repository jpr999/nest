# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="Ensures consistent FEATURES across multiple implementations"
HOMEPAGE="https://github.com/trivial-features/trivial-features"
EGIT_REPO_URI="https://github.com/trivial-features/${PN}.git"

LICENSE="MIT"
SLOT="0"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="dev-lisp/alexandria"
BDEPEND="test? ( dev-lisp/asdf
		dev-lisp/cffi
		dev-lisp/rt )"

DOCS=( {README,SPEC}.md )

src_test() {
	local -x CL_SOURCE_REGISTRY="${S}:${CLSYSTEMROOT}"
	common-lisp-export-impl-args "$(common-lisp-find-lisp-impl)"

	${CL_BINARY} "${CL_EVAL}" "(asdf:test-system :trivial-features)" \
		|| die "test failed"
}
