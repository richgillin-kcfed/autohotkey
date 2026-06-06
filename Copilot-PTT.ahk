; ==========================
; Copilot Push-to-Talk (INS)
; ==========================
; Rich Gillin - IT Manager Setup
; INS = Hold to talk, Release to stop
; Scoped to Copilot-capable apps

#NoEnv
SendMode Input
SetTitleMatchMode, 2

; --- TARGET APPS ---
#If WinActive("ahk_exe msedge.exe")
    || WinActive("ahk_exe chrome.exe")
    || WinActive("ahk_exe msedgewebview2.exe")
    || WinActive("ahk_exe ms-teams.exe")

; --- PUSH TO TALK ---
Insert::
Send {Alt down}{Space down}
return

Insert up::
Send {Space up}{Alt up}
return

#If
Insert::
Tooltip, 🎤 Copilot Listening...
Send {Alt down}{Space down}
return

Insert up::
Send {Space up}{Alt up}
Tooltip
return
