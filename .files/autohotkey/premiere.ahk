#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance force
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#Include %A_ScriptDir%/Lib/Gdip_All.ahk
#Include %A_ScriptDir%/Lib/fuzzy.ahk
#Include %A_ScriptDir%/Lib/premiere-actions.ahk

GLOBAL VARIABLE := "variable"
GLOBAL NOT_VARIABLE := false

GLOBAL INJECT := "inject"
GLOBAL DONT_INJECT := false

GLOBAL edits := [
(JOIN
    "Zoom",
    "Intro",
    "PastFuture",
    "Title"
)]

_startVariable() {
    _focusTimeline()
    Sleep, 300

    _makeMarker(1)
    Sleep, 300
    _goBackMarker()
}

_endVariable() {
    _goForward()
    Sleep, 300
    _deleteMarker()
    Sleep, 300
    _goBackMarker()
    Sleep, 300
    _deleteMarker()
}

_insert(edit, track, variableOrInject = false) {
    _focusTimeline()
    Sleep, 300

    _source(track)
    Sleep, 300
    _focusProject()
    Sleep, 300
    _focusFind()
    Sleep, 300
    _type(edit)
    Sleep, 300
    _highlightFirstSegment()
    Sleep, 300

    if (variableOrInject == INJECT) {
        _inject()
        Sleep, 300
    } else {
        _overlay()
        Sleep, 300
    }

    _clearFind()
    Sleep, 300
    _focusTimeline()
    Sleep, 300
    _trackVideo(track)
    Sleep, 300

    if (variableOrInject == VARIABLE) {
        _extendSegment()
        Sleep, 300
    }

    _goBack()
    Sleep, 300
    _trackVideo(track)
    Sleep, 300
    _source(1)
}

Title() {
    _startVariable()
    Sleep, 300
    _insert("darker", 4)
    Sleep, 300
    _endVariable()
}

PastFuture() {
    _startVariable()
    Sleep, 300
    _insert("zoom", 6, VARIABLE)
    Sleep, 300
    _insert("zoom", 7, VARIABLE)
    Sleep, 300
    _endVariable()
}

Zoom() {
    _startVariable()
    Sleep, 300
    _insert("zoom", 2, VARIABLE)
    Sleep, 300
    _endVariable()
}

Intro() {
    _insert("intro", 4, INJECT)
}

#IfWinActive ahk_exe Adobe Premiere Pro.exe
    $^u::Send, ^z
    $^r::Send, ^+z

    ; Inject Placeholder
    $+\::Send, +{LEFT}+{LEFT}+{LEFT}!3d^c{DOWN}^+v{ESC}{UP}!2dg-99{ENTER}{ESC}{DOWN}+{RIGHT}+{RIGHT}+{RIGHT}!3

    ; SHIFT|LPEDAL Add Edit with Fuzzy Search
    $+F20::
        editNumber := fuzzy(edits, 1)
        edit := edits[editNumber]
        editFunction := Func(edit)
        editFunction.Call()
    RETURN

    ; LPEDAL Ripple Trim Previous Edit to Playhead
    $F20::_rippleTrimLast()

    ; ALT|LPEDAL Ripple Trim Next Edit to Playhead
    $!F20::_rippleTrimNext()

    ; RPEDAL Add Edit
    $F22::_addEdit()

    ; SHIFT|RPEDAL Mute Segment
    $+F22::Send, {UP}dg-99{ENTER}{ESC}{DOWN}

;     $+F20::
;         MouseGetPos x, y
;         Send, +7+F
;         SendInput, title-blur-enter
;         SendEvent {Click 60, 270, down}{click %x%, %y%, up}
;     RETURN
#IfWinActive
