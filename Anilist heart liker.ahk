#Persistent
loopRunning := false
SetTimer, ClickHearts, 1000  ; Adjust the interval as needed

^|::  ; Ctrl + |
    if (loopRunning) {
        loopRunning := false
        ToolTip, Loop Stopped
        Sleep 1000  ; Display the tooltip for 1 second
        ToolTip
    } else {
        loopRunning := true
        ToolTip, Loop Started
        Sleep 1000  ; Display the tooltip for 1 second
        ToolTip
    }
return

ClickHearts:
    if (loopRunning) {
        ; Loop through all elements with class "button" and "notliked"
        Loop, % "div.button:not(.liked)"
        {
            ; Get the position of the button
            CoordMode, Mouse, Screen
            MouseGetPos, xpos, ypos

            ; Click on the button
            Click %xpos%, %ypos%
            Sleep 100  ; Adjust sleep time as needed
        }
    }
return
