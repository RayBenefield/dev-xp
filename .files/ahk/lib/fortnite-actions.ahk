#Include %A_ScriptDir%/lib/number-picker.ahk

_menu() {
    Send, {ESC}
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

_search() {
    CoordMode, Mouse, Client
    Click, 1720, 375
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

_setChannel(original, target) {
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
