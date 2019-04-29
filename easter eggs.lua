script_name("Easter eggs catcher")
script_author("James Hawk")

require 'lib.moonloader'
require 'lib.sampfuncs'

local active = false
KEY = VK_U -- deactivation

function main()
	if not isSampLoaded() or not isSampfuncsLoaded() then return end
    while not isSampAvailable() do wait(100) end
	sampRegisterChatCommand("ee", function() active = not active end)
    while true do
		wait(0)
		if wasKeyPressed(KEY) and not sampIsChatInputActive() and not isSampfuncsConsoleActive() then
			thisScript():pause()
		end
		if active then
			setVirtualKeyState(18)
			wait(100)
			if sampIsDialogActive(1278) then
				sampSendDialogResponse(1278, 1, 0, -1)
				wait(150)
				setVirtualKeyState(13)
			end
		end
	end
end

function setVirtualKeyState(key)
	lua_thread.create(function(key)
		setVirtualKeyDown(key, true)
		wait(150)
		setVirtualKeyDown(key, false)
	end, key)
end
