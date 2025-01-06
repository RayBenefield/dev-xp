#NoTrayIcon ; disable the momentary tray icon flickering

Process, Exist, %1%
if (ErrorLevel = 0)
{
    Run, %2%
}
else
{
    WinActivate ahk_exe %1%
}