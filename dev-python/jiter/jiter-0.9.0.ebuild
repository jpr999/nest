# Copyright 2023-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=maturin
PYTHON_COMPAT=( python3_{10..13} )

CRATES="ahash@0.8.11
	arbitrary@1.4.1
	autocfg@1.4.0
	bencher@0.1.5
	bitflags@2.9.0
	bitvec@1.0.1
	cc@1.2.16
	cfg-if@1.0.0
	codspeed-bencher-compat@2.9.1
	codspeed@2.9.1
	colored@2.2.0
	equivalent@1.0.2
	funty@2.0.0
	getrandom@0.2.15
	getrandom@0.3.1
	hashbrown@0.15.2
	heck@0.5.0
	indexmap@2.8.0
	indoc@2.0.6
	itoa@1.0.15
	jobserver@0.1.32
	lazy_static@1.5.0
	lexical-parse-float@1.0.5
	lexical-parse-integer@1.0.5
	lexical-util@1.0.6
	libc@0.2.170
	libfuzzer-sys@0.4.9
	memchr@2.7.4
	memoffset@0.9.1
	num-bigint@0.4.6
	num-integer@0.1.46
	num-traits@0.2.19
	once_cell@1.21.0
	paste@1.0.15
	portable-atomic@1.11.0
	proc-macro2@1.0.94
	pyo3-build-config@0.24.0
	pyo3-ffi@0.24.0
	pyo3-macros-backend@0.24.0
	pyo3-macros@0.24.0
	pyo3@0.24.0
	python3-dll-a@0.2.13
	quote@1.0.39
	radium@0.7.0
	ryu@1.0.20
	serde@1.0.219
	serde_derive@1.0.219
	serde_json@1.0.140
	shlex@1.3.0
	smallvec@1.14.0
	static_assertions@1.1.0
	syn@2.0.100
	tap@1.0.1
	target-lexicon@0.13.2
	unicode-ident@1.0.18
	unindent@0.2.4
	uuid@1.15.1
	version_check@0.9.5
	wasi@0.11.0+wasi-snapshot-preview1
	wasi@0.13.3+wasi-0.2.2
	windows-sys@0.59.0
	windows-targets@0.52.6
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_msvc@0.52.6
	windows_i686_gnu@0.52.6
	windows_i686_gnullvm@0.52.6
	windows_i686_msvc@0.52.6
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_msvc@0.52.6
	wit-bindgen-rt@0.33.0
	wyz@0.5.1
	zerocopy-derive@0.7.35
	zerocopy@0.7.35"

inherit cargo distutils-r1 pypi

DESCRIPTION="Fast iterable JSON parser"
HOMEPAGE="https://github.com/pydantic/jiter"
SRC_URI+="
	${CARGO_CRATE_URIS}
"

LICENSE="Apache-2.0 Boost-1.0 Apache-2.0-with-LLVM-exceptions MIT MPL-2.0 UoI-NCSA Unicode-3.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test" # requires nodejs

RDEPEND="dev-python/orjson[${PYTHON_USEDEP}]
	dev-python/ujson[${PYTHON_USEDEP}]"
BDEPEND="dev-util/maturin[${PYTHON_USEDEP}]"

QA_FLAGS_IGNORED="usr/lib/python.*/site-packages/jiter/jiter.*.so"

distutils_enable_tests pytest
