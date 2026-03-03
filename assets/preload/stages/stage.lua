local xx = 550;
local yy = 550;
local ofs = 10;
local ofs2 = 10;
local xx2 = 700;
local yy2 = 550;
local followchars = true;
local flash = 0;

function onCreate()
	if getPropertyFromClass('backend.ClientPrefs', 'PotatoOptimization') == false then
		makeLuaSprite('wall', 'stageback', -740, 0, 'shared');
		scaleObject('wall', 1.1, 1.1);
		setScrollFactor('wall', 1, 1);
		setProperty('wall.antialiasing', true);
		addLuaSprite('wall', false);

		makeLuaSprite('floor', 'stagefront', -800, 740, 'shared');
		scaleObject('floor', 1.1, 1.1);
		setScrollFactor('floor', 1, 1);
		setProperty('floor.antialiasing', true);
		addLuaSprite('floor', false);

		makeLuaSprite('light1', 'stage_light', 0, 0, 'shared');
		scaleObject('light1', 1.1, 1.1);
		setScrollFactor('light1', 1, 1);
		setProperty('light1.antialiasing', true);
		addLuaSprite('light1', true);

		makeLuaSprite('light2', 'stage_light', 0, 0, 'shared');
		scaleObject('light2', 1.1, 1.1);
		setScrollFactor('light2', 1, 1);
		setProperty('light2.antialiasing', true);
		addLuaSprite('light2', true);

		makeLuaSprite('curtains', 'stagecurtains', -630, -20, 'shared');
		scaleObject('curtains', 1, 1);
		setScrollFactor('curtains', 1.4, 1.4);
		setProperty('curtains.antialiasing', true);
		addLuaSprite('curtains', true);
	end
	makeLuaSprite('flashingshit', '', 0, 0);
	makeGraphic('flashingshit',1920,1080,'FFFFFF')
	addLuaSprite('flashingshit', true);
	setLuaSpriteScrollFactor('flashingshit',0,0)
	setProperty('flashingshit.scale.x',2)
	setProperty('flashingshit.scale.y',2)
	setProperty('flashingshit.alpha',0)
	
	makeLuaSprite('flashin', 'RedVG', 0, 0, 'exe');
	addLuaSprite('flashin', true);
	setLuaSpriteScrollFactor('flashin',0,0)
	setProperty('flashin.alpha',0)
	setObjectCamera('flashin', 'camHUD')
	setGraphicSize('flashin', 1280, 720)
end

function onBeatHit()
	if flash == 1 then
		if curBeat % 2 == 0 then
			cancelTween('flash');
			setProperty('flashin.alpha', 0.7)
			doTweenAlpha('flash','flashin',0,0.7,'linear')
			triggerEvent('Add Camera Zoom')
			triggerEvent('Add Camera Zoom')
		end
	end
end

function onUpdate(elapsed)
	if songName == 'test' then
		if curStep == 192 then
			setProperty('gf.x', 355)
		end
		if curStep == 256 then
			setProperty('gf.x',295)
			setProperty('dad.x',-100)
			setProperty('dad.y',100)
		end
		if curStep == 384 or curStep == 512 then
			setProperty('flashingshit.alpha',1)
			doTweenAlpha('flsh','flashingshit',0,0.3,'linear')
		end
		if curStep == 384 then
			setProperty('dad.x',-0)
			setProperty('dad.y',530)
		end
		if curStep == 512 then
			setProperty('flashingshit.color', getColorFromHex('000dd0'))
			flash = 1;
			setProperty('dad.x',-0)
			setProperty('dad.y',130)
		end
		if curStep == 640 then
			flash = 0;
			xx = 600;
			xx2 = 750;
			yy = 520;
			yy2 = 520;
			setProperty('defaultCamZoom',0.9)
		end
		if curStep == 768 or curStep == 808 then
			xx = 550;
			xx2 = 700
			yy = 550
			yy2 = 550;
			setProperty('defaultCamZoom',0.8)
			setProperty('dad.x',80)
			setProperty('dad.y',450)
		end
		if curStep == 896 or curStep == 897 then
			setObjectOrder('dadGroup',100)
			setObjectOrder('gfGroup',101)
			setObjectOrder('boyfriendGroup',102)
		end
	end
    songPos = getPropertyFromClass('Conductor', 'songPosition');
 
    currentBeat = (songPos / 300) * (bpm / 180)
	
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