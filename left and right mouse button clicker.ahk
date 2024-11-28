#Persistent
#NoEnv
SetBatchLines -1
SetDefaultMouseSpeed, 0

; Variables for toggling
clicking := false

; Hotkey to toggle clicking
CapsLock::
clicking := !clicking
if (clicking) {
    SetTimer, AutoClick, 0 ; No delay, maximum speed
} else {
    SetTimer, AutoClick, Off
}
return

; Function for auto-clicking
AutoClick:
    Click, left
    Click, right
return

; Exit script with F12
F12::ExitApp
