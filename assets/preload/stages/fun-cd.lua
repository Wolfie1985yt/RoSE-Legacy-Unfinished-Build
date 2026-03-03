local xx = 880;
local yy = 810;
local ofs = 20;
local ofs2 = 20;
local xx2 = 1040;
local yy2 = 810;
local followchars = true;
speed = 1;
function onCreate()
	if getPropertyFromClass('backend.ClientPrefs', 'PotatoOptimization') == false then
		makeLuaSprite('bg', 'bgs/endless-us/bg', -400, -250);
		scaleObject('bg', 2, 2);
		setScrollFactor('bg', 0.3, 0.3);
		setProperty('bg.antialiasing', false);
		addLuaSprite('bg', false);
		
		makeLuaSprite('sky', 'bgs/endless-us/sky', -200, 200);
		scaleObject('sky', 5.5, 5.5);
		setScrollFactor('sky', 1, 1);
		setProperty('sky.antialiasing', false);
		setProperty('sky.alpha', 0)
		addLuaSprite('sky', false);
		
		makeLuaSprite('build', 'bgs/endless-us/buildings', -200, 332);
		scaleObject('build', 5.5, 5.5);
		setScrollFactor('build', 1.1, 1);
		setProperty('build.antialiasing', false);
		setProperty('build.alpha', 0)
		addLuaSprite('build', false);
		
		makeLuaSprite('hills', 'bgs/endless-us/downhills', -300, 596);
		scaleObject('hills', 5.5, 5.5);
		setScrollFactor('hills', 0.95, 1);
		setProperty('hills.antialiasing', false);
		setProperty('hills.alpha', 0)
		addLuaSprite('hills', false);
		
		makeLuaSprite('water', 'bgs/endless-us/water', -300, 816);
		scaleObject('water', 5.5, 5.5);
		setScrollFactor('water', 0.9, 1);
		setProperty('water.antialiasing', false);
		setProperty('water.alpha', 0)
		addLuaSprite('water', false);
		
		makeLuaSprite('clouds', 'bgs/endless-us/clouds', -400, -100);
		scaleObject('clouds', 2, 2);
		setScrollFactor('clouds', 0.3, 0.3);
		setProperty('clouds.antialiasing', false);
		setProperty('clouds.alpha', 0)
		addLuaSprite('clouds', false);
		
		makeAnimatedLuaSprite('bg-new', 'bgs/endless-us/bg-new', -500, -250);
		scaleObject('bg-new', 9, 10);
		addAnimationByPrefix('bg-new', 'idle', 'idle', 24, true);
		setScrollFactor('bg-new', 0, 0);
		setProperty('bg-new.antialiasing', false);
		addLuaSprite('bg-new', false);
		
		makeAnimatedLuaSprite('static', 'bgs/omw/staticOMW', -600, -400);
		scaleObject('static', 6, 6);
		addAnimationByPrefix('static', 'sshh', 'stat', 24, true);
		setScrollFactor('static', 0, 0);
		setProperty('static.antialiasing', false);
		setProperty('static.alpha', 0.7)
		addLuaSprite('static', false);
		
		makeAnimatedLuaSprite('dna', 'bgs/endless-us/dna', 1200, 60);
		scaleObject('dna', 3, 3);
		addAnimationByPrefix('dna', 'idle', 'idle', 30, true);
		setScrollFactor('dna', 1, 1);
		setProperty('dna.alpha', 0);
		setProperty('dna.color', getColorFromHex('3E48FF'))
		setProperty('dna.antialiasing', false);
		addLuaSprite('dna', false);
		
		makeAnimatedLuaSprite('dna2', 'bgs/endless-us/dna', -390, 60);
		scaleObject('dna2', 3, 3);
		setProperty('dna2.flipY', true);
		setProperty('dna2.flipX', true);
		addAnimationByPrefix('dna2', 'idle', 'idle', 30, true);
		setScrollFactor('dna2', 1, 1);
		setProperty('dna2.alpha', 0);
		setProperty('dna2.color', getColorFromHex('3E48FF'))
		setProperty('dna2.antialiasing', false);
		addLuaSprite('dna2', false);
		
		makeLuaSprite('fun', 'bgs/endless-us/fun', 395, 150);
		scaleObject('fun', 0.7, 0.7);
		setScrollFactor('fun', 1, 0.3);
		setProperty('fun.antialiasing', true);
		setProperty('fun.alpha', 0)
		addLuaSprite('fun', false);
		
		makeLuaSprite('cd', 'bgs/endless-us/cd', 380, 900);
		scaleObject('cd', 0.9, 0.9);
		setScrollFactor('cd', 1, 1);
		setProperty('cd.antialiasing', true);
		addLuaSprite('cd', false);
		
		if getPropertyFromClass('backend.ClientPrefs', 'Optimization') == false then
			makeAnimatedLuaSprite('light', 'bgs/endless-us/light', -320, 200);
			addAnimationByPrefix('light', 'idle', 'light idle', 30, true);
			scaleObject('light', 4, 4);
			setProperty('light.antialiasing', true);
			addLuaSprite('light', true);
			setBlendMode('light','ADD')
			setProperty('light.alpha', 0)
		end
		
		makeLuaSprite('blk', '', 0, 0);
		makeGraphic('blk',1920,1080,'000000')
		addLuaSprite('blk', true);
		setLuaSpriteScrollFactor('blk',0,0)
		setProperty('blk.scale.x',2)
		setProperty('blk.scale.y',2)
		setProperty('blk.alpha',1)
		
		makeLuaSprite('flashingshit', '', 0, 0);
		makeGraphic('flashingshit',1920,1080,'0C266E')
		addLuaSprite('flashingshit', true);
		setLuaSpriteScrollFactor('flashingshit',0,0)
		setProperty('flashingshit.scale.x',2)
		setProperty('flashingshit.scale.y',2)
		setProperty('flashingshit.alpha', 0)
		setBlendMode('flashingshit','ADD')
		
		makeLuaSprite('flashin', 'blueVgV', 0, 0, 'exe');
		addLuaSprite('flashin', true);
		setLuaSpriteScrollFactor('flashin',0,0)
		setProperty('flashin.alpha',0)
		setProperty('flashin.color', getColorFromHex('3E48FF'))
		setObjectCamera('flashin', 'camOther')
		setGraphicSize('flashin', 1280, 720)
	end
	ITSMOVING();
end

function ITSMOVING()
	addHaxeLibrary('FlxTiledSprite', 'flixel.addons.display');
	addHaxeLibrary('FlxTween', 'flixel.tweens');
	addHaxeLibrary('FlxEase', 'flixel.tweens');
	addHaxeLibrary('FlxObject', 'flixel');
	addHaxeLibrary('flash.display');
	
	runHaxeCode([[
		left = new FlxTiledSprite(Paths.image('bgs/endless-us/cooltext-left', 'preload'), 2500, 1400, true, true);
		left.x = -300;
		left.y = 100;
		left.visible = false;
		game.insert(game.members.indexOf(game.modchartSprites.get('dna')), left);
		
		right = new FlxTiledSprite(Paths.image('bgs/endless-us/cooltext-right', 'preload'), 2500, 1400, true, true);
		right.x = -300;
		right.y = 100;
		right.visible = false;
		game.insert(game.members.indexOf(game.modchartSprites.get('dna')), right);
	]])
end

function onBeatHit()
	if flash == 2 then
		if curBeat % 2 == 0 then
			cancelTween('flash');
			setProperty('flashin.alpha',0.35)
			doTweenAlpha('flash','flashin',0,0.7,'linear')
			triggerEvent('Add Camera Zoom')
			triggerEvent('Add Camera Zoom')
		else
			cancelTween('flash');
			setProperty('flashin.alpha',0.35)
			doTweenAlpha('flash','flashin',0,0.7,'linear')
			triggerEvent('Add Camera Zoom')
			triggerEvent('Add Camera Zoom')
		end
	end
	if flash == 3 then
		if curBeat % 1 then
			cancelTween('flash');
			setProperty('flashin.alpha',0.35)
			doTweenAlpha('flash','flashin',0,0.7,'linear')
			triggerEvent('Add Camera Zoom')
			triggerEvent('Add Camera Zoom')
		else
			cancelTween('flash');
			setProperty('flashin.alpha',0.35)
			doTweenAlpha('flash','flashin',0,0.7,'linear')
			triggerEvent('Add Camera Zoom')
			triggerEvent('Add Camera Zoom')
		end
	end
end

function onUpdate(elapsed)

    songPos = getPropertyFromClass('Conductor', 'songPosition');
 
    currentBeat = (songPos / 300) * (bpm / 180)
	
	if speed == 1 then
		runHaxeCode([[
			left.scrollX -= 1.5;
			right.scrollX += 1.5;
		]])
	end
	if speed == 2 then
		runHaxeCode([[
			left.scrollX -= 2.5;
			right.scrollX += 2.5;
		]])
	end
	if speed == 3 then
		runHaxeCode([[
			left.scrollX -= 4;
			right.scrollX += 4;
		]])
	end
	
	if songName == "endless-us" then
		if curStep == 0 then
			setProperty('camHUD.alpha',0)
			setBlendMode('static','MULTIPLY')
		end
		if curStep == 1 then
			setProperty('flashingshit.alpha', 1)
		end
		if curStep == 4 then
			setProperty('blk.alpha',0)
			doTweenAlpha('flsh1','flashingshit', 0, 1,'quadInOut')
		end
		if curStep == 112 then
			doTweenAlpha('camHUD','camHUD', 1, 1.5,'quadInOut')
		end
		if curStep == 256 then
			doTweenAlpha('bg-new','bg-new', 0, 1.5,'quadInOut')
			doTweenAlpha('fun','fun', 1, 1.5,'quadInOut')
			doTweenAlpha('static','static', 0.5, 0.6,'quadInOut')
			setProperty('defaultCamZoom',0.6)
		end
		if curStep == 512 then
			doTweenAlpha('static','static', 1, 0.6,'quadInOut')
			setProperty('defaultCamZoom',0.7)
			yy = 850;
			yy2 = 850;
		end
		if curStep == 642 then
			doTweenAlpha('static','static', 0.5, 0.6,'quadInOut')
			setProperty('defaultCamZoom',0.6)
			yy = 810;
			yy2 = 810;
		end
		if curStep == 768 then
			doTweenAlpha('static','static', 0.4, 0.6,'quadInOut')
			setProperty('defaultCamZoom',0.58)
			xx = 960;
			yy = 830;
			ofs = 10;
			ofs2 = 10;
			xx2 = 960;
			yy2 = 830;
		end
		if curStep == 888 then
			doTweenAlpha('camGame','camGame', 0, 0.7,'quadInOut')
		end
		if curStep == 904 then
			doTweenAlpha('camGame','camGame', 1, 1,'quadInOut')
			doTweenAlpha('static','static', 0.5, 0.6,'quadInOut')
			doTweenAlpha('light','light', 0.75, 0.6,'quadInOut')
			setProperty('defaultCamZoom',0.65)
		end
		if curStep == 1150 then
			doTweenAlpha('light','light', 0, 1.5,'quadInOut')
		end
		if curStep == 1296 then
			setProperty('defaultCamZoom',0.7)
			doTweenAlpha('static','static', 1, 0.6,'quadInOut')
			xx = 880;
			xx2 = 1040;
		end
		if curStep == 1420 then
			doTweenZoom('ZOOMDAD','camGame', 5, 1,'quadInOut')
		end
		if curStep == 1424 then
			cancelTween('ZOOMDAD')
			setProperty('defaultCamZoom',0.6)
			doTweenAlpha('static','static', 0.2, 0.01,'quadInOut')
			doTweenAlpha('light','light', 0.75, 0.01,'quadInOut')
			setProperty('sky.alpha', 1)
			setProperty('build.alpha', 1)
			setProperty('hills.alpha', 1)
			setProperty('water.alpha', 1)
		end
		if curStep == 1424 then
			setProperty('flashingshit.alpha', 1)
			doTweenAlpha('flsh1','flashingshit', 0, 0.8,'quadInOut')
		end
		if curStep == 1672 then
			setBlendMode('bg-new', 'MULTIPLY')
		end
		if curStep == 1680 then
			doTweenAlpha('light','light', 0, 0.8,'quadInOut')
			doTweenAlpha('static','static', 0.4, 0.8,'quadInOut')
			doTweenAlpha('bg-new', 'bg-new', 0.9, 0.8, 'quadInOut')
			doTweenAlpha('dna', 'dna', 0.7, 0.8, 'quadInOut')
			doTweenAlpha('dna2', 'dna2', 0.7, 0.8, 'quadInOut')
			setProperty('defaultCamZoom',0.7)
		end
		if curStep == 1794 then
			doTweenAlpha('camHUD', 'camHUD', 1, 1, 'linear')
		end
		if curStep == 1936 then
			setProperty('flashingshit.alpha', 1)
			doTweenAlpha('flsh1','flashingshit', 0, 1.7,'quadInOut')
			setBlendMode('bg-new', 'NORMAL')
			setProperty('bg-new.alpha', 1)
			setProperty('dna.alpha', 0)
			setProperty('dna2.alpha', 0)
			setProperty('static.alpha', 0.7)
		end
		if curStep == 2000 then
			doTweenAlpha('bg-new','bg-new', 0, 1.5,'quadInOut')
			doTweenAlpha('static','static', 0.5, 0.6,'quadInOut')
			setProperty('defaultCamZoom',0.6)
			setProperty('sky.alpha', 0)
			setProperty('build.alpha', 0)
			setProperty('hills.alpha', 0)
			setProperty('water.alpha', 0)
		end
		if curStep == 2188 then
			setProperty('blk.alpha', 1)
			setProperty('defaultCamZoom',0.7)
			xx = 750;
			yy = 850;
			xx2 = 1200;
			yy2 = 850;
		end
		if curStep == 2192 then
			setProperty('flashingshit.alpha', 1)
			doTweenAlpha('flsh1','flashingshit', 0, 1.5,'quadInOut')
			setProperty('static.alpha', 0.4)
			setProperty('blk.alpha', 0)
			setProperty('clouds.alpha', 1)
			runHaxeCode([[
			left.visible = true;
			right.visible = true;
			]])
		end
		if curStep == 2447 then
			setProperty('defaultCamZoom',0.6)
			xx = 960;
			yy = 830;
			ofs = 10;
			ofs2 = 10;
			xx2 = 960;
			yy2 = 830;
			speed = 2;
			flash = 2;
		end
		if curStep == 2576 then
			speed = 3;
			flash = 3;
		end
		if curStep == 2696 then
			flash = 0;
		end
		if curStep == 2716 then
			doTweenZoom('ZOOMDAD4','camGame', 1, 0.9,'quartInOut')
		end
		if curStep == 2724 then
			doTweenAlpha('camHUD','camHUD', 0, 0.001,'linear')
			doTweenAlpha('camGame','camGame', 0, 0.001,'linear')
		end
	end
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
			if getProperty('boyfriend.animation.curAnim.name') == 'singLEFTmiss' or getProperty('boyfriend.animation.curAnim.name') == 'singLEFTmiss-alt' then
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