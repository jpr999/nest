# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit optfeature

MY_PN="${PN//doctrine-/}"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Doctrine Data Fixtures Extension"
HOMEPAGE="https://github.com/doctrine/data-fixtures"
SRC_URI="https://github.com/doctrine/${MY_PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${MY_P}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"
RESTRICT="test"
PROPERTIES="test_network"

RDEPEND="dev-lang/php:*[pdo,sqlite]
	dev-php/doctrine-deprecations
	dev-php/doctrine-persistence
	dev-php/fedora-autoloader"
BDEPEND="test? ( dev-php/composer
		dev-php/doctrine-orm
		dev-php/phpunit
		dev-php/symfony-cache )"

src_prepare() {
	default

	install -D -m 644 "${FILESDIR}"/autoload.php \
		src/autoload.php || die "install failed"
	install -D -m 644 "${FILESDIR}"/autoload-test.php \
		vendor/autoload.php || die "install test failed"
}

src_test() {
	composer require -d "${T}" --prefer-source \
		--dev "${PN/-/\/}:${PV}" || die "composer failed"
	cp -r "${T}"/vendor/"${PN/-/\/}"/{phpunit.xml.dist,tests} "${S}" \
		|| die "cp failed"
	eapply "${FILESDIR}/${PN}"-1.7.0-test.patch
	phpunit --testdox || die "phpunit failed"
}

src_install() {
	einstalldocs
	insinto /usr/share/php/Doctrine/Common/DataFixtures
	doins -r src/.
}

pkg_postinst() {
	optfeature "Loading ORM fixtures" dev-php/doctrine-orm
}
