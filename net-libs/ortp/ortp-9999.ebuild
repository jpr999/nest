# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGIT_REPO_URI="https://gitlab.linphone.org/BC/public/${PN}.git"

inherit cmake git-r3

DESCRIPTION="Open Real-time Transport Protocol (RTP, RFC3550) stack"
HOMEPAGE="https://gitlab.linphone.org/BC/public/ortp"

LICENSE="GPL-3"
SLOT="0"
IUSE="debug doc ntp-timestamp minimal test"
RESTRICT="!test? ( test )"

RDEPEND="net-libs/bctoolbox[test?]"
DEPEND="${RDEPEND}"
BDEPEND="virtual/pkgconfig
	doc? ( app-text/doxygen )"

src_prepare() {
	# fix version
	sed -i '/project(Ortp/s|0|1|' CMakeLists.txt \
		|| die "sed failed for CMakeLists.txt"

	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DENABLE_DEBUG_LOGS="$(usex debug)"
		-DENABLE_DOC="$(usex doc)"
		-DENABLE_NTP_TIMESTAMP="$(usex ntp-timestamp)"
		-DENABLE_PERF="$(usex minimal)"
		-DENABLE_TESTS="$(usex test)"
		-DENABLE_UNIT_TESTS="$(usex test)"
	)

	cmake_src_configure
}

src_test() {
	"${S}"_build/tester/ortp-tester || die "tests failed"

	cmake_src_test
}
