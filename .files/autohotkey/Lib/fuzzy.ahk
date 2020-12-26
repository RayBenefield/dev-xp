#Include %A_ScriptDir%/Lib/sift.ahk

fuzzy(values, default) {
    Global numberSlider
    Global number
    Global numberText
    Global submit
    Global fileText
    Global search

    Gui, Destroy
    Gui, +LastFound
    GuiHWND := WinExist()

    updateValue := Func("UpdateValue").Bind(values)
    keyPressed := Func("KeyPressed").Bind(updateValue)
    getFinalValue := Func("GetFinalValue")
    name := values[default]
    max := values.MaxIndex()

    Gui, Add, Edit, r1 vsearch w135
    Gui, Add, Slider,x60 y60 w250 vnumberSlider AltSubmit Range1-%max%, % default
    GuiControl +g, numberSlider, % updateValue
    Gui,Font,S24 Bold,Verdana
    Gui, Add, Text,x5 y50 w50 h50 vNumberText Center, % default
    Gui,Font,S18 Bold,Verdana
    Gui, Add, Text, w400 h250 vfileText Left, % name
    Gui, Add, Button, Default h0 w0 vsubmit,
    GuiControl +g, Submit, % getFinalValue

    CoordMode, Mouse, Screen
    WinGetPos, x, y, , , A

    Gui, Show, x%x% y%y%, Update Current

    OnMessage(0x0100, keyPressed)
    GuiControlGet, final, , numberSlider
    Gui.OnEvent("Close", NOOP)

    WinWaitClose, ahk_id %GuiHWND%

    GuiControlGet, final, , numberSlider

    return  GetFinalValue()
}

NOOP() {
}

GetFinalValue() {
    GuiControlGet, final, , numberSlider
    Gui, Submit
    return final
}

KeyPressed(updateValue) {
    SetTimer, % updateValue, -100
}

UpdateValue(values) {
    Gui, Submit, Nohide

    GuiControlGet, searchString, , search

    if (!searchString) {
        return
    }

    selected =
    display =
    if (searchString is integer) {
        if (searchString > values.MaxIndex()) {
            return
        }

        selected := searchString
        display := values[selected]
    } else {
        results := Sift_Ngram(values, searchString,,,,S)
        if (!results.MaxIndex()) {
            return
        }

        display := ""
        for index, value in results {
            if (!selected) {
                selected := index
            }
            display .= value.data "`n"
        }
    }

    name := values[selected]
    GuiControl,, numberSlider, % selected
    GuiControlGet, final, , numberSlider
    GuiControl,, numberText, % selected
    GuiControl,, fileText, % display
}
