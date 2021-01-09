#NOENV ; recommended for performance and compatibility with future autohotkey releases.
#USEHOOK
#INSTALLKEYBDHOOK
#SINGLEINSTANCE FORCE

#Include %A_ScriptDir%/lib/fuzzy.ahk
#Include C:/Users/RayBenefield/AutoHotInterception/lib/AutoHotInterception.ahk

AHI := new AutoHotInterception()

SENDMODE INPUT
SETTITLEMATCHMODE, 2

;; deactivate capslock completely
SETCAPSLOCKSTATE, ALWAYSOFF

GLOBAL games := [
(JOIN
    "CoreGames",
    "Fortnite"
)]

;; remap capslock to hyper
;; if capslock is toggled, remap it to esc

;; note: must use tidle prefix to fire hotkey once it is pressed
;; not until the hotkey is released
~CAPSLOCK::
    ;; must use downtemp to emulate hyper key, you cannot use down in this case 
    ;; according to https://autohotkey.com/docs/commands/Send.htm, downtemp is as same as down except for ctrl/alt/shift/win keys
    ;; in those cases, downtemp tells subsequent sends that the key is not permanently down, and may be 
    ;; released whenever a keystroke calls for it.
    ;; for example, Send {Ctrl Downtemp} followed later by Send {Left} would produce a normal {Left}
    ;; keystroke, not a Ctrl{Left} keystroke
    SEND {CTRL DOWNTEMP}{SHIFT DOWNTEMP}{ALT DOWNTEMP}{LWIN DOWNTEMP}
    KEYWAIT, Capslock
    SEND {CTRL UP}{SHIFT UP}{ALT UP}{LWIN UP}
    IF (A_PriorKey = "Capslock") {
        SEND {Esc}
    }
RETURN

#IFWINACTIVE ahk_exe Notepad.exe
    ~^s::
    ~#s::
        RELOAD
    RETURN
#IFWINACTIVE

ActivateOrRun(window, app, path = "") {
    IFWINEXIST, %window%
    {
        WINGET, winList, List, %window%
        
        LOOP, % winList
            WINACTIVATEBOTTOM %window%
        RETURN
    }
    ELSE
    {
        RUN, %app%, %path%
        WINACTIVATE, %window%
    }
}


; #1::
~CAPSLOCK & 1::
    ActivateOrRun("ahk_exe Hyper.exe", "C:\Users\RayBenefield\AppData\Local\hyper\Hyper.exe")
RETURN

; #2::
~CAPSLOCK & 2::
    GROUPADD, Chrome, ahk_exe chrome.exe, , , Google Keep
    ActivateOrRun("ahk_group Chrome", "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe")
RETURN

; #3::
~CAPSLOCK & 3::
    ActivateOrRun("ahk_exe Mailbird.exe", "C:\Program Files\Mailbird\Mailbird.exe")
RETURN

; #4::
~CAPSLOCK & 4::
    ActivateOrRun("Google Keep", "C:\Users\RayBenefield\Dropbox\My PC (Ray-PC)\Desktop\Google Keep")
RETURN

; #5::
~CAPSLOCK & 5::
    ActivateOrRun("ahk_exe StreamDeck.exe", "C:\Program Files\Elgato\StreamDeck\StreamDeck.exe")
RETURN

; #6::
~CAPSLOCK & 6::
    ActivateOrRun("ahk_exe Miro.exe", "C:\Users\RayBenefield\AppData\Local\RealtimeBoard\Miro.exe")
RETURN

; #7::
~CAPSLOCK & 7::
    ActivateOrRun("ahk_exe Discord.exe", "C:\Users\RayBenefield\AppData\Local\Discord\Update.exe --processStart Discord.exe")
RETURN

; #8::
~CAPSLOCK & 8::
    ActivateOrRun("ahk_exe Spotify.exe", "C:\Users\RayBenefield\AppData\Roaming\Spotify\Spotify.exe")
RETURN

; #9::
~CAPSLOCK & 9::
    GROUPADD, Explorer, ahk_class ExploreWClass
    GROUPADD, Explorer, ahk_class CabinetWClass
    ActivateOrRun("ahk_group Explorer", "explorer")
RETURN

; #0::
~CAPSLOCK & 0::
    ActivateOrRun(ahk_exe obs64.exe, "C:\Program Files\obs-studio\bin\64bit\obs64.exe", "C:\Program Files\obs-studio\bin\64bit")
RETURN

~CAPSLOCK & -::
    ActivateOrRun(ahk_exe Adobe Premiere Pro.exe, "C:\Program Files\Adobe\Adobe Premiere Pro 2020\Adobe Premiere Pro.exe")
RETURN

CoreGames() {
    ActivateOrRun("Core", "C:\ProgramData\Manticore Games\Launcher\Core Launcher.exe")
}

Fortnite() {
    ActivateOrRun("ahk_exe FortniteClient-Win64-Shipping.exe", "C:\Program Files\Epic Games\Fortnite\FortniteGame\Binaries\Win64\FortniteLauncher.exe", "C:\Program Files\Epic Games\Fortnite\FortniteGame\Binaries\Win64")
}

~Capslock & =::
    SEND, {CTRL UP}
    gameNumber := fuzzy(games, 1)
    game := games[gameNumber]
    gameFunction := Func(game)
    gameFunction.Call()
RETURN

#+l::
    IFWINEXIST, LastPass Desktop
    {
        WINACTIVATE, LastPass Desktop
        COORDMODE, Mouse, Window
        CLICK, 490, 90
    }
    ELSE
    {
        RUN, "C:\Users\RayBenefield\Links\LastPass"
        WINACTIVATE, LastPass Desktop
    }
RETURN

~CAPSLOCK & `::
    IF WINEXIST("Window Spy") {
        WINCLOSE, Window Spy
    } ELSE {
        WINGET, currentWindow, ID
        RUN, "C:\Program Files\AutoHotkey\WindowSpy.ahk"
        WINACTIVATE, currentWindow
    }
RETURN

~CAPSLOCK & BS::
    IFWINEXIST, ahk_exe taskmgr.exe
    {
        WINCLOSE, ahk_exe taskmgr.exe
    }
    ELSE
    {
        RUN, "C:\WINDOWS\system32\Taskmgr.exe"
        WINACTIVATE, ahk_exe taskmgr.exe
    }
RETURN

lastMove=0
moving=false
#IfWinActive ahk_exe FortniteClient-Win64-Shipping.exe
    ~CAPSLOCK::
        GLOBAL AHI

        AHI.SubscribeMouseMove(12, true, Func("MouseEvent"))
        KEYWAIT, Capslock
        unslowTimer()
    RETURN

    ~CAPSLOCK & W::
        Send {W DOWN}
        Sleep, 20
        Send {W UP}
        Sleep, 600
    RETURN
    ~CAPSLOCK & A::Send {A}
        Send {A DOWN}
        Sleep, 20
        Send {A UP}
        Sleep, 600
    RETURN
    ~CAPSLOCK & S::Send {S}
        Send {S DOWN}
        Sleep, 20
        Send {S UP}
        Sleep, 600
    RETURN
    ~CAPSLOCK & D::Send {D}
        Send {D DOWN}
        Sleep, 20
        Send {D UP}
        Sleep, 600
    RETURN
    ~CAPSLOCK & SPACE::
        Send {SPACE DOWN}
        Sleep, 20
        Send {SPACE UP}
        Sleep, 600
    RETURN
    ~CAPSLOCK & CTRL::
        Send {J DOWN}
        Sleep, 20
        Send {J UP}
        Sleep, 600
    RETURN

    unslowTimer() {
        GLOBAL AHI
        AHI.UnsubscribeMouseMove(12)
    }

    MouseEvent(x, y) {
        GLOBAL AHI
        GLOBAL lastMove
        GLOBAL moving

        if (moving) {
            lastMove += 1
        }
        if (lastMove > 300) {
            lastMove = 0
            moving := false
        }
        if (not moving) {
            if (Abs(x) > 6 or Abs(y) > 6) {
                AHI.SendMouseMove(12, x/2, y/2)
                moving := true
            }
        }
    }
#IfWinActive
