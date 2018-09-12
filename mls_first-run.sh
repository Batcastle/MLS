#!/bin/bash
# -*- coding: utf-8 -*-
#
#  mls_first-run.sh
#  
#  Copyright 2018 Thomas Castleman <draugeros@gmail.com>
#  
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#  
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#  MA 02110-1301, USA.
#  
#  
if [[ $EUID != 0 ]]; then
    echo "Root privs are needed to install MLS. Please run 'sudo mls_first-run.sh'."
    exit 1
fi
read -p "This script makes the command mycroft executable, puts it in $HOME/bin, and copies the rest of the files where they need to go. BEFORE continuing, make sure Mycroft is installed in your home directory. Is Mycroft installed to your home directory? [y/N]: " q
if [[ "$q" == "y" ]] || [[ "$q" == "Y" ]]; then
    base=$(pwd)
    pkexec chmod +x $base/mycroft
    pkexec chmod +x $base/MLS/loader.py
    pkexec chmod +x $base/MLS/loader.sh
    pkexec chmod +x $base/MLS/loader.gif
    pkexec cp $base/mycroft.1.gz /usr/share/man/man1
    mkdir $HOME/bin $HOME/mycroft-core/MLS
    cp -rv $base/MLS $HOME/mycroft-core/MLS
    cp $base/mycroft $HOME/bin
    echo "Done"
    exit 0
fi
if [ "$q" == "n" ]; then
	exit 0
fi
