local xx = 1000;
local yy = 750;
local ofs = 40;
local ofs2 = 40;
local xx2 = 1200;
local yy2 = 750;
local followchars = false;

local darkDadX = 0;
local darkDadY = 0;
local darkBfX = 0;
local darkBfY = 0;
local darkOfsDad = 45;
local darkOfsBF = 45;
local darkCamMovement = false;
local darkMoveBFSpeed = 0.15;
local darkMoveDadSpeed = 0.07;

local camMoveX = 710;
local moveCamX = false;
local centerNotes = true;
local stopIt = false;
local camShakeOnOpponentNoteHit = false;
local hideCombo = true;

local chromFreq = 2;
local chromAmount = 0.65;
local enabled = false;
local activated = false;
local Pulse = 1;

local cams = {'camHUD', 'camOther'}
function onCreate()
	addHaxeLibrary('objects.HealthIcon');
	addHaxeLibrary('psychlua.FunkinLua');
	addHaxeLibrary('backend.ClientPrefs');

	makeLuaSprite('bg', 'bgs/for-you/bg', -450, -300);
	scaleObject('bg',1.2, 1.2);
	
	makeLuaSprite('lamp', 'bgs/for-you/lamp', 1780, 500);
	setLuaSpriteScrollFactor('lamp',0.85,0.8);
	scaleObject('lamp',1.3, 1.3);
	
	makeLuaSprite('luz', 'bgs/for-you/luz', -450, -300);
	scaleObject('luz',1.2, 1.2);

	makeLuaSprite('luz1', 'bgs/for-you/luz1', -450, -200);
	setLuaSpriteScrollFactor('luz1',0.9,1.9);
	scaleObject('luz1',1.2, 1.2);
	setBlendMode('luz1', 'add')

    addLuaSprite('luz1', true);
	addLuaSprite('luz', true);
	addLuaSprite('bg', false);
	addLuaSprite('lamp', true);
	
	setProperty('luz1.alpha', 0);
	setProperty('luz.alpha', 0);
	setProperty('bg.alpha', 0);
	setProperty('lamp.alpha', 0);
	
	makeLuaSprite('vg', 'bgs/for-you/vg', 0, 0);
	setLuaSpriteScrollFactor('vg',0,0)
	scaleObject('vg',1.1, 1.1);
	screenCenter('vg')
	setObjectCamera('vg', 'camOther')
	addLuaSprite('vg', true);
	
	makeLuaSprite('blackScreenBehind', '', 0, 0);
	makeGraphic('blackScreenBehind',1920,1080,'FFFFFF')
	addLuaSprite('blackScreenBehind', true);
	screenCenter('blackScreenBehind')
	setLuaSpriteScrollFactor('blackScreenBehind',0,0)
	setProperty('blackScreenBehind.scale.x',4)
	setProperty('blackScreenBehind.scale.y',4)
	setProperty('blackScreenBehind.alpha', 0);
	setObjectCamera('blackScreenBehind', 'camHUD')
	
	makeLuaSprite('blackScreen', '', 0, 0);
	makeGraphic('blackScreen',1920,1080,'000000')
	addLuaSprite('blackScreen', true);
	screenCenter('blackScreen')
	setLuaSpriteScrollFactor('blackScreen',0,0)
	setProperty('blackScreen.scale.x',4)
	setProperty('blackScreen.scale.y',4)
	setProperty('blackScreen.alpha', 1);
	setObjectCamera('blackScreen', 'camOther')
	
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash',1920,1080,'FFFFFF')
	addLuaSprite('flash', true);
	screenCenter('flash')
	setLuaSpriteScrollFactor('flash',0,0)
	setProperty('flash.scale.x',4)
	setProperty('flash.scale.y',4)
	setProperty('flash.alpha',0)
	setObjectCamera('flash', 'camOther')
	
	--JustShitFix
	makeLuaSprite('fixN1', '', 0, 0);
	makeGraphic('fixN1',1280,720,'000000')
	setLuaSpriteScrollFactor('fixN1',0,0)
	setProperty('fixN1.scale.x',4)
	setProperty('fixN1.scale.y',4)
	screenCenter('fixN1', 'x')
	setProperty('fixN1.alpha',1)
	setObjectCamera('fixN1', 'camOther')
	addLuaSprite('fixN1', true);
	setProperty('fixN1.y',1800)
	
	makeLuaSprite('fixN2', '', 0, 0);
	makeGraphic('fixN2',1280,720,'000000')
	setProperty('fixN2.scale.x',4)
	setProperty('fixN2.scale.y',4)
	screenCenter('fixN2', 'x')
	setProperty('fixN2.alpha',1)
	setObjectCamera('fixN2', 'camOther')
	addLuaSprite('fixN2', true);
	setProperty('fixN2.y',-1800)
	--JustShitFix
	
	setProperty('camHUD.alpha', 0);
	setProperty('introSoundsSuffix', '-nothing');
	setProperty('introSoundsSuffix', '-nothing');
end

function onCountdownTick(tick)
	runHaxeCode([[
		switch (]]..tick..[[) {
			case 1: game.countdownReady.destroy();
			case 2: game.countdownReady.destroy();
			case 3: game.countdownReady.destroy();
		}
	]])
end

function onUpdatePost()
	for _, cam in pairs(cams) do
		setProperty(cam..'.flashSprite.scaleX', 2)
		setProperty(cam..'.flashSprite.scaleY', 2)
		runHaxeCode("game."..cam..".setScale(game."..cam..".zoom / 2, game."..cam..".zoom / 2);")
	end
	runHaxeCode([[
		if (!ClientPrefs.downScroll) {
			game.iconP1.x = 1135;
			game.iconP2.x = 15;
			game.iconP1.y = 582;
			game.iconP2.y = 582;
			game.healthBarBG.y = 703;
			game.healthBar.y = 711;
			game.healthBarBG.setGraphicSize(1350, 20);
			game.healthBar.setGraphicSize(1280, 20);
			game.healthBarBG.screenCenter(X);
			game.healthBar.screenCenter(X);
		} else {
			game.iconP1.x = 1135;
			game.iconP2.x = 15;
			game.iconP1.y = 5;
			game.iconP2.y = 5;
			game.healthBarBG.y = 0;
			game.healthBar.y = 0;
			game.healthBarBG.setGraphicSize(1350, 20);
			game.healthBar.setGraphicSize(1280, 20);
			game.healthBarBG.screenCenter(X);
			game.healthBar.screenCenter(X);
		}
	]])
	if getPropertyFromClass('ClientPrefs', 'downScroll') == false then
		setProperty('scoreTxt.y',0)
	else
		setProperty('scoreTxt.y',697)
		setProperty('timeBarBG.y',680)
		setProperty('timeBar.y',684)
		setProperty('timeTxt.y',675)
	end
end

function onUpdate()
    if enabled then
        setShaderFloat('chromGraphic', "amount", getProperty('chromX.x'))
        if not activated and chromAmount == 0 and getProperty('chromX.x') <= 0 then
            removeSpriteShader('chromGraphic')
            enabled = false
        end
    end
	if hideCombo == true then
		runHaxeCode([[
			ClientPrefs.comboOffset = [-1000,0,-1000,0];
		]])
	end
	if centerNotes == true then
		if getPropertyFromClass('ClientPrefs', 'middleScroll') == false then
			runHaxeCode([[
				game.opponentStrums.forEach(function(spr:FlxSprite) {
					spr.visible = false;
					spr.x -= 1000;
				});
				game.playerStrums.forEach(function(spr:FlxSprite) {
					switch (spr.ID) {
						case 0: spr.x = 412;
						case 1: spr.x = 524;
						case 2: spr.x = 638;
						case 3: spr.x = 750;
					}
				});
			]])
		end
	end
	if activated and Pulse == 0 then
		setProperty('chromX.x',chromAmount)
		doTweenX('chromLol','chromX',0,0.45,'linear')
		activated = false;
	end
	if camMoveX < 1065 then
		if moveCamX == true then
			camMoveX = camMoveX+0.3;
		end
	end
	if curStep == 0 then
		doTweenZoom('CamZoomEvent', 'camGame', 0.5, 15.6, quadOut);
		doTweenAlpha('bg1Tween', 'bg', 1, 12, quadOut);
		doTweenAlpha('bg2Tween', 'lamp', 1, 12, quadOut);
		doTweenAlpha('bg3Tween', 'luz', 1, 12, quadOut);
		doTweenAlpha('bg4Tween', 'luz1', 1, 12, quadOut);
	end
	if curStep == 2 then
		doTweenAlpha('blackScreen', 'blackScreen', 0.75, 20, quadOut);
		moveCamX = true;
	end
	if curStep == 132 then
		if stopIt == false then
			setProperty('defaultCamZoom', 0.5)
			followchars = true;
			stopIt = true;
		end
	end
	if curStep == 256 then
		cancelTween('flsh');
		setProperty('flash.alpha',1)
		doTweenAlpha('flsh','flash',0,1,'linear')
		setProperty('blackScreen.alpha',0)
	end
	if curStep == 352 then
		doTweenAlpha('camHUDTween', 'camHUD', 1, 1.9, quadOut);
	end
	if curStep == 390 or curStep == 464 then
		setProperty('defaultCamZoom', 0.55)
	end
	if curStep == 400 or curStep == 432 or curStep == 480 then
		setProperty('defaultCamZoom', 0.65)
	end
	if curStep == 416 then
		setProperty('defaultCamZoom', 0.55)
	end
	if curStep == 448 or curStep == 496 then
		setProperty('defaultCamZoom', 0.7)
	end
	if curStep == 512 then
		setProperty('defaultCamZoom', 0.55)
	end
	if curStep == 636 then
		doTweenAlpha('bg1Tween', 'bg', 0.5, 0.5, 'Linear');
		doTweenAlpha('bg2Tween', 'lamp', 0.5, 0.5, 'Linear');
		doTweenAlpha('bg3Tween', 'luz', 0.5, 0.5, 'Linear');
		doTweenAlpha('bg4Tween', 'luz1', 0.5, 0.5, 'Linear');
	end
	if curStep == 640 then
		setProperty('defaultCamZoom', 0.65)
	end
	if curStep == 736 then
		setProperty('defaultCamZoom', 0.5)
		doTweenAlpha('camHUDTween', 'camHUD', 0, 0.6, quadOut);
		doTweenAlpha('blackScreen', 'blackScreen', 1, 0.6, quadOut);
	end
	if curStep == 759 then
		doTweenAlpha('camHUDTween', 'camHUD', 1, 0.6, quadOut);
		doTweenAlpha('blackScreen', 'blackScreen', 0.5, 0.6, quadOut);
	end
	if curStep == 768 then
		setProperty('defaultCamZoom', 0.7)
		doTweenAlpha('bg1Tween', 'bg', 0.35, 0.5, 'Linear');
		doTweenAlpha('bg2Tween', 'lamp', 0.35, 0.5, 'Linear');
		doTweenAlpha('bg3Tween', 'luz', 0.35, 0.5, 'Linear');
		doTweenAlpha('bg4Tween', 'luz1', 0.35, 0.5, 'Linear');
	end
	if curStep == 891 then
		setProperty('defaultCamZoom', 0.5)
		doTweenAlpha('blackScreen', 'blackScreen', 1, 0.15, quadOut);
	end
	if curStep == 896 then
		cancelTween('flsh');
		setProperty('flash.alpha',1)
		doTweenAlpha('flsh','flash',0,1,'linear')
		setProperty('blackScreen.alpha',0)
		
		setProperty('bg.alpha',0)
		setProperty('lamp.alpha',0)
		setProperty('luz.alpha',0)
		setProperty('luz1.alpha',0)
		
		camShakeOnOpponentNoteHit = true;
		doTheCoolChromEffect(2, 0.05);
		setProperty('defaultCamZoom', 0.45)
		
		doTweenAlpha('camHUDTweenElement1', 'timeBarBG', 0, 0.15, quadOut);
		doTweenAlpha('camHUDTweenElement2', 'timeBar', 0, 0.15, quadOut);
		doTweenAlpha('camHUDTweenElement3', 'timeTxt', 0, 0.15, quadOut);
		doTweenAlpha('camHUDTweenElement4', 'iconP1', 0, 0.15, quadOut);
		doTweenAlpha('camHUDTweenElement5', 'iconP2', 0, 0.15, quadOut);
		doTweenAlpha('camHUDTweenElement6', 'healthBarBG', 0, 0.15, quadOut);
		doTweenAlpha('camHUDTweenElement7', 'healthBar', 0, 0.15, quadOut);
		doTweenAlpha('camHUDTweenElement8', 'scoreTxt', 0, 0.15, quadOut);
		
		xx = 1300;
		yy = 550;
		xx2 = 1300;
		yy2 = 600;
		
		darkDadX = getProperty('dad.x');
		darkDadY = getProperty('dad.y');
		darkBfX = getProperty('boyfriend.x');
		darkBfY = getProperty('boyfriend.y');
		darkCamMovement = true;
	end
	if curStep == 912 or curStep == 944 or curStep == 1024 or curStep == 1056 or curStep == 1136 then
		setProperty('defaultCamZoom', 0.4)
	end
	if curStep == 928 or curStep == 960 or curStep == 992 or curStep == 1040 or curStep == 1072 or curStep == 1104 then
		setProperty('defaultCamZoom', 0.45)
	end
	if curStep == 976 or curStep == 1008 or curStep == 1088 or curStep == 1120 then
		setProperty('defaultCamZoom', 0.5)
	end
	if curStep == 1150 then
		setProperty('defaultCamZoom', 0.45)
	end
	if curStep == 1152 or curStep == 1156 or curStep == 1184 or curStep == 1188 or curStep == 1280 or curStep == 1283 or curStep == 1286 or curStep == 1296 or curStep == 1299 or curStep == 1302 or curStep == 1312 or curStep == 1315 or curStep == 1318 or curStep == 1328 or curStep == 1331 or curStep == 1334 then
		cancelTween('blackScreenBehindTweenWhite');
		setProperty('blackScreenBehind.alpha',0.5)
		doTweenAlpha('blackScreenBehindTweenWhite','blackScreenBehind',0,0.25,'linear')
	end
	if curStep == 1392 then
		doTheCoolChromEffect(0, 0);
		camShakeOnOpponentNoteHit = false;
		darkCamMovement = false;
	end
	if curStep == 1408 then
		doTweenAlpha('blackScreen', 'blackScreen', 1, 0.9, quadOut);
		doTweenAlpha('camHUDTween', 'camHUD', 0, 0.5, quadOut);
	end
	if curStep == 1418 then
		xx = 1000;
		yy = 750;
		xx2 = 1200;
		yy2 = 750;
	
		setProperty('timeBarBG.alpha',1)
		setProperty('timeBar.alpha',1)
		setProperty('timeTxt.alpha',1)
		setProperty('iconP1.alpha',1)
		setProperty('iconP2.alpha',1)
		setProperty('healthBarBG.alpha',1)
		setProperty('healthBar.alpha',1)
		setProperty('scoreTxt.alpha',1)
		
		setProperty('bg.alpha',1)
		setProperty('lamp.alpha',1)
		setProperty('luz.alpha',1)
		setProperty('luz1.alpha',1)
		
		setProperty('defaultCamZoom', 0.7)
	end
	if curStep == 1420 then
		doTweenAlpha('blackScreen', 'blackScreen', 0.5, 0.4, quadOut);
		doTweenAlpha('camHUDTween', 'camHUD', 1, 0.4, quadOut);
	end
	if curStep == 1536 or curStep == 1632 or curStep == 1856 or curStep == 1928 or curStep == 1944 or curStep == 1960 or curStep == 1984 then
		setProperty('defaultCamZoom', 0.6)
	end
	if curStep == 1568 or curStep == 1664 or curStep == 1808 or curStep == 1840 or curStep == 1968 or curStep == 2016 then
		setProperty('defaultCamZoom', 0.7)
	end
	if curStep == 1888 then
		setProperty('defaultCamZoom', 0.65)
	end
	if curStep == 1600 or curStep == 1792 or curStep == 1824 or curStep == 1920 or curStep == 1936 or curStep == 1952 or curStep == 2032 then
		setProperty('defaultCamZoom', 0.5)
	end
	if curStep == 1792 then
		setBlendMode('blackScreenBehind','MULTIPLY')
	end
	if curStep == 1792 or curStep == 1796 or curStep == 1824 or curStep == 1828 or curStep == 1920 or curStep == 1923 or curStep == 1926 or curStep == 1952 or curStep == 1955 or curStep == 1958 then
		setProperty('blackScreenBehind.color', getColorFromHex('FF0000'))
		cancelTween('blackScreenBehindTweenRed');
		setProperty('blackScreenBehind.alpha',0.4)
		doTweenAlpha('blackScreenBehindTweenRed','blackScreenBehind',0,0.3,'linear')
		Pulse = 0;
		doTheCoolChromEffect(2, 0.05);
	end
	if curStep == 1808 or curStep == 1840 or curStep == 1856 or curStep == 1928 or curStep == 1944 or curStep == 1960 then
		cancelTween('blackScreenBehindTweenRed');
		doTweenAlpha('blackScreenBehindTweenRed','blackScreenBehind',0.3,0.25,'linear')
		Pulse = 1;
		doTheCoolChromEffect(2, 0.05);
	end
	if curStep == 1936 or curStep == 2032 then
		cancelTween('blackScreenBehindTweenRed');
		doTweenAlpha('blackScreenBehindTweenRed','blackScreenBehind',0,0.25,'linear')
		Pulse = 0;
		doTheCoolChromEffect(0, 0);
	end
	if curStep == 1808 then
		camShakeOnOpponentNoteHit = true;
	end
	if curStep == 2032 then
		camShakeOnOpponentNoteHit = false;
		doTweenAlpha('camHUDTweenElement1', 'timeBarBG', 0, 0.15, quadOut);
		doTweenAlpha('camHUDTweenElement2', 'timeBar', 0, 0.15, quadOut);
		doTweenAlpha('camHUDTweenElement3', 'timeTxt', 0, 0.15, quadOut);
		doTweenAlpha('camHUDTweenElement4', 'iconP1', 0, 0.15, quadOut);
		doTweenAlpha('camHUDTweenElement5', 'iconP2', 0, 0.15, quadOut);
		doTweenAlpha('camHUDTweenElement6', 'healthBarBG', 0, 0.15, quadOut);
		doTweenAlpha('camHUDTweenElement7', 'healthBar', 0, 0.15, quadOut);
		doTweenAlpha('camHUDTweenElement8', 'scoreTxt', 0, 0.15, quadOut);
	end
	if curStep == 2048 then
		doTweenAlpha('blackScreen', 'blackScreen', 1, 1.92, quadOut);
		doTweenAlpha('camHUDTween', 'camHUD', 0, 0.3, quadOut);
		setProperty('defaultCamZoom', 0.8)
	end
	
	if followchars == true then
        if mustHitSection == false then
			if getProperty('dad.animation.curAnim.name') == 'singLEFT' then

            end
			if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                
            end
			if getProperty('dad.animation.curAnim.name') == 'singUP' then

            end
			if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                
            end
        else
			if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
               
            end
			if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                
            end
			if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                
            end
			if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                
            end
			if getProperty('boyfriend.curCharacter') == 'singLEFTmiss' then
                
            end
			if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHTmiss' then
                
            end
			if getProperty('boyfriend.animation.curAnim.name') == 'singUPmiss' then
                
            end
			if getProperty('boyfriend.animation.curAnim.name') == 'singDOWNmiss' then
               
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                
            end
        end
        
		
		if darkCamMovement == true then
			if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' or getProperty('dad.animation.curAnim.name') == 'singLEFT' then
				darkCamTweenStopShit();
				doTweenX('dadDarkMoveLeftX','dad',darkDadX+darkOfsDad,darkMoveDadSpeed,'quadOut')
				doTweenY('dadDarkMoveLeftY','dad',darkDadY,darkMoveDadSpeed,'quadOut')
				doTweenX('bfDarkMoveLeftX','boyfriend',darkBfX-darkOfsBF,darkMoveBFSpeed,'quadOut')
				doTweenY('bfDarkMoveLeftY','boyfriend',darkBfY,darkMoveBFSpeed,'quadOut')
			end
			if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' or getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
				darkCamTweenStopShit();
				doTweenX('dadDarkMoveRightX','dad',darkDadX-darkOfsDad,darkMoveDadSpeed,'quadOut')
				doTweenY('dadDarkMoveRightY','dad',darkDadY,darkMoveDadSpeed,'quadOut')
				doTweenX('bfDarkMoveRightX','boyfriend',darkBfX+darkOfsBF,darkMoveBFSpeed,'quadOut')
				doTweenY('bfDarkMoveRightY','boyfriend',darkBfY,darkMoveBFSpeed,'quadOut')
			end
			if getProperty('boyfriend.animation.curAnim.name') == 'singUP' or getProperty('dad.animation.curAnim.name') == 'singUP' then
				darkCamTweenStopShit();
				doTweenX('dadDarkMoveUpX','dad',darkDadX,darkMoveDadSpeed,'quadOut')
				doTweenY('dadDarkMoveUpY','dad',darkDadY+darkOfsDad,darkMoveDadSpeed,'quadOut')
				doTweenX('bfDarkMoveUpX','boyfriend',darkBfX,darkMoveBFSpeed,'quadOut')
				doTweenY('bfDarkMoveUpY','boyfriend',darkBfY-darkOfsBF,darkMoveBFSpeed,'quadOut')
			end
			if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' or getProperty('dad.animation.curAnim.name') == 'singDOWN' then
				darkCamTweenStopShit();
				doTweenX('dadDarkMoveDownX','dad',darkDadX,darkMoveDadSpeed,'quadOut')
				doTweenY('dadDarkMoveDownY','dad',darkDadY-darkOfsDad,darkMoveDadSpeed,'quadOut')
				doTweenX('bfDarkMoveDownX','boyfriend',darkBfX,darkMoveBFSpeed,'quadOut')
				doTweenY('bfDarkMoveDownY','boyfriend',darkBfY+darkOfsBF,darkMoveBFSpeed,'quadOut')
			end
			if getProperty('boyfriend.curCharacter') == 'singLEFTmiss' then
				darkCamTweenStopShit();
				doTweenX('dadDarkMoveLeftX','dad',darkDadX-darkOfsDad,darkMoveDadSpeed,'quadOut')
				doTweenY('dadDarkMoveLeftY','dad',darkDadY,darkMoveDadSpeed,'quadOut')
				doTweenX('bfDarkMoveLeftX','boyfriend',darkBfX,darkMoveBFSpeed,'quadOut')
				doTweenY('bfDarkMoveLeftY','boyfriend',darkBfY,darkMoveBFSpeed,'quadOut')
			end
			if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHTmiss' then
				darkCamTweenStopShit();
				doTweenX('dadDarkMoveRightX','dad',darkDadX+darkOfsDad,darkMoveDadSpeed,'quadOut')
				doTweenY('dadDarkMoveRightY','dad',darkDadY,darkMoveDadSpeed,'quadOut')
				doTweenX('bfDarkMoveRightX','boyfriend',darkBfX,darkMoveBFSpeed,'quadOut')
				doTweenY('bfDarkMoveRightY','boyfriend',darkBfY,darkMoveBFSpeed,'quadOut')
			end
			if getProperty('boyfriend.animation.curAnim.name') == 'singUPmiss' then
				darkCamTweenStopShit();
				doTweenX('dadDarkMoveUpX','dad',darkDadX,darkMoveDadSpeed,'quadOut')
				doTweenY('dadDarkMoveUpY','dad',darkDadY-darkOfsDad,darkMoveDadSpeed,'quadOut')
				doTweenX('bfDarkMoveUpX','boyfriend',darkBfX,darkMoveBFSpeed,'quadOut')
				doTweenY('bfDarkMoveUpY','boyfriend',darkBfY,darkMoveBFSpeed,'quadOut')
			end
			if getProperty('boyfriend.animation.curAnim.name') == 'singDOWNmiss' then
				darkCamTweenStopShit();
				doTweenX('dadDarkMoveDownX','dad',darkDadX,darkMoveDadSpeed,'quadOut')
				doTweenY('dadDarkMoveDownY','dad',darkDadY+darkOfsDad,darkMoveDadSpeed,'quadOut')
				doTweenX('bfDarkMoveDownX','boyfriend',darkBfX,darkMoveBFSpeed,'quadOut')
				doTweenY('bfDarkMoveDownY','boyfriend',darkBfY,darkMoveBFSpeed,'quadOut')
			end
			if mustHitSection == false then
				if getProperty('dad.animation.curAnim.name') == 'idle' then
					darkCamTweenStopShit();
					doTweenX('dadDarkMoveRightX','dad',darkDadX,darkMoveDadSpeed,'quadOut')
					doTweenY('dadDarkMoveRightY','dad',darkDadY,darkMoveDadSpeed,'quadOut')
				end
			else
				if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
					darkCamTweenStopShit();
					doTweenX('bfDarkMoveRightX','boyfriend',darkBfX,darkMoveBFSpeed,'quadOut')
					doTweenY('bfDarkMoveRightY','boyfriend',darkBfY,darkMoveBFSpeed,'quadOut')
				end
			end
		end
	end
end
function darkCamTweenStopShit()
	cancelTween('dadDarkMoveLeftX');
	cancelTween('dadDarkMoveLeftY');
	cancelTween('dadDarkMoveRightX');
	cancelTween('dadDarkMoveRightY');
	cancelTween('dadDarkMoveUpX');
	cancelTween('dadDarkMoveUpY');
	cancelTween('dadDarkMoveDownX');
	cancelTween('dadDarkMoveDownY');
	cancelTween('dadDarkMoveIdleX');
	cancelTween('dadDarkMoveIdleY');
	
	cancelTween('bfDarkMoveLeftX');
	cancelTween('bfDarkMoveLeftY');
	cancelTween('bfDarkMoveRightX');
	cancelTween('bfDarkMoveRightY');
	cancelTween('bfDarkMoveUpX');
	cancelTween('bfDarkMoveUpY');
	cancelTween('bfDarkMoveDownX');
	cancelTween('bfDarkMoveDownY');
	cancelTween('bfDarkMoveIdleX');
	cancelTween('bfDarkMoveIdleY');
end

function onCreatePost()
    initLuaShader('ChromaticAbberation')
    makeLuaSprite('chromGraphic')
    makeGraphic("chromShader", screenWidth, screenHeight)
    makeLuaSprite('chromX',nil,0,0)
end
function onBeatHit()
	if activated and Pulse == 2 then
		setProperty('chromX.x',chromAmount)
		doTweenX('chromLol','chromX',0,0.45,'linear')
	end
end
function onStepHit()
	if activated and Pulse == 1 then
		setProperty('chromX.x',chromAmount)
		doTweenX('chromLol','chromX',0,0.45,'linear')
	end
end
function chromToggle(ye)
    if ye then
        if not activated then
            setSpriteShader("chromShader", 'chromGraphic')
            runHaxeCode(
                [[
                    var chromToggle = game.createRuntimeShader('ChromaticAbberation');
                    game.camGame.setFilters([new ShaderFilter(chromToggle)]);
                    game.getLuaObject('chromGraphic').shader = chromToggle;
                    return;
                ]]
            )
            activated = true
            enabled = true
        end
    else
        if activated then
            doTweenX('chromLol','chromX',0,0.45,'linear')
            activated = false
        end
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

function opponentNoteHit()
	if camShakeOnOpponentNoteHit == true then
		triggerEvent('Screen Shake', '0.25, 0.005' ,'0.25, 0.005')
	end
end
