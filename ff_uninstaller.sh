#!/bin/sh

# A Linux Shell Script for uninstalling ffmpeg in CentOS (tested on 6).
# This script based on ffmpeg guide <http://ffmpeg.org/trac/ffmpeg/wiki/CentosCompilationGuide>
# This script is licensed under GNU GPL version 3.0 or above.


# uninstall yasm
rm -rf ~/ffmpeg_build ~/ffmpeg_sources ~/bin/{ffmpeg,ffprobe,ffserver,lame,vsyasm,x264,yasm,ytasm}
sudo yum erase autoconf automake gcc gcc-c++ git libtool make nasm pkgconfig zlib-devel
hash -r
