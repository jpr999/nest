# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="A library to retrieve the system's configured locale and language"
HOMEPAGE="https://github.com/Shinmera/system-locale"
EGIT_REPO_URI="https://github.com/Shinmera/${PN}.git"

LICENSE="ZLIB"
SLOT="0"

RDEPEND="dev-lisp/asdf
	dev-lisp/documentation-utils"
BDEPEND="dev-lisp/asdf"
