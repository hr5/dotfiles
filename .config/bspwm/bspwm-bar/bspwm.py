import os
import bar

class Bspwm:
    
    def __init__(self):    
        self.rawData = os.popen("bspc control --get-status").read()
        self.bspwmData = self.rawData.split(":")
    
    def getActiveWorkspace(self):
        for i in self.bspwmData:
            if i[0] in ("O","F"):
                return i[1:]

    def printRaw(self):
        return (self.bspwmData)

    def printDesktopList(self):
        dlist = ""
        count = 1
        for i in self.bspwmData:
            if i[0] in ("o","f"):
                dlist = dlist + i[1:] + " "
                count += 1
            elif i[0] in ("O","F"):
                dlist = dlist + bar.getForegroundColor("#ffccff00") + i[1:] + " " + "%{F-}"
                count += 1
        return dlist

    def refresh(self):
        self.rawData = os.popen("bspc control --get-status").read()
        self.bspwmData = self.rawData.split(":")

