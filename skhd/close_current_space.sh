#!/bin/bash

index=$(yabai -m query --spaces --space | jq .index)

osascript -e \
  'tell application "Mission Control" to launch
delay 0.25
tell application "System Events"
	tell list 1 of group 2 of group 1 of group 1 of process "Dock"
		set countSpaces to count of buttons
		if countSpaces is greater than 1 then
			perform action "AXRemoveDesktop" of button countSpaces
		end if
	end tell
	delay 0.6
	key code 53 --  # Esc key on US English Keyboard
end tell' 
