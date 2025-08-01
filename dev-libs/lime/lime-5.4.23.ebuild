# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="C++ library implementing Open Whisper System Signal protocol"
HOMEPAGE="https://gitlab.linphone.org/BC/public/lime"
SRC_URI="https://gitlab.linphone.org/BC/public/${PN}/-/archive/${PV}/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc test"
RESTRICT="test" # needs server on nodejs

RDEPEND="<dev-db/soci-4.1[sqlite]
	net-libs/bctoolbox[test?]"
DEPEND="${RDEPEND}"
BDEPEND="virtual/pkgconfig
	doc? ( app-text/doxygen )
	test? ( dev-libs/belle-sip )"

src_configure() {
	local mycmakeargs=(
		-DENABLE_STRICT="$(usex doc)"
		-DENABLE_STRICT=NO
		-DENABLE_UNIT_TESTS="$(usex test)"
	)
	cmake_src_configure
}
