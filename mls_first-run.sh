#!/bin/bash
if [[ $EUID != 0 ]]; then
    echo "Root privs are needed to install MLS."
    exit 1
fi
echo "This script makes the command mycroft executable, puts it in $HOME/bin, and copies the rest of the files where they need to go. BEFORE continuing, make sure Mycroft is installed in your home directory. Is Mycroft installed to your home directory? (y/n)"
read q
if [ "$q" == "y" ]; then
    base=$(pwd)
    sudo chmod +x $base/mycroft
    sudo chmod +x $base/MLS/loader.py
    sudo chmod +x $base/MLS/loader.sh
    sudo chmod +x $base/MLS/loader.gif
    sudo cp $base/mycroft.1.gz /usr/share/man/man1
    mkdir $HOME/mycroft-core/MLS
    mkdir $HOME/bin
    cp $base/MLS/loader.py $HOME/mycroft-core/MLS
    cp $base/MLS/loader.sh $HOME/mycroft-core/MLS
    cp $base/MLS/loader.gif $HOME/mycroft-core/MLS
    cp $base/mycroft $HOME/bin
    echo "Done"
    exit 0
fi
if [ "$q" == "n" ]; then
	exit 0
fi
