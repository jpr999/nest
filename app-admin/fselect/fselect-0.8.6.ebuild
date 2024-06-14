# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# shellcheck disable=SC2086

EAPI=8

CRATES="addr2line@0.21.0
	adler@1.0.2
	aes@0.8.4
	ahash@0.8.11
	aho-corasick@1.1.3
	android-tzdata@0.1.1
	android_system_properties@0.1.5
	arbitrary@1.3.2
	autocfg@1.2.0
	backtrace@0.3.71
	base64@0.21.7
	base64@0.22.1
	bitflags@1.3.2
	bitflags@2.5.0
	bitreader@0.3.8
	bitstream-io@2.2.0
	block-buffer@0.10.4
	bumpalo@3.16.0
	bytecount@0.6.8
	bytemuck@1.15.0
	byteorder@1.5.0
	bytes@1.6.0
	bzip2@0.4.4
	bzip2-sys@0.1.11+1.0.8
	cc@1.0.96
	cfg-if@1.0.0
	cfg_aliases@0.1.1
	chrono@0.4.38
	chrono-english@0.1.7
	cipher@0.4.4
	clipboard-win@5.3.1
	cmake@0.1.50
	constant_time_eq@0.3.0
	core-foundation@0.9.4
	core-foundation-sys@0.8.6
	cpufeatures@0.2.12
	crc@3.2.1
	crc-catalog@2.4.0
	crc32fast@1.4.0
	crossbeam-deque@0.8.5
	crossbeam-epoch@0.9.18
	crossbeam-utils@0.8.19
	crypto-common@0.1.6
	csv@1.3.0
	csv-core@0.1.11
	deflate64@0.1.8
	deranged@0.3.11
	derive_arbitrary@1.3.2
	digest@0.10.7
	directories@5.0.1
	dirs-sys@0.4.1
	either@1.11.0
	encoding_rs@0.8.34
	endian-type@0.1.2
	equivalent@1.0.1
	errno@0.3.8
	error-code@3.2.0
	fallible_collections@0.4.9
	fd-lock@4.0.2
	fixedbitset@0.4.2
	flate2@1.0.30
	fnv@1.0.7
	form_urlencoded@1.2.1
	fselect@0.8.6
	futures-channel@0.3.30
	futures-core@0.3.30
	futures-io@0.3.30
	futures-sink@0.3.30
	futures-task@0.3.30
	futures-util@0.3.30
	generic-array@0.14.7
	getrandom@0.2.14
	gimli@0.28.1
	h2@0.3.26
	hashbrown@0.13.2
	hashbrown@0.14.5
	hmac@0.12.1
	home@0.5.9
	http@0.2.12
	http-body@0.4.6
	httparse@1.8.0
	httpdate@1.0.3
	human-time@0.1.6
	human-time-macros@0.1.8
	humansize@2.1.3
	hyper@0.14.28
	hyper-rustls@0.24.2
	iana-time-zone@0.1.60
	iana-time-zone-haiku@0.1.2
	idna@0.5.0
	imagesize@0.12.0
	indexmap@2.2.6
	inout@0.1.3
	ipnet@2.9.0
	itertools@0.10.5
	itoa@1.0.11
	jobserver@0.1.31
	js-sys@0.3.69
	kamadak-exif@0.5.5
	keccak@0.1.5
	lazy_static@1.4.0
	libc@0.2.154
	libm@0.2.8
	libmimalloc-sys@0.1.37
	libredox@0.1.3
	libz-ng-sys@1.1.15
	linux-raw-sys@0.4.13
	log@0.4.21
	lscolors@0.17.0
	lzma-rs@0.3.0
	matroska@0.26.1
	memchr@2.7.2
	mimalloc@0.1.41
	mime@0.3.17
	minimal-lexical@0.2.1
	miniz_oxide@0.7.2
	mio@0.8.11
	mp3-metadata@0.3.4
	mp4parse@0.17.0
	mutate_once@0.1.1
	nibble_vec@0.1.0
	nix@0.28.0
	nom@7.1.3
	nu-ansi-term@0.50.0
	num-conv@0.1.0
	num-traits@0.2.18
	object@0.32.2
	once_cell@1.19.0
	option-ext@0.2.0
	paste@1.0.14
	pbkdf2@0.12.2
	percent-encoding@2.3.1
	petgraph@0.6.4
	phf@0.11.2
	phf_generator@0.11.2
	phf_macros@0.11.2
	phf_shared@0.11.2
	pin-project-lite@0.2.14
	pin-utils@0.1.0
	pkg-config@0.3.30
	powerfmt@0.2.0
	ppv-lite86@0.2.17
	proc-macro2@1.0.81
	quote@1.0.36
	radix_trie@0.2.1
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	rayon@1.10.0
	rayon-core@1.12.1
	rbase64@2.0.3
	redox_users@0.4.5
	regex@1.10.4
	regex-automata@0.4.6
	regex-syntax@0.8.3
	reqwest@0.11.27
	ring@0.17.8
	rustc-demangle@0.1.23
	rustix@0.38.34
	rustls@0.21.12
	rustls@0.22.4
	rustls-pemfile@1.0.4
	rustls-pki-types@1.5.0
	rustls-webpki@0.101.7
	rustls-webpki@0.102.3
	rustyline@14.0.0
	ryu@1.0.17
	scanlex@0.1.4
	sct@0.7.1
	semver@1.0.22
	serde@1.0.200
	serde_derive@1.0.200
	serde_json@1.0.116
	serde_spanned@0.6.5
	serde_urlencoded@0.7.1
	sha-1@0.10.1
	sha1@0.10.6
	sha2@0.10.8
	sha3@0.10.8
	simd-adler32@0.3.7
	siphasher@0.3.11
	slab@0.4.9
	smallvec@1.13.2
	socket2@0.5.7
	spin@0.9.8
	static_assertions@1.1.0
	subtle@2.5.0
	svg@0.17.0
	syn@1.0.109
	syn@2.0.60
	sync_wrapper@0.1.2
	system-configuration@0.5.1
	system-configuration-sys@0.5.0
	thiserror@1.0.59
	thiserror-impl@1.0.59
	time@0.3.36
	time-core@0.1.2
	tinyvec@1.6.0
	tinyvec_macros@0.1.1
	tokio@1.37.0
	tokio-rustls@0.24.1
	tokio-util@0.7.10
	toml@0.8.12
	toml_datetime@0.6.5
	toml_edit@0.22.12
	tower-service@0.3.2
	tracing@0.1.40
	tracing-core@0.1.32
	tree_magic_db@3.0.0
	tree_magic_mini@3.1.4
	try-lock@0.2.5
	typed-arena@2.0.2
	typenum@1.17.0
	unicode-bidi@0.3.15
	unicode-ident@1.0.12
	unicode-normalization@0.1.23
	unicode-segmentation@1.11.0
	unicode-width@0.1.12
	untrusted@0.9.0
	update-informer@1.1.0
	ureq@2.9.7
	url@2.5.0
	utf8parse@0.2.1
	uzers@0.12.0
	version_check@0.9.4
	wana_kana@3.0.0
	want@0.3.1
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen@0.2.92
	wasm-bindgen-backend@0.2.92
	wasm-bindgen-futures@0.4.42
	wasm-bindgen-macro@0.2.92
	wasm-bindgen-macro-support@0.2.92
	wasm-bindgen-shared@0.2.92
	wavers@1.4.1
	web-sys@0.3.69
	webpki-roots@0.25.4
	webpki-roots@0.26.1
	windows-core@0.52.0
	windows-sys@0.48.0
	windows-sys@0.52.0
	windows-targets@0.48.5
	windows-targets@0.52.5
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.5
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.5
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.5
	windows_i686_gnullvm@0.52.5
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.5
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.5
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.5
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.5
	winnow@0.6.7
	winreg@0.50.0
	xattr@1.3.1
	zerocopy@0.7.32
	zerocopy-derive@0.7.32
	zeroize@1.7.0
	zip@1.1.3
	zopfli@0.8.0
	zstd@0.13.1
	zstd-safe@7.1.0
	zstd-sys@2.0.10+zstd.1.5.6"

inherit cargo

DESCRIPTION="Find files with SQL-like queries"
HOMEPAGE="https://github.com/jhspetersson/fselect"
SRC_URI="${CARGO_CRATE_URIS}"

LICENSE="0BSD Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD BSD-2 Boost-1.0 CC0-1.0 GPL-2+ ISC MIT MPL-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="mirror"

DOCS=( docs/usage.md )

QA_FLAGS_IGNORED="usr/bin/fselect"

src_install() {
	einstalldocs
	cargo_src_install
	doman docs/fselect.1
}
