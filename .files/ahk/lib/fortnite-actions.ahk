#Include %A_ScriptDir%/lib/Vis2.ahk

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
