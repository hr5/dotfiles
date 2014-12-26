import json
import time
import os
import sys
import base

refreshRate = 5

print ('{"version":1}')
print ("[")


while 1:
    

    data = json.dumps([base.getVolume(),base.getMemoryPct(text="Mem: "),base.getTime("%a %X")])
    print(data + ",")
    
    time.sleep(refreshRate)
