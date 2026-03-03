local xx = 580;
local yy = 425;
local ofs = 15;
local ofs2 = 15;
local xx2 = 975;
local yy2 = 500;
local followchars = true;
function onCreate()
	if getPropertyFromClass('backend.ClientPrefs', 'PotatoOptimization') == false then
		makeLuaSprite('sky', 'bgs/sunshineEncore/sky', -820, -650);
		scaleObject('sky', 0.6, 0.6);
		setScrollFactor('sky', 0.5, 0.5);
		setProperty('sky.antialiasing', true);
		addLuaSprite('sky', false);
		
		makeLuaSprite('p2', 'bgs/sunshineEncore/planets2', -450, -500);
		scaleObject('p2', 0.9, 0.9);
		setScrollFactor('p2', 0.9, 0.9);
		setProperty('p2.antialiasing', true);
		addLuaSprite('p2', false);
		
		makeLuaSprite('road', 'bgs/sunshineEncore/road', 150, 700);  --600
		scaleObject('road', 0.6, 0.6);
		setScrollFactor('road', 0.8, 0.8);
		setProperty('road.antialiasing', true);
		addLuaSprite('road', false);
		
		makeLuaSprite('p1', 'bgs/sunshineEncore/planets1', -400, -500);
		scaleObject('p1', 0.9, 0.9);
		setScrollFactor('p1', 0.7, 0.7);
		setProperty('p1.antialiasing', true);
		addLuaSprite('p1', false);
		
		makeLuaSprite('xterion', 'bgs/sunshineEncore/xterion', -730, -550);
		scaleObject('xterion', 0.6, 0.6);
		setScrollFactor('xterion', 0.8, 1);
		setProperty('xterion.alpha', 0);
		setProperty('xterion.antialiasing', true);
		addLuaSprite('xterion', false);
		
		if getPropertyFromClass('backend.ClientPrefs', 'Optimization') == false then
			makeLuaSprite('terrain', 'bgs/sunshineEncore/terrain', -600, -550);
			scaleObject('terrain', 0.7, 0.6);
			setScrollFactor('terrain', 1, 1);
			setProperty('terrain.antialiasing', true);
			addLuaSprite('terrain', false);
		end
		
		makeAnimatedLuaSprite('cool', 'bgs/sunshineEncore/cool', -900, -780);
		setScrollFactor('cool', 0.6, 0.6);
		scaleObject('cool', 5, 5)
		addAnimationByPrefix('cool', 'idle', 'cool idle', 12, true);
		setProperty('cool.antialiasing', false);
		addLuaSprite('cool', false);
		setProperty('cool.alpha', 0)
		
		makeLuaSprite('sun', 'bgs/sunshineEncore/sun', 420, 200);
		scaleObject('sun', 0.6, 0.6);
		setScrollFactor('sun', 0.6, 0.6);
		setProperty('sun.antialiasing', true);
		addLuaSprite('sun', false);
		setProperty('sun.alpha', 0)
		
		makeLuaSprite('floor', 'bgs/tails-doll/bg', -800, -250);
		scaleObject('floor', 1.3, 1.3);
		setScrollFactor('floor', 1, 1);
		setProperty('floor.antialiasing', true);
		setProperty('floor.alpha', 0);
		addLuaSprite('floor', false);
		
		makeLuaSprite('black', '', 0, 0);
		makeGraphic('black',1920,1080,'000000')
		addLuaSprite('black', false);
		screenCenter('black')
		setLuaSpriteScrollFactor('black',0,0)
		setProperty('black.scale.x',4)
		setProperty('black.scale.y',4)
		setProperty('black.alpha',1)
		
		makeLuaSprite('blk', '', 0, 0);
		makeGraphic('blk',1920,1080,'000000')
		addLuaSprite('blk', true);
		screenCenter('blk')
		setLuaSpriteScrollFactor('blk',0,0)
		setProperty('blk.scale.x',4)
		setProperty('blk.scale.y',4)
		setProperty('blk.alpha',0)
	end
end

function onTimerCompleted(tag)
	if tag == 'Planets Up' then
		doTweenY('p1-TweenUp', 'p1', -390, 3.5, 'sineInOut')
		doTweenY('p2-TweenUp', 'p2', -550, 3.5, 'sineInOut')
		runTimer('Planets Down', 3.5, 1)
	end
	if tag == 'Planets Down' then
		doTweenY('p1-TweenDown', 'p1', -320, 3.5, 'sineInOut')
		doTweenY('p2-TweenDown', 'p2', -630, 3.5, 'sineInOut')
		runTimer('Planets Up', 3.6, 1)
	end
	if tag == 'Road Left' then
		doTweenAngle('road-TweenLeft', 'road', 2, 3, 'sineInOut')
		runTimer('Road Right',3, 1)
	end
	if tag == 'Road Right' then
		doTweenAngle('road-TweenRight', 'road', -2, 3, 'sineInOut')
		runTimer('Road Left', 3.1, 1)
	end
	if tag == 'Road Up' then
		doTweenY('road-TweenUp', 'road', -50, 4, 'sineInOut')
		runTimer('Road Down', 4, 1)
	end
	if tag == 'Road Down' then
		doTweenY('road-TweenUp', 'road', 50, 4, 'sineInOut')
		runTimer('Road Up', 4.1, 1)
	end
end

function onBeatHit()
	if funny == true then
		if curBeat % 2 == 0 then
			setProperty('camGame.zoom', 0.71)
			doTweenZoom('Zoom1DadCamOut1','camGame',0.7, 0.1,'quadInOut')
		else
			if curBeat % 1 == 0 then
				setProperty('camGame.zoom', 0.71)
				doTweenZoom('Zoom1DadCamOut1','camGame',0.7, 0.1,'quadInOut')
			end
		end
	end
	if epic == true then
		if curBeat % 2 == 0 then
			setProperty('camGame.zoom', 0.77)
			doTweenZoom('Zoom1DadCamOut1','camGame',0.76, 0.1,'quadInOut')
		end
	end
end

function onStepHit()
	if songName == "sunshine-encore" then
		if curStep == 32 then
			runTimer('Planets Up', 0.1, 1)
			setProperty('defaultCamZoom',0.77)
		end
		if curStep == 64 then
			setProperty('defaultCamZoom',0.77)
		end
		if curStep == 128 then
			doTweenAlpha('blk1','blk', 1, 0.7,'linear')
		end
		if curStep == 136 then
			setProperty('black.alpha', 0)
			setProperty('blk.alpha', 0)
			setProperty('defaultCamZoom',0.67)
			doTweenAlpha('END1','scoreTxt', 1, 0.2,'linear')
			doTweenAlpha('END2','iconP1', 1, 0.2,'linear')
			doTweenAlpha('END3','iconP2', 1, 0.2,'linear')
			doTweenAlpha('END4','healthBar', 1, 0.2,'linear')
			doTweenAlpha('END5','healthBarBG', 1, 0.2,'linear')
		end
		if curStep == 264 then
			setProperty('defaultCamZoom',0.9)
		end
		if curStep == 328 then
			setProperty('defaultCamZoom',0.67)
		end
		if curStep == 336 then
			setProperty('defaultCamZoom',0.75)
		end
		if curStep == 344 then
			setProperty('defaultCamZoom',0.8)
		end
		if curStep == 352 then
			setProperty('defaultCamZoom',0.9)
		end
		if curStep == 360 then
			setProperty('defaultCamZoom',0.67)
		end
		if curStep == 368 then
			setProperty('defaultCamZoom',0.75)
		end
		if curStep == 376 then
			setProperty('defaultCamZoom',0.8)
		end
		if curStep == 384 then
			setProperty('defaultCamZoom',0.9)
		end
		if curStep == 392 then
			setProperty('defaultCamZoom',0.67)
		end
		if curStep == 456 then
			setProperty('blk.alpha', 1)
			doTweenAlpha('END1','scoreTxt', 0, 0.02,'linear')
			doTweenAlpha('END2','iconP1', 0, 0.02,'linear')
			doTweenAlpha('END3','iconP2', 0, 0.02,'linear')
			doTweenAlpha('END4','healthBar', 0, 0.02,'linear')
			doTweenAlpha('END5','healthBarBG', 0, 0.02,'linear')
			doTweenAlpha('END6','timeBar', 0, 0.02,'linear')
			doTweenAlpha('END7','timeBarBG', 0, 0.02,'linear')
			doTweenAlpha('END8','timeTxt', 0, 0.02,'linear')
			noteTweenAlpha('OpponentStrums0',0 ,0 ,0.02, 'linear')
			noteTweenAlpha('OpponentStrums1',1 ,0 ,0.02, 'linear')
			noteTweenAlpha('OpponentStrums2',2 ,0 ,0.02, 'linear')
			noteTweenAlpha('OpponentStrums3',3 ,0 ,0.02, 'linear')
			noteTweenAlpha('playerStrums0',4 ,0 ,0.02, 'linear')
			noteTweenAlpha('playerStrums1',5 ,0 ,0.02, 'linear')
			noteTweenAlpha('playerStrums2',6 ,0 ,0.02, 'linear')
			noteTweenAlpha('playerStrums3',7 ,0 ,0.02, 'linear')
		end
		if curStep == 471 then
			setProperty('defaultCamZoom',0.56)
			setProperty('sun.alpha', 1)
			doTweenAngle('sunspin','sun', 180, 35,'linear')
			setProperty('cool.alpha', 1)
		
			doTweenAlpha('blk3','blk', 0, 0.2,'linear')
			doTweenAlpha('END1','scoreTxt', 1, 0.5,'quadInOut')
			doTweenAlpha('END2','iconP1', 1, 0.5,'quadInOut')
			doTweenAlpha('END3','iconP2', 1, 0.5,'quadInOut')
			doTweenAlpha('END4','healthBar', 1, 0.5,'quadInOut')
			doTweenAlpha('END5','healthBarBG', 1, 0.5,'quadInOut')
			doTweenAlpha('END6','timeBar', 1, 0.5,'quadInOut')
			doTweenAlpha('END7','timeBarBG', 1, 0.5,'quadInOut')
			doTweenAlpha('END8','timeTxt', 1, 0.5,'quadInOut')
			
			noteTweenAlpha('OpponentStrums0',0 ,1 ,0.5, 'quadInOut')
			noteTweenAlpha('OpponentStrums1',1 ,1 ,0.5, 'quadInOut')
			noteTweenAlpha('OpponentStrums2',2 ,1 ,0.5, 'quadInOut')
			noteTweenAlpha('OpponentStrums3',3 ,1 ,0.5, 'quadInOut')
			noteTweenAlpha('playerStrums0',4 ,1 ,0.5, 'quadInOut')
			noteTweenAlpha('playerStrums1',5 ,1 ,0.5, 'quadInOut')
			noteTweenAlpha('playerStrums2',6 ,1 ,0.5, 'quadInOut')
			noteTweenAlpha('playerStrums3',7 ,1 ,0.5, 'quadInOut')
		end
		if curStep == 590 then
			doTweenZoom('ZOOMDAD', 'camGame', 0.67, 1.55, 'quadInOut')
			setProperty('defaultCamZoom',0.68)
			doTweenAlpha('sun','sun', 0, 4.55,'linear')
			doTweenAlpha('cool','cool', 0, 4.55,'linear')
			doTweenAlpha('floor','floor', 1, 1.55, 'linear')
			doTweenAlpha('dad','dadGroup', 0.5, 1.55,'linear')
			doTweenAlpha('bf','boyfriendGroup', 0.5, 1.55,'linear')
			doTweenAlpha('END1','scoreTxt', 0, 1.55,'linear')
			doTweenAlpha('END2','iconP1', 0, 1.55,'linear')
			doTweenAlpha('END3','iconP2', 0, 1.55,'linear')
			doTweenAlpha('END4','healthBar', 0, 1.55,'linear')
			doTweenAlpha('END5','healthBarBG', 0, 1.55,'linear')
			doTweenAlpha('END6','timeBar', 0, 1.55,'linear')
			doTweenAlpha('END7','timeBarBG', 0, 1.55,'linear')
			doTweenAlpha('END8','timeTxt', 0, 1.55,'linear')
		end
		if curStep == 665 then
			doTweenY('road-TweenUp', 'road', -50, 3, 'ExpoInOut')
		end
		if curStep == 672 then
			funny = true;
			setProperty('floor.alpha', 0)
			setProperty('xterion.alpha', 1)
			setProperty('dadGroup.alpha', 1)
			setProperty('boyfriendGroup.alpha', 1)
			doTweenAlpha('END1','scoreTxt', 1, 0.2,'linear')
			doTweenAlpha('END2','iconP1', 1, 0.2,'linear')
			doTweenAlpha('END3','iconP2', 1, 0.2,'linear')
			doTweenAlpha('END4','healthBar', 1, 0.2,'linear')
			doTweenAlpha('END5','healthBarBG', 1, 0.2,'linear')
			doTweenAlpha('END6','timeBar', 1, 0.2,'linear')
			doTweenAlpha('END7','timeBarBG', 1, 0.2,'linear')
			doTweenAlpha('END8','timeTxt', 1, 0.2,'linear')
		end
		if curStep == 675 then
			runTimer('Road Up', 0.1, 1)
			runTimer('Road Left', 0.1, 1)
		end
		if curStep == 991 then
			doTweenAlpha('road','road', 0, 1.5,'linear')
			funny = false
			epic = true
		end
		if curStep == 1023 then
			doTweenAlpha('p1','p1', 0, 1.5,'linear')
		end
		if curStep == 1055 then
			doTweenAlpha('p2','p2', 0, 1.5,'linear')
			doTweenAlpha('xterion','xterion', 0, 1.5,'linear')
		end
		if curStep == 1087 then
			doTweenAlpha('terrain','terrain', 0, 1.5,'linear')
		end
		if curStep == 1120 then
			setProperty('black.alpha', 1)
			epic = false
		end
		if curStep == 1247 then
			doTweenAlpha('dad','dadGroup', 0, 3,'linear')
			doTweenAlpha('bf','boyfriendGroup', 0, 3,'linear')
			doTweenAlpha('END1','scoreTxt', 0, 3,'linear')
			doTweenAlpha('END2','iconP1', 0, 3,'linear')
			doTweenAlpha('END3','iconP2', 0, 3,'linear')
			doTweenAlpha('END4','healthBar', 0, 3,'linear')
			doTweenAlpha('END5','healthBarBG', 0, 3,'linear')
			doTweenAlpha('END6','timeBar', 0, 3,'linear')
			doTweenAlpha('END7','timeBarBG', 0, 3,'linear')
			doTweenAlpha('END8','timeTxt', 0, 3,'linear')
			
			noteTweenAlpha('OpponentStrums0',0 ,0 ,3, 'linear')
			noteTweenAlpha('OpponentStrums1',1 ,0 ,3, 'linear')
			noteTweenAlpha('OpponentStrums2',2 ,0 ,3, 'linear')
			noteTweenAlpha('OpponentStrums3',3 ,0 ,3, 'linear')
			noteTweenAlpha('playerStrums0',4 ,0 ,3, 'linear')
			noteTweenAlpha('playerStrums1',5 ,0 ,3, 'linear')
			noteTweenAlpha('playerStrums2',6 ,0 ,3, 'linear')
			noteTweenAlpha('playerStrums3',7 ,0 ,3, 'linear')
		end
	end
end
    
function onUpdate(elapsed)

    songPos = getSongPosition()
 
    currentBeat = (songPos / 227000) * (bpm / 85)
	
	if followchars == true then
        if mustHitSection == false then
			if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
			if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
			if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
			if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
			if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
			if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
			if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
			if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else
			if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' or getProperty('boyfriend.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx2-ofs2,yy2)
            end
			if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' or getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx2+ofs2,yy2)
            end
			if getProperty('boyfriend.animation.curAnim.name') == 'singUP' or getProperty('boyfriend.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs2)
            end
			if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' or getProperty('boyfriend.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs2)
            end
			if getProperty('boyfriend.curCharacter') == 'singLEFTmiss' then
                triggerEvent('Camera Follow Pos',xx2-ofs2,yy2)
            end
			if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHTmiss' or getProperty('boyfriend.animation.curAnim.name') == 'singRIGHTmiss-alt' then
                triggerEvent('Camera Follow Pos',xx2+ofs2,yy2)
            end
			if getProperty('boyfriend.animation.curAnim.name') == 'singUPmiss' or getProperty('boyfriend.animation.curAnim.name') == 'singUPmiss-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs2)
            end
			if getProperty('boyfriend.animation.curAnim.name') == 'singDOWNmiss' or getProperty('boyfriend.animation.curAnim.name') == 'singDOWNmiss-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' or getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
        triggerEvent('Camera Follow Pos','','')
	end
end