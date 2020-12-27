#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance force
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#Include %A_ScriptDir%/lib/fuzzy.ahk
#Include %A_ScriptDir%/lib/premiere-actions.ahk

_duplicate() {
    Send, ^j
}

_convertToCurves() {
    Send, ^[
}

_group() {
    Send, ^g
}

_ungroup() {
    Send, ^+g
}

_expandStroke() {
    Send, ^]
}

_addCurves() {
    Send, ^\
}

_nodeTool() {
    Send, a
}

_moveToBottom() {
    Send, ^+[
}

#IfWinActive ahk_exe Designer.exe

    ; SHIFT|LPEDAL Add Edit with Fuzzy Search
    $F20::
        _duplicate()
        _convertToCurves()
        _ungroup()
        _addCurves()
        _expandStroke()
    RETURN

    ; LPEDAL Ripple Trim Previous Edit to Playhead
    $+F20::
        _addCurves()
        _moveToBottom()
        _nodeTool()
    RETURN

    ; ALT|LPEDAL Ripple Trim Next Edit to Playhead
    $!F20::_rippleTrimNext()

    ; RPEDAL Add Edit
    $F22::_addEdit()

    ; SHIFT|RPEDAL Mute Segment
    $+F22::Send, {UP}dg-99{ENTER}{ESC}{DOWN}

#IfWinActive
