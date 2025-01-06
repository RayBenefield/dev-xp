#NoTrayIcon ; disable the momentary tray icon flickering
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#Include %A_ScriptDir%/lib/Vis2.ahk

FileRead, Project, current-project.txt

Clipboard := ""
FileRead, Clipboard, %1%
Clipboard := StrReplace(Clipboard, "{PROJECT}", Project)
Send +v
