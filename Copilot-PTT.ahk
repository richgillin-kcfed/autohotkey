; ==========================
; Copilot Push-to-Talk (INS)
; ==========================
; Rich Gillin - IT Manager Setup
; INS = Hold to talk, Release to stop
; Scoped to Copilot-capable apps | RDP-safe

#Requires AutoHotkey v2.0
SendMode("Input")
SetTitleMatchMode(2)

; --- PUSH TO TALK ---
; Scoped to Edge, Chrome, WebView2, Teams — excludes RDP (mstsc.exe)
#HotIf (WinActive("ahk_exe msedge.exe") || WinActive("ahk_exe chrome.exe") || WinActive("ahk_exe msedgewebview2.exe") || WinActive("ahk_exe ms-teams.exe")) && !WinActive("ahk_exe mstsc.exe")

Insert::
{
    ToolTip("Copilot Listening...")
    Send("{Alt down}{Space down}")
}

Insert up::
{
    Send("{Space up}{Alt up}")
    ToolTip()
}

#HotIf
