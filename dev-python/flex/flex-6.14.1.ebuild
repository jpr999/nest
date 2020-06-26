# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DISTUTILS_USE_SETUPTOOLS=rdepend
PYTHON_COMPAT=( python3_{6..8} )

inherit distutils-r1 eutils

DESCRIPTION="Validation tooling for Swagger 2.0 specifications"
HOMEPAGE="https://github.com/pipermerriam/flex"
SRC_URI="https://github.com/pipermerriam/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="dev-python/click[${PYTHON_USEDEP}]
	dev-python/jsonpointer[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/rfc3987[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	dev-python/strict-rfc3339[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/validate_email[${PYTHON_USEDEP}]"
BDEPEND="test? ( dev-python/django[${PYTHON_USEDEP}]
		dev-python/factory_boy[${PYTHON_USEDEP}]
		dev-python/falcon[${PYTHON_USEDEP}]
		dev-python/pytest-httpbin[${PYTHON_USEDEP}]
		dev-python/responses[${PYTHON_USEDEP}]
		dev-python/webob[${PYTHON_USEDEP}]
		www-servers/tornado[${PYTHON_USEDEP}] )"

distutils_enable_tests pytest

pkg_postinst() {
	optfeature "integration with django" dev-python/django
	optfeature "integration with tornado" www-servers/tornado
	optfeature "integration with falcon" dev-python/falcon
	optfeature "integration with webob" dev-python/webob
	optfeature "integration with werkzeug" dev-python/werkzeug
}
