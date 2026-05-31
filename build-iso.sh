#!/bin/sh

set -e

ROOT_PASSWORD="$1"

cp -r /usr/share/archiso/configs/releng releng
echo "$ROOT_PASSWORD:root" |
	chpasswd -P "$PWD/releng/airootfs"
mkarchiso -v -w archiso-work -o target releng
