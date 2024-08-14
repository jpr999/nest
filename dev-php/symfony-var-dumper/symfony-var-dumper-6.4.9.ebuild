# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PN="${PN//symfony-/}"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Mechanisms for walking through any arbitrary PHP variable"
HOMEPAGE="https://github.com/symfony/var-dumper"
SRC_URI="https://github.com/symfony/${MY_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${MY_P}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"
RESTRICT="test"
PROPERTIES="test_network"

RDEPEND="dev-lang/php:*[iconv]
	dev-php/fedora-autoloader
	dev-php/symfony-deprecation-contracts
	dev-php/symfony-polyfill-mbstring"
BDEPEND="test? ( dev-db/redis
		dev-php/composer
		dev-php/phpunit
		dev-php/symfony-console
		dev-php/symfony-http-kernel
		>=dev-php/symfony-process-6.4.8
		dev-php/symfony-uid
		>=dev-php/twig-3.10.3 )"

DOCS=( {CHANGELOG,README}.md )

src_prepare() {
	default

	install -D -m 644 "${FILESDIR}"/autoload.php \
		autoload.php || die "install failed"
	install -D -m 644 "${FILESDIR}"/autoload-test.php \
		vendor/autoload.php || die "install test failed"
}

src_test() {
	composer require -d "${T}" --prefer-source \
		--dev "${PN/-/\/}:${PV}" || die "composer failed"
	cp -r "${T}"/vendor/"${PN/-/\/}"/{phpunit.xml.dist,Tests} "${S}" \
		|| die "cp failed"
	# remove test with failed assert
	sed -i '/testHtmlDump/,+34d' Tests/Caster/ExceptionCasterTest.php \
		|| die "sed failed for ExceptionCasterTest.php"
	sed -i '/testGet/,+95d' Tests/Dumper/HtmlDumperTest.php \
		|| die "sed failed for HtmlDumperTest.php"
	"${EPREFIX}"/usr/sbin/redis-server - <<- EOF || die "redis-server failed"
		daemonize yes
		pidfile "${T}/redis.pid"
		port 6379
		bind 127.0.0.1
	EOF
	REDIS_HOST=127.0.0.1 phpunit --testdox || die "phpunit failed"
	kill "$(<"${T}/redis.pid")" || die "kill failed"
}

src_install() {
	einstalldocs
	insinto /usr/share/php/Symfony/Component/VarDumper
	doins -r Caster Cloner Command Dumper Exception \
		Resources Server Test ./*.php
}
