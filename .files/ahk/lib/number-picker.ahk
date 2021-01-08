pickNumber(original, max) {
    Global numberSlider
    Global number
    Global numberText
    Global submit
    Global fileText
    Global search

    Gui, Destroy
    Gui, +LastFound
    GuiHWND := WinExist()

    updateNumber := Func("UpdateNumber").Bind(original, max)
    numberKeyPressed := Func("NumberKeyPressed").Bind(original, updateNumber)
    getFinalNumber := Func("GetFinalNumber")
    name := ChangeText(original, original)

    Gui, Add, Edit, r1 vsearch w135
    Gui, Add, Slider,x100 y60 w250 vnumberSlider AltSubmit Range-1-%max%, % original
    GuiControl +g, numberSlider, % updateNumber
    Gui,Font,S24 Bold,Verdana
    Gui, Add, Text,x5 y50 w100 h50 vNumberText Center, % original
    Gui,Font,S18 Bold,Verdana
    Gui, Add, Text, w400 h250 vfileText Left, % name
    Gui, Add, Button, Default h0 w0 vsubmit,
    GuiControl +g, Submit, % getFinalNumber

    CoordMode, Mouse, Screen
    WinGetPos, x, y, , , A

    SysGet, monitor, MonitorWorkArea, 1
    Gui, Show, x%monitorLeft% y%monitorTop%, Update Current

    OnMessage(0x0100, numberKeyPressed)
    GuiControlGet, final, , numberSlider
    Gui.OnEvent("Close", NOOP)

    WinWaitClose, ahk_id %GuiHWND%
    return  GetFinalNumber()
}

GetFinalNumber() {
    GuiControlGet, final, , numberSlider
    Gui, Submit
    return final
}

NumberKeyPressed(original, updateNumber, value) {
    GuiControlGet, current, , numberSlider
    Number := (current . String) , current += 0

    if (value == 27) {
        GuiControl,, numberSlider, -1
        GetFinalNumber()
    } else if (value == 37) {
        previous := Number - 1
        GuiControl,, numberSlider, % previous
        UpdateNumberGUI(original)
    } else if (value == 39) {
        next := Number + 1
        GuiControl,, numberSlider, % next
        UpdateNumberGUI(original)
    } else if (value == 13) {
        GetFinalNumber()
    } else {
        SetTimer, % updateNumber, -100
    }
}

UpdateNumberGUI(original) {
    GuiControlGet, target, , numberSlider
    GuiControl,, numberSlider, % target
    GuiControl,, numberText, % target
    name := ChangeText(original, target)
    GuiControl,, fileText, % name
}


UpdateNumber(original, max) {
    Gui, Submit, Nohide

    GuiControlGet, searchString, , search

    selected =
    display =

    if (!searchString) {
        target := 0
        display := ChangeText(original, "No Channel")
    }

    searchType := type(searchString)
    if (type(searchString) == "Integer") {
        if (searchString > max) {
            display := ChangeText(original, max)
        } else if (searchString <= 0) {
            target := 0
            display := ChangeText(original, "No Channel")
        } else {
            target := searchString
            display := ChangeText(original, target)
        }
    } else {
        target := 0
        display := ChangeText(original, "No Channel")
    }

    GuiControl,, numberSlider, % target
    GuiControlGet, final, , numberSlider
    GuiControl,, numberText, % target
    GuiControl,, fileText, % display
}

ChangeText(original, target) {
    return % "Channel " original " -> " target
}
