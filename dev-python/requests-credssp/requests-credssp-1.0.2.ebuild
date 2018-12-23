# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python{2_7,3_{4..6}} )

inherit distutils-r1

DESCRIPTION="CredSSP authentication handler for Python Requests"
HOMEPAGE="https://github.com/jborean93/requests-credssp"
SRC_URI="https://github.com/jborean93/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="dev-python/cryptography[${PYTHON_USEDEP}]
	dev-python/ntlm-auth[${PYTHON_USEDEP}]
	dev-python/pyasn1[${PYTHON_USEDEP}]
	dev-python/pyopenssl[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}"
BDEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
	test? ( dev-python/pytest[${PYTHON_USEDEP}] )"
#		dev-python/pywin32
#		dev-python/gssapi

# Skip failed tests
PATCHES=( "${FILESDIR}/${P}"-test.patch )

python_test() {
	py.test -v || die "tests failed with ${EPYTHON}"
}

#pkg_postinst() {
#	optfeature "integration with Kerberos authentication on Unix" dev-python/gssapi
#	optfeature "integration with Kerberos authentication on Windows" dev-python/pywin32
#}
