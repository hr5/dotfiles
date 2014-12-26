import time
import os
import re

def getVolume(text="Vol: "):
    dict = {}
    amixerOut = os.popen("amixer get Master").read()
    amixer = re.search("Playback [0-9]* \[([0-9]*%)\] \[([a-z]*)\]",amixerOut)
    volume = re.findall("[0-9]*%",amixerOut)
    
    if len(set(volume)) < 2:
        out = text + volume[0]
        
        if amixer != None and amixer.group(2) == "off":
            out = text + "No Sound "
        return out

def getMemoryPct(text=""):
    dict = {}
    freeOut = os.popen("free").read()
    memory = re.search("[A-z]:[ ]+ ([0-9]*)[ ]+ ([0-9]*)",freeOut)
    memoryTotal = int(memory.group(1))
    memoryUsed = int(memory.group(2))
    memoryPct = int(memoryUsed / (memoryTotal / 100))
    
    return text + str(memoryPct)

