#!/bin/bash

releases() {
	curl -s https://api.github.com/repos/thekhanj/archiso-headless/releases | jq -r '.[].name'
}

latest_release() {
	ret="$(releases | head -n 1)"
	if [ -z "$ret" ]; then
		return 1
	fi
	echo "$ret"
}

release_date() {
	echo "$1" |
		grep -oE '[0-9]{4}\.[0-9]{2}\.[0-9]{2}' |
		sed 's/\./-/g'
}

should_release() {
	local gh_latest_release
	if ! gh_latest_release="$(latest_release)"; then
		# not released anything yet
		return 0
	fi

	local gh_date
	gh_date="$(release_date "$gh_latest_release")"

	local arch_date
	arch_date="$(./ops/arch.sh latest_release)"

	[[ "$gh_date" < "$arch_date" ]]
}

"$@"
