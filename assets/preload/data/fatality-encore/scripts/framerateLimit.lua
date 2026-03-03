local preferredFrames = 0
function onCreate()
	preferredFrames = getPropertyFromClass('backend.ClientPrefs', 'framerate')
end
function onCreatePost()
	if preferredFrames > 60 then
		setPropertyFromClass('flixel.FlxG', 'updateFramerate', 60)
		setPropertyFromClass('flixel.FlxG', 'drawFramerate', 60)
	end
end
function onDestroy()
    setPropertyFromClass('flixel.FlxG', 'updateFramerate', preferredFrames)
    setPropertyFromClass('flixel.FlxG', 'drawFramerate', preferredFrames)
end