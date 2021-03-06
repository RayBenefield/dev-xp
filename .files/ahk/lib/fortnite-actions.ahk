#Include %A_ScriptDir%/lib/number-picker.ahk

_(delay = 100) {
    SLEEP, % delay
}

_customize() {
    Send, {e}
}

_confirm() {
    Send, {ENTER}
}

_escape() {
    Send, {ESC}
}

_phoneTools() {
    Send, {B}
}

_buildingToProp() {
    CoordMode, Mouse, Client
    Click, 1012, 1244
}

_refineGridSnap() {
    CoordMode, Mouse, Client
    Click, 848, 1151
}

_delete() {
    Send, {X}
}

_menu() {
    Send, {ESC}
}

_islandMenu() {
    Send, {TAB}
}

_myIsland() {
    CoordMode, Mouse, Client
    Click, 1700, 80
}

_creative() {
    CoordMode, Mouse, Client
    Click, 1994, 83
}

_devices() {
    CoordMode, Mouse, Client
    Click, 1702, 243
}

_inventorySearch() {
    CoordMode, Mouse, Client
    Click, 305, 465
}

_inventoryResult(pos = 1) {
    CoordMode, Mouse, Client

    if (pos == 1) {
        Click, 1059, 478
    } else if (pos == 2) {
        Click, 1376, 497
    } else if (pos == 3) {
        Click, 1690, 491
    } else {
        Click, 1059, 478
    }
}

_channelBrowser() {
    CoordMode, Mouse, Client
    Click, 3199, 2111
}

_tools() {
    CoordMode, Mouse, Client
    Click, 2125, 245
}

_backup() {
    CoordMode, Mouse, Client
    Click, 3342, 415
}

_startEndGame() {
    CoordMode, Mouse, Client
    Click, 3333, 1550 

    If (GetKeyState("F5", "P"))
        _returnToIsland()
    RETURN
}

_returnToIsland() {
    Sleep, 5000
    Click, 1890, 1930
}

_inventoryPrimary() {
    CoordMode, Mouse, Client
    Click, 1030, 1950
}

_inventorySecondary() {
    CoordMode, Mouse, Client
    Click, 1500, 1950
}

_inventoryBack() {
    CoordMode, Mouse, Client
    Click, 690, 275
}

_search() {
    CoordMode, Mouse, Client
    Click, 1720, 375
}

rowHeight := 170
_prop(row) {
    GLOBAL rowHeight
    rowY := (510 + (row * rowHeight)) - (rowHeight / 2)
    rowX := 1530
    CoordMode, Mouse, Client
    MouseMove, %rowX%, %rowY%
}

_readProperty(y) {
    row := Floor((y - 510) / 170)
    rowY := 510 + (row * 170)
    rowDimensions := [1320, rowY, 1430, 170]
    LOOP, 3 {
        property := OCR(rowDimensions)
        if (RegExMatch(property, "i)channel")) {
            BREAK
        } else {
            ;moveMsg := Func("MoveMsg")
            ;SetTimer, % moveMsg, 50
            ;msgbox, % property, Not Found
        }
    }
    if (RegExMatch(property, "i)no\s*channel")) {
        RETURN 0
    }
    RegExMatch(property, "i)channel\s*(\d+)", channel)
    Number := channel1 += 0
    if (type(Number) == "Integer") {
        RETURN Number
    }
    RETURN % "ERROR " property
}

_getTargetChannel(channel := 0) {
    return pickNumber(channel, 150)
}

_setChannel(target, original = 0) {
    if (target < 0) {
        RETURN
    }
    moves := target - original

    if (moves > 0) {
        Send, {RIGHT %moves%}
    }
    if (moves < 0) {
        newMoves := moves * -1
        Send, {LEFT %newMoves%}
    }
}

_setName(name) {
    SEND, e
    Sleep, 100
    CoordMode, Mouse, Client
    Click, 177, 2018
    Sleep, 100
    CoordMode, Mouse, Client
    Click, 599, 1441
    Sleep, 100
    CoordMode, Mouse, Client
    Click, 253, 1147
    Sleep, 100
    SEND, ^a
    Sleep, 100
    SEND, % name
    Sleep, 100
    SEND, {ENTER}
    SEND, {ENTER}
}
