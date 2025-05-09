# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
DISTUTILS_EXT=1
PYTHON_COMPAT=( python3_{10..13} python3_13t )

inherit distutils-r1

MY_PN="${PN//google/python}"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Hardware-based implementation of the CRC32C hashing algorithm"
HOMEPAGE="https://github.com/googleapis/python-crc32c"
SRC_URI="https://github.com/googleapis/${MY_PN}/archive/v${PV}.tar.gz -> ${MY_P}.gh.tar.gz"
S="${WORKDIR}/${MY_P}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-libs/crc32c"

distutils_enable_tests pytest
