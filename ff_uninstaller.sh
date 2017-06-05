#!/bin/sh

# A Linux Shell Script for uninstalling ffmpeg in CentOS (tested on 7).
# This script based on ffmpeg guide <https://trac.ffmpeg.org/wiki/CompilationGuide/Centos>
# This script is licensed under GNU GPL version 3.0 or above.


# uninstall yasm
rm -rf ~/ffmpeg_build ~/ffmpeg_sources ~/bin/{ffmpeg,ffprobe,ffserver,lame,vsyasm,x264,yasm,ytasm} ~/bin
yum erase autoconf automake bzip2 cmake freetype-devel gcc gcc-c++ git libtool mercurial nasm pkgconfig zlib-devel
hash -r
