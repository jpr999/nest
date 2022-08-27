# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} )
EGIT_REPO_URI="https://github.com/a13xp0p0v/${PN}.git"

inherit distutils-r1 git-r3

DESCRIPTION="A script to check the hardening options in the Linux kernel config"
HOMEPAGE="https://github.com/a13xp0p0v/kconfig-hardened-check"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
