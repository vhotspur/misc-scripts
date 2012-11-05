#!/bin/sh

xmlhighlight() {
	xmllint --format "$@" | source-highlight -s xml -f esc
}

x2x_over_ssh() {
	[ -z "$1" ] && { echo "specify hostname"; return 1; }
	local _host="$1"
	shift
	local _opts=""
	[ "$#" -eq 0 ] && _opts="-west"
	ssh -XC "$_host"  x2x -to "$DISPLAY" "$@" $_opts
}


