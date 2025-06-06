# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1 git-r3

DESCRIPTION="GraphQL framework for Python"
HOMEPAGE="https://github.com/graphql-python/graphene"
EGIT_REPO_URI="https://github.com/graphql-python/${PN}.git"

LICENSE="MIT"
SLOT="0"

RDEPEND="dev-python/graphql-core[${PYTHON_USEDEP}]
	dev-python/graphql-relay[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]"
BDEPEND="test? ( dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-benchmark[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}] )"

distutils_enable_tests pytest
