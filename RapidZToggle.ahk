#Persistent
#MaxThreadsPerHotkey 2

toggle := false ; Initialize toggle state

CapsLock::
toggle := !toggle ; Toggle the state
if (toggle) {
    SetTimer, PressZ, 0 ; Start pressing Z rapidly
} else {
    SetTimer, PressZ, Off ; Stop pressing Z
}
return

PressZ:
Send, z
return
