#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance force
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#Hotstring o
#Hotstring EndChars {#}

::core?::site:https://development.docs.coregames.com{SPACE}
::api::https://development.docs.coregames.com/core_api/
