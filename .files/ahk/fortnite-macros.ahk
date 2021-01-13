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

GLOBAL labels := [
(JOIN
    "[1] Diamond - ",
    "[2] Ruby - ",
    "[3] Amber - ",
    "[4] Topaz - ",
    "[5] Emerald - ",
    "[6] Turquoise - ",
    "[7] Sapphire - ",
    "[8] Obsidian - ",
    "[9] Opal - ",
    "[10] Garnet - ",
    "[11] Citrine - ",
    "[12] Agate - ",
    "[13] Peridot - ",
    "[14] Aquamarine - ",
    "[15] Onyx - ",
    "[16] Amethyst - "
)]

GLOBAL devices := [
(JOIN
    "Trigger",
    "Player Spawn Pad",
    "Player Reference",
    "Speaker",
    "Radio",
    "Explosive Device",
    "Damage Trap",
    "Poison Dart Trap",
    "Full Damage Rail",
    "Half Damage Rail",
    "Creature Manager",
    "Creature Spawner",
    "Creature Placer",
    "Shooting Range Gallery",
    "Sentry",
    "HUD Message Device",
    "Map Indicator Device",
    "Billboard",
    "Holoscreen",
    "Scoreboard",
    "Item Spawner",
    "Vending Machine",
    "Item Granter",
    "Elimination Manager",
    "Consumables Gallery",
    "Chest & Ammo Gallery",
    "Item Spawner Plate",
    "Creepin' Cardboard",
    "Trick Tile",
    "Matchmaking Portal",
    "Teleporter",
    "Hover Platform",
    "Air Vent Gallery",
    "Pinball Bumper",
    "Pinball Flipper",
    "Chiller",
    "Ice Block",
    "Bouncer",
    "Speed Boost",
    "Movement Modulator",
    "Launch Pad",
    "Tracker",
    "Lock Device",
    "Conditional Button",
    "Timed Objective",
    "Capture Item Spawner",
    "Capture Area",
    "Objective Device Gallery",
    "Collectibles Gallery",
    "Ball Spawner",
    "Color Changing Tiles",
    "Class Selector",
    "Class Designer",
    "Power Ups Gallery",
    "Player Spawn Plate",
    "Player Checkpoint",
    "Round Settings",
    "Team Settings & Inventory",
    "Prop-O-Matic Manager",
    "Advanced Storm Controller",
    "Basic Storm Controller",
    "Advanced Storm Beacon",
    "Attribute Trigger",
    "Preception Trigger",
    "Random Number Generator",
    "Score Manager",
    "Button",
    "Timer",
    "Sequencer",
    "Shopping Cart Spawn",
    "ATK Spawn",
    "Quadcrasher Spawn",
    "X-4 Stormwing Spawn",
    "Driftboard Spawn",
    "Baller Spawn",
    "B.R.U.T.E. Spawn",
    "Sword in the Stone",
    "Mounted Turret",
    "Cannon Spawn",
    "Damage Volume",
    "Mutator Zone",
    "Barrier",
    "Cozy Campfire"
)]

GLOBAL deviceSearchPositions := [
(JOIN
    3,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1
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
        AHI.UnsubscribeMouseMove(19)
    }
    BlockMouse(time) {
        GLOBAL AHI
        AHI.SubscribeMouseMove(19, true, Func("MouseEvent"))
        if (time) {
            unblock := Func("unblockTimer")
            SetTimer, % unblock, % time
        }
    }

    F::Send, {N}
    C::
        _phoneTools()
        Sleep, 300
        _refineGridSnap()
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
    +Xbutton2::Send {ESC}

    F20::
        MouseGetPos, x, y
        target := _getTargetChannel(original)
        WinActivate, ahk_exe FortniteClient-Win64-Shipping.exe
        MouseMove, x, y
        _setChannel(0, target)
    RETURN
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

    +F22::
        label := fuzzy(labels)
        if (label == 0) {
            CLIPBOARD := " "
        } else {
            CLIPBOARD := labels[label]
        }
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

    +TAB::
        _islandMenu()
        _myIsland()
        _channelBrowser()
    RETURN

    +F21::
        device := fuzzy(devices)
        if (device == 0) {
            RETURN
        }
        CLIPBOARD := devices[device]
        pos := deviceSearchPositions[device]
        WinActivate, ahk_exe FortniteClient-Win64-Shipping.exe
        _escape()
        Sleep, 300
        _escape()
        Sleep, 300
        Click
        Sleep, 300
        _islandMenu()
        Sleep, 300
        _creative()
        Sleep, 300
        _creative()
        Sleep, 300
        _devices()
        Sleep, 300
        _inventorySearch()
        Send, ^a
        Send, % CLIPBOARD
        Sleep, 300
        _inventoryResult(pos)
        Sleep, 300
        _inventorySearch()
        Sleep, 300
        Send, ^a{BACKSPACE}{ENTER}
        Sleep, 300
        _inventoryPrimary()
    RETURN

#IfWinActive
