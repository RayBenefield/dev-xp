#NoTrayIcon ; disable the momentary tray icon flickering
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#Include %A_ScriptDir%/lib/Vis2.ahk

; ProjectTitleLocation := [3030, 40, 3660, 75]
ProjectTitleLocation := [1730, 40, 2370, 75]
Title := OCR(ProjectTitleLocation)
RegExMatch(Title, "- (.*) \(", ProjectName)

FileDelete, current-project.txt
FileAppend, % ProjectName1, current-project.txt

MsgBox, % ProjectName1
