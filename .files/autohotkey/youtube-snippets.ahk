#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance force
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#Include %A_ScriptDir%/Lib/Gdip_All.ahk

#Hotstring o
#Hotstring EndChars {#}

global filenames := [
(Join
    "1-monetize-gaming",
    "2-goals-and-hopes",
    "3-pot-of-luck",
    "4-discipline-over-motivation",
    "5-mental-agility",
    "6-idea-list",
    "7-quantity-over-quality",
    "8-innovation",
    "9-apply-theories",
    "10-momentum",
    "11-consistency",
    "12-buffering",
    "13-breaking-point",
    "14-early-advertising",
    "15-paths-of-success",
    "16-first-mover-advantage",
    "17-be-a-champion",
    "18-word-of-mouth",
    "19-invisibility",
    "20-the-meta",
    "21-proper-networking",
    "22-social-leveling",
    "23-user-investment",
    "24-nurture",
    "25-criticism",
    "26-playtesting",
    "27-correct-solutions",
    "28-game-design",
    "29-ultimate-secret",
    "30-peak-learning",
    "31-monetization",
    "32-channel-plans",
    "33-reaching-dreams",
    "34-burnout",
    "35-minotaur-core-prototype",
    "36-core-challenge-board",
    "37-just-do-it",
    "38-greatest-enemy",
    "39-trial-by-fire",
    "40-day-0-minotaur",
    "41-day-1-minotaur",
    "42-day-2-minotaur",
    "43-day-3-minotaur",
    "44-day-4-minotaur",
    "45-day-5-minotaur",
    "46-day-6-minotaur",
    "47-day-7-minotaur",
    "48-day-x-minotaur",
    "49-day-minotaur-future"
)]

ids := [
(Join
    "AzmMhK7Juz0",
    "QBVXJq4Vuks",
    "gczUrf0aYpc",
    "KPPo4AEmXvw",
    "43yaKT53-Sg",
    "p7S7r6oQ-6s",
    "DMZJr4Tn86E",
    "4Dx3KyvKc6o",
    "6_rsFUreX-I",
    "6OubzLa5Hgw",
    "tSq5CO6NsM8",
    "vUquQIe5vYw",
    "DFUnzP-I1ek",
    "zMkXfWvz0E0",
    "AybyWFF_avM",
    "XjEni0f8EdA",
    "KeqMfRIR7HU",
    "xT4sTHFvOFU",
    "ece1R1wy46E",
    "Zl1RHnQNSDQ",
    "bEad9ZnNrtE",
    "-Nwsmh6noc4",
    "ZQwGe9tI2oU",
    "G-l00fidzYA",
    "aOOqq9XMlho",
    "azvgx2muA6U",
    "-LwVNx8tR0g",
    "ZAHZDkqUc74",
    "Nu4IsMn-KSc",
    "jtPj-x74aZU",
    "Pu5fVXBJu1U",
    "R2r4CCsEsKI",
    "c5TbQGnsvqo",
    "esvo2s6xnz8",
    "TvO_UdRU4zM",
    "zxHcDaFLxMQ",
    "2fsDeH0t0rY",
    "alDPIG4Evh4",
    "POu0Ei2CvpU",
    "nrm8O_4rJGI",
    "L4cBAQLrboI"
)]

global max := 49
global latest := 41
global current := latest
global total := 0

filename := filenames[current]
id := ids[current]

::fin::C:\Users\RayBenefield\Videos\finals\
::vids::C:\Users\RayBenefield\Videos\
::music::C:\Users\RayBenefield\Music\
::comment::{ENTER}{ENTER}📽️ Live EVERYDAY - 4pm Pacific | 7pm Eastern | 12 Midnight GMT{ENTER} ►  Twitch - https://twitch.tv/RayBenefield{ENTER}{ENTER} 🌟 New entry - 12 Noon Pacific | 3pm Eastern | 7pm GMT
::pinball::Pinball Sumo: 0575-1189-8800
::reflection::Reflection: 1798-0511-1961
::minotaur::Minotaur Maze: 1676-6495-8269
::risk::Risk: 0345-2250-3171
::forever::Forever Fights: 7987-4279-7746
+F17::
    current := latest
    file := filenames[current]
    MsgBox, %file%
RETURN
F17::setNumber()

::file::
    filename := filenames[current]
    SENDINPUT, %filename%
RETURN
::filename::
    filename := filenames[current]
    SENDINPUT, %filename%
RETURN
::folder::
    filename := filenames[current]
    SENDINPUT, C:\Users\RayBenefield\Videos\finals\%filename%
RETURN
::img::
    filename := filenames[current]
    SENDINPUT, C:\Users\RayBenefield\Videos\finals\%filename%\%filename%.png
RETURN
::png::
    filename := filenames[current]
    SENDINPUT, C:\Users\RayBenefield\Videos\finals\%filename%\%filename%.png
RETURN
::mp4::
    filename := filenames[current]
    SENDINPUT, C:\Users\RayBenefield\Videos\finals\%filename%\%filename%.mp4
RETURN
::vid::
    filename := filenames[current]
    SENDINPUT, C:\Users\RayBenefield\Videos\finals\%filename%\%filename%.mp4
RETURN
::mkv::
    filename := filenames[current]
    SENDINPUT, C:\Users\RayBenefield\Videos\%filename%.mkv
RETURN
::record::
    filename := filenames[current]
    SENDINPUT, C:\Users\RayBenefield\Videos\%filename%.mp4
RETURN
::ico::
    filename := filenames[current]
    SENDINPUT, C:\Users\RayBenefield\Videos\finals\%filename%\%filename%.ico
RETURN
::rec::
    id := ids[current]
    SENDINPUT, https://www.youtube.com/watch?v=%id%&list=PLKkxR5bGeI37PHoQKbWMZqWJlwhH2u-st
RETURN
::link::
    id := ids[current]
    SENDINPUT, https://www.youtube.com/watch?v=%id%&list=PLKkxR5bGeI34v1lh7pHzkaRPeQPjxDaON
RETURN
::list::
    id := ids[current]
    SENDINPUT, https://www.youtube.com/watch?v=%id%&list=PLKkxR5bGeI34v1lh7pHzkaRPeQPjxDaON
RETURN

numberSlider=
number=
numberText=
submit=
fileText=
setNumber() {
    Gui, Destroy
    updateNumber := Func("UpdateNumber")
    numberPressed := Func("NumberPressed")
    updateCurrent := Func("UpdateCurrent")
    name := filenames[latest]

    Gui, Add, Slider,x60 y30 w250 vnumberSlider AltSubmit Range1-%max%, % latest
    GuiControl +g, numberSlider, % updateNumber
    Gui,Font,S24 Bold,Verdana
    Gui, Add, Text,x5 y20 w50 h50 vNumberText Center, % latest
    Gui,Font,S18 Bold,Verdana
    Gui, Add, Text, w310 h50 vfileText Center, % name
    Gui, Add, Button, Default h0 w0 vsubmit,
    GuiControl +g, Submit, % updateCurrent

    CoordMode, Mouse, Screen
    WinGetPos, x, y, , , A

    Gui, Show, x%x% y%y%, Update Current

    OnMessage(0x0100, numberPressed)
    Gui.OnEvent("Close", updateCurrent)

    return
}

UpdateCurrent() {
    Gui, Submit
    GuiControlGet, number, , numberSlider
    current := number
}

UpdateNumber() {
    Gui, Submit, Nohide
    GuiControlGet, number, , numberSlider

    name := filenames[number]
    GuiControl,, numberText, % number
    GuiControl,, fileText, % name
}

NumberPressed(wParam, lParam, Msg,HWND) {
    sc := Format("{:X}", (lParam >> 16) & 0x1FF)
    key := GetKeyName("sc" . sc)
    numbers := [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

    if (ArrayContains(numbers, key)) {
        if (total = 0) {
            total := key
        } else {
            total := total*10 + key
        }

        GuiControl, , numberSlider, % total
        UpdateNumber()
        resetTotal := Func("ResetTotal")
        SetTimer, %resetTotal%, -1000
    }
}

ResetTotal() {
    total := 0
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

~Capslock::
    Gui, Hide
return 

F8::ImgToClipboard("C:\Users\RayBenefield\Videos\finals\19-invisibility\19-invisibility.png")

ImgToClipboard(imagepath){
    pToken := Gdip_Startup()
    Gdip_SetBitmapToClipboard(pBitmap := Gdip_CreateBitmapFromFile(imagepath))
    Gdip_DisposeImage(pBitmap)
    Gdip_Shutdown(pToken)
}
