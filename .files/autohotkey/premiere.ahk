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
    "Intro"
)]

_insert(edit, track, variableOrInject = false) {
    _focusTimeline()
    Sleep, 200

    if (variableOrInject == VARIABLE) {
        _makeMarker(1)
        Sleep, 200
        _goBackMarker()
        Sleep, 200
    }

    _source(track)
    Sleep, 200
    _focusProject()
    Sleep, 200
    _focusFind()
    Sleep, 200
    _type(edit)
    Sleep, 200
    _highlightFirstSegment()
    Sleep, 200

    if (variableOrInject == INJECT) {
        _inject()
        Sleep, 200
    } else {
        _overlay()
        Sleep, 200
    }

    _focusTimeline()
    Sleep, 200
    _trackVideo(track)
    Sleep, 200

    if (variableOrInject == VARIABLE) {
        _extendSegment()
        Sleep, 200
        _deleteMarker()
        Sleep, 200
        _goBackMarker()
        Sleep, 200
        _deleteMarker()
        Sleep, 200
    } else {
        _goBack()
        Sleep, 200
    }

    _trackVideo(track)
    Sleep, 200
    _source(1)
}

Zoom() {
    _insert("zoom", 6, VARIABLE)
}

Intro() {
    _insert("intro", 6, INJECT)
}

+F20::
    editNumber := fuzzy(edits, 1)
    edit := edits[editNumber]
    editFunction := Func(edit)
    editFunction.Call()
RETURN
