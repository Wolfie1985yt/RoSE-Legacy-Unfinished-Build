function onUpdatePost()
    setProperty('camHUD.zoom', 0.6)
    setProperty('camGame.zoom', 0.5)

    setProperty('camHUD.x', -50)
    setProperty('camHUD.y', -105)
    setProperty('camGame.x', 50)
    setProperty('camGame.y', -100)
end

function onCreate()
    setTargetDad = true
end

function onUpdate()
    if setTargetDad then
        runTimer('camTarget', 0.0000001)
    end
end

function onTimerCompleted(tag)
    if tag == 'camTarget' and setTargetDad then
        runTimer('target', 0.0000001)
        cameraSetTarget('girlfriend')
    end
end 
