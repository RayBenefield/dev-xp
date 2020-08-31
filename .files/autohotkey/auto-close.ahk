#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance force

SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.  

GroupAdd, autoClose, ahk_exe StreamDeck.exe
GroupAdd, autoClose, ahk_exe WaveLink.exe

Loop {
    WinWaitActive, ahk_group autoClose
    WinGet, id, ID, A

    WinWaitNotActive, ahk_id %id%
    WinClose, ahk_id %id%
}
