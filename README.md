# **Mycroft Loading Screen**
#### By Thomas Castleman
#### Lead Developer, Drauger OS
###### <draugeros@gmail.com>
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

# RUNNING
To start Mycroft with this application, run `mycroft -s` in your command line

This application can also kill Mycroft, start the command line interface for Mycroft, and start Mycroft in debugging mode. Furthermore, it can auto-update mycroft.

To do each, respectively, run:
* `mycroft -e`
* `mycroft -c`
* `mycroft -d`
* `mycroft -u`

If you need help, feel free to email us at the email provided above. Our Team will try our best to help as much as possible.

**Thank you again!**
