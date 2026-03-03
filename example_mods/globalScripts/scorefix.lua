function onUpdate(elapsed)
	if songName == "fight-or-flight" or songName == "expulsion" or songName == "playful" then
		if curStep == 0 then
			setProperty('scoreTxt.y', 695);
			setProperty('timeBarBGBG.y', 670);
			setProperty('timeBar.y', 670);
			setProperty('timeBarBG.y', 670);
			setProperty('timeTxt.y', 657);
		end
	else
		if getPropertyFromClass('states.PlayState', 'isFixedAspectRatio') == false and getPropertyFromClass('states.PlayState', 'devoidUI') == false and getPropertyFromClass('states.PlayState', 'xenoEncUI') == false and getPropertyFromClass('states.PlayState', 'xenoEncFix') == false then
			if curStep == 0 then
				if getPropertyFromClass('backend.ClientPrefs', 'downScroll') == false then
					setProperty('scoreTxt.y', 695);
				else
					setProperty('scoreTxt.y', 8);
				end
			end
		end
	end
end