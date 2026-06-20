; ==========================================
; Universal AI Push-to-Talk (INS key)
; ==========================================
; Rich Gillin - IT Manager Setup
; Hold INS to talk | Release to stop
; Covers: Copilot, ChatGPT, Claude, Gemini, Perplexity, Teams
; RDP-safe | AHK v2

#Requires AutoHotkey v2.0
SendMode("Input")
SetTitleMatchMode(2)

; ---------------------------------------------------------------------------
; Voice shortcut map by AI platform
;   Copilot (Edge/browser/Teams) : Alt+Space  ✅ confirmed
;   ChatGPT desktop app          : Alt+Space  ✅ confirmed
;   ChatGPT web                  : Alt+Space  ✅ confirmed
;   Claude (web/app)             : no native shortcut — mic button only ⚠️
;   Gemini                       : no native shortcut — mic button only ⚠️
;   Perplexity                   : no native shortcut — mic button only ⚠️
;
; For platforms marked ⚠️: click their mic button once to focus it,
; then INS hold/release will activate/deactivate voice normally.
; ---------------------------------------------------------------------------

; --- Detect which AI assistant is in the foreground ---
GetActiveAI() {
    title := WinGetTitle("A")
    for ai in ["Copilot", "ChatGPT", "Claude", "Gemini", "Perplexity", "Bing Chat"]
        if InStr(title, ai)
            return ai
    if WinActive("ahk_exe ms-teams.exe")
        return "Teams Copilot"
    return "AI Assistant"
}

; --- Scope guard: browsers + AI desktop apps, never RDP ---
IsAIContext() {
    if WinActive("ahk_exe mstsc.exe")
        return false
    for exe in ["msedge.exe", "chrome.exe", "firefox.exe", "msedgewebview2.exe",
                "ms-teams.exe", "ChatGPT.exe", "claude.exe"] {
        if WinActive("ahk_exe " exe)
            return true
    }
    return false
}

; ---------------------------------------------------------------------------
#HotIf IsAIContext()

Insert::
{
    ToolTip("  " GetActiveAI() " — Listening...")
    Send("{Alt down}{Space down}")
}

Insert up::
{
    Send("{Space up}{Alt up}")
    ToolTip()
}

#HotIf
