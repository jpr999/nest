# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1 optfeature

DESCRIPTION="A utility for easily assuming AWS IAM roles from command line"
HOMEPAGE="https://github.com/trek10inc/awsume"
SRC_URI="https://github.com/trek10inc/${PN}/archive/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-python/colorama[${PYTHON_USEDEP}]
	dev-python/boto3[${PYTHON_USEDEP}]
	dev-python/psutil[${PYTHON_USEDEP}]
	dev-python/pluggy[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

pkg_postinst() {
	optfeature "SAML support" dev-python/xmltodict
	optfeature "fuzzy support" dev-python/python-levenshtein
}
