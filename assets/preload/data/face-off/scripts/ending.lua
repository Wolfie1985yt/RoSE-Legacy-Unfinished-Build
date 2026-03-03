function onStepHit()
	if curStep == 3 then
		setPropertyFromClass('backend.ClientPrefs', 'vineboom', false)
	end
end
function onDestroy()
	setPropertyFromClass('backend.ClientPrefs', 'vineboom', false)
end