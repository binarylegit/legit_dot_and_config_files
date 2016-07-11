#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
; SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
; ^!t::Send #{tab}

; Edit Logitech Setpoint to assign a button press to Ctrl+Shift+F6
; If necessary Manually change Logitech Setpoint file in: C:\Users\<username>\AppData\Roaming\Logitech\SetPoint\user.xml
;  <Param DisplayName="Shift+Ctrl+F6" LParam="4194305" Modifier="3" VirtualKey="117"/>

; Place compiled autohotkey script in: C:\Users\<username>\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
; Or type Win+r and type: shell:startup
^+F6::Send #{tab}
