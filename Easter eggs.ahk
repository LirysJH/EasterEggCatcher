#SingleInstance force
#NoEnv
#IfWinActive GTA:SA:MP
#Include samp-udf.ahk

global state:=false

flag:
if(state)
{
	Loop
	{
		Send {LAlt Down}
		sleep 20
		Send {LAlt up}
		sleep 20
		if(isDialogOpen())
		{
			Send {Enter}
			sleep 20
			Send {Enter}	
		}  
	}
}
return

0::
{
	if(!state)
	{
		AddchatmessageEx("FFFFFF", "Включено. {0000FF}[by Hawk]")
		state:=true
		SetTimer, flag, on
	}
	else
		if(state)
		{
			AddchatmessageEx("FFFFFF", "Выключено. {0000FF}[by Hawk]")
			state:=false
			SetTimer, flag, off
		}
}
return

F2::ExitApp
