#!/bin/sh

set -e

: "${IMAGE_NAME:=archiso-headless-builder}"

if [ -z "$1" ]; then
	target_dir="target"
	if ! [ -d "$target_dir" ]; then
		mkdir "$target_dir"
	fi
fi

target_dir="$(realpath "$target_dir")"

if ! docker images | grep -q "$IMAGE_NAME"; then
	echo "error: Docker image '$IMAGE_NAME' not found"
	echo "hint: build it with: docker/build-image.sh"
	exit 1
fi

docker run --rm \
	-v "$target_dir:/work/target" \
	--privileged \
	"$IMAGE_NAME" make
