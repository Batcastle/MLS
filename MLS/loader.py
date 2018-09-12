#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
#  loader.py
#  
import gi
import os
gi.require_version('Gtk', '3.0')
from gi.repository import Gtk, Gdk, Pango
home = os.environ["HOME"]
location = "%s/Dropbox/MLS/loader.gif" % (home)
#location = "%s/mycroft-core/MLS/loader.gif" % (home)
import subprocess
resuls = subprocess.Popen(['xrandr'],stdout=subprocess.PIPE).communicate()[0].split("current")[1].split(",")[0]
width = resuls.split("x")[0].strip()
heigth = resuls.split("x")[1].strip()
width = int(width)
heigth = int(heigth)

def set_procname(newname):
	from ctypes import cdll, byref, create_string_buffer
	libc = cdll.LoadLibrary('libc.so.6')    #Loading a 3rd party library C
	buff = create_string_buffer(10) #Note: One larger than the name (man prctl says that)
	buff.value = newname                 #Null terminated string as it should be
	libc.prctl(15, byref(buff), 0, 0, 0) #Refer to "#define" of "/usr/include/linux/prctl.h" for the misterious value 16 & arg[3..5] are zero as the man page says.

#set this script's process name to "loader.py", which is the value of "name"
set_procname("loader.py")

#set-up GTK to display the loading window properly
class Splash(Gtk.Window):

    def __init__(self):
        Gtk.Window.__init__(self, title="splashtitle")
        maingrid = Gtk.Grid()
        self.add(maingrid)

        image = Gtk.Image()
        # set the path to the image below
        image.set_from_file(location)
        maingrid.attach(image, 1, 0, 1, 1)

        maingrid.set_border_width(40)
        # set text for the spash window
        label = Gtk.Label("Mycroft is Loading . . .")
        label.modify_font(Pango.FontDescription("Ubuntu 16"))
        maingrid.attach(label, 1, 1, 1, 1)
        

def splashwindow():
    window = Splash()
    window.set_decorated(False)
    window.set_resizable(False)
    window.override_background_color(Gtk.StateType.NORMAL, Gdk.RGBA(0,0,0,1))
    window.modify_fg(Gtk.StateFlags.NORMAL, Gdk.color_parse("white"))
    window.set_opacity(0.0)
    window.move(width,heigth)
    window.show_all()
    Gtk.main()

#
splashwindow()
