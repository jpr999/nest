# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="Tmux plugin for highlights by tmux prefix key"
HOMEPAGE="https://github.com/tmux-plugins/tmux-prefix-highlight"
EGIT_REPO_URI="https://github.com/tmux-plugins/${PN}.git"

LICENSE="MIT"
SLOT="0"

RDEPEND="app-misc/tmux"

src_install() {
	einstalldocs
	insinto /usr/share/tmux-plugins/tmux-prefix-highlight
	doins prefix_highlight.tmux
	fperms +x /usr/share/tmux-plugins/tmux-prefix-highlight/prefix_highlight.tmux
}
