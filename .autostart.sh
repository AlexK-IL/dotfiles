#! /bin/bash

# Fix low volume
sudo python2 /home/alex/FixLowVolume.py

# Mount Windows7 OS
sudo mount -t ntfs -o iocharset=utf8,umask=000 /dev/sda2 /media/Windows7/
