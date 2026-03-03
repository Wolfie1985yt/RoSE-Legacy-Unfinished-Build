local bfDefaultX = 0;
local bfDefaultY = 0;
local dadDefaultX = 0;
local dadDefaultY = 0;
local xx = 1450;
local yy = 1370;
local ofs = 15;
local ofs2 = 15;
local xx2 = 1450;
local yy2 = 1370;
local followchars = false;
local healthNuhuh = true;
local healthDrain = false;
local beat = 1;

function onCreate()

	setSpriteShader("skyR", "glitch")
	setSpriteShader("mountinsR", "glitch")
	setSpriteShader("waterR", "glitch")
	setSpriteShader("loopR", "glitch")
	setSpriteShader("tvIcons", "glitch")
	setSpriteShader("plateR", "glitch")
	
	setSpriteShader("preyBG", "glitch")
	setSpriteShader("preyFloor", "glitch")

	makeAnimatedLuaSprite('tetraBG', 'bgs/sl4shandfatal/TetraBG', -300, -35);
	setScrollFactor('tetraBG', 1, 1);
	addAnimationByPrefix('tetraBG', 'idle', 'Stage', 24, true);
	setProperty('tetraBG.antialiasing', false);
	addLuaSprite('tetraBG', false);
	scaleObject('tetraBG', 6, 6)

	makeAnimatedLuaSprite('tetraLave', 'bgs/sl4shandfatal/TetraLave', -300, -135);
	setScrollFactor('tetraLave', 1, 1);
	addAnimationByPrefix('tetraLave', 'idle', 'Lava', 8, true);
	setProperty('tetraLave.antialiasing', false);
	addLuaSprite('tetraLave', false);
	scaleObject('tetraLave', 6, 6)
	
	makeLuaSprite('blk', '', 0, 0);
	makeGraphic('blk',1920,1080,'000008')
	addLuaSprite('blk', false);
	setLuaSpriteScrollFactor('blk',0,0)
	setProperty('blk.scale.x',2)
	setProperty('blk.scale.y',2)
	setProperty('blk.alpha',0)
	
	makeLuaSprite('flashingshit', '', 0, 0);
	makeGraphic('flashingshit',1920,1080,'FFFFFF')
	addLuaSprite('flashingshit', false);
	setLuaSpriteScrollFactor('flashingshit',0,0)
	setProperty('flashingshit.scale.x',2)
	setProperty('flashingshit.scale.y',2)
	setProperty('flashingshit.alpha',0)
	setScrollFactor('flashingshit',0,0)
	
	makeLuaSprite('redFlash', '', 0, 0);
	makeGraphic('redFlash',1920,1080,'FF0000')
	addLuaSprite('redFlash', false);
	setLuaSpriteScrollFactor('redFlash',0,0)
	setProperty('redFlash.scale.x',2)
	setProperty('redFlash.scale.y',2)
	setProperty('redFlash.alpha',0)
	setScrollFactor('redFlash',0,0)
	addLuaSprite('redFlash',true)
	setObjectCamera('redFlash','camHUD')
	
end

function onSongStart()
	bfDefaultX = getProperty('boyfriend.x')
	bfDefaultY = getProperty('boyfriend.y')
	dadDefaultX = getProperty('dad.x')
	dadDefaultY = getProperty('dad.y')
	
	doTweenAlpha('flsh','redFlash',0,1,'linear')
	setProperty('redFlash.alpha',1)
	makeGraphic('redFlash', 1920, 1080, 'FFFFFF')
end

function onStartCountdown()
	setProperty('healthBarBG.alpha',0)
	setProperty('healthBar.alpha',0)
	setProperty('iconP1.alpha',0)
	setProperty('iconP2.alpha',0)
end

function opponentNoteHit()
	if healthDrain == true and getProperty('health') > 0.02 then
		setProperty('health', getProperty('health') - 0.01)
	end
end

function onUpdatePost()
	if healthNuhuh == true then
		setProperty('health', 1)
	end
	if curStep == 2896 then
		beat = 0; --no beat lmao
		healthNuhuh = true;
	end
	if curStep == 1536 or curStep == 2880 then
		beat = 1; --slow
	end
	if curStep == 768 or curStep == 830 or curStep == 890 or curStep == 958 or curStep == 1558 or curStep == 2320 or curStep == 2382 or curStep == 2448 or curStep == 2510 then
		beat = 2; --medium
	end
	if curStep == 256 or curStep == 822 or curStep == 878 or curStep == 950 or curStep == 1040 or curStep == 2064 or curStep == 2374 or curStep == 2430 or curStep == 2502 or curStep == 2592 then
		beat = 3; --fast
		healthNuhuh = false;
	end
	setProperty('gf.alpha',0)
	if curStep == 396 or curStep == 460 or curStep == 990 or curStep == 2382 or curStep == 2510 then
		doTweenAlpha('flsh','redFlash',0,0.7,'linear')
		setProperty('redFlash.alpha',1)
		makeGraphic('redFlash', 1920, 1080, 'FF0000')
		setObjectCamera('redFlash','camHUD')
	end
	if curStep == 644 or curStep == 830 or curStep == 958 or curStep == 1168 or curStep == 1812 then
		doTweenAlpha('flsh','redFlash',0,1,'linear')
		setProperty('redFlash.alpha',1)
		makeGraphic('redFlash', 1920, 1080, 'FF0000')
	end
	if curStep == 822 or curStep == 826 or curStep == 950 or curStep == 954 or curStep == 986 or curStep == 1602 or curStep == 1666 or curStep == 1730 or curStep == 1794 or curStep == 1858 or curStep == 1922 or curStep == 1986 or curStep == 2374 or curStep == 2378 or curStep == 2502 or curStep == 2506 then
		doTweenAlpha('flsh','redFlash',0,0.5,'linear')
		setProperty('redFlash.alpha',0.6)
		makeGraphic('redFlash', 1920, 1080, 'FF0000')
	end
	if curStep == 0 then
		setProperty('flashingshit.alpha',1)
		setProperty('dad.color', getColorFromHex('000000'))
		setProperty('boyfriend.color', getColorFromHex('000000'))
		setProperty('gf.visible', false);
		
		noteTweenX('BFInvert1', 4, 90, 0.000001, 'linear');
		noteTweenX('BFInvert2', 5, 205, 0.000001, 'linear');
		noteTweenX('BFInvert3', 6, 315, 0.000001, 'linear');
		noteTweenX('BFInvert4', 7, 425, 0.000001, 'linear');
	
		noteTweenX('DadInvert1', 0, 730, 0.000001, 'linear');
		noteTweenX('DadInvert2', 1, 845, 0.000001, 'linear');
		noteTweenX('DadInvert3', 2, 955, 0.000001, 'linear');
		noteTweenX('DadInvert4', 3, 1065, 0.000001, 'linear');
	end
	if curStep == 256 then
		healthNuhuh = false;
		healthDrain = true;
	
		setObjectCamera('redFlash','camOther')
		
		setProperty('healthBarBG.alpha',1)
		setProperty('healthBar.alpha',1)
		setProperty('iconP1.alpha',1)
		setProperty('iconP2.alpha',1)
	
		doTweenAlpha('flsh','redFlash',0,1,'linear')
		setProperty('redFlash.alpha',1)
		setProperty('dad.color', getColorFromHex('FFFFFF'))
		setProperty('boyfriend.color', getColorFromHex('FFFFFF'))
		setProperty('gf.visible', false);
		setProperty('flashingshit.alpha',0)
		makeGraphic('redFlash', 1920, 1080, 'FF0000')
	end
	if curStep == 512 or curStep == 2064 then
		doTweenAlpha('flsh','redFlash',0,1,'linear')
		setProperty('redFlash.alpha',1)
	
		makeAnimatedLuaSprite('domain2', 'fatal/domain2', -400, 495, 'exe');
		setScrollFactor('domain2', 1, 1);
		addAnimationByPrefix('domain2', 'idle', 'idle', 16, false);
		setProperty('domain2.antialiasing', false);
		addLuaSprite('domain2', false);
		scaleObject('domain2', 4.5, 4.5)
		setScrollFactor('domain2', 1, 1);

		makeAnimatedLuaSprite('domain', 'fatal/domain', -400, 495, 'exe');
		setScrollFactor('domain', 1, 1);
		addAnimationByPrefix('domain', 'idle', 'idle', 12, false);
		setProperty('domain.antialiasing', false);
		addLuaSprite('domain', false);
		scaleObject('domain', 4.5, 4.5)
		setScrollFactor('domain', 1, 1);
		
		setProperty('tetraBG.alpha',0)
		setProperty('tetraLave.alpha',0)
		
		setProperty('domain.alpha',1)
		setProperty('domain2.alpha',1)
		
		removeLuaSprite('FriendlyArgumentFatal');
		removeLuaSprite('FriendlyArgumentSlash');
		removeLuaSprite('Line');
		
		setProperty('dad.x',dadDefaultX)
		setProperty('dad.y',dadDefaultY)
		setProperty('boyfriend.x',bfDefaultX)
		setProperty('boyfriend.y',bfDefaultY)
		
	end
	if curStep == 2196 then
		doTweenAlpha('flsh','redFlash',0,1,'linear')
		setProperty('redFlash.alpha',1)
		makeGraphic('redFlash', 1920, 1080, '33fff1')
	
        runHaxeCode([[
			game.dad.setColorTransform(-1,-1,-1,1,255,255,255,0);
			game.boyfriend.setColorTransform(-1,-1,-1,1,255,255,255,0);
			game.getLuaObject('domain').setColorTransform(-1,-1,-1,1,255,255,255,0);
			game.getLuaObject('domain2').setColorTransform(-1,-1,-1,1,255,255,255,0);
			game.iconP1.setColorTransform(-1,-1,-1,1,255,255,255,0);
			game.iconP2.setColorTransform(-1,-1,-1,1,255,255,255,0);
			game.healthBarBG.setColorTransform(-1,-1,-1,1,255,255,255,0);
			game.healthBar.setColorTransform(-1,-1,-1,1,255,255,255,0);
        ]])
	end
	if curStep == 768 then
		setProperty('domain.alpha',0)
		setProperty('domain2.alpha',0)
	
		setProperty('tetraBG.alpha',1)
		setProperty('tetraLave.alpha',1)
		
		doTweenAlpha('flsh','redFlash',0,1,'linear')
		setProperty('redFlash.alpha',1)
		makeGraphic('redFlash', 1920, 1080, 'FF0000')
	end
	if curStep == 1040 then
		doTweenAlpha('flsh','redFlash',0,1,'linear')
		setProperty('redFlash.alpha',1)
		makeGraphic('redFlash', 1920, 1080, '00ca39')

		setProperty('tetraBG.alpha',0)
		setProperty('tetraLave.alpha',0)

		addHaxeLibrary('FlxBackdrop', 'flixel.addons.display');
		addHaxeLibrary('FlxTween', 'flixel.tweens');
		addHaxeLibrary('FlxEase', 'flixel.tweens');
		addHaxeLibrary('FlxObject', 'flixel');
		
		makeLuaSprite('sky', '', 0, 0);
		makeGraphic('sky', 1920, 1080,'2400B4')
		addLuaSprite('sky', false);
		setLuaSpriteScrollFactor('sky',0,0)
		setProperty('sky.scale.x',2)
		setProperty('sky.scale.y',2)
		
		makeAnimatedLuaSprite('mountins', 'bgs/melt/classic/main', -1600, 462);
		scaleObject('mountins', 7, 7);
		addAnimationByPrefix('mountins', 'idle', 'BG ', 12, true);
		setScrollFactor('mountins', 0.7, 1);
		setProperty('mountins.antialiasing', false);
		addLuaSprite('mountins', false);
		
		makeAnimatedLuaSprite('water', 'bgs/melt/classic/water', -1600, 462);
		scaleObject('water', 7, 7);
		addAnimationByPrefix('water', 'idle', 'BG', 12, true);
		setScrollFactor('water', 0.9, 1);
		setProperty('water.antialiasing', false);
		addLuaSprite('water', false);
		
		makeAnimatedLuaSprite('loop', 'bgs/melt/classic/loop', 500, 400);
		scaleObject('loop', 6, 6);
		addAnimationByPrefix('loop', 'idle', 'loop ', 12, true);
		setScrollFactor('loop', 1.05, 1);
		setProperty('loop.antialiasing', false);
		addLuaSprite('loop', false);
		
		makeAnimatedLuaSprite('tvIcons', 'bgs/melt/tv-icons', 327, 1338);
		scaleObject('tvIcons', 7, 7);
		addAnimationByPrefix('tvIcons', 'melthog1', 'Melthog1 0', 24, true);
		addAnimationByPrefix('tvIcons', 'melthog2', 'Melthog2 0', 24, true);
		addAnimationByPrefix('tvIcons', 'melthog3', 'Melthog3-4 0', 24, true);
		addAnimationByPrefix('tvIcons', 'melthog4', 'Melthog3-4 0', 24, true);
		addAnimationByPrefix('tvIcons', 'melthog5', 'Melthog5-6-7 0', 24, true);
		addAnimationByPrefix('tvIcons', 'melthog6', 'Melthog5-6-7 0', 24, true);
		addAnimationByPrefix('tvIcons', 'melthog7', 'Melthog5-6-7 0', 24, true);
		addAnimationByPrefix('tvIcons', 'melthogs3', 'MelthogS3 0', 24, true);
		addAnimationByPrefix('tvIcons', 'melthogpico', 'Melthog Pico 0', 24, true);
		addAnimationByPrefix('tvIcons', 'melthogbf', 'Melthog BF 0', 24, true);
		setScrollFactor('tvIcons', 1, 1);
		setProperty('tvIcons.antialiasing', false);
		addLuaSprite('tvIcons', false);
	
		makeLuaSprite('plate', 'bgs/melt/classic/plate', -900, 900);
		scaleObject('plate', 6, 6);
		setScrollFactor('plate', 1.1, 1);
		setProperty('plate.antialiasing', false);
		addLuaSprite('plate', false);
		
		makeAnimatedLuaSprite('floor', 'bgs/melt/classic/Melthog_S1_stage', -1850, 400);
		scaleObject('floor', 7, 7);
		addAnimationByPrefix('floor', 'idle', 'S1 Stage', 12, true);
		setScrollFactor('floor', 1, 1);
		setProperty('floor.antialiasing', false);
		addLuaSprite('floor', false);

		setProperty('dadGroup.x',900)
		setProperty('dadGroup.y',790)
		
		setProperty('boyfriendGroup.x',75)
		setProperty('boyfriendGroup.y',1002)
	end
	if curStep == 1296 then
		removeLuaSprite('sky')
		removeLuaSprite('mountins')
		removeLuaSprite('water')
		removeLuaSprite('loop')
		removeLuaSprite('tvIcons')
		removeLuaSprite('plate')
		removeLuaSprite('floor')
	
		doTweenAlpha('flsh','redFlash',0,1,'linear')
		setProperty('redFlash.alpha',1)
		makeGraphic('redFlash', 1920, 1080, '1e00ff')
	
		makeLuaSprite('fucklesBGPixel', 'chaotix/horizonsky', -1450, 725, 'exe');
		scaleObject('fucklesBGPixel', 1, 1);
		setScrollFactor('fucklesBGPixel', 1.2, 0.9);
		setProperty('fucklesBGPixel.antialiasing', false);
		addLuaSprite('fucklesBGPixel', false);
	
		makeLuaSprite('fucklesFGPixel', 'chaotix/horizonFg', -550, 735, 'exe');
		scaleObject('fucklesFGPixel', 1, 1);
		setScrollFactor('fucklesFGPixel', 1, 1);
		setProperty('fucklesFGPixel.antialiasing', false);
		addLuaSprite('fucklesFGPixel', false);

		setProperty('boyfriendGroup.y',1500)
		setProperty('dad.y',1630)
	end
	if curStep == 1424 then
		doTweenAlpha('flsh','redFlash',0,1,'linear')
		setProperty('redFlash.alpha',1)
		makeGraphic('redFlash', 1920, 1080, 'FF0000')

		removeLuaSprite('fucklesBGPixel')
		removeLuaSprite('fucklesFGPixel')

		setProperty('dadGroup.x',900)
		setProperty('dadGroup.y',280)
		
		setProperty('boyfriendGroup.x',75)
		setProperty('boyfriendGroup.y',1002)

		makeLuaSprite('skyR', '', 0, 0);
		makeGraphic('skyR', 1920, 1080,'4C0707')
		addLuaSprite('skyR', false);
		setLuaSpriteScrollFactor('skyR',0,0)
		setProperty('skyR.scale.x',2)
		setProperty('skyR.scale.y',2)
		setProperty('skyR.alpha', 1)
	
		makeAnimatedLuaSprite('mountinsR', 'bgs/melt/alt/main', -1600, 462);
		scaleObject('mountinsR', 7, 7);
		addAnimationByPrefix('mountinsR', 'idle', 'BG ', 12, true);
		setScrollFactor('mountinsR', 0.7, 1);
		setProperty('mountinsR.antialiasing', false);
		setProperty('mountinsR.alpha', 1);
		addLuaSprite('mountinsR', false);
		
		makeAnimatedLuaSprite('waterR', 'bgs/melt/alt/water', -1600, 462);
		scaleObject('waterR', 7, 7);
		addAnimationByPrefix('waterR', 'idle', 'BG', 12, true);
		setScrollFactor('waterR', 0.9, 1);
		setProperty('waterR.antialiasing', false);
		setProperty('waterR.alpha', 1);
		addLuaSprite('waterR', false);
		
		makeAnimatedLuaSprite('loopR', 'bgs/melt/alt/loop_red', 500, 400);
		scaleObject('loopR', 6, 6);
		addAnimationByPrefix('loopR', 'idle', 'loop_red ', 12, true);
		setScrollFactor('loopR', 1.05, 1);
		setProperty('loopR.antialiasing', false);
		setProperty('loopR.alpha', 1);
		addLuaSprite('loopR', false);
		
		makeAnimatedLuaSprite('tvIcons', 'bgs/melt/tv-icons', 327, 1338);
		scaleObject('tvIcons', 7, 7);
		addAnimationByPrefix('tvIcons', 'melthog1', 'Melthog1 0', 24, true);
		addAnimationByPrefix('tvIcons', 'melthog2', 'Melthog2 0', 24, true);
		addAnimationByPrefix('tvIcons', 'melthog3', 'Melthog3-4 0', 24, true);
		addAnimationByPrefix('tvIcons', 'melthog4', 'Melthog3-4 0', 24, true);
		addAnimationByPrefix('tvIcons', 'melthog5', 'Melthog5-6-7 0', 24, true);
		addAnimationByPrefix('tvIcons', 'melthog6', 'Melthog5-6-7 0', 24, true);
		addAnimationByPrefix('tvIcons', 'melthog7', 'Melthog5-6-7 0', 24, true);
		addAnimationByPrefix('tvIcons', 'melthogs3', 'MelthogS3 0', 24, true);
		addAnimationByPrefix('tvIcons', 'melthogpico', 'Melthog Pico 0', 24, true);
		addAnimationByPrefix('tvIcons', 'melthogbf', 'Melthog BF 0', 24, true);
		setScrollFactor('tvIcons', 1, 1);
		setProperty('tvIcons.antialiasing', false);
		addLuaSprite('tvIcons', false);
		objectPlayAnimation('tvIcons', 'melthogbf', true)
		
		makeLuaSprite('plateR', 'bgs/melt/alt/plate_red', -900, 900);
		scaleObject('plateR', 6, 6);
		setScrollFactor('plateR', 1.1, 1);
		setProperty('plateR.antialiasing', false);
		setProperty('plateR.alpha', 1);
		addLuaSprite('plateR', false);
		
		makeAnimatedLuaSprite('floorR', 'bgs/melt/alt/Melthog_S1_stage_red', -1850, 400);
		scaleObject('floorR', 7, 7);
		addAnimationByPrefix('floorR', 'idle', 'S1_red Stage', 12, true);
		setScrollFactor('floorR', 1, 1);
		setProperty('floorR.antialiasing', false);
		setProperty('floorR.alpha', 1);
		addLuaSprite('floorR', false);
		
	end
	if curStep == 1520 then
		setProperty('tetraBG.alpha',1)
		setProperty('tetraLave.alpha',1)
		
		doTweenAlpha('flsh','redFlash',0,1,'linear')
		setProperty('redFlash.alpha',1)
		makeGraphic('redFlash', 1920, 1080, 'FF0000')
		
		removeLuaSprite('fucklesBGPixel')
		removeLuaSprite('fucklesFGPixel')
		
		setProperty('dad.x',dadDefaultX)
		setProperty('dad.y',dadDefaultY)
		setProperty('boyfriend.x',bfDefaultX)
		setProperty('boyfriend.y',bfDefaultY)
		
		removeLuaSprite('skyR')
		removeLuaSprite('mountinsR')
		removeLuaSprite('waterR')
		removeLuaSprite('loopR')
		removeLuaSprite('tvIcons')
		removeLuaSprite('plateR')
		removeLuaSprite('floorR')
	end
	if curStep == 1556 then
		doTweenAlpha('flsh','redFlash',0,1,'linear')
		setProperty('redFlash.alpha',1)
		makeGraphic('redFlash', 1920, 1080, 'FF0000')

		makeLuaSprite('FriendlyArgumentSlash', 'bgs/sl4shandfatal/slashPOV', 300, 765);
		scaleObject('FriendlyArgumentSlash', 1.8, 1.8);
		setScrollFactor('FriendlyArgumentSlash', 1, 1);
		setProperty('FriendlyArgumentSlash.antialiasing', false);
		addLuaSprite('FriendlyArgumentSlash', false);
		setProperty('FriendlyArgumentSlash.alpha',1)

		makeLuaSprite('FriendlyArgumentFatal', 'bgs/sl4shandfatal/fatalPOV', 300, 765);
		scaleObject('FriendlyArgumentFatal', 1.8, 1.8);
		setScrollFactor('FriendlyArgumentFatal', 1, 1);
		setProperty('FriendlyArgumentFatal.antialiasing', false);
		addLuaSprite('FriendlyArgumentFatal', false);
		setProperty('FriendlyArgumentFatal.alpha',1)
		
		makeLuaSprite('Line', 'bgs/sl4shandfatal/line', 300, 765);
		scaleObject('Line', 1.8, 1.8);
		setScrollFactor('Line', 1, 1);
		setProperty('Line.antialiasing', false);
		addLuaSprite('Line', false);
		setProperty('Line.alpha',1)
		
		setObjectOrder('FriendlyArgumentSlash',1)
		setObjectOrder('boyfriendGroup',2)
		setObjectOrder('FriendlyArgumentFatal',3)
		setObjectOrder('dadGroup',4)
		setObjectOrder('Line',5)
		
		setProperty('tetraBG.alpha',0)
		setProperty('tetraLave.alpha',0)
		
		triggerEvent('Change Character', 'bf', 'FrontViewSl4sh-playable')
		triggerEvent('Change Character', 'dad', 'true-fatal-tetra')
		
		setProperty('boyfriend.x',550)
		setProperty('boyfriend.y',1450)
		setProperty('dad.x',1770)
		setProperty('dad.y',1258)
		
		followchars = true;
	end
	if curStep == 2064 then
		followchars = false;
		triggerEvent('Change Character', 'bf', 'sl4sh-playable')
		triggerEvent('Change Character', 'dad', 'fatal-tetra')
		setObjectOrder('boyfriendGroup',100)
		setObjectOrder('dadGroup',101)
		
		doTweenAlpha('flsh','redFlash',0,1,'linear')
		setProperty('redFlash.alpha',1)
		makeGraphic('redFlash', 1920, 1080, 'FF0000')
	end
	if curStep == 2192 then
		makeLuaSprite('RSOD', 'bgs/fatal-encore/Error_Screen', 0, 0);
		setProperty('RSOD.scale.x',0.7)
		setProperty('RSOD.scale.y',0.7)
		setScrollFactor('RSOD', 0, 0);
		screenCenter('RSOD');
		setProperty('RSOD.antialiasing', true);
		setProperty('RSOD.alpha', 1);
		addLuaSprite('RSOD', false);
		setObjectCamera('RSOD', 'camHUD')
		
		setProperty('healthBarBG.alpha',0)
		setProperty('healthBar.alpha',0)
		setProperty('iconP1.alpha',0)
		setProperty('iconP2.alpha',0)
	end
	if curStep == 2196 then
		removeLuaSprite('RSOD')
		
		setProperty('healthBarBG.alpha',1)
		setProperty('healthBar.alpha',1)
		setProperty('iconP1.alpha',1)
		setProperty('iconP2.alpha',1)
	end
	if curStep == 2320 then
		doTweenAlpha('flsh','redFlash',0,1,'linear')
		setProperty('redFlash.alpha',1)
		makeGraphic('redFlash', 1920, 1080, 'fff700')
		setObjectCamera('redFlash','camOther')
	
		runHaxeCode([[
			game.dad.setColorTransform(1,1,1,1,0,0,0,0);
			game.boyfriend.setColorTransform(1,1,1,1,0,0,0,0);
			game.getLuaObject('domain').setColorTransform(1,1,1,1,0,0,0,0);
			game.getLuaObject('domain2').setColorTransform(1,1,1,1,0,0,0,0);
			game.iconP1.setColorTransform(1,1,1,1,0,0,0,0);
			game.iconP2.setColorTransform(1,1,1,1,0,0,0,0);
			game.healthBarBG.setColorTransform(1,1,1,1,0,0,0,0);
			game.healthBar.setColorTransform(1,1,1,1,0,0,0,0);
		]])
		setProperty('tetraBG.alpha',0)
		setProperty('tetraLave.alpha',0)
		
		setProperty('domain.alpha',0)
		setProperty('domain2.alpha',0)

		makeAnimatedLuaSprite('sonicalt-flipped', 'bgs/sally-bg/pixel/sonic_alt', -50, 530);
		scaleObject('sonicalt-flipped', 9, 9);
		addAnimationByPrefix('sonicalt-flipped', 'idle', 'Sonic_Alt', 12, true);
		setScrollFactor('sonicalt-flipped', 1, 1);
		setProperty('sonicalt-flipped.antialiasing', false);
		addLuaSprite('sonicalt-flipped', false);
		setProperty('sonicalt-flipped.flipX',true)
		
		makeAnimatedLuaSprite('sonicalt', 'bgs/sally-bg/pixel/sonic_alt', 2170, 530);
		scaleObject('sonicalt', 9, 9);
		addAnimationByPrefix('sonicalt', 'idle', 'Sonic_Alt', 12, true);
		setScrollFactor('sonicalt', 1, 1);
		setProperty('sonicalt.antialiasing', false);
		addLuaSprite('sonicalt', false);

		makeLuaSprite('goddessPinball', 'bgs/sally-bg/pixel/pinball', -100, 335);
		scaleObject('goddessPinball', 9, 9);
		setScrollFactor('goddessPinball', 1, 1);
		setProperty('goddessPinball.antialiasing', false);
		addLuaSprite('goddessPinball', false);
		setProperty('goddessPinball.alpha',1)
		
		makeLuaSprite('goddessStage', 'bgs/sally-bg/pixel/floor', -100, 335);
		scaleObject('goddessStage', 9, 9);
		setScrollFactor('goddessStage', 1, 1);
		setProperty('goddessStage.antialiasing', false);
		addLuaSprite('goddessStage', false);
		setProperty('goddessStage.alpha',1)
	
		setProperty('boyfriend.x',800)
		setProperty('dad.x',1520)
	end
	if curStep == 2592 then
		doTweenAlpha('flsh','redFlash',0,1,'linear')
		setProperty('redFlash.alpha',1)
		makeGraphic('redFlash', 1920, 1080, 'FF0000')
		setObjectCamera('redFlash','camHUD')

		removeLuaSprite('sonicalt-flipped')
		removeLuaSprite('sonicalt')
		removeLuaSprite('goddessPinball')
		removeLuaSprite('goddessStage')

		makeLuaSprite('preyBG', 'bgs/sl4shandfatal/preyBG', -350, 105);
		scaleObject('preyBG', 4.7, 4.7);
		setScrollFactor('preyBG', 0.4, 1);
		setProperty('preyBG.antialiasing', false);
		addLuaSprite('preyBG', false);
		setProperty('preyBG.alpha',1)
		
		makeLuaSprite('preyFloor', 'bgs/prey/stardustFloor', -100, 835);
		scaleObject('preyFloor', 1, 1);
		setScrollFactor('preyFloor', 1, 1);
		setProperty('preyFloor.antialiasing', false);
		addLuaSprite('preyFloor', true);
		setProperty('preyFloor.alpha',1)
		
		setProperty('tetraBG.alpha',0)
		setProperty('tetraLave.alpha',0)
		
	end
	if curStep == 2720 then
		doTweenAlpha('flsh','redFlash',0,1,'linear')
		setProperty('redFlash.alpha',1)
		makeGraphic('redFlash', 1920, 1080, '0e00a2')

		makeAnimatedLuaSprite('horizonCorrupt', 'chaotix/corrupt_background', -1050, 265, 'exe');
		scaleObject('horizonCorrupt', 1, 1);
		addAnimationByPrefix('horizonCorrupt', 'idle', 'corrupt background', 24, true);
		setScrollFactor('horizonCorrupt', 1.2, 0.9);
		setProperty('horizonCorrupt.antialiasing', false);
		addLuaSprite('horizonCorrupt', false);
		
		makeLuaSprite('fucklesFGCorrupt', 'chaotix/horizonFuckedUp', -610, 265, 'exe');
		scaleObject('fucklesFGCorrupt', 1, 1);
		setScrollFactor('fucklesFGCorrupt', 1, 1);
		setProperty('fucklesFGCorrupt.antialiasing', false);
		addLuaSprite('fucklesFGCorrupt', false);
		
		removeLuaSprite('preyBG')
		removeLuaSprite('preyFloor')
		
		setProperty('dad.y',dadDefaultY - 13)
		setProperty('boyfriend.x',bfDefaultX)
		setProperty('boyfriend.y',bfDefaultY - 5)
	end
	if curStep == 2784 then
		removeLuaSprite('fucklesFGCorrupt')
		removeLuaSprite('horizonCorrupt')
		
		setProperty('tetraBG.alpha',1)
		setProperty('tetraLave.alpha',1)
		
		doTweenAlpha('flsh','redFlash',0,1,'linear')
		setProperty('redFlash.alpha',1)
		makeGraphic('redFlash', 1920, 1080, 'FF0000')
	end
	if curStep == 2880 then
		doTweenAlpha('dadGroup','dadGroup',0,1.5,'linear')
		doTweenAlpha('boyfriendGroup','boyfriendGroup',0,1.5,'linear')
		doTweenAlpha('tetraBG','tetraBG',0,1.5,'linear')
		doTweenAlpha('tetraLave','tetraLave',0,1.5,'linear')
		doTweenAlpha('camHUD','camHUD',0,1.5,'linear')
	end
	if curStep == 2896 then
		doTweenAlpha('flsh','redFlash',0,1,'linear')
		setProperty('redFlash.alpha',1)
		makeGraphic('redFlash', 1920, 1080, 'FFFFFF')
		setObjectCamera('redFlash','camOther')
		
		setProperty('cpuControlled', true)
	end
	if curStep == 3043 then
		setProperty('cpuControlled', false)
	end
end

function onBeatHit()
	if curBeat % 1 == 0 then
		objectPlayAnimation('domain', 'idle', true)
		objectPlayAnimation('domain2', 'idle', true)
	end
	
	if curBeat % 4 == 0 and beat == 1 then --slow
		triggerEvent('Add Camera Zoom', 0.025, 0.025)
	end
	if curBeat % 2 == 0 and beat == 2 then --medium, probably wont use
		triggerEvent('Add Camera Zoom', 0.027, 0.027)
	end
	if curBeat % 1 == 0 and beat == 3 then --fast, probably use a lot
		triggerEvent('Add Camera Zoom', 0.03, 0.03)
	end
end

function onUpdate(elapsed)
    songPos = getPropertyFromClass('Conductor', 'songPosition');
 
    currentBeat = (songPos / 300) * (bpm / 180)
	if followchars == true then
        if mustHitSection == false then
			if getProperty('dad.animation.curAnim.name') == 'singLEFT' or getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
			if getProperty('dad.animation.curAnim.name') == 'singRIGHT' or getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
			if getProperty('dad.animation.curAnim.name') == 'singUP' or getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
			if getProperty('dad.animation.curAnim.name') == 'singDOWN' or getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
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
			if getProperty('boyfriend.animation.curAnim.name') == 'singLEFTmiss' then
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
            if getProperty('boyfriend.animation.curAnim.name') == 'hey' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' or getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
        triggerEvent('Camera Follow Pos','','')
	end
end