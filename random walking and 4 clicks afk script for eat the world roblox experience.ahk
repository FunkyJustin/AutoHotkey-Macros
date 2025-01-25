#Persistent
toggle := false ; Start with the script turned off
SetTimer, CircularMovement, 0 ; Set the timer to trigger instantly

; Hotkey to toggle the script (Shift + L)
+L:: ; Shift + L
    toggle := !toggle ; Switch the toggle state
    if (toggle) {
        ToolTip, Circular Movement: ON ; Show "ON" notification
        Sleep, 1000
        ToolTip, ; Hide the notification
    } else {
        ToolTip, Circular Movement: OFF ; Show "OFF" notification
        Sleep, 1000
        ToolTip, ; Hide the notification
    }
return

; Timer function for circular movement
CircularMovement:
    if (!toggle) ; If the script is off, skip the movement logic
        return

    ; Movement pattern for circular motion
    CircularPattern := ["W", "D", "S", "A"] ; Clockwise pattern
    if (!CurrentKeyIndex) ; Initialize the index if it doesn't exist
        CurrentKeyIndex := 1

    ; Get the current key from the pattern
    KeyToPress := CircularPattern[CurrentKeyIndex]

    ; Randomize hold time for more natural movement
    Random, KeyHoldTime, 500, 2000 ; Randomly hold the key between 500-2000ms

    ; Press and hold the key
    Send, {%KeyToPress% down}
    Sleep, %KeyHoldTime% ; Hold the key for the random duration
    Send, {%KeyToPress% up} ; Release the key

    ; Perform 6 consecutive "eating" clicks after movement
    Loop, 6 {
        Click ; Simulate a mouse click
        Sleep, 200 ; Wait 200ms between clicks
    }

    ; Move to the next key in the circular pattern
    CurrentKeyIndex++
    if (CurrentKeyIndex > CircularPattern.MaxIndex()) ; Loop back to the first key
        CurrentKeyIndex := 1

    ; Immediately move to the next movement cycle
    return
