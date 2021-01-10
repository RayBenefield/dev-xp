#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance force
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#Include %A_ScriptDir%/lib/fuzzy.ahk
#Include %A_ScriptDir%/lib/fortnite-actions.ahk
#Include %A_ScriptDir%/lib/Vis2.ahk
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
    F23::
        Suspend
        ToolTip, PAUSE, 200, 250
        Pause ,, 1
        SetTimer, RemoveToolTip, 1
    return

    RemoveToolTip:
        SetTimer, RemoveToolTip, Off
        ToolTip
    return

    F5::StartEndGame()

    +Right::
        Send, {RIGHT %increment%}
    RETURN

    +Left::
        Send, {LEFT %increment%}
    RETURN

    WheelUp::
        BlockMouse(600)
        Send, {U down}
        Sleep, 300
        Send, {U up}
    return

    WheelDown::
        BlockMouse(600)
        Send, {O down}
        Sleep, 300
        Send, {O up}
    return

    +WheelUp::
        BlockMouse(600)
        Send, {P down}
        Sleep, 300
        Send, {P up}
   return

    +WheelDown::
        BlockMouse(600)
        Send, {L down}
        Sleep, 300
        Send, {L up}
    return

    unblockTimer() {
        GLOBAL AHI
        AHI.UnsubscribeMouseMove(12)
    }
    BlockMouse(time) {
        GLOBAL AHI
        AHI.SubscribeMouseMove(12, true, Func("MouseEvent"))
        if (time) {
            unblock := Func("unblockTimer")
            SetTimer, % unblock, % time
        }
    }

    F::Send, {N}
    C::
        _phoneTools()
        Sleep, 300
        CoordMode, Mouse, Client
        Click, 847, 1102
        _escape()
    RETURN

    !Rbutton::
        MouseClick
        Sleep, 300
        _inventoryPrimary()
    RETURN
    !^Rbutton::
        MouseClick
        Sleep, 300
        _inventorySecondary()
    RETURN
    !Mbutton::
        MouseGetPos, x, y
        _inventoryBack()
        MouseMove, x, y
    RETURN

    +Xbutton1::Send {ENTER}

    +F20::
        MouseGetPos, x, y
        original := _readProperty(y)
        if (!InStr(original, "ERROR")) {
            target := _getTargetChannel(original)
            WinActivate, ahk_exe FortniteClient-Win64-Shipping.exe
            MouseMove, x, y
            _setChannel(original, target)
        } else {
            moveMsg := Func("MoveMsg")
            SetTimer, % moveMsg, 50
            msgbox, , Not Found, % original
        }
        WinActivate, ahk_exe FortniteClient-Win64-Shipping.exe
    RETURN

    F2::
        _islandMenu()
        Sleep, 300
        _myIsland()
        Sleep, 300
        _tools()
        Sleep, 300
        _backup()
    RETURN

    `::
        _phoneTools()
        Sleep, 300
        _buildingToProp()
        Sleep, 300
        _escape()
    RETURN

    +Rbutton::
    WHILE, GetKeyState("Rbutton", "P") {
        _delete()
        Sleep, 300
    }
    RETURN

    MoveMsg() {
        SysGet, monitor, MonitorWorkArea, 1
        ID := WinExist("Not Found")
        WinMove, ahk_id %ID%, , % monitorLeft, % monitorTop
    }

    MouseEvent(x, y) {
    }

#IfWinActive
