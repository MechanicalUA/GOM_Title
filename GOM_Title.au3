;tools libraries
#include <GUIConstantsEx.au3>
#include <GUIConstants.au3>
#include <MsgBoxConstants.au3>
#include <AutoItConstants.au3>
;its colors in HEX system for our user interface
Global $c_uiBackground = 0xFFFFFF , $c_uiTitle = 0x808080 , $c_Line = 0x881858
;dimensions of interface
Global $ui_width = 220
Global $ui_height = 266
;names of Titles
Global $t1 = "3D-Scan-Daten"
Global $t2 = "Reverse-Engineering"
Global $t3 = "Technische Zeichnung"
Global $t4 = "Abweichungsanalyse"
Global $t5 = "Überlagerung von 3D-Scan und Reverse-Engineering"
;keyboard combination Ctrl+Shift+A who run PasteTitle function
HotKeySet("^+a", "PasteTitle")
;keyboard combination Ctrl+Shift+E who run Close function
HotKeySet("^+e", "Close")
;tracking of the Mouse position
While 1
Sleep(100)
Global $aMsPOS = MouseGetPos()
WEnd
;Ctrl+Shift+A - run PasteTitle function
Func PasteTitle()
;if the position of UI comes out of the resolution of the screen we set up a new true position
Local $iPOSyUI = $aMsPOS[1]
If $aMsPOS[1] + $ui_height >= @DesktopHeight Then
   $iPOSyUI = @DesktopHeight-$ui_height-40
EndIf
;setup work area triggering to show UI
If $aMsPOS[0] <= 380 Then
;creating UI
$ui = GUICreate("", $ui_width, $ui_height, $aMsPOS[0]+15 , $iPOSyUI, $WS_POPUP, $WS_EX_CONTROLPARENT)
GUISetBkColor($c_uiBackground, $ui)
;top line
        $line = GUICtrlCreateLabel("", 0, 0, $ui_width, 4, Default, $GUI_WS_EX_PARENTDRAG)
                GUICtrlSetBkColor(-1, $c_Line)
;text label 3D-Scan-Daten
Global $text1 = GUICtrlCreateLabel($t1, 10, 15, 200, 32, $SS_CENTER, $GUI_WS_EX_PARENTDRAG)
                GUICtrlSetColor(-1, $c_uiTitle)
                GUICtrlSetFont(-1, 14, 700, Default, "Segoe UI", 5)
;text label Reverse-Engineering
Global $text2 = GUICtrlCreateLabel($t2, 10, 55, 200, 32, $SS_CENTER, $GUI_WS_EX_PARENTDRAG)
                GUICtrlSetColor(-1, $c_uiTitle)
			    GUICtrlSetFont(-1, 14, 700, Default, "Segoe UI", 5)
;text label Technische Zeichnung
Global $text3 = GUICtrlCreateLabel($t3, 10, 95, 200, 32, $SS_CENTER, $GUI_WS_EX_PARENTDRAG)
                GUICtrlSetColor(-1, $c_uiTitle)
                GUICtrlSetFont(-1, 14, 700, Default, "Segoe UI", 5)
;text label Abweichungsanalyse
Global $text4 = GUICtrlCreateLabel($t4, 10, 135, 200, 32, $SS_CENTER, $GUI_WS_EX_PARENTDRAG)
                GUICtrlSetColor(-1, $c_uiTitle)
                GUICtrlSetFont(-1, 14, 700, Default, "Segoe UI", 5)
;text label Überlagerung von 3D-Scan und Reverse-Engineering
Global $text5 = GUICtrlCreateLabel($t5, 10, 175, 200, 80, $SS_CENTER, $GUI_WS_EX_PARENTDRAG)
                GUICtrlSetColor(-1, $c_uiTitle)
                GUICtrlSetFont(-1, 13, 700, Default, "Segoe UI", 5)
;bottom line
        $line = GUICtrlCreateLabel("", 0, $ui_height-4, $ui_width, 4, Default, $GUI_WS_EX_PARENTDRAG)
                GUICtrlSetBkColor(-1, $c_Line)
    ; Display the UI.
    GUISetState(@SW_SHOW, $ui)
;Creating timer to close UI
Local $hTimer = TimerInit()
;tracking events if we click on text labels
While 1
   ;run animation of text labels
   LabelColorAnimation() ;you can delete this function if needed
   ;return absolute coordinate system (see LabelColorAnimation function)
   Opt("MouseCoordMode", 1)
   ;run tracking
	$msg = GUIGetMsg()
	Switch $msg
;when you click on text 1, we execute the chain of events
		 Case $text1
			MouseClick($MOUSE_CLICK_LEFT,$aMsPOS[0], $aMsPOS[1], 2, 0)
			Sleep(15)
			Send("{F2}")
			Sleep(100)
			Send("{DEL}")
			Sleep(50)
			ClipPut($t1)
			Send("^v")
			Sleep(15)
			Send("{ENTER}")
			GUIDelete($ui)
			ExitLoop
;when you click on text 2, we execute the chain of events
		 Case $text2
			MouseClick($MOUSE_CLICK_LEFT,$aMsPOS[0], $aMsPOS[1], 2, 0)
			Sleep(15)
			Send("{F2}")
			Sleep(100)
			Send("{DEL}")
			Sleep(50)
			ClipPut($t2)
			Send("^v")
			Sleep(15)
			Send("{ENTER}")
			GUIDelete($ui)
			ExitLoop
;when you click on text 3, we execute the chain of events
		 Case $text3
			MouseClick($MOUSE_CLICK_LEFT,$aMsPOS[0], $aMsPOS[1], 2, 0)
			Sleep(15)
			Send("{F2}")
			Sleep(100)
			Send("{DEL}")
			Sleep(50)
			ClipPut($t3)
			Send("^v")
			Sleep(15)
			Send("{ENTER}")
			GUIDelete($ui)
			ExitLoop
;when you click on text 4, we execute the chain of events
		 Case $text4
			MouseClick($MOUSE_CLICK_LEFT,$aMsPOS[0], $aMsPOS[1], 2, 0)
			Sleep(15)
			Send("{F2}")
			Sleep(100)
			Send("{DEL}")
			Sleep(50)
			ClipPut($t4)
			Send("^v")
			Sleep(15)
			Send("{ENTER}")
			GUIDelete($ui)
			ExitLoop
;when you click on text 5, we execute the chain of events
		 Case $text5
			MouseClick($MOUSE_CLICK_LEFT,$aMsPOS[0], $aMsPOS[1], 2, 0)
			Sleep(15)
			Send("{F2}")
			Sleep(100)
			Send("{DEL}")
			Sleep(50)
			ClipPut($t5)
			Send("^v")
			Sleep(15)
			Send("{ENTER}")
			GUIDelete($ui)
			ExitLoop
		 EndSwitch
;tracking timer to close UI
Local $fDiff = TimerDiff($hTimer)
If $fDiff > 3000 Then ; about 3 sec
   GUIDelete($ui)
   ExitLoop
   EndIf
WEnd

EndIf

 EndFunc

 Func LabelColorAnimation()
	;change screen coordinate system to UI window coordinate system
	 Opt("MouseCoordMode", 0)
	 ;tracking of the Mouse position
       Local $aPos = MouseGetPos()
       Sleep(30)
     ;comparing the positions of the Mous with the position of the text Label, changing the color
	  If      $aPos[1] > 15 And $aPos[1] < 40 And $aPos[0] > 10 And $aPos[0] < $ui_width - 20 Then
		 GUICtrlSetColor($text1, $c_Line)
	  ElseIf  $aPos[1] > 55 And $aPos[1] < 80 And $aPos[0] > 10 And $aPos[0] < $ui_width - 20 Then
		 GUICtrlSetColor($text2, $c_Line)
	  ElseIf  $aPos[1] > 95 And $aPos[1] < 120 And $aPos[0] > 10 And $aPos[0] < $ui_width - 20 Then
		 GUICtrlSetColor($text3, $c_Line)
	  ElseIf  $aPos[1] > 135 And $aPos[1] < 160 And $aPos[0] > 10 And $aPos[0] < $ui_width - 20 Then
		 GUICtrlSetColor($text4, $c_Line)
	  ElseIf  $aPos[1] > 175 And $aPos[1] < 235 And $aPos[0] > 10 And $aPos[0] < $ui_width - 20 Then
		 GUICtrlSetColor($text5, $c_Line)
	  Else
		 Sleep(40)
		 GUICtrlSetColor($text1, $c_uiTitle)
		 GUICtrlSetColor($text2, $c_uiTitle)
		 GUICtrlSetColor($text3, $c_uiTitle)
		 GUICtrlSetColor($text4, $c_uiTitle)
		 GUICtrlSetColor($text5, $c_uiTitle)
	  EndIf
   EndFunc
;close script function
 Func Close()
	Exit
	EndFunc