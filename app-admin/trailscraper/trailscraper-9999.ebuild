# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} )
EGIT_REPO_URI="https://github.com/flosell/${PN}.git"

inherit distutils-r1 git-r3

DESCRIPTION="Command-line tool to get information out of AWS CloudTrail"
HOMEPAGE="https://github.com/flosell/trailscraper"

LICENSE="Apache-2.0"
SLOT="0"

RDEPEND="dev-python/boto3[${PYTHON_USEDEP}]
	dev-python/click[${PYTHON_USEDEP}]
	dev-python/dateparser[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
	dev-python/ruamel-yaml[${PYTHON_USEDEP}]
	dev-python/toolz[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}"
BDEPEND="test? ( dev-python/freezegun[${PYTHON_USEDEP}]
		dev-python/moto[${PYTHON_USEDEP}] )"

distutils_enable_tests pytest

python_prepare_all() {
	# Relax requirements
	sed -i 's/==/>=/g' requirements.txt || die "sed failed for requirements.txt"

	# support for modern moto
	sed -i 's/mock_s3/mock_aws/g' tests/{integration/cli_download_s3,s3/s3_download,s3/download_recursive}_test.py \
		die "sed failed for tests"

	distutils-r1_python_prepare_all
}
