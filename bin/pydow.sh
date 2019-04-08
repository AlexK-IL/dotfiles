#!/bin/sh
# A shell script to download python packages for different platforms
#-------------------------------------------------------------------

[ $# -eq 0 ] && { echo "Usage: $0 package, [package, ...]"; exit 1; }

declare -a py_versions=("cp27m", "cp36m", "cp37m")
declare -a platforms=("win32", "win_amd64", "manylinux1_x86", "manylinux1_x86_64", "linux_x86", "linux_x86_64")

for package in "$@"
do
    pip download $package

    for platform in "${platforms[@]}"
    do
        for py_version in "${py_versions[@]}"
        do
            # pip download $package --python-version $py_version --platform $platform --only-binary=:all:
            pip download $package --platform $platform --only-binary=:all:
        done
    done
done
