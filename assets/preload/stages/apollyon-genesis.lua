local xx = 600; --0.53 for json
local yy = 130;
local ofs = 10;
local ofs2 = 10;
local xx2 = 1100;
local yy2 = 220;
local followchars = true;
function onCreate()
	if getPropertyFromClass('backend.ClientPrefs', 'PotatoOptimization') == false then
		makeLuaSprite('Sky', 'bgs/apollyon-p1/blue-sky', -950, -700);
		scaleObject('Sky', 5, 5);
		setScrollFactor('Sky', 1.0, 1.0);
		setProperty('Sky.antialiasing', false);
		addLuaSprite('Sky', false);
		
		makeLuaSprite('hill', 'bgs/apollyon-p1/hills', 950, -143);
		scaleObject('hill', 6.75, 6.75);
		setScrollFactor('hill', 0.9, 1.1);
		setProperty('hill.antialiasing', false);
		addLuaSprite('hill', false);
		
		makeLuaSprite('mount', 'bgs/apollyon-p1/mountain', 700, -474);
		scaleObject('mount', 6.75, 6.75);
		setScrollFactor('mount', 0.9, 1.1);
		setProperty('mount.antialiasing', false);
		addLuaSprite('mount', false);
		
		makeLuaSprite('side', 'bgs/apollyon-p1/one-piece', 2000, 300);
		scaleObject('side', 6.75, 6.75);
		setScrollFactor('side', 1.0, 1.0);
		setProperty('side.antialiasing', false);
		addLuaSprite('side', false);
		
		makeAnimatedLuaSprite('lova', 'bgs/apollyon-p1/lova', 1000, 400);
		addAnimationByPrefix('lova', 'idle', 'lova idle', 6, true);
		scaleObject('lova', 6.75, 6.75);
		setScrollFactor('lova', 1, 1);
		setProperty('lova.alpha', 1)
		setProperty('lova.antialiasing', false);
		addLuaSprite('lova', false);
		
		makeLuaSprite('main', 'bgs/apollyon-p1/main-stage', -922, -630);
		scaleObject('main', 6.75, 6.75);
		setScrollFactor('main', 1.0, 1.0);
		setProperty('main.antialiasing', false);
		addLuaSprite('main', false);
		
		makeLuaSprite('blk', '', 0, 0);
		makeGraphic('blk',1920,1080,'000000')
		addLuaSprite('blk', true);
		screenCenter('blk')
		setLuaSpriteScrollFactor('blk',0,0)
		setProperty('blk.scale.x',4)
		setProperty('blk.scale.y',4)
		setProperty('blk.alpha',0)
		setObjectCamera('blk', 'camOther')
		
		ITSMOVING();
		
		runTimer('Side Down', 0.1, 1)
	end
end

function onTimerCompleted(tag)
	if tag == 'Side Up' then
		doTweenY('side-TweenUp', 'side', 200, 2.5, 'sineInOut')
		runTimer('Side Down', 2.5, 1)
	end
	if tag == 'Side Down' then
		doTweenY('side-TweenDown', 'side', 300, 2.5, 'sineInOut')
		runTimer('Side Up', 2.6, 1)
	end
end

function ITSMOVING()
	addHaxeLibrary('FlxTiledSprite', 'flixel.addons.display');
	addHaxeLibrary('FlxTween', 'flixel.tweens');
	addHaxeLibrary('FlxEase', 'flixel.tweens');
	addHaxeLibrary('FlxObject', 'flixel');
	addHaxeLibrary('flash.display');
	
	runHaxeCode([[
		minus4 = new FlxTiledSprite(Paths.image('bgs/apollyon-p1/!-4', 'preload'), 1500, 27, true, true);
		minus4.scale.set(6.75,6.75);
		minus4.scrollFactor.set(0.9, 1.1);
		minus4.x = 950;
		minus4.y = 66;
		minus4.visible = true;
		game.insert(game.members.indexOf(game.modchartSprites.get('hill')), minus4);
		
		minus3 = new FlxTiledSprite(Paths.image('bgs/apollyon-p1/!-3', 'preload'), 1500, 27, true, true);
		minus3.scale.set(6.75,6.75);
		minus3.scrollFactor.set(0.9, 1.1);
		minus3.x = 950;
		minus3.y = 93;
		minus3.visible = true;
		game.insert(game.members.indexOf(game.modchartSprites.get('hill'))+1, minus3);
		
		minus2 = new FlxTiledSprite(Paths.image('bgs/apollyon-p1/!-2', 'preload'), 1500, 27, true, true);
		minus2.scale.set(6.75,6.75);
		minus2.scrollFactor.set(0.9, 1.1);
		minus2.x = 950;
		minus2.y = 120;
		minus2.visible = true;
		game.insert(game.members.indexOf(game.modchartSprites.get('hill'))+2, minus2);
		
		minus1 = new FlxTiledSprite(Paths.image('bgs/apollyon-p1/!-1', 'preload'), 1500, 27, true, true);
		minus1.scale.set(6.75,6.75);
		minus1.scrollFactor.set(0.9, 1.1);
		minus1.x = 950;
		minus1.y = 147;
		minus1.visible = true;
		game.insert(game.members.indexOf(game.modchartSprites.get('hill'))+3, minus1);
		
		plus1 = new FlxTiledSprite(Paths.image('bgs/apollyon-p1/1', 'preload'), 1700, 54, true, true);
		plus1.scale.set(6.75,6.75);
		plus1.scrollFactor.set(0.9, 1.1);
		plus1.x = 700;
		plus1.y = 174;
		plus1.visible = true;
		game.insert(game.members.indexOf(game.modchartSprites.get('mount')), plus1);
		
		plus2 = new FlxTiledSprite(Paths.image('bgs/apollyon-p1/2', 'preload'), 1700, 54, true, true);
		plus2.scale.set(6.75,6.75);
		plus2.scrollFactor.set(0.9, 1.1);
		plus2.x = 700;
		plus2.y = 228;
		plus2.visible = true;
		game.insert(game.members.indexOf(game.modchartSprites.get('mount'))+1, plus2);
		
		plus3 = new FlxTiledSprite(Paths.image('bgs/apollyon-p1/3', 'preload'), 1700, 54, true, true);
		plus3.scale.set(6.75,6.75);
		plus3.scrollFactor.set(0.9, 1.1);
		plus3.x = 700;
		plus3.y = 282;
		plus3.visible = true;
		game.insert(game.members.indexOf(game.modchartSprites.get('mount'))+2, plus3);
		
		plus4 = new FlxTiledSprite(Paths.image('bgs/apollyon-p1/4', 'preload'), 1700, 54, true, true);
		plus4.scale.set(6.75,6.75);
		plus4.scrollFactor.set(0.9, 1.1);
		plus4.x = 700;
		plus4.y = 336;
		plus4.visible = true;
		game.insert(game.members.indexOf(game.modchartSprites.get('mount'))+3, plus4);
		
		plus5 = new FlxTiledSprite(Paths.image('bgs/apollyon-p1/5', 'preload'), 1700, 108, true, true);
		plus5.scale.set(6.75,6.75);
		plus5.scrollFactor.set(0.9, 1.1);
		plus5.x = 700;
		plus5.y = 390;
		plus5.visible = true;
		game.insert(game.members.indexOf(game.modchartSprites.get('mount'))+4, plus5);
	]])
end
--107
function onUpdate(elapsed)

    songPos = getPropertyFromClass('Conductor', 'songPosition');
 
    currentBeat = (songPos / 300) * (bpm / 180)
	
	runHaxeCode([[
		minus4.scrollX -= 0.2;
		minus3.scrollX -= 0.35;
		minus2.scrollX -= 0.5;
		minus1.scrollX -= 0.65;
		plus1.scrollX -= 0.8;
		plus2.scrollX -= 0.95;
		plus3.scrollX -= 1.1;
		plus4.scrollX -= 1.25;
		plus5.scrollX -= 1.4;
	]])
	
	if songName == "genesis" then 
		if curStep == 1936 then
			triggerEvent('Play Animation', 'transform', 'dad');
			doTweenZoom('bom', 'camGame',0.9, 1.5, 'linear')
		end
		if curStep == 1950 then
			setProperty('blk.alpha', 1)
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