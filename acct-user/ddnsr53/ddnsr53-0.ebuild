# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit acct-user

ACCT_USER_ID=-1
ACCT_USER_GROUPS=( ddnsr53 )
ACCT_USER_HOME="/etc/ddns-route53"
ACCT_USER_HOME_OWNER="ddnsr53:ddnsr53"
ACCT_USER_HOME_PERMS=0770

acct-user_add_deps
