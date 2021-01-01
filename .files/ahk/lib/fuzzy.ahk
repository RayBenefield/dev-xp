#Include %A_ScriptDir%/lib/sift.ahk

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
    keyPressed := Func("KeyPressed").Bind(values, updateValue)
    getFinalValue := Func("GetFinalValue")
    name := values[default]
    max := values.MaxIndex()

    Gui, Add, Edit, r1 vsearch w135
    Gui, Add, Slider,x60 y60 w250 vnumberSlider AltSubmit Range0-%max%, % default
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
    return  GetFinalValue()
}

NOOP() {
}

GetFinalValue() {
    GuiControlGet, final, , numberSlider
    Gui, Submit
    return final
}

KeyPressed(values, updateValue, value) {
    GuiControlGet, current, , numberSlider
    Number := (current . String) , current += 0

    if (value == 27) {
        GuiControl,, numberSlider, 0
        GetFinalValue()
    } else if (value == 37) {
        previous := Number - 1
        GuiControl,, numberSlider, % previous
        UpdateGUI(values)
    } else if (value == 39) {
        next := Number + 1
        GuiControl,, numberSlider, % next
        UpdateGUI(values)
    } else if (value == 13) {
        GetFinalValue()
    } else {
        SetTimer, % updateValue, -100
    }
}

UpdateGUI(values) {
    GuiControlGet, selected, , numberSlider
    name := values[selected]
    GuiControl,, numberSlider, % selected
    GuiControl,, numberText, % selected
    GuiControl,, fileText, % name
}

type(v) {
    if IsObject(v)
        return "Object"
    return v="" || [v].GetCapacity(1) ? "String" : InStr(v,".") ? "Float" : "Integer"
}

UpdateValue(values) {
    Gui, Submit, Nohide

    GuiControlGet, searchString, , search

    if (!searchString) {
        return
    }

    selected =
    display =
    searchType := type(searchString)
    if (type(searchString) == "Integer") {
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
