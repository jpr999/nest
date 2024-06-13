# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# shellcheck disable=SC2086

EAPI=8

EGIT_REPO_URI="https://github.com/SoptikHa2/${PN}.git"
CRATES="anyhow@1.0.65
	atty@0.2.14
	autocfg@1.1.0
	bitflags@1.3.2
	cassowary@0.3.0
	cfg-if@1.0.0
	clap@3.2.22
	clap_lex@0.2.4
	crossterm@0.25.0
	crossterm_winapi@0.9.0
	futures-core@0.3.24
	hashbrown@0.12.3
	hermit-abi@0.1.19
	indexmap@1.9.1
	inotify@0.10.0
	inotify-sys@0.1.5
	kqueue@1.0.6
	kqueue-sys@1.0.3
	libc@0.2.135
	lock_api@0.4.9
	log@0.4.17
	mio@0.8.4
	once_cell@1.15.0
	os_str_bytes@6.3.0
	parking_lot@0.12.1
	parking_lot_core@0.9.3
	pin-project-lite@0.2.9
	redox_syscall@0.2.16
	scopeguard@1.1.0
	signal-hook@0.3.14
	signal-hook-mio@0.2.3
	signal-hook-registry@1.4.0
	smallvec@1.10.0
	socket2@0.4.7
	strsim@0.10.0
	termcolor@1.1.3
	textwrap@0.15.1
	tokio@1.21.2
	tui@0.19.0
	unicode-segmentation@1.10.0
	unicode-width@0.1.10
	wasi@0.11.0+wasi-snapshot-preview1
	winapi@0.3.9
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.5
	winapi-x86_64-pc-windows-gnu@0.4.0
	windows-sys@0.36.1
	windows_aarch64_msvc@0.36.1
	windows_i686_gnu@0.36.1
	windows_i686_msvc@0.36.1
	windows_x86_64_gnu@0.36.1
	windows_x86_64_msvc@0.36.1"

inherit cargo git-r3

DESCRIPTION="Debugger for Sed"
HOMEPAGE="https://github.com/SoptikHa2/desed"
SRC_URI="${CARGO_CRATE_URIS}"

LICENSE="0BSD Apache-2.0 Apache-2.0-with-LLVM-exceptions GPL-3+ ISC MIT Unlicense ZLIB"
SLOT="0"

QA_FLAGS_IGNORED="usr/bin/desed"

src_unpack() {
	git-r3_src_unpack
	cargo_live_src_unpack
}

src_install() {
	einstalldocs
	doman desed.1
	cargo_src_install
}
