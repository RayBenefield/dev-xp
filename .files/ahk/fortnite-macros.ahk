#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance force
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#Include %A_ScriptDir%/lib/fuzzy.ahk
#Include %A_ScriptDir%/lib/fortnite-actions.ahk
#Include C:/Users/RayBenefield/AutoHotInterception/lib/AutoHotInterception.ahk

AHI := new AutoHotInterception()

GLOBAL actions := [
(JOIN
    "StartEndGame",
    "AddDevice"
)]

StartEndGame() {
    _menu()
    Sleep, 300
    _startEndGame()
}

AddDevice() {
    MSGBOX, Not Implemented Yet
}

increment := 10

#IfWinActive ahk_exe FortniteClient-Win64-Shipping.exe

    F5::StartEndGame()

    +Right::
        Send, {RIGHT %increment%}
    RETURN

    +Left::
        Send, {LEFT %increment%}
    RETURN

    WheelUp::
        BlockMouse(600)
        Send, {f down}
        Sleep, 300
        Send, {f up}
    return

    WheelDown::
        BlockMouse(600)
        Send, {c down}
        Sleep, 300
        Send, {c up}
    return

    +WheelUp::
        BlockMouse(600)
        Send, {r down}
        Sleep, 300
        Send, {r up}
   return

    +WheelDown::
        BlockMouse(600)
        Send, {e down}
        Sleep, 300
        Send, {e up}
    return

    unblockTimer() {
        GLOBAL AHI
        AHI.UnsubscribeMouseMove(12)
    }
    BlockMouse(time) {
        GLOBAL AHI
        AHI.SubscribeMouseMove(12, true, Func("MouseEvent"))
        unblock := Func("unblockTimer")
        SetTimer, % unblock, % time
    }

    MouseEvent(x, y) {
    }

#IfWinActive
