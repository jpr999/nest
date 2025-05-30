# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit ecm git-r3 xdg

DESCRIPTION="Linux perf GUI for performance analysis"
HOMEPAGE="https://github.com/KDAB/hotspot"
EGIT_REPO_URI="https://github.com/KDAB/${PN}.git"

LICENSE="GPL-2"
SLOT="0"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="app-arch/zstd:=
	dev-libs/qcustomplot
	dev-libs/rustc-demangle
	dev-qt/qtbase:6[network,widgets]
	dev-qt/qtsvg:6
	dev-util/perf
	gui-libs/kddockwidgets:=
	kde-frameworks/karchive:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/knotifications:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kio:6
	kde-frameworks/kitemmodels:6
	kde-frameworks/kitemviews:6
	kde-frameworks/kparts:6
	kde-frameworks/syntax-highlighting:6
	kde-frameworks/kwindowsystem:6
	kde-frameworks/solid:6
	kde-frameworks/threadweaver:6
	media-gfx/kgraphviewer
	virtual/libelf:="

src_prepare() {
	if ! use test ; then
		sed -i '/add_subdirectory(tests)/d' CMakeLists.txt \
			|| die "sed failed for CMakeLists.txt"
	fi

	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DQT6_BUILD=ON
	)
	cmake_src_configure
}
