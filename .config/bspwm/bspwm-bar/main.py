import bspwm
import time
import bar
import base

b = bspwm.Bspwm()
count = 0
sync = 0

alignRight = "%{r}"
alignLeft = "%{l}"
alignCenter = "%{l}"
sep = " | "

while 1:
    
    if count == sync:
        date = time.strftime("%X | %x")
        mem = base.getMemoryPct(text="Mem: ") + sep
        vol = base.getVolume() + sep

        sync = 50
        count = 0
    
    try:
        print("{}{}{} {}{}{}".format(bar.alignLeft,b.printDesktopList(),bar.alignRight,vol,mem,date))
    except:
        exit()
    time.sleep (0.1)
    count += 1
    b.refresh()
