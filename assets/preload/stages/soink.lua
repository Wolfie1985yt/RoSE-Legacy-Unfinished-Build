local xx = -250;
local yy = 420;
local ofs = 15;
local ofs2 = 15;
local xx2 = 350;
local yy2 = 420;
local followchars = true;

local beat = 0;

local chromFreq = 2;
local chromAmount = 0.65;
local activated = false;
local dadIcon = 'soink';

local invertRN = false;

function onCreate()
	addHaxeLibrary('HealthIcon');
	addCharacterToList('soink-side','dad');
	addCharacterToList('bf-side','bf');
	addCharacterToList('bf-side-white','bf');

	makeLuaSprite('whiteSideBG', '', -850, 0);
	makeGraphic('whiteSideBG',1920,1080,'FFFFFF')
	addLuaSprite('whiteSideBG', false);
	setLuaSpriteScrollFactor('whiteSideBG',1,1)
	setProperty('whiteSideBG.scale.x',2)
	setProperty('whiteSideBG.scale.y',2)
	setProperty('whiteSideBG.alpha',0)
	
	makeLuaSprite('blackSideBG', '', 784, 0);
	makeGraphic('blackSideBG',1920,1080,'000000')
	addLuaSprite('blackSideBG', false);
	setLuaSpriteScrollFactor('blackSideBG',1,1)
	setProperty('blackSideBG.scale.x',2)
	setProperty('blackSideBG.scale.y',2)
	setProperty('blackSideBG.alpha',0)
	
	makeAnimatedLuaSprite('SideBG', 'bgs/flashcard/bg-2', -1305, -260);
	scaleObject('SideBG', 1.8, 1.8);
	addAnimationByPrefix('SideBG', 'idle', 'idle', 24, true);
	setScrollFactor('SideBG', 1, 1);
	setProperty('SideBG.antialiasing', true);
	addLuaSprite('SideBG', false);
	setProperty('SideBG.alpha',0)

	makeLuaSprite('blackScreen', '', 0, 0);
	makeGraphic('blackScreen',1920,1080,'000000')
	addLuaSprite('blackScreen', true);
	setLuaSpriteScrollFactor('blackScreen',0,0)
	setProperty('blackScreen.scale.x',2)
	setProperty('blackScreen.scale.y',2)
	setProperty('blackScreen.alpha',1)

	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash',1920,1080,'FFFFFF')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash',0,0)
	setProperty('flash.scale.x',2)
	setProperty('flash.scale.y',2)
	setProperty('flash.alpha',0)
	
	setProperty('camHUD.alpha',0)
	setProperty('SoinkAnimate.alpha',0)
	setProperty('FatalEncoreTray.alpha',0)
	setProperty('FatalEncoreTrayIcons.alpha',0)
	setProperty('FatalEncoreUsername.alpha',0)
	setProperty('FatalEncorePCTime.alpha',0)
	setProperty('FatalEncorePCDay.alpha',0)
end

function onCreatePost()
	shaderCoordFix()
    initLuaShader('ChromaticAbberation')
    makeLuaSprite('chromGraphic')
    makeGraphic("chromShader", screenWidth, screenHeight)
    makeLuaSprite('chromX',nil,0,0)
	
	initLuaShader('invert')
	makeLuaSprite("invertGraphic")
	makeGraphic("invertShader", screenWidth, screenHeight)
	
	runHaxeCode([[
		game.SoinkAnimateGlitch.alpha = 0;
	]])
end

function onBeatHit()
	if beat == 1 then
		if curBeat % 2 == 0 then
			triggerEvent('Add Camera Zoom')
			triggerEvent('Add Camera Zoom')
		end
	end
	if beat == 2 then
		if curBeat % 2 == 0 then
			triggerEvent('Add Camera Zoom')
			triggerEvent('Add Camera Zoom')
		else
			triggerEvent('Add Camera Zoom')
			triggerEvent('Add Camera Zoom')
		end
	end
	if beat == 3 then
		if curBeat % 2 == 0 then
			triggerEvent('Add Camera Zoom')
		end
	end
	if beat == 4 then
		if curBeat % 2 == 0 then
			triggerEvent('Add Camera Zoom')
		else
			triggerEvent('Add Camera Zoom')
		end
	end
	if dadIcon == 'soink-glitch' and getProperty('dad.animation.curAnim.name') == 'idle' then
		runHaxeCode([[
			if (']]..dadIcon..[[' != 'soink')
				game.iconP2.changeIconAnimated('soink');
		]])
		dadIcon = 'soink';
	end
end

function onStepHit()
	if songName == "flashcard" then
		if curStep == 0 then
			triggerEvent('Camera_Tween_Zoom',"0.4, 11","quadOut")
		end
		if curStep == 80 then
			setProperty('dad.alpha',0)
			setProperty('boyfriend.alpha',0)
			doTweenAlpha('blackScreen','blackScreen',0,1,'linear')
		end
		if curStep == 112 then
			doTweenAlpha('blackScreen','blackScreen',1,1.2,'linear')
		end
		if curStep == 128 then
			cancelTween('flsh');
			setProperty('blackScreen.alpha',0)
			setProperty('flash.alpha',1)
			setProperty('flash.color', getColorFromHex('FFFFFF'))
			doTweenAlpha('flsh','flash',0,1,'linear')
			setProperty('defaultCamZoom',0.4)
			setProperty('dad.alpha',1)
			setProperty('boyfriend.alpha',1)
			setProperty('SoinkAnimate.alpha',1)
			setProperty('FatalEncoreTray.alpha',1)
			setProperty('FatalEncoreTrayIcons.alpha',1)
			setProperty('FatalEncoreUsername.alpha',1)
			setProperty('FatalEncorePCTime.alpha',1)
			setProperty('FatalEncorePCDay.alpha',1)
			doTweenAlpha('camHUD','camHUD',1,0.3,'linear')
		end
		if curStep == 256 or curStep == 768 then
			cancelTween('flsh');
			setProperty('flash.alpha',1)
			setProperty('flash.color', getColorFromHex('FFFFFF'))
			doTweenAlpha('flsh','flash',0,1,'linear')
		end
		if curStep == 128 or curStep == 196 or curStep == 240 or curStep == 1024 or curStep == 1252 or curStep == 1536 then
			beat = 4;
		end
		if curStep == 187 or curStep == 225 or curStep == 752 or curStep == 1146 or curStep == 1182 or curStep == 1199 or curStep == 1243 or curStep == 1264 or curStep == 1824 then
			beat = 0;
		end
		if curStep == 512 or curStep == 768 then
			beat = 3;
		end
		if curStep == 1152 or curStep == 1188 or curStep == 1220 then
			beat = 2;
		end
		if curStep == 254 or curStep == 255 or curStep == 318 or curStep == 319 or curStep == 382 or curStep == 383 or curStep == 446 or curStep == 447 or curStep == 504 or curStep == 505 or curStep == 506 or curStep == 507 or curStep == 1182 or curStep == 1184 or curStep == 1186 or curStep == 1200 or curStep == 1202 or curStep == 1203 or curStep == 1204 or curStep == 1206 or curStep == 1216 or curStep == 1217 or curStep == 1218 or curStep == 1219 or curStep == 1244 or curStep == 1246 or curStep == 1247 or curStep == 1248 or curStep == 1250 or curStep == 1280 or curStep == 1312 or curStep == 1328 or curStep == 1344 or curStep == 1360 or curStep == 1368 or curStep == 1376 or curStep == 1392 or curStep == 1400 or curStep == 1424 or curStep == 1432 or curStep == 1440 or curStep == 1456 or curStep == 1464 or curStep == 1472 or curStep == 1496 or curStep == 1602 or curStep == 1603 or curStep == 1814 or curStep == 1815 or curStep == 1818 or curStep == 1819 or curStep == 1822 or curStep == 1823 then
			triggerEvent('Add Camera Zoom')
		end
		if curStep == 1208 then
			triggerEvent('Add Camera Zoom')
			triggerEvent('Add Camera Zoom')
		end
		if curStep == 1408 or curStep == 1440 or curStep == 1472 then
			triggerEvent('Add Camera Zoom')
			triggerEvent('Add Camera Zoom')
			cancelTween('flsh');
			setProperty('flash.alpha',0.7)
			setProperty('flash.color', getColorFromHex('FFFFFF'))
			doTweenAlpha('flsh','flash',0,1,'linear')
		end
		if curStep == 1152 or curStep == 1156 or curStep == 1160 or curStep == 1164 or curStep == 1168 or curStep == 1172 or curStep == 1176 or curStep == 1180 or curStep == 1188 or curStep == 1192 or curStep == 1196 or curStep == 1205 or curStep == 1209 or curStep == 1220 or curStep == 1224 or curStep == 1228 or curStep == 1232 or curStep == 1236 or curStep == 1240 or curStep == 1244 or curStep == 1228 or curStep == 1252 or curStep == 1256 or curStep == 1260 or curStep == 1264 then
			invertSwitch();
			invertToggle();
		end
		if curStep == 1024 then
			runHaxeCode([[
				game.canPause = false;
			]])
		end
		if curStep == 1248 then
			doTweenAlpha('blackScreen','blackScreen',1,2.65,'linear')
			doTweenAlpha('camHUD','camHUD',0.5,2.8,'linear')
		end
		if curStep == 1280 then
			runHaxeCode([[
				game.canPause = true;
			]])
			invertRN = false;
			invertToggle();
		end
		if curStep == 1280 then --4
			doTweenAlpha('camHUD','camHUD',1,0.25,'linear')
			doTweenAlpha('blackScreen','blackScreen',0,7,'linear')
			setProperty('whiteSideBG.alpha',1)
			setProperty('blackSideBG.alpha',1)
			triggerEvent('Change Character', '1', 'soink-side');
			triggerEvent('Change Character', '0', 'bf-side-white');
			setProperty('dad.color', getColorFromHex('000000'))
			setProperty('defaultCamZoom',0.59)
			xx = -150;
			yy = 380;
			xx2 = -150;
			yy2 = 380;
			
			doTweenAlpha('scoreTxt','scoreTxt', 0, 0.3,'linear')
			doTweenAlpha('iconP1','iconP1', 0, 0.3,'linear')
			doTweenAlpha('iconP2','iconP2', 0, 0.3,'linear')
			doTweenAlpha('healthBar','healthBar', 0, 0.3,'linear')
			doTweenAlpha('healthBarBG','healthBarBG', 0, 0.3,'linear')
			doTweenAlpha('timeBar','timeBar', 0, 0.15,'linear')
			doTweenAlpha('timeBarBGBG','timeBarBGBG', 0, 0.15,'linear')
			doTweenAlpha('timeBarBG','timeBarBG', 0, 0.15,'linear')
			doTweenAlpha('timeTxt','timeTxt', 0, 0.15,'linear')
		end
		if curStep == 1536 then --6
			cancelTween('flsh');
			setProperty('flash.alpha',1)
			setProperty('flash.color', getColorFromHex('FFFFFF'))
			doTweenAlpha('flsh','flash',0,1,'linear')
			setProperty('whiteSideBG.alpha',0)
			setProperty('blackSideBG.alpha',0)
			setProperty('SideBG.alpha',1)
			setProperty('dad.color', getColorFromHex('FFFFFF'))
			triggerEvent('Change Character', '0', 'bf-side');
			setProperty('defaultCamZoom',0.57)
		end
		if curStep == 1824 then
			doTweenAlpha('camHUD','camHUD',0,1.4,'linear')
		end
		if curStep == 1840 then
			doTweenAlpha('blackScreen','blackScreen',1,5.5,'linear')
		end
	end
end

function invertSwitch() if invertRN then invertRN = false; else invertRN = true; end end

function onUpdate()
	setShaderFloat("invertGraphic", "iTime", os.clock())
	runHaxeCode([[
		if (game.SoinkAnimateGlitch.alpha > 0)
			game.SoinkAnimateGlitch.alpha -= 0.05;
	]])
    if enabled then
        setShaderFloat('chromGraphic', "amount", getProperty('chromX.x'))
        if not activated and chromAmount == 0 and getProperty('chromX.x') <= 0 then
            removeSpriteShader('chromGraphic')
            enabled = false
        end
    end
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
function chromToggle(ye)
    if ye then
        if not activated then
			setSpriteShader("invertShader", "invertGraphic")
			setSpriteShader("chromShader", 'chromGraphic')
			runHaxeCode([[
				chromToggle = game.createRuntimeShader('ChromaticAbberation');
				shader0 = game.createRuntimeShader('invert');
				//game.camGame.setFilters([new ShaderFilter(chromToggle), new ShaderFilter(shader0)]);
				game.camGame.setFilters([new ShaderFilter(chromToggle)]);
				game.getLuaObject('chromGraphic').shader = chromToggle;
				game.getLuaObject("invertGraphic").shader = shader0;
				return;
			]])
            activated = true
            enabled = true
        end
    else
        if activated then
            doTweenX('chromLol','chromX',0,0.25,'linear')
            activated = false
        end
    end
end
function invertToggle()
	if invertRN then
		runHaxeCode([[
			game.camGame.setFilters([new ShaderFilter(chromToggle), new ShaderFilter(shader0)]);
		]])
	else
		runHaxeCode([[
			game.camGame.setFilters([new ShaderFilter(chromToggle)]);
		]])
	end
end
function doTheCoolChromEffect(v1, v2)
	if v1 ~= ''  then
		chromAmount = tonumber(v1)
		chromFreq = tonumber(v2)
	end
	if value2 ~= '' then
		chromFreq = tonumber(v2)
	end
	if chromAmount ~= 0 and chromAmount ~= nil and chromFreq ~= nil and chromFreq ~= 0 then
		chromToggle(true)
		setProperty('chromX.x',chromAmount)
		doTweenX('chromLol','chromX',0,0.45,'linear')
	else
		chromToggle(false)
	end
end
function onDestroy()
	runHaxeCode([[
		FlxG.signals.gameResized.remove(fixShaderCoordFix);
	]])
end
function opponentNoteHit(note, data, type, sus)
	if type == 'Alt Animation' then
		doTheCoolChromEffect(2, 2);
		runHaxeCode([[
			if (']]..dadIcon..[[' != 'soink-glitch')
				game.iconP2.changeIconAnimated('soink-glitch');
		]])
		dadIcon = 'soink-glitch';
		runHaxeCode([[
			game.SoinkAnimateGlitch.alpha = 1;
		]])
	else
		runHaxeCode([[
			if (']]..dadIcon..[[' != 'soink')
				game.iconP2.changeIconAnimated('soink');
		]])
		dadIcon = 'soink';
	end
end

function shaderCoordFix()
    runHaxeCode([[
        resetCamCache = function(?spr) {
            if (spr == null || spr.filters == null) return;
            spr.__cacheBitmap = null;
            spr.__cacheBitmapData = null;
        }
        
        fixShaderCoordFix = function(?_) {
            resetCamCache(game.camGame.flashSprite);
            resetCamCache(game.camHUD.flashSprite);
            resetCamCache(game.camOther.flashSprite);
        }
    
        FlxG.signals.gameResized.add(fixShaderCoordFix);
        fixShaderCoordFix();
        return;
    ]])
    
    local temp = onDestroy
    function onDestroy()
        runHaxeCode([[
            FlxG.signals.gameResized.remove(fixShaderCoordFix);
            return;
        ]])
        if (temp) then temp() end
    end
end