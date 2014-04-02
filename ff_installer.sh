#!/usr/bin/env bash

# A Linux Shell Script for compiling and installing ffmpeg in CentOS (tested on 6).
# This script based on ffmpeg guide <http://ffmpeg.org/trac/ffmpeg/wiki/CentosCompilationGuide>
# This script is licensed under GNU GPL version 3.0 or above.


#Remove any existing packages:
sudo yum erase ffmpeg x264 x264-devel

#Get the dependencies
sudo yum install autoconf automake gcc gcc-c++ git libtool make nasm pkgconfig wget zlib-devel


mkdir -p ~/src/ffmpeg-source

# install Yasm
cd ~/src/ffmpeg-source
wget http://www.tortall.net/projects/yasm/releases/yasm-1.2.0.tar.gz
tar xzvf yasm-1.2.0.tar.gz
cd yasm-1.2.0
./configure
make
sudo make install

# install x264
cd ~/src/ffmpeg-source
git clone git://git.videolan.org/x264
cd x264
./configure --enable-static
make
sudo make install

# install libfdk_aac
cd ~/src/ffmpeg-source
git clone --depth 1 git://github.com/mstorsjo/fdk-aac.git
cd fdk-aac
autoreconf -fiv
./configure --disable-shared
make
sudo make install

# install LAME
cd ~/src/ffmpeg-source
wget http://downloads.sourceforge.net/project/lame/lame/3.99/lame-3.99.5.tar.gz
tar xzvf lame-3.99.5.tar.gz
cd lame-3.99.5
./configure --disable-shared --enable-nasm
make
sudo make install

# install libogg
cd ~/src/ffmpeg-source
wget http://downloads.xiph.org/releases/ogg/libogg-1.3.1.tar.gz
tar xzvf libogg-1.3.1.tar.gz
cd libogg-1.3.1
./configure --disable-shared
make
sudo make install

# install libtheora
cd ~/src/ffmpeg-source
wget http://downloads.xiph.org/releases/theora/libtheora-1.1.1.tar.gz
tar xzvf libtheora-1.1.1.tar.gz
cd libtheora-1.1.1
./configure --disable-shared
make
sudo make install

# install libvorbis
cd ~/src/ffmpeg-source
wget http://downloads.xiph.org/releases/vorbis/libvorbis-1.3.4.tar.gz
tar xzvf libvorbis-1.3.4.tar.gz
cd libvorbis-1.3.4
./configure --disable-shared
make
sudo make install


# install libvpx
cd ~/src/ffmpeg-source
git clone http://git.chromium.org/webm/libvpx.git
cd libvpx
./configure
make
sudo make install

# install ffmpeg
cd ~/src/ffmpeg-source
git clone git://source.ffmpeg.org/ffmpeg
cd ffmpeg
./configure --enable-gpl --enable-libmp3lame --enable-libvorbis --enable-libvpx --enable-libx264
make
sudo make install
