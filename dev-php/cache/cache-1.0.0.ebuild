# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit optfeature

DESCRIPTION="PHP Cache adapters"
HOMEPAGE="https://github.com/php-cache/cache"
SRC_URI="https://github.com/php-cache/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"
RESTRICT="test" # can't load tests

RDEPEND="!dev-php/cache-tag-interop
	dev-lang/php:*
	dev-php/doctrine-cache
	dev-php/fedora-autoloader
	dev-php/league-flysystem
	dev-php/psr-cache
	dev-php/psr-log
	dev-php/psr-simple-cache"
BDEPEND="test? ( dev-php/composer
		dev-php/phpunit )"

src_prepare() {
	default

	install -D -m 644 "${FILESDIR}"/autoload.php \
		src/autoload.php || die "install failed"
	install -D -m 644 "${FILESDIR}"/autoload-test.php \
		vendor/autoload.php || die "install test failed"
}

src_test() {
	composer require -d "${T}" --prefer-source \
		--dev "${PN}/${PN}:${PV}" || die "composer failed"
	cp -r "${T}/vendor/${PN}/${PN}"/{phpunit.xml.dist,tests} "${S}" \
		|| die "cp failed"
	phpunit --testdox || die "phpunit failed"
}

src_install() {
	einstalldocs
	insinto /usr/share/php/Cache
	doins -r src/.
}

pkg_postinst() {
	optfeature "APCU Adapter" dev-php/pecl-apcu
	optfeature "Memcache Adapter" dev-php/pecl-memcache
	optfeature "Memcached Adapter" dev-php/pecl-memcached
	optfeature "Redis Adapter" dev-php/pecl-redis
	optfeature "Mongodb Adapter" dev-php/pecl-mongodb dev-php/mongodb
}
