#!/bin/sh

set -e

releases() {
	curl -s https://archlinux.org/releng/releases/ |
		pup 'table tr td:nth-child(2) text{}'
}

latest_release() {
	releases | head -n 1
}

"$@"
