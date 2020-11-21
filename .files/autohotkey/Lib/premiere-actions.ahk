_focusTimeline() {
    Send, +t
}

_focusProject() {
    Send, +1
}

_clearSelected() {
    Send, ^+a
}

_focusFind() {
    _clearSelected()
    Sleep, 200
    Send, +f
}

_toggleVideoTracking() {
    Send, ^!0
}

_trackVideo(track) {
    Send, ^!%track%
}

_toggleSource() {
    Send, ^+-
}

_source(track) {
    Send, ^+%track%
}

_onlyTrack(track) {
    _toggleVideoTracking()
    Sleep, 200
    _trackVideo(track)
}

_type(text) {
    Send, %text%
}

_highlightFirstSegment() {
    Send, {TAB}{TAB}{DOWN}
}

_inject() {
    Send, ,
}

_overlay() {
    Send, .
}

_goBack() {
    Send, {UP}
}

_goForward() {
    Send, {DOWN}
}

_goBackMarker() {
    Send, ^{UP}
}

_goForwardMarker() {
    Send, ^{DOWN}
}

_deleteMarker() {
    Send, ^{BACKSPACE}
}

_makeMarker(type) {
    Send, !%type%
}

_extend() {
    Send, e
}

_trimOut() {
    Send, ^!\
}

_extendSegment() {
    _trimOut()
    Sleep, 200
    _goForwardMarker()
    Sleep, 200
    _extend()
    Sleep, 200
    _clearSelected()
}
