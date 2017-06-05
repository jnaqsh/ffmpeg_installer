# FFmpeg Installer

A Linux Shell Script for compiling, installing and uninstalling FFmpeg in CentOS (tested on 7.0). This script is based on the [FFmpeg guide](https://trac.ffmpeg.org/wiki/CompilationGuide/Centos).


## Installation

````sh
cd ~
sudo yum -y install git
git clone https://github.com/jnaqsh/ffmpeg_installer/
cd ffmpeg_installer
chmod +x ./*.sh
sudo ./ff_installer.sh
````

## Uninstallation

````sh
cd ~/ffmpeg_installer
sudo ./ff_uninstaller.sh
````

## License

A Linux Shell Script for compiling and installing FFmpeg in CentOS.

Copyright (C) 2017 Hamed Ramezanian Nik

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
