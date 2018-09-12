#!/bin/bash
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
