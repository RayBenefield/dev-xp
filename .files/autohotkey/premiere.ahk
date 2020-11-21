#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance force
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#Include %A_ScriptDir%/Lib/Gdip_All.ahk
#Include %A_ScriptDir%/Lib/fuzzy.ahk
#Include %A_ScriptDir%/Lib/premiere-actions.ahk

GLOBAL edits := [
(JOIN
    "Zoom",
    "Intro"
)]

_fixedInsert(edit, track) {
    _focusTimeline()
    Sleep, 200
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
    _overlay()
    Sleep, 200
    _focusTimeline()
    Sleep, 200
    _trackVideo(track)
    Sleep, 200
    _goBack()
    Sleep, 200
    _trackVideo(track)
    Sleep, 200
    _source(1)
}

_variableInsert(edit, track) {
    _focusTimeline()
    Sleep, 200
    _makeMarker(1)
    Sleep, 200
    _goBackMarker()
    Sleep, 200
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
    _overlay()
    Sleep, 200
    _focusTimeline()
    Sleep, 200
    _trackVideo(track)
    Sleep, 200
    _extendSegment()
    Sleep, 200
    _deleteMarker()
    Sleep, 200
    _goBackMarker()
    Sleep, 200
    _deleteMarker()
    Sleep, 200
    _trackVideo(track)
    Sleep, 200
    _source(1)
}

Zoom() {
    _variableInsert("zoom", 6)
}

Intro() {
    MSGBOX, intro
}

+F20::
    editNumber := fuzzy(edits, 1)
    edit := edits[editNumber]
    editFunction := Func(edit)
    editFunction.Call()
RETURN
