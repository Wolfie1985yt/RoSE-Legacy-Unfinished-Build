function onCreate()
    precacheImage('pixelUI/chaotix');
    precacheImage('pixelUI/chaotixENDS');
end
function onUpdate()
    if curStep <= 30 then
        for i = 0, getProperty('playerStrums.length')-1 do
            setPropertyFromGroup('playerStrums', i, 'texture', 'chaotix');
        end
    end
end
function onUpdatePost()
    if curStep <= 30 then
        for strumLineNotes = 0,7 do
            if strumLineNotes < 4 then
                setPropertyFromGroup('strumLineNotes', strumLineNotes,'texture','chaotix')
            end
        end
    end
end
function onSongStart()
    for i = 0, getProperty('unspawnNotes.length')-1 do
        if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
            setPropertyFromGroup('unspawnNotes', i, 'texture', 'chaotix');
        end
    end
end