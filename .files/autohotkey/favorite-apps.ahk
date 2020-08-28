#NoEnv ; recommended for performance and compatibility with future autohotkey releases.
#UseHook
#InstallKeybdHook
#SingleInstance force

SendMode Input

;; deactivate capslock completely
SetCapslockState, AlwaysOff

;; remap capslock to hyper
;; if capslock is toggled, remap it to esc

;; note: must use tidle prefix to fire hotkey once it is pressed
;; not until the hotkey is released
~Capslock::
    ;; must use downtemp to emulate hyper key, you cannot use down in this case 
    ;; according to https://autohotkey.com/docs/commands/Send.htm, downtemp is as same as down except for ctrl/alt/shift/win keys
    ;; in those cases, downtemp tells subsequent sends that the key is not permanently down, and may be 
    ;; released whenever a keystroke calls for it.
    ;; for example, Send {Ctrl Downtemp} followed later by Send {Left} would produce a normal {Left}
    ;; keystroke, not a Ctrl{Left} keystroke
    Send {Ctrl DownTemp}{Shift DownTemp}{Alt DownTemp}{LWin DownTemp}
    KeyWait, Capslock
    Send {Ctrl Up}{Shift Up}{Alt Up}{LWin Up}
    if (A_PriorKey = "Capslock") {
        Send {Esc}
    }
return

SetTitleMatchMode, 2
#IfWinActive ahk_exe Notepad.exe
    ~^s::
    ~#s::
        Reload
    Return
#IfWinActive

#1::
~Capslock & 1::
SetTitleMatchMode, 2
IfWinExist, ahk_exe Hyper.exe
{
    WinActivate, ahk_exe Hyper.exe
}
else
{
     run, "C:\Users\RayBenefield\AppData\Local\hyper\Hyper.exe"
    WinActivate, ahk_exe Hyper.exe
}
return ;

#2::
~Capslock & 2::
GroupAdd, chrome, ahk_exe chrome.exe, , , Google Keep
IfWinExist, ahk_group chrome
{
    WinGet, vWinList, List, ahk_group chrome
    
    Loop, % vWinList
        WinActivateBottom ahk_group chrome
    return
}
else
{
    run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
    WinActivate, ahk_group chrome
}
return ;

#3::
~Capslock & 3::
SetTitleMatchMode, 2
IfWinExist, ahk_exe Mailbird.exe
{

    WinActivate, ahk_exe Mailbird.exe
}
else
{
    run, "C:\Program Files\Mailbird\Mailbird.exe"
    WinActivate, ahk_exe Mailbird.exe
}
return ;

#4::
~Capslock & 4::
IfWinExist, Google Keep
{
    WinActivate, Google Keep
}
else
{
    run, "C:\Users\RayBenefield\Desktop\Google Keep"
    WinActivate, Google Keep
}
return ;

#5::
~Capslock & 5::
SetTitleMatchMode, 2
IfWinExist, ahk_exe StreamDeck.exe
{
    WinActivate, ahk_exe StreamDeck.exe
}
else
{
    run, "C:\Program Files\Elgato\StreamDeck\StreamDeck.exe"
    WinActivate, ahk_exe StreamDeck.exe
}
return ;

#6::
~Capslock & 6::
SetTitleMatchMode, 2
IfWinExist, Startup
{
    WinActivate, Startup
}
else
{
    run, explorer ""C:\Users\RayBenefield\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup""
    WinActivate, Startup
}
return ;

#7::
~Capslock & 7::
SetTitleMatchMode, 2
IfWinExist, ahk_exe Discord.exe
{
    WinActivate, ahk_exe Discord.exe
}
else
{
    run, "C:\Users\RayBenefield\AppData\Local\Discord\app-0.0.306\Discord.exe"
    WinActivate, ahk_exe Discord.exe
}
return ;

#8::
~Capslock & 8::
SetTitleMatchMode, 2
IfWinExist, ahk_exe Spotify.exe
{
    WinActivate, ahk_exe Spotify.exe
}
else
{
    run, "C:\Users\RayBenefield\AppData\Roaming\Spotify\Spotify.exe"
    WinActivate, ahk_exe Spotify.exe
}
return ;

#9::
~Capslock & 9::
SetTitleMatchMode, 2
GroupAdd, Explorer, ahk_class ExploreWClass
GroupAdd, Explorer, ahk_class CabinetWClass
IfWinExist, ahk_group Explorer
{
    WinGet, vWinList, List, ahk_group Explorer
    
    Loop, % vWinList
        WinActivateBottom ahk_group Explorer
    return
}
else
{
    run, explorer "C:\Users\RayBenefield\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Quick access.lnk"
    WinActivate, ahk_exe Explorer.EXE
}
return ;

#0::
~Capslock & 0::
SetTitleMatchMode, 2
IfWinExist, ahk_exe obs64.exe
{
    WinActivate, ahk_exe obs64.exe
}
else
{
    Run, "C:\Program Files\obs-studio\bin\64bit\obs64.exe", C:\Program Files\obs-studio\bin\64bit
    WinActivate, ahk_exe obs64.exe
}
return ;

#-::
~Capslock & -::
SetTitleMatchMode, 2
IfWinExist, ahk_exe Designer.exe
{
    WinActivate, ahk_exe Designer.exe
}
else
{
    Run, "C:\Program Files\Affinity\Designer\Designer.exe"
    WinActivate, ahk_exe Designer.exe
}
return ;

#=::
~Capslock & =::
SetTitleMatchMode, 2
IfWinExist, ahk_exe PhraseExpress.exe
{
    WinActivate, ahk_exe PhraseExpress.exe
}
else
{
    run, "C:\Program Files (x86)\PhraseExpress\phraseexpress.exe"
    WinActivate, ahk_exe PhraseExpress.exe
}
return ;

#+l::
SetTitleMatchMode, 2
IfWinExist, LastPass Desktop
{
    WinActivate, LastPass Desktop
    CoordMode, Mouse, Window
    Click, 490, 90
}
else
{
    run, "C:\Users\RayBenefield\Links\LastPass"
    WinActivate, LastPass Desktop
    Sleep, 1000
    CoordMode, Mouse, Window
    Click, 490, 90
}
return ;

~Capslock & `::
if WinExist("Window Spy") {
    WinClose, Window Spy
} else {
    WinGet, currentWindow, ID
    run, "C:\Program Files\AutoHotkey\WindowSpy.ahk"
    WinActivate, currentWindow
}
Return
