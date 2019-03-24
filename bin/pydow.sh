#!/bin/sh
# A shell script to download python packages in different platforms
#------------------------------------------------------------------

[ $# -eq 0 ] && { echo "Usage: $0 package, [package, ...]"; exit 1; }

for package in "$@"
do
    pip download $package --platform win32 --only-binary=:all:
    pip download $package --platform win_amd64 --only-binary=:all:
    pip download $package --platform manylinux1_x86 --only-binary=:all:
    pip download $package --platform manylinux1_x86_64 --only-binary=:all:
    pip download $package --platform linux_x86 --only-binary=:all:
    pip download $package --platform linux_x86_64 --only-binary=:all:
    pip download $package --platform any --only-binary=:all:
done
