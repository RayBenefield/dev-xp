#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance force
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#Include %A_ScriptDir%/Lib/explorer.ahk

#Hotstring o x
#Hotstring EndChars {#}

::<3::pasteEmoji("💖")
::fist::pasteEmoji("🤜🤛", 1)

emojiSlider=
emojiCount=
finalEmojis=
submit=
pasteEmoji(emoji, defaultValue:=3) {
    Gui, Destroy
    updateCount := Func("UpdateCount").bind(emoji)
    numberPressed := Func("NumberPressed").bind(emoji)
    inputEmojis := Func("InputEmojis").bind(emoji)

    Gui, Add, Slider,x60 y30 w250 vemojiSlider AltSubmit Range1-10, % defaultValue
    GuiControl +g, emojiSlider, % updateCount
    Gui,Font,S24 Bold,Verdana
    Gui, Add, Text,x5 y20 w50 h50 vemojiCount Center, % defaultValue
    Gui,Font,S18 Bold,Verdana
    Gui, Add, Text, w310 h50 vfinalEmojis Center, % final
    Gui, Add, Button, Default h0 w0 vsubmit,
    GuiControl +g, Submit, % inputEmojis

    CoordMode, Mouse, Screen
    MouseGetPos, x, y

    Gui, Show, x%x% y%y%, Insert %emoji%

    OnMessage(0x0100, numberPressed)
    Gui.OnEvent("Close", inputEmojis)

    UpdateCount(emoji)

    return
}

InputEmojis(emoji) {
    Gui, Submit
    GuiControlGet, count, , emojiSlider
    final := MakeEmojiString(emoji, count)
    Send, % final
}

UpdateCount(emoji) {
    Gui, Submit, Nohide
    UpdateEmojiMenu(emoji)
}

UpdateEmojiMenu(emoji) {
    GuiControlGet, count, , emojiSlider
    final := MakeEmojiString(emoji, count)
    GuiControl,, emojiCount, % count
    GuiControl,, finalEmojis, % final
}

MakeEmojiString(emoji, count) {
    final=
    Loop, %count% {
        final=%emoji%%final%
    }
    return final
}

NumberPressed(emoji, wParam, lParam, Msg,HWND) {
    sc := Format("{:X}", (lParam >> 16) & 0x1FF)
    key := GetKeyName("sc" . sc)
    numbers := [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

    if (ArrayContains(numbers, key)) {
        if (key = 0)
            key := 10

        GuiControl, , emojiSlider, % key
        UpdateEmojiMenu(emoji)
    }
}

; https://www.autohotkey.com/boards/viewtopic.php?p=109173#p109173
ArrayContains(haystack, needle)
{
    if !(IsObject(haystack)) || (haystack.Length() = 0)
        return 0
    for index, value in haystack
        if (value = needle)
            return index
    return 0
}
