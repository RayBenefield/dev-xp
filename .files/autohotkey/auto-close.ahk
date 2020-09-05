#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance force

SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.  

GroupAdd, autoClose, ahk_exe StreamDeck.exe
GroupAdd, autoClose, ahk_exe WaveLink.exe
GroupAdd, autoClose, ahk_exe AquaSnap.Configurator.exe

Loop {
    WinWaitActive, ahk_group autoClose
    WinGet, id, ID, A
    WinGet, app, ProcessName, A

    WinWaitNotActive, ahk_id %id%
    WinGet, newApp, ProcessName, A

    if (newApp != app)
        WinClose, ahk_id %id%
}
