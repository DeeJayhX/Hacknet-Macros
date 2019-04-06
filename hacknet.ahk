SetKeyDelay, 15, 25

^s::
if WinActive("ahk_exe Hacknet.exe")
{
	Send shell
	Send {enter}
	Send cd log
	Send {enter}
	Send rm *
	Send {enter}

	Searching := True

		while Searching
		{
			CoordMode Pixel  ; Interprets coordinates relative to screen rather than active window
			ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, empty.bmp
			if ErrorLevel = 2
			{
				MsgBox Could not conduct the search.
				Seaching := False
			}
			else if ErrorLevel = 1
			{
				; TrayTip Waiting, Waiting for Log folder to empty., ,1
				Sleep 2500
			}
			else
			{
				Send disconnect
				Send {enter}
				Searching := False
			}
		}
}
return
