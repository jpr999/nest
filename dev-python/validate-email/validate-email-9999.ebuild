# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1 git-r3

DESCRIPTION="Python email validation library"
HOMEPAGE="https://github.com/syrusakbary/validate_email"
EGIT_REPO_URI="https://github.com/syrusakbary/${PN}.git"

LICENSE="LGPL-3+"
SLOT="0"
