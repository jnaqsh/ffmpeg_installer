#!/bin/sh

# A Linux Shell Script for uninstalling ffmpeg in CentOS (tested on 6).
# This script based on ffmpeg guide <http://ffmpeg.org/trac/ffmpeg/wiki/CentosCompilationGuide>
# This script is licensed under GNU GPL version 3.0 or above.


# uninstall yasm
cd ~/src/ffmpeg-source/yasm-1.2.0 && sudo make uninstall

# uninstall x264
cd ~/src/ffmpeg-source/x264 && sudo make uninstall

# uninstall LAME
cd ~/src/ffmpeg-source/lame-3.99.5 && sudo make uninstall

# uninstall libogg
cd ~/src/ffmpeg-source/libogg-1.3.0 && sudo make uninstall

# uninstall libvorbis
cd ~/src/ffmpeg-source/libvorbis-1.3.3 && sudo make uninstall

# uninstall libvpx
cd ~/src/ffmpeg-source/libvpx && sudo make uninstall

# uninstall ffmpeg
cd ~/src/ffmpeg-source/ffmpeg && sudo make uninstall

# remove ffmpeg-source dir
rm -rf ~/src/ffmpeg-source

# uninstall dependencies
sudo yum erase autoconf automake gcc gcc-c++ git libtool make nasm pkgconfig wget zlib-devel
