# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake git-r3

DESCRIPTION="Database access library for C++"
HOMEPAGE="https://github.com/SOCI/soci"
EGIT_REPO_URI="https://github.com/SOCI/${PN}.git"

LICENSE="BSD-1"
SLOT="0"
IUSE="boost firebird mysql odbc oracle postgres sqlite static-libs test"
RESTRICT="!test? ( test )"

RDEPEND="boost? ( dev-libs/boost:= )
	mysql? ( dev-db/mysql-connector-c:0= )
	odbc? ( dev-db/unixODBC )
	oracle? ( dev-db/oracle-instantclient:= )
	postgres? ( dev-db/postgresql:= )
	sqlite? ( dev-db/sqlite:3 )"
DEPEND="${RDEPEND}"

src_configure() {
	local mycmakeargs=(
		-DSOCI_STATIC="$(usex static-libs)"
		-DSOCI_TESTS="$(usex test)"
		-DWITH_BOOST="$(usex boost)"
	)
	cmake_src_configure
}
