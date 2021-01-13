#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance force
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#Include %A_ScriptDir%/lib/explorer.ahk

GroupAdd, tabs, ahk_exe chrome.exe
GroupAdd, tabs, ahk_exe Designer.exe
GroupAdd, tabs, ahk_exe Hyper.exe
GroupAdd, chrome, ahk_exe chrome.exe, , , Google Keep

;RCtrl::RWin
;RWin::RCtrl
;LCtrl::LWin
;LWin::LCtrl

F12::Send, {AppsKey}

#IfWinNotActive ahk_exe diabotical.exe
    F1::Send, {F2}
#IfWinNotActive

#IfWinActive ahk_exe Designer.exe
    F2::
        Send, ^+]
        CoordMode, Mouse, Screen
        Click, 1840, 700
    Return
#IfWinActive

#IfWinActive ahk_exe Hyper.exe
    $^j::SEND, {F12}
    $^i::SEND, {F9}
    $#v::
    $^v::
        Send, ^+v
    return
    $#w::
        SEND, exit{ENTER}
        Sleep, 100
        SEND, {CTRL DOWN}{ALT DOWN}w{ALT UP}{CTRL UP}
    RETURN
    #q::
        WinKill, A
    return
#IfWinActive

#IfWinActive ahk_exe Mailbird.exe
    $^/::Send, {F3}
#IfWinActive

; F4::
; 	path := Explorer_GetPath()
; 	all := Explorer_GetAll()
; 	sel := Explorer_GetSelected()
; 	MsgBox %path%
; 	MsgBox %all%
; 	MsgBox %sel%
; return

#IfWinActive ahk_exe explorer.exe
    $^Backspace::Send, ^d
    $#l::Send, !d
#IfWinActive

#IfWinActive ahk_group chrome
    $#l:: Send, {Alt down}d{Alt up}
    $#+t::
    $^+t::
        Send, {Ctrl down}{Shift Down}t{Shift Up}{Ctrl Up}
    Return
    $#Left:: Send, {Alt down}{Left}{Alt Up}
    $#Right:: Send, {Alt down}{Right}{Alt Up}
    $^h:: Send, {Alt down}{Left}{Alt Up}
    $^l:: Send, {Alt down}{Right}{Alt Up}
    $#f:: Send, /
    $^w:: Send, ^{BACKSPACE}
#IfWinActive

#IfWinActive Google Keep
    $^h:: Send, {CTRL DOWN}![{CTRL UP}
    $^l:: Send, {CTRL DOWN}!]{CTRL UP}
    $^j:: Send, +{TAB}N{TAB}{END}
    $^k:: Send, +{TAB}P{TAB}{END}
    $^!k:: Send, +{TAB}p{TAB}{END}
    $^!j:: Send, +{TAB}n{TAB}{END}
    $^b:: Send, ^+8
    $^Space::
        Send, +{TAB}{SPACE}n{TAB}
        Sleep, 100
        Send, {ESC}
        Sleep, 200
        Send, {ENTER}
#IfWinActive

#IfWinActive ahk_group tabs
    $#+]:: Send, ^{Tab}
    $#+[:: Send, ^+{Tab}
#IfWinActive

#c::Send, ^c 
#v::Send, ^v
#x::Send, ^x
#w::Send, ^w
#t::Send, ^t
#n::Send, ^n
#q::Send, ^q
#s::Send, ^s
#z::Send, ^z
#f::Send, ^f
#o::Send, ^o
#a::Send, ^a
#k::Send, ^k
#r::Send, ^r
#,::Send, ^,
#+n::Send, ^+n
#enter:: Send {LCtrl}{Enter}

Help::Send, {AppsKey}

SetTitleMatchMode, 2
#IfWinActive ahk_exe Notepad.exe
    ~^s::
    ~#s::
        Reload
    Return
#IfWinActive

;$RShift::
;KeyWait, RShift, T0.06
;If (ErrorLevel = 1)
;{
;	Send {Shift Down}
;	KeyWait, RShift
;	Send {Shift Up}
;}
;Else
;	Send {$}
;Return

~RShift::
Input, Pressed, L1 T0.08 V E C
if (ErrorLevel = "Max")
    return
if (ErrorLevel = "Timeout")
{
    if !GetKeyState("RShift", "P")a
        Send {$}
    return
}
return

~LShift::
if (!timer) {
    conflict = 0
    timer = 1
    SetTimer, Stop, -700
}

Input, Pressed, L1 T0.08 V E C
if (ErrorLevel = "Max") {
    return
}
if (ErrorLevel = "Timeout") {
    if (!GetKeyState("LShift", "P")) {
        if (!conflict) {
            Send {^}
        }
        conflict = 0
        timer = 0
    }
    return
}
Stop:
    conflict = 1
return

$RWin::
KeyWait, RWin, T0.08
If (ErrorLevel = 1)
{
	Send {RWin Down}
	KeyWait, RWin
	Send {RWin Up}
}
Else
{
    conflict=1
    SendLevel 1
    Send {#}
}
Return

$RAlt::
KeyWait, RAlt, T0.08
If (ErrorLevel = 1)
{
	Send {RAlt Down}
	KeyWait, RAlt
	Send {RAlt Up}
}
Else
{
    conflict=1
    SendLevel 1
	Send {*}
}
Return

^q::Send !{F4}
return

PreviousApp := ""
NextIndex := 1

$#`::
    PID = 0
    WinGet, hWnd,, A
    DllCall("GetWindowThreadProcessId", "UInt", hWnd, "UInt *", PID)
    hProcess := DllCall("OpenProcess",  "UInt", 0x400 | 0x10, "Int", False
                                     ,  "UInt", PID)
    PathLength = 260*2
    VarSetCapacity(FilePath, PathLength, 0)
    DllCall("Psapi.dll\GetModuleFileNameExW", "UInt", hProcess, "Int", 0
                                 , "Str", FilePath, "UInt", PathLength)
    DllCall("CloseHandle", "UInt", hProcess)

    if (PreviousApp != FilePath) {
        PreviousApp := FilePath
        NextIndex := 1
    }

    NextIndex := ++NextIndex
    WinGet, vWinCount, count, ahk_exe %FilePath%
    if (NextIndex > vWinCount)
        NextIndex := vWinCount

    WinGet, vWinList, List, ahk_exe %FilePath%
    NextWindowId := vWinList%NextIndex%
    WinActivate, ahk_id %NextWindowId%
Return

#d::
    WinGet, active, ProcessName, A

    collapse := active != "ssn.exe"

    WinGet, List, List  ;get the list of all windows
    Loop % List  ;or use this loop to minimze the windows
    {
        WinGet, app, ProcessName, % "ahk_id " List%A_Index%
        if (app != "ssn.exe") {
            if (collapse)
                WinMinimize, % "ahk_id " List%A_Index%
            else
                WinActivate, % "ahk_id " List%A_Index%
        } else {
            if (collapse)
                WinActivate, % "ahk_id " List%A_Index%
        }
    }
    
    if (collapse) {
        WinActivate, ahk_exe ssn.exe
    }
Return

#F12::
Sleep 1000  ; Give user a chance to release keys (in case their release would wake up the monitor again).
; Turn Monitor Off:
SendMessage, 0x112, 0xF170, 2,, Program Manager  ; 0x112 is WM_SYSCOMMAND, 0xF170 is SC_MONITORPOWER.
; Note for the above: Use -1 in place of 2 to turn the monitor on.
; Use 1 in place of 2 to activate the monitor's low-power mode.
return

#IfWinExist ahk_exe ssn.exe
    $!s::
        WinGet, prevId, ID, A
        Send, !g
        Sleep, 1000
        Send, !a
        Sleep, 1000
        Send, +{TAB}+{TAB}{ENTER}
        Sleep, 100
        Send, {ESC}
        Sleep, 100
        WinActivate, ahk_id %prevId%
    RETURN
#IfWinExist

#IfWinActive ahk_exe ssn.exe
    $!Backspace::Send, !{DEL}
#IfWinActive

#IfWinActive ahk_exe taskmgr.exe
    $#w::Send, !e
#IfWinActive

#Tab::Send, !{Tab}

#IfWinActive Youtube Title Analysis - Google Sheets - Google Chrome
    F11::
        SENDINPUT ^{LEFT}
        SENDINPUT +{LEFT}
        SENDINPUT ^c
        SLEEP 100
        SENDINPUT !{TAB}
        SLEEP 200
        SENDINPUT ^a
        SLEEP 100
        SENDINPUT ^v
        SENDINPUT {ENTER}
        SLEEP 100
        SENDINPUT !{TAB}
        SLEEP 200
        SENDINPUT {RIGHT}
        SLEEP 100
        SENDINPUT {RIGHT}
    RETURN
#IfWinActive

+^k:: ; SHIFT+CTRL+K converts text to capitalized
  Clipboard := ""
  SendInput, ^c ;copies selected text
  ClipWait
  StringUpper Clipboard, Clipboard, T ; Title mode conversion
  SendInput %Clipboard%
Return

F10::
    CoordMode, Mouse, Client
    MouseGetPos, x, y
    clipboard := "CoordMode, Mouse, Client`nMouseMove, " x ", " y
RETURN
