#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance force
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#Include %A_ScriptDir%/lib/fuzzy.ahk
#Include %A_ScriptDir%/lib/fortnite-actions.ahk

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

#IfWinActive ahk_exe FortniteClient-Win64-Shipping.exe
    F5::StartEndGame()
#IfWinActive
