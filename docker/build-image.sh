#!/bin/sh

: "${IMAGE_NAME:=archiso-headless-builder}"

docker build -t "$IMAGE_NAME" -f docker/Dockerfile .
