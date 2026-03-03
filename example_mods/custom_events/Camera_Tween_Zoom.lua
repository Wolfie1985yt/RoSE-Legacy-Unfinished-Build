function Split(s, delimiter)
    result = {};
    for match in (s..delimiter):gmatch('(.-)'..delimiter) do
        table.insert(result, match);
    end
    return result;
end

function onEvent(name, value1, value2)
	if name == 'Camera_Tween_Zoom' then
        setPropertyFromClass('states.PlayState', 'camGameZooms', false)
        tarAndDir = Split(tostring(value1), ', ');
		doTweenZoom('ZoomEvent', 'camGame', tonumber(tarAndDir[1]), tonumber(tarAndDir[2]), tostring(value2));
		setProperty('defaultCamZoom', tonumber(tarAndDir[1]));
        runTimer('allowZooms', tonumber(tarAndDir[2]));
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'allowZooms' then
        setPropertyFromClass('states.PlayState', 'camGameZooms', true);
    end
end