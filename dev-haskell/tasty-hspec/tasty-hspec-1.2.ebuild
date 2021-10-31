# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CABAL_FEATURES="lib profile haddock hoogle hscolour"

inherit haskell-cabal

DESCRIPTION="Hspec support for the Tasty test framework"
HOMEPAGE="https://github.com/mitchellwrosen/tasty-hspec"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-haskell/hspec:=[profile?]
	dev-haskell/hspec-core:=[profile?]
	dev-haskell/quickcheck:2=[profile?]
	dev-haskell/tasty:=[profile?]
	dev-haskell/tasty-quickcheck:=[profile?]
	dev-haskell/tasty-smallcheck:=[profile?]
	dev-lang/ghc:="
DEPEND="${RDEPEND}"
BDEPEND="dev-haskell/cabal:="

src_prepare() {
	default

	sed -i '/license-file/d' tasty-hspec.cabal \
		|| die "sed failed"
}
