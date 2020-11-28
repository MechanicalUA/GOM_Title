
Global $sProgramGOM = "gom_inspect.exe"
Global $sScriptGOM_Title = "D:\Inspiration\Youtube Channel\GOM Scripts\GOM_Title.exe"
Global $iPID_GOM_Title = 0

While 1
    If ProcessExists($sProgramGOM) Then
	     Sleep(10000)
        _ActionGOM_Title()

        While ProcessExists($sProgramGOM)
            Sleep(1000)
		 WEnd
	  Else
		 ProcessClose($iPID_GOM_Title)
    EndIf

    Sleep(1000)
WEnd

Func _ActionGOM_Title()
    $iPID_GOM_Title = Run($sScriptGOM_Title)
EndFunc