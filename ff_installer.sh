#!/usr/bin/env bash

# A Linux Shell Script for compiling and installing ffmpeg in CentOS (tested on 7).
# This script based on ffmpeg guide <https://trac.ffmpeg.org/wiki/CompilationGuide/Centos>
# This script is licensed under GNU GPL version 3.0 or above.


# Remove any existing packages
yum -y erase ffmpeg x264 x264-devel
yum -y install yum-utils

# Install the dependencies
yum-config-manager --add-repo http://www.nasm.us/nasm.repo
yum -y install autoconf automake bzip2 cmake freetype-devel gcc gcc-c++ git libtool make mercurial nasm pkgconfig zlib-devel

# Make a directory for FFmpeg sources
mkdir ~/ffmpeg_sources

# Install Yasm
cd ~/ffmpeg_sources
curl -O http://www.tortall.net/projects/yasm/releases/yasm-1.3.0.tar.gz
tar xzvf yasm-1.3.0.tar.gz
cd yasm-1.3.0
./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin"
make
make install
make distclean
source ~/.bash_profile

# Install x264
cd ~/ffmpeg_sources
git clone --depth 1 git://git.videolan.org/x264
cd x264
PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig" ./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin" --enable-static
make
make install
make distclean
source ~/.bash_profile

# Install x265
cd ~/ffmpeg_sources
hg clone https://bitbucket.org/multicoreware/x265
cd ~/ffmpeg_sources/x265/build/linux
cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="$HOME/ffmpeg_build" -DENABLE_SHARED:bool=off ../../source
make
make install
make distclean
source ~/.bash_profile

# Install libfdk_aac
cd ~/ffmpeg_sources
git clone --depth 1 git://git.code.sf.net/p/opencore-amr/fdk-aac
cd fdk-aac
autoreconf -fiv
./configure --prefix="$HOME/ffmpeg_build" --disable-shared
make
make install
make distclean
source ~/.bash_profile

# Install libmp3lame
cd ~/ffmpeg_sources
curl -L -O http://downloads.sourceforge.net/project/lame/lame/3.99/lame-3.99.5.tar.gz
tar xzvf lame-3.99.5.tar.gz
cd lame-3.99.5
./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin" --disable-shared --enable-nasm
make
make install
make distclean
source ~/.bash_profile

# Install libopus
cd ~/ffmpeg_sources
curl -O https://archive.mozilla.org/pub/opus/opus-1.1.5.tar.gz
tar xzvf opus-1.1.5.tar.gz
cd opus-1.1.5
./configure --prefix="$HOME/ffmpeg_build" --disable-shared
make
make install
make distclean
source ~/.bash_profile

# Install libogg
cd ~/ffmpeg_sources
curl -O http://downloads.xiph.org/releases/ogg/libogg-1.3.2.tar.gz
tar xzvf libogg-1.3.2.tar.gz
cd libogg-1.3.2
./configure --prefix="$HOME/ffmpeg_build" --disable-shared
make
make install
make distclean
source ~/.bash_profile
#yum -y install libogg

# Install libvorbis
cd ~/ffmpeg_sources
curl -O http://downloads.xiph.org/releases/vorbis/libvorbis-1.3.4.tar.gz
tar xzvf libvorbis-1.3.4.tar.gz
cd libvorbis-1.3.4
./configure --prefix="$HOME/ffmpeg_build" --with-ogg="$HOME/ffmpeg_build" --disable-shared
make
make install
make distclean
source ~/.bash_profile
#yum -y install libvorbis

# Install libtheora
# cd ~/ffmpeg_sources
# wget http://downloads.xiph.org/releases/theora/libtheora-1.1.1.tar.gz
# tar xzvf libtheora-1.1.1.tar.gz
# cd libtheora-1.1.1
# ./configure --disable-shared
# make
# make install
# make distclean
# source ~/.bash_profile
yum -y install libtheora

# Install libvpx
cd ~/ffmpeg_sources
git clone --depth 1 https://chromium.googlesource.com/webm/libvpx.git
cd libvpx
./configure --prefix="$HOME/ffmpeg_build" --disable-examples  --as=yasm
PATH="$HOME/bin:$PATH" make
make install
make distclean
source ~/.bash_profile
#yum -y install libvpx

# Install FFmpeg
cd ~/ffmpeg_sources
curl -O http://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2
tar xjvf ffmpeg-snapshot.tar.bz2
cd ffmpeg
PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig" ./configure --prefix="$HOME/ffmpeg_build" --extra-cflags="-I$HOME/ffmpeg_build/include" --extra-ldflags="-L$HOME/ffmpeg_build/lib -ldl" --bindir="$HOME/bin" --pkg-config-flags="--static" --enable-gpl --enable-nonfree --enable-libfdk_aac --enable-libfreetype --enable-libmp3lame --enable-libopus --enable-libvorbis --enable-libvpx --enable-libx264 --enable-libx265
make
make install
hash -r

make distclean
source ~/.bash_profile
