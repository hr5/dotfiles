
alignRight = "%{r}"
alignLeft = "%{l}"
alignCenter = "%{c}"

def getForegroundColor(color,underline=False):
    attr=""
    if underline:
        attr = "+u"
    return "%{F" + color + attr +"}"

def getBackgroundColor(color):
    return "%{B" + color + "}"

def getUnderlineColor(color):
    return "%{U" + color  + "}"

def button(text,command):

    return "%%{A:%s:}%s%%{A}" % (command,text)

