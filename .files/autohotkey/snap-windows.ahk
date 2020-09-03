#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance force
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

previousWindow :=

Loop {
    WinWaitActive, A, ,
    
    WinGet, style, Style, A

    isResizable := style & 0x40000
    if (!isResizable) {
        ;MsgBox, "No Resize"
        Continue
    }
    WinGet, id, ID, A

    if (id = previousWindow) {
        Sleep, 1000
        WinGet, id, ID, A
        if (id != previousWindow)
            Continue
    }

    previousWindow := id

    WinGetPos, x, y, width, height, A
    winLeft := x
    winTop := y
    winRight := x + width
    winBottom := y + height
    WinGetTitle, winTitle 

    foundMonitor := GetMonitor()
    SysGet, monitor, MonitorWorkArea, %foundMonitor%

    ;MsgBox %winTitle%`nWinTop:`t%winTop%`tBottom:`t%winBottom%`tLeft:`t%winLeft%`tRight:`t%winRight%`nMonTop:`t%monitorTop%`tBottom:`t%monitorBottom%`tLeft:`t%monitorLeft%`tRight:`t%monitorRight%
    topDist := abs(winTop - monitorTop)
    leftDist := abs(winLeft - monitorLeft)
    rightDist := abs(winRight - monitorRight)
    bottomDist := abs(winBottom - monitorBottom)

    ; Snapped to Top Left
    if (0 <= topDist) && (topDist <= 15) && (0 <= leftDist) && (leftDist <= 15) && (topDist + leftDist <= 25) {
        ;MsgBox, Top Left
        Continue
    }

    ; Snapped to Top Right
    if (0 <= topDist) && (topDist <= 15) && (0 <= rightDist) && (rightDist <= 15) && (topDist + rightDist <= 25) {
        ;MsgBox, Top Right
        Continue
    }

    ; Snapped to Bottom Right
    if (0 <= bottomDist) && (bottomDist <= 15) && (0 <= rightDist) && (rightDist <= 15) && (bottomDist + rightDist <= 25) {
        ;MsgBox, Bottom Right
        Continue
    }

    ; Snapped to Bottom Left
    if (0 <= bottomDist) && (bottomDist <= 15) && (0 <= leftDist) && (leftDist <= 15) && (bottomDist + leftDist <= 25) {
        ;MsgBox, Bottom Left
        Continue
    }

    ; Snapped to Top Bottom
    if (0 <= bottomDist) && (bottomDist <= 15) && (0 <= topDist) && (topDist <= 15) && (topDist + bottomDist <= 25) {
        ;MsgBox, Top Bottom
        Continue
    }

    ; Snapped to Right Left
    if (0 <= rightDist) && (rightDist <= 15) && (0 <= leftDist) && (leftDist <= 15) && (rightDist + leftDist <= 25) {
        ;MsgBox, Right Left
        Continue
    }

    monitorWidth := abs(monitorRight - monitorLeft)
    monitorHeight := abs(monitorTop - monitorBottom)
    CoordMode, Mouse, Screen
    MouseGetPos, x, y

    monitorArea := monitorWidth * monitorHeight
    windowArea := width * height

    smallWindow := windowArea < monitorArea/4

    if (monitorWidth >= monitorHeight) {
        ;MsgBox, Landscape
        if (leftDist <= rightDist) {
            ;MsgBox, Left Side
            if (!smallWindow) {
                Send, ^!+#h
            } else {
                if (topDist >= bottomDist)
                    WinMove, ahk_id %id%, , monitorLeft, monitorBottom - height
                else
                    WinMove, ahk_id %id%, , monitorLeft, monitorTop
            }
            Continue
        }

        if (leftDist > rightDist) {
            ;MsgBox, Right Side
            if (!smallWindow) {
                Send, ^!+#l
            } else {
                if (topDist < bottomDist)
                    WinMove, ahk_id %id%, , monitorRight - width, monitorTop
                else
                    WinMove, ahk_id %id%, , monitorRight - width, monitorBottom - height
            }
            Continue
        }
    }

    if (monitorWidth < monitorHeight) {
        ;MsgBox, Portrait
        if (topDist <= bottomDist) {
            ;MsgBox, Top
            if (!smallWindow) {
                Send, ^!+#k
            } else {
                if (rightDist >= leftDist)
                    WinMove, ahk_id %id%, , monitorLeft, monitorTop
                else
                    WinMove, ahk_id %id%, , monitorRight - width, monitorTop
            }
            Continue
        }

        if (topDist > bottomDist) {
            ;MsgBox, Bottom
            if (!smallWindow) {
                Send, ^!+#j
            } else {
                if (rightDist < leftDist)
                    WinMove, ahk_id %id%, , monitorRight - width, monitorBottom - height
                else
                    WinMove, ahk_id %id%, , monitorLeft, monitorBottom - height
            }
            Continue
        }
    }
}

GetMonitor(hwnd := 0) {
; If no hwnd is provided, use the Active Window
    if (hwnd)
        WinGetPos, winX, winY, winW, winH, ahk_id %hwnd%
    else
        WinGetActiveStats, winTitle, winW, winH, winX, winY

    SysGet, numDisplays, MonitorCount
    SysGet, idxPrimary, MonitorPrimary

    Loop %numDisplays%
    {   SysGet, mon, MonitorWorkArea, %a_index%
    ; Tracked based on X. Cannot properly sense on Windows "between" monitors
        if (winX >= monLeft - 15 && winX < monRight + 15)
            return %a_index%
    }
; Return Primary Monitor if can't sense
    return idxPrimary
}
