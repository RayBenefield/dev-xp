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
    Gui.OnEvent("Close", GetFinalValue)

    WinWaitClose, ahk_id %GuiHWND%

    return GetFinalValue()
}

GetFinalValue() {
    Gui, Submit
    GuiControlGet, number, , numberSlider
    return number
}

KeyPressed(updateValue) {
    SetTimer, % updateValue, -100
}

UpdateValue(values) {
    Gui, Submit, Nohide

    GuiControlGet, searchString, , search

    number =
    display =
    if (IsNumber(searchString))
    {
        number := searchString
        display := values[number]
    } else {
        results := Sift_Ngram(values, searchString,,,,S)

        display := ""
        for index, value in results {
            if (!number) {
                number := index
            }
            display .= value.data "`n"
        }
    }

    name := values[number]
    GuiControl,, numberSlider, % number
    GuiControl,, numberText, % number
    GuiControl,, fileText, % display
}
