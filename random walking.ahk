#Persistent
toggle := false ; Start with the script turned off
SetTimer, RandomMovement, 100 ; Check periodically if the script is toggled on

; Hotkey to toggle the script (Shift + L)
+L:: ; Shift + L
    toggle := !toggle ; Switch the toggle state
    if (toggle) {
        ToolTip, Random Movement: ON ; Show "ON" notification
        Sleep, 1000
        ToolTip, ; Hide the notification
    } else {
        ToolTip, Random Movement: OFF ; Show "OFF" notification
        Sleep, 1000
        ToolTip, ; Hide the notification
    }
return

; Timer function for random movement
RandomMovement:
    if (!toggle) ; If the script is off, skip the movement logic
        return

    Random, KeyHoldTime, 500, 2000 ; Randomly hold the key between 0.5-2 seconds
    Random, KeyInterval, 1000, 3000 ; Random interval between key presses (1-3 seconds)
    Random, Key, 1, 4 ; Randomly choose a key: 1=W, 2=A, 3=S, 4=D

    ; Assign the key based on the random value
    if (Key = 1)
        KeyToPress := "W"
    else if (Key = 2)
        KeyToPress := "A"
    else if (Key = 3)
        KeyToPress := "S"
    else
        KeyToPress := "D"

    ; Press and hold the key
    Send, {%KeyToPress% down}
    Sleep, %KeyHoldTime% ; Hold the key for the random duration
    Send, {%KeyToPress% up} ; Release the key

    Sleep, %KeyInterval% ; Wait for the random interval before the next key press
return
