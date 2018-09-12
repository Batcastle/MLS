#!/bin/sh
# -*- coding: utf-8 -*-
#
#  loader.sh
#   The following code runs 3 commands simultaneously:
#       1st - starting the loading screen
#       2nd - it sets Mycroft to start up in 3 seconds, to allow the loading screen time to work so they can be working at the same time
#       3rd - it sets this script to kill the loading screen in 8 seconds so that it closes about the same time Mycroft's voice-recognition system fully launches
( python $HOME/mycroft-core/MLS/loader.py &
  sleep 3s && $HOME/mycroft-core/start-mycroft.sh all &
  sleep 8s && killall loader.py )
