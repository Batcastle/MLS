# **Mycroft Loading Screen**
#### By Thomas Castleman
#### Lead Dev, Drauger OS
#### <draugeros@gmail.com>
#### https://draugeros.ml
A loading screen for the Mycroft AI (find at https://github.com/MycroftAI/mycroft-core/blob/dev/README.md )
---

## Thank you for using Mycroft Loading Screen (MLS)!

This loading screen has no dependencies that are not already found on most Linux systems. However, to ensure it works properly, please put the following files in their respective directories:
```
mycroft-core
└───MLS
    |   loader.gif
    |   loader.py
    └───loader.sh

/
└───bin
     └───mycroft
```
Please also note that `mycroft-core` must be installed to your home directory for this application to work.

# Installing

To install MLS, simply run `sudo mls_first-run.sh` and it will copy everything into the proper place

# Running
To start Mycroft with this application, run `mycroft -s` in your command line

This application can also kill Mycroft, start the command line interface for Mycroft, and start Mycroft in debugging mode. Furthermore, it can auto-update mycroft.

To do each, respectively, run:
* `mycroft -e`
* `mycroft -c`
* `mycroft -d`
* `mycroft -u`

If you need help, feel free to email us at the email provided above. Our Team will try our best to help as much as possible.

## Known Bugs

MLS currently does not work with Wayland, only with X11. If you are using Wayland, please switch to X11 in order to use MLS.

**Thank you again!**
