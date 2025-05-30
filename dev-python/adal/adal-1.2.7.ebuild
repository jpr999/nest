# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )
PYTHON_REQ_USE="threads(+)"

inherit distutils-r1

MY_PN="azure-activedirectory-library-for-python"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Library for authentication in Azure Active Directory"
HOMEPAGE="https://github.com/AzureAD/azure-activedirectory-library-for-python"
SRC_URI="https://github.com/AzureAD/${MY_PN}/archive/${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/${MY_P}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="dev-python/cryptography[${PYTHON_USEDEP}]
	dev-python/pyjwt[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]"
BDEPEND="test? ( dev-python/httpretty[${PYTHON_USEDEP}]
		dev-python/six[${PYTHON_USEDEP}] )"

distutils_enable_tests unittest

python_prepare_all() {
	# Disable network test
	rm tests/test_mex.py || die "rm failed"

	distutils-r1_python_prepare_all
}
