local Rings = 0
local Texts = {'SonicScoreText', 'SonicScoreTextShadow', 'SonicScore', 'SonicScoreShadow', 'SonicTimeText', 'SonicTimeTextShadow', 'SonicTime', 'SonicTimeShadow', 'SonicRingsText', 'SonicRingsTextShadow', 'SonicRings', 'SonicRingsShadow'}
local Shadows = {'SonicScoreTextShadow', 'SonicTimeTextShadow', 'SonicRingsTextShadow', 'SonicScoreShadow', 'SonicTimeShadow', 'SonicRingsShadow'}
local StaticTexts = {'SonicScoreText', 'SonicTimeText', 'SonicRingsText'}
local ActualTexts = {'SonicScore', 'SonicTime', 'SonicRings'}
local Flash = 0
local combo = 0
local ringNum = 0
local ringPenis = 0
local ringBuffer = '0'
local ringDick = '0'

function onCreate()
 --------------hud----------------
    setProperty('scoreTxt.visible', false)
    setProperty('healthBar.alpha', 1)
    setProperty('iconP1.visible', true)
    setProperty('iconP2.visible', true)
    setTextFont('botplayTxt', "sonic-1-hud-font.ttf");
    setObjectCamera('botplayTxt', 'hud');
    setTextColor('botplayTxt', 'FFFF00')
    setPropertyFromClass('backend.ClientPrefs', 'timeBarType', 'Disabled')
     -- Create Texts --
     for i = 1, #Texts do
        makeLuaText(Texts[i], '0')
        setTextSize(Texts[i], 30)
        setTextFont(Texts[i], 'sonic-1-hud-font.ttf')
        setTextBorder(Texts[i], '0')
        setObjectCamera(Texts[i], 'hud')
    end
    -- Text Settings --
    for i = 1, #Shadows do
        setTextColor(Shadows[i], '000000')
    end
    for i = 1, #StaticTexts do
        setTextColor(StaticTexts[i], 'FFFF00')
    end
    for i = 1, #ActualTexts do
        setTextColor(ActualTexts[i], 'FFFFFF')
    end
    setTextString('SonicScoreText', 'SCORE')
    setTextString('SonicScoreTextShadow', 'SCORE')
    setTextString('SonicTimeText', 'TIME')
    setTextString('SonicTimeTextShadow', 'TIME')
    setTextString('SonicRingsText', 'RINGS')
    setTextString('SonicRingsTextShadow', 'RINGS')
    for i = 1, #Shadows do
        addLuaText(Shadows[i])
        setProperty(Shadows[i] .. '.x', 52)
    end
    if downscroll == true then
    setProperty('SonicScoreTextShadow.y', 52)
    setProperty('SonicTimeTextShadow.y', 102)
    setProperty('SonicRingsTextShadow.y', 152)
    setProperty('SonicScoreShadow.y', 52)
    setProperty('SonicTimeShadow.y', 102)
    setProperty('SonicRingsShadow.y', 152)
    setProperty('SonicScoreShadow.x', 202)
    setProperty('SonicTimeShadow.x', 202)
    setProperty('SonicRingsShadow.x', 202)
    setProperty('botplayTxt.x', 400)
    else
    setProperty('SonicScoreTextShadow.y', 452)
    setProperty('SonicTimeTextShadow.y', 502)
    setProperty('SonicRingsTextShadow.y', 552)
    setProperty('SonicScoreShadow.y', 452)
    setProperty('SonicTimeShadow.y', 502)
    setProperty('SonicRingsShadow.y', 552)
    setProperty('SonicScoreShadow.x', 202)
    setProperty('SonicTimeShadow.x', 202)
    setProperty('SonicRingsShadow.x', 202)
    setProperty('botplayTxt.x', 400)
    end
    for i = 1, #StaticTexts do
        addLuaText(StaticTexts[i])
        setProperty(StaticTexts[i] .. '.x', 50)
    end
    if downscroll == true then
        setProperty('SonicScoreText.y', 50)
        setProperty('SonicTimeText.y', 100)
        setProperty('SonicRingsText.y', 150)
        setProperty('botplayTxt.y', 50)
    else
        setProperty('SonicScoreText.y', 450)
        setProperty('SonicTimeText.y', 500)
        setProperty('SonicRingsText.y', 550)
        setProperty('botplayTxt.y', 50)
    end
    for i = 1, #ActualTexts do
        addLuaText(ActualTexts[i])
        setProperty(ActualTexts[i] .. '.x', 200)
    end
    if downscroll == true then
        setProperty('SonicScore.y', 50)
        setProperty('SonicTime.y', 100)
        setProperty('SonicRings.y', 150)
    else
        setProperty('SonicScore.y', 450)
        setProperty('SonicTime.y', 500)
        setProperty('SonicRings.y', 550)
    end
end

function roundDecimal(num, numDecimalPlaces)
    local mult = 10^(numDecimalPlaces or 0);
    return math.floor(num * mult + 0.5) / mult;
end

function onUpdate()
    if misses == 1 then
        setTextString('MissesText', misses .. '')
        setTextString('MissesTextShadow', misses .. '')
    else
        setTextString('MissesText', misses .. '')
        setTextString('MissesTextShadow', misses .. '')
    end
    songSecs = tostring(roundDecimal(((songLength/1000)%60), 0))
    songMins = tostring(roundDecimal(((songLength/(1000*60))%60), 0))
    songPosSecs = tostring(roundDecimal(((getPropertyFromClass('Conductor', 'songPosition')/1000)%60), 0))
    songPosMins = tostring(roundDecimal(((getPropertyFromClass('Conductor', 'songPosition')/(1000*60))%60), 0))
    if curStep == 0 then
        songPosSecs = tostring("00")
        songPosMins = tostring("0")
    end
    if #songPosSecs < 2 then
        songPosSecs = "0" .. songPosSecs
    end
    if #songSecs < 2 then
        songSecs = "0" .. songSecs
    end
    if Rings < 0 then
        setProperty('health', 0)
    end
    setTextString('SonicScore', score)
    setTextString('SonicScoreShadow', score)
    setTextString('SonicRings', Rings)
    setTextString('SonicRingsShadow', Rings)
    setTextString('SonicTime', songPosMins .. ':' .. songPosSecs .. '/' .. songMins .. ':' .. songSecs)
    setTextString('SonicTimeShadow', songPosMins .. ':' .. songPosSecs .. '/' .. songMins .. ':' .. songSecs)
    math.randomseed(getPropertyFromClass('Conductor', 'songPosition') / curStep * math.random(4124,12312) * curBeat * 5843223)
end

function onStepHit()
    if curStep % 2 == 0 then
        if Rings == 0 and Flash == 0 then
            setTextColor('SonicRingsText', 'FF0000')
            Flash = 1
        elseif Rings == 0 then
            setTextColor('SonicRingsText', 'FFFF00')
            Flash = 0
        else
            setTextColor('SonicRingsText', 'FFFF00')
        end
    end
end

function noteMiss(id, direction, noteType, isSustainNote)
    combo = 0
    if isSustainNote == false then
        if Rings == 0 then
            Rings = -1
        else
            math.randomseed(getPropertyFromClass('Conductor', 'songPosition') / curStep * math.random(4124,12312) * curBeat * 584328 / math.random(249864694369486,1423) / songLength)
            playSound('losering', 0.5)
            if Rings % 2 == 0 then
                ringCount = Rings / 2
            else
                ringCount = Rings + 1
                ringCount = ringCount / 2
            end
            for i = 1, ringCount do
                ringNum = ''
                ringNum = ringNum .. i
                if #ringNum < 2 then
                    ringNum = '0' .. ringNum
                end
                if tonumber(ringNum) > 500 then
                    ringNum = '500'
                end
                makeAnimatedLuaSprite('ring' .. ringNum, 'Ring', 0, 0)
                addLuaSprite('ring' .. ringNum)
                addAnimationByPrefix('ring' .. ringNum, 'speen', 'speen')
                objectPlayAnimation('ring' .. ringNum, 'speen')
                setProperty('ring' .. ringNum .. '.scale.x', 0.5)
                setProperty('ring' .. ringNum .. '.scale.y', 0.5)
                setProperty('ring' .. ringNum .. '.x', getProperty('boyfriend.x') + 150)
                setProperty('ring' .. ringNum .. '.y', getProperty('boyfriend.y') + 150)
                doTweenX('ringX' .. ringNum, 'ring' .. ringNum, math.random(300, 2000), 3, 'linear')
                doTweenY('ringY' .. ringNum, 'ring' .. ringNum, getProperty('boyfriend.y') - math.random(100, 150), 0.75, 'cubeOut')
                if math.random(0, 10) == 1 then
                    setObjectOrder('ring' .. ringNum, 9999999)
                end
                ringPenis = ringPenis + 1
            end
            if Rings % 2 == 0 then
                Rings = Rings / 2
            elseif Rings == 1 then
                Rings = 0
            else
                Rings = Rings - 1
                Rings = Rings / 2
            end
        end
    end
end

function onTweenCompleted(tag)
    if tag:sub(1, 5) == 'ringY' then
        cutTag = tag:sub(6, 7 + #ringDick)
        doTweenY('ring2Y' .. cutTag, 'ring' .. cutTag, math.random(500, 700), 1, 'cubeIn')
        doTweenAlpha('ring2Alpha' .. cutTag, 'ring' .. cutTag, 0, 1, 'linear')
    end
end

function goodNoteHit(no, noagain, notetype, yourmother)
    if yourmother == false then
        combo = combo + 1
        if notetype == "RingNote" or notetype == "ringaddnote" then
            Rings = Rings + 1
            playSound('ring', 0.5)
            if Rings == 100 then
                Rings = 1
                score = score + 2000
                playSound('100Rings', 6)
            end
        elseif combo % 4 == 0 then
            Rings = Rings + 1
            playSound('ring', 0.3)
        end
    end
end

function onBeatHit()
    if curBeat % 4 == 0 then
        for i = 1, ringPenis do
            if getProperty('ring' .. i .. '.alpha') == 1 then
                doTweenY('ring2Y' .. i, 'ring' .. i, math.random(500, 700), 1, 'cubeIn')
                doTweenAlpha('ring2Alpha' .. i, 'ring' .. i, 0, 1, 'linear')
            end
        end
    end
    if curBeat % 8 == 0 then
        for i = 1, ringPenis do
            if getProperty('ring' .. i .. '.alpha') == 1 then
                removeLuaSprite('ring' .. i)
            end
        end
    end
end


function onStepHit()
    if Rings == 0 then
        if curStep % 4 == 0 then
            doTweenColor('SonicRingsText', 'SonicRingsText', 'FF0000', 0.001, 'linear')
        end
        if curStep % 8 == 0 then
            doTweenColor('SonicRingsText', 'SonicRingsText', 'FFFF00', 0.001, 'linear')
        end
    end
    if Rings == 1 then
        doTweenColor('SonicRingsText', 'SonicRingsText', 'FFFF00', 0.001, 'linear')
    end
end
