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
    "PastFuture"
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

+F20::
    editNumber := fuzzy(edits, 1)
    edit := edits[editNumber]
    editFunction := Func(edit)
    editFunction.Call()
RETURN
