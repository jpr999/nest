# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1 pypi

DESCRIPTION="Web util for OpenTelemetry"
HOMEPAGE="https://github.com/open-telemetry/opentelemetry-contrib"

LICENSE="Apache-2.0"
SLOT=0
KEYWORDS="~amd64 ~x86"

BDEPEND="test? ( dev-python/opentelemetry-instrumentation[${PYTHON_USEDEP}]
		dev-python/opentelemetry-test-utils[${PYTHON_USEDEP}] )"

distutils_enable_tests unittest
