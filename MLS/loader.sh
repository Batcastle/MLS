#!/bin/sh
# -*- coding: utf-8 -*-
#
# loader.sh
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
#   The following code runs 3 commands simultaneously:
#       1st - starting the loading screen
#       2nd - it sets Mycroft to start up in 3 seconds, to allow the loading screen time to work so they can be working at the same time
#       3rd - it sets this script to kill the loading screen in 8 seconds so that it closes about the same time Mycroft's voice-recognition system fully launches
( python $HOME/mycroft-core/MLS/loader.py &
  sleep 3s && $HOME/mycroft-core/start-mycroft.sh all &
  sleep 8s && killall loader.py )
  
  ##EOF##
