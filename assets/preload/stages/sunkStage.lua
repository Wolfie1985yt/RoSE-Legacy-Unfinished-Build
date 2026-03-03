local xx = 1000;
local yy = 250; --300
local ofs = 25;
local ofs2 = 25;
local xx2 = 1280;
local yy2 = 250;
local followchars = true;
local boing = 0;
local spin = false;
local cereal = false;
local ifuckit = true;
local animName = 'milk1';

function onCreate()
	makeLuaSprite('wall', 'bgs/milk/wall', -300, -500);
	scaleObject('wall', 2, 1);
	setScrollFactor('wall', 1, 1);
	setProperty('wall.antialiasing', true);
	addLuaSprite('wall', false);
	
	makeLuaSprite('joists', 'bgs/milk/joists', -135, -500);
	scaleObject('joists', 0.97, 0.97);
	setScrollFactor('joists', 1, 1);
	setProperty('joists.antialiasing', true);
	addLuaSprite('joists', false);
	
	makeLuaSprite('floor', 'bgs/milk/floor', -250, 300);
	scaleObject('floor', 0.75, 0.75);
	setScrollFactor('floor', 1, 1);
	setProperty('floor.antialiasing', true);
	addLuaSprite('floor', false);
	
	makeAnimatedLuaSprite('speaker', 'bgs/milk/speaker', 260, -250); -- 260 -235
	addAnimationByPrefix('speaker', 'idle', 'dance lol0', 24, false);
	scaleObject('speaker', 0.85, 0.85);
	setScrollFactor('speaker', 1, 1);
	setProperty('speaker.antialiasing', true);
	addLuaSprite('speaker', false);
	
	makeAnimatedLuaSprite('speaker2', 'bgs/milk/speaker', 1450, -235); -- 1435 -235
	addAnimationByPrefix('speaker2', 'idle', 'dance lol0', 24, false);
	scaleObject('speaker2', 0.85, 0.85);
	setScrollFactor('speaker2', 1, 1);
	setProperty('speaker2.antialiasing', true);
	setProperty('speaker2.flipX', true);
	addLuaSprite('speaker2', false);
	
	makeAnimatedLuaSprite('ball', 'bgs/milk/ball', 1010, -900); --600
	addAnimationByIndices('ball', 'stop', 'drop0', '0', 24, true);
	addAnimationByPrefix('ball', 'spin', 'dance0', 30, false);
	addAnimationByPrefix('ball', 'drop', 'drop0', 24, false);	
	scaleObject('ball', 1, 1);
	setScrollFactor('ball', 1.2, 1.1);
	setProperty('ball.antialiasing', true);
	addLuaSprite('ball', true);
	
	makeLuaSprite('krill1', 'bgs/milk/krill1', -490, -505);
	scaleObject('krill1', 0.9, 0.9);
	setScrollFactor('krill1', 0, 0);
	setProperty('krill1.antialiasing', true);
	setProperty('krill1.alpha', 0);
	addLuaSprite('krill1', false);
	
	makeLuaSprite('krill2', 'bgs/milk/krill2', -490, -505);
	scaleObject('krill2', 0.9, 0.9);
	setScrollFactor('krill2', 0, 0);
	setProperty('krill2.alpha', 0);
	setProperty('krill2.antialiasing', true);
	addLuaSprite('krill2', false);
	
	makeAnimatedLuaSprite('milk-cereal', 'bgs/milk/milk-cereal', 780, -300);
	addAnimationByIndices('milk-cereal', 'milk1', 'idle0', '0', 1, false);
	addAnimationByIndices('milk-cereal', 'milk2', 'idle0', '1', 1, false);
	addAnimationByIndices('milk-cereal', 'cereal1', 'idle0', '3', 1, false);
	addAnimationByIndices('milk-cereal', 'cereal2', 'idle0', '2', 1, false);
	scaleObject('milk-cereal', 0.65, 0.65);
	setScrollFactor('milk-cereal', 1.2, 1.2);
	setProperty('milk-cereal.antialiasing', true);
	setProperty('milk-cereal.alpha', 0);
	addLuaSprite('milk-cereal', false);
	
	makeLuaSprite('epico', 'bgs/milk/epico', -130, -500);
	scaleObject('epico', 2, 2);
	setScrollFactor('epico', 1, 1);
	setProperty('epico.alpha', 0);
	setProperty('epico.antialiasing', true);
	addLuaSprite('epico', false);
	
	makeLuaSprite('light', 'bgs/milk/light', 1045, -900);
	scaleObject('light', 1, 1.3);
	setScrollFactor('light', 1, 1);
	setProperty('light.alpha', 0);
	setProperty('light.antialiasing', true);
	addLuaSprite('light', true);
	
	if songName == 'cool-party' then
		makeLuaSprite('light2', 'bgs/milk/light', 200, -900);
		scaleObject('light2', 1, 1.3);
		setScrollFactor('light2', 1, 1);
		setProperty('light2.antialiasing', true);
		addLuaSprite('light2', true);
		
		setProperty('light.alpha', 0.3);
		setProperty('light2.alpha', 0.3);
	end
	
	makeLuaSprite('black', '', 0, 0);
	makeGraphic('black',1920,1080,'000000')
	addLuaSprite('black', false);
	setLuaSpriteScrollFactor('black',0,0)
	setProperty('black.scale.x',2)
	setProperty('black.scale.y',2)
	setProperty('black.alpha', 0)
	if songName == 'cool-party' then
		setProperty('black.alpha', 0.8)
	end
	
	makeAnimatedLuaSprite('transition', 'bgs/milk/transition', 680, -300);
	addAnimationByPrefix('transition', 'no', 'milk no0', 1, false);
	addAnimationByPrefix('transition', 'go', 'milk falls0', 24, false);
	addAnimationByPrefix('transition', 'fall', 'milk go0', 20, false);
	scaleObject('transition', 0.89, 0.67);
	setScrollFactor('transition', 1, 1);
	setObjectCamera('transition', 'camHUD');
	screenCenter('transition')
	setProperty('transition.antialiasing', true);
	addLuaSprite('transition', false);
	
	makeLuaSprite('sunkage', 'bgs/milk/sunkage');
	scaleObject('sunkage', 1, 1);
	setScrollFactor('sunkage', 1, 1);
	setProperty('sunkage.alpha', 0);
	setProperty('sunkage.antialiasing', true);
	addLuaSprite('sunkage', false);
	setObjectCamera('sunkage', 'camOther');
	screenCenter('sunkage')
	
	makeAnimatedLuaSprite('sunker', 'bgs/milk/sunker');
	addAnimationByPrefix('sunker', 'idle', 'sunker0', 24, true);
	scaleObject('sunker', 4, 4);
	setScrollFactor('sunker', 1, 1);
	setObjectCamera('sunker', 'camOther');
	screenCenter('sunker')
	setProperty('sunker.antialiasing', false);
	setProperty('sunker.alpha', 0);
	addLuaSprite('sunker', false);
end
	
function onBeatHit()
	if boing == 1 then
		if curBeat % 1 == 0 then
			playAnim('speaker', 'idle', false)
			playAnim('speaker2', 'idle', false)	
		end
	end
	if boing == 2 then
		if curBeat % 4 == 2 then
			playAnim('speaker', 'idle', false)
			playAnim('speaker2', 'idle', false)	
		end
	end
	if boing == 4 then
		if curBeat % 4 == 0 then
			playAnim('speaker', 'idle', false)
			playAnim('speaker2', 'idle', false)
		end
	end
	if boing == false then
		--nothing lol		
	end
	
	if cereal == true then
		if curBeat % 2 == 0 then
			if ifuckit == true then
				setProperty('krill2.alpha', 1)
				ifuckit = false;
			else
				setProperty('krill2.alpha', 0)
				ifuckit = true;
			end
		end
	end
	
	if curBeat % 1 == 0 then
		if animName == 'milk1' then
			playAnim('milk-cereal', 'milk1', false)
			animName = 'milk2';
		else if animName == 'milk2' then
			playAnim('milk-cereal', 'milk2', false)
			animName = 'cereal1';
		else if animName == 'cereal1' then
			playAnim('milk-cereal', 'cereal1', false)
			animName = 'cereal2';
		else if animName == 'cereal2' then
			playAnim('milk-cereal', 'cereal2', false)
			animName = 'milk1';
		end
		end
		end
		end
	end
end

function onUpdate()
    songPos = getPropertyFromClass('Conductor', 'songPosition');
 
    currentBeat = (songPos / 300) * (bpm / 180)
	
	if getProperty('ball.animation.curAnim.name') == 'drop' or getProperty('ball.animation.curAnim.name') == 'stop' then
		setProperty('ball.x', 700);
		setProperty('ball.y', -1230);
	else
		setProperty('ball.x', 990);
		setProperty('ball.y', -900);
	end
	
	if spin == true then
		playAnim('ball', 'spin', false)
	end
	
	if songName == "milk" then
		if curStep == 10 then
			--setProperty('defaultCamZoom',0.45)
			--doTweenAlpha('sunker','dad', 0, 0.9,'quadInOut')
			--doTweenAlpha('sunker2','boyfriend', 0, 0.9,'quadInOut')
		end
		if curStep == 60 then
			boing = 4;
		end
		if curStep == 96 then
			boing = 1;
			doTweenZoom('cam1','camGame', 1, 4,'sineOut')
			xx2 = 1550;
			yy2 = 350;
		end
		if curStep == 116 then
			boing = false;
		end
		if curStep == 120 then
			cancelTween('cam1');
			xx2 = 1280;
			yy2 = 250;
		end
		if curStep == 132 then
			doTweenX('speaker','speaker', 210, 0.9,'quadInOut')
			doTweenX('speaker2','speaker2', 1505, 0.9,'quadInOut')
			doTweenAlpha('sunker','sunker', 1, 0.9,'linear')
		end
		if curStep == 143 then
			boing = 1;
		end
		if curStep == 144 then
			setProperty('defaultCamZoom',0.5)
			setProperty('sunker.alpha', 0)
			playAnim('ball', 'drop', false)
		end
		if curStep == 149 then
			spin = true
		end
		if curStep == 352 then
			doTweenZoom('ZOOMDAD','camGame', 0.9, 3,'sineOut')
			yy = 300;
			yy2 = 300;
		end
		if curStep == 384 then
			cancelTween('ZOOMDAD')
			yy = 250;
			yy2 = 250;
		end
		if curStep == 639 then
			doTweenZoom('ZOOMDAD2','camGame', 0.7, 1.1,'sineOut')
			yy = 300;
			yy2 = 300;
		end
		if curStep == 652 then
			cancelTween('ZOOMDAD2')
			doTweenZoom('ZOOMDAD3','camGame', 0.8, 0.25,'quintOut')
		end
		if curStep == 655 then
			cancelTween('ZOOMDAD3')
			doTweenZoom('ZOOMDAD4','camGame', 0.9, 0.25,'quintOut')
		end
		if curStep == 659 then
			setProperty('defaultCamZoom',0.55)
			yy = 250;
			yy2 = 250;
		end
		if curStep == 776 then
			doTweenZoom('ZOOMDAD5','camGame', 0.6, 0.33,'sineOut')
		end
		if curStep == 780 then
			cancelTween('ZOOMDAD5')
			doTweenZoom('ZOOMDAD6','camGame', 0.7, 0.33,'sineOut')
		end
		if curStep == 886 then
			playAnim('transition', 'go', false)
			boing = 0;
		end
		if curStep == 894 then
			cereal = true;
			xx = 1160;
			yy = 300;
			ofs = 10;
			ofs2 = 10;
			xx2 = 1160;
			yy2 = 300;
		end
		if curStep == 912 then
			playAnim('transition', 'fall', false)
			setProperty('defaultCamZoom',0.45)
			setProperty('milk-cereal.alpha', 1)
			setProperty('krill1.alpha', 1)
			setProperty('epico.alpha', 1)
			setProperty('gf.alpha', 0)
			setProperty('ball.alpha', 0)
			setProperty('boyfriend.x', 1325);
			setProperty('boyfriend.y', 20);
		end
		if curStep == 1168 then
			setProperty('defaultCamZoom',0.6)
			xx = 900;
			yy = 400;
			ofs = 10;
			ofs2 = 10;
			xx2 = 1430;
			yy2 = 400;
		end
		if curStep == 1424 then
			setProperty('camGame.alpha', 0)
			setProperty('camHUD.alpha', 0)
			setProperty('defaultCamZoom',0.6)
			xx = 1000;
			yy = 300;
			ofs = 25;
			ofs2 = 25;
			xx2 = 1280;
			yy2 = 300;
		end
		if curStep == 1439 then
			doTweenAlpha('sunkage','sunkage', 1, 1.3,'linear')
		end
		if curStep == 1455 then
			cereal = false;
			boing = 1;
			setProperty('milk-cereal.alpha', 0)
			setProperty('sunkage.alpha', 0)
			setProperty('camGame.alpha', 1)
			setProperty('camHUD.alpha', 1)
			setProperty('krill1.alpha', 0)
			setProperty('krill2.alpha', 0)
			setProperty('epico.alpha', 0)
			setProperty('gf.alpha', 1)
			setProperty('ball.alpha', 1)
			setProperty('boyfriend.x', 1325);
			setProperty('boyfriend.y', 145);
		end
		if curStep == 1588 then
			doTweenZoom('ZOOMDAD8','camGame', 0.67, 4.8,'quadInOut')
			doTweenAlpha('black','black', 0.5, 4,'quadInOut')
			doTweenAlpha('light','light', 0.3, 4,'quadInOut')
			doTweenColor('dad','dad', '565656', 4,'quadInOut')
			doTweenColor('ball','ball', '565656', 4,'quadInOut')
			doTweenColor('gf','gf', '565656', 4,'quadInOut')
		end
		if curStep == 1590 then
			xx2 = 1550;
			yy2 = 350;
		end
		if curStep == 1648 then
			xx2 = 1280;
			yy2 = 300;
			doTweenAlpha('black','black', 0, 0.79,'linear')
			doTweenAlpha('light','light', 0, 0.79,'linear')
			doTweenColor('dad','dad', 'FFFFFF', 0.79,'linear')
			doTweenColor('ball','ball', 'FFFFFF', 0.79,'linear')
			doTweenColor('gf','gf', 'FFFFFF', 0.79,'linear')
		end
		if curStep == 1694 then
			xx = 1140;
			yy = 300;
			ofs = 15;
			ofs2 = 15;
			xx2 = 1140;
			yy2 = 300;
		end
		if curStep == 1728 then
			doTweenX('camGame','camGame', 1500, 4.2,'backInOut')
			doTweenX('camHUD','camHUD', 1500, 4.5,'backInOut')
		end
	end
	
	if songName == "cool-party" then
		if curStep == 0 then
			doTweenColor('gf','gf', '3D3D3D', 0.001,'linear')
			boing = 1;
		end
		if curStep == 145 then	
			doTweenAngle('camHUD', 'camGame', 360, 0.4, 'quintOut')
			setProperty('defaultCamZoom',0.5)
			doTweenX('speaker','speaker', 210, 0.2,'quadInOut')
			doTweenX('speaker2','speaker2', 1505, 0.2,'quadInOut')
			doTweenColor('gf','gf', 'FFFFFF', 0.2,'linear')
			doTweenAlpha('black','black', 0, 0.2,'linear')
			doTweenAlpha('light','light', 0, 0.2,'linear')
			doTweenAlpha('light2','light2', 0, 0.2,'linear')
			playAnim('ball', 'drop', false)
		end
		if curStep == 150 then
			spin = true
		end
		if curStep == 272 then
			makeLuaSprite('flash', '');
			makeGraphic('flash',1920,1080,'FFFFFF')
			addLuaSprite('flash', true);
			setLuaSpriteScrollFactor('flash',0,0)
			setObjectCamera('flash', 'HUD')
			doTweenAlpha('flTw','flash', 0, 0.5,'linear')
			
			setProperty('defaultCamZoom',0.55)
		end
		if curStep == 401 then
			xx = 800;
			yy = 300;
			xx2 = 1480;
			yy2 = 300;
			doTweenColor('gf','gf', '3D3D3D', 0.4,'linear')
			doTweenColor('ball','ball', '3D3D3D', 0.4,'linear')
			doTweenAlpha('black','black', 0.8, 0.4,'linear')
			doTweenAlpha('light','light', 0.3, 0.4,'linear')
			doTweenAlpha('light2','light2', 0.3, 0.4,'linear')
			setProperty('defaultCamZoom',0.6)
		end
		if curStep == 448 then
			doTweenColor('gf','gf', '000000', 8,'linear')
			doTweenColor('ball','ball', '000000', 8,'linear')
			doTweenAlpha('black','black', 1, 8,'linear')
		end
		if curStep == 528 then
			xx = 1000;
			yy = 250;
			xx2 = 1280;
			yy2 = 250;
			doTweenAngle('camHUD', 'camGame', -360, 0.4, 'quintOut')
			doTweenColor('gf','gf', 'FFFFFF', 0.2,'linear')
			doTweenColor('ball','ball', 'FFFFFF', 0.2,'linear')
			doTweenAlpha('black','black', 0, 0.2,'linear')
			doTweenAlpha('light','light', 0, 0.2,'linear')
			doTweenAlpha('light2','light2', 0, 0.2,'linear')
			setProperty('defaultCamZoom',0.5)
		end
		if curStep == 657 then
			setProperty('defaultCamZoom',0.6)
			xx = 800;
			yy = 320;
			xx2 = 1530;
			yy2 = 320;
		end
		if curStep == 672 then
			doTweenZoom('ZOOMDAD1','camGame', 1.5, 0.3,'sineOut')
		end
		if curStep == 676 then
			cancelTween('ZOOMDAD1')
		end
		if curStep == 697 then
			doTweenZoom('ZOOMDAD2','camGame', 1, 0.2,'quintOut')
		end
		if curStep == 699 then
			cancelTween('ZOOMDAD2')
			doTweenZoom('ZOOMDAD3','camGame', 1, 0.2,'quintOut')
		end
		if curStep == 701 then
			cancelTween('ZOOMDAD3')
			doTweenZoom('ZOOMDAD4','camGame', 1, 0.2,'quintOut')
		end
		if curStep == 736 then
			doTweenZoom('ZOOMDAD5','camGame', 1.5, 0.3,'sineOut')
		end
		if curStep == 740 then
			cancelTween('ZOOMDAD5')
		end
		if curStep == 761 then
			doTweenZoom('ZOOMDAD6','camGame', 1, 0.2,'quintOut')
		end
		if curStep == 763 then
			cancelTween('ZOOMDAD6')
			doTweenZoom('ZOOMDAD7','camGame', 1, 0.2,'quintOut')
		end
		if curStep == 765 then
			cancelTween('ZOOMDAD7')
			doTweenZoom('ZOOMDAD8','camGame', 1, 0.2,'quintOut')
		end
		if curStep == 785 then
			xx = 1000;
			yy = 250;
			xx2 = 1280;
			yy2 = 250;
			setProperty('defaultCamZoom',0.5)
		end
		if curStep == 904 then
			setProperty('defaultCamZoom',0.7)
			xx = 900;
			yy = 300;
			xx2 = 1380;
			yy2 = 300;
		end
		if curStep == 907 then
			setProperty('defaultCamZoom',0.9)
			xx = 800;
			yy = 300;
			xx2 = 1480;
			yy2 = 300;
		end
		if curStep == 911 then
			setProperty('defaultCamZoom',1.1)
			xx = 700;
			yy = 300;
			xx2 = 1580;
			yy2 = 300;
		end
		if curStep == 913 then
			setProperty('defaultCamZoom',0.5)
			xx = 1000;
			yy = 250;
			xx2 = 1280;
			yy2 = 250;
		end
		if curStep == 1040 then
			makeLuaSprite('flash', '');
			makeGraphic('flash',1920,1080,'FFFFFF')
			addLuaSprite('flash', true);
			setLuaSpriteScrollFactor('flash',0,0)
			setObjectCamera('flash', 'HUD')
			doTweenAlpha('flTw','flash', 0, 0.5,'linear')
			
			setProperty('defaultCamZoom',0.6)
		end
		if curStep == 1182 then
			setProperty('camGame.alpha', 0)
			setProperty('camHUD.alpha', 0)
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
			if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx2-ofs2,yy2)
            end
			if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx2+ofs2,yy2)
            end
			if getProperty('boyfriend.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs2)
            end
			if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs2)
            end
			if getProperty('boyfriend.animation.curCharacter') == 'singLEFTmiss' then
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