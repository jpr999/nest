# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CABAL_HACKAGE_REVISION=3
CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"

inherit haskell-cabal

DESCRIPTION="GHC plugin to do inspection testing"
HOMEPAGE="https://github.com/nomeata/inspection-testing"

LICENSE="MIT"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
RESTRICT="test" # needs specific versions of dependencies

RDEPEND="dev-lang/ghc:="
DEPEND="${RDEPEND}"
BDEPEND="dev-haskell/cabal:="

src_prepare() {
	haskell-cabal_src_prepare
	sed -i '/license-file/d' inspection-testing.cabal || die "sed failed"
}

src_configure() {
	haskell-cabal_src_configure --flag=-more-tests --flag=-old-text-tests
}
