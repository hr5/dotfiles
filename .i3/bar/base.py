import time
import os
import re

def getTime(format):
    dict= {}
    dict["full_text"] = time.strftime(format)
    return dict

def getVolume(text="Vol: "):
    dict = {}
    amixerOut = os.popen("amixer get Master").read()
    amixer = re.search("Playback [0-9]* \[([0-9]*%)\] \[([a-z]*)\]",amixerOut)
    volume = re.findall("[0-9]*%",amixerOut)
    
    if len(set(volume)) < 2:
        dict["full_text"] = text + volume[0]
        
        if amixer != None and amixer.group(2) == "off":
            dict["full_text"] = "Vol: No Sound "
            dict["color"] = "#ff0000"
        return dict

def getKernel():
    dict = {}
    dict["full_text"] = "Kernel v" + os.popen("uname -r").read()
    return dict

def getArch():
    dict = {}
    dict["full_text"] = os.popen("uname -m").read()
    return dict

def getUptime(flags="-p"):
    dict = {}

    output = os.popen("uptime " + flags).read()[:-1]
    if flags == "-p" and Lang == "DE":
        output = output.replace("hours","stunden")
        output = output.replace("minutes","minuten")
    
    dict["full_text"] = output
    return dict

def getMemoryPct(text=""):
    dict = {}
    freeOut = os.popen("free").read()
    memory = re.search("[\w]*:[ ]+ (\d*)[ ]+ (\d*)",freeOut)
    memoryTotal = int(memory.group(1))
    memoryUsed = int(memory.group(2))

    memoryPct = int(memoryUsed / (memoryTotal / 100))

    dict["full_text"] = text + str(memoryPct)+"%"
    #return int(memoryPct)
    return dict 
