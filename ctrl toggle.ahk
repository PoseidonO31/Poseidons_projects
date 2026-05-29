#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

; --- Customization Settings ---
DotSize := 16  ; Size of the circle in pixels
X_Pos := 10    ; Distance from the left edge of the screen
Y_Pos := 10    ; Distance from the top edge of the screen
; ------------------------------

; Setup the on-screen indicator GUI
Gui, +AlwaysOnTop -Caption +ToolWindow +LastFound
Gui, Color, Red  ; Starts as Red because Ctrl is initially OFF

; Turn the square window into a perfect circle (E = Ellipse)
WinSet, Region, 0-0 W%DotSize% H%DotSize% E

; Display the circle without stealing focus from your active game/window
Gui, Show, x%X_Pos% y%Y_Pos% w%DotSize% h%DotSize% NoActivate
return


$*RCtrl::
    if GetKeyState("LCtrl") {
        Send, {LCtrl Up}
        Gui, Color, Red     ; Toggle OFF -> Red dot
    } else {
        Send, {LCtrl Down}
        Gui, Color, Green   ; Toggle ON -> Green dot
    }
    
    KeyWait, RCtrl 
return