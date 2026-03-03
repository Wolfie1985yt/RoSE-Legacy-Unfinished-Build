local xx = -550;
local yy = -310;
local ofs = 15;
local ofs2 = 15;
local xx2 = 50;
local yy2 = -250;
local followchars = true;
function onCreate()
	makeLuaSprite('sky', 'stages/faker/sprites/sky', -1450, -830);
	scaleObject('sky', 1.6, 1.7);
	setScrollFactor('sky', 0.5, 0.5);
	setProperty('sky.antialiasing', true);
	addLuaSprite('sky', false);

	makeLuaSprite('sun', 'stages/faker/sprites/sun', -750, -460);
	scaleObject('sun', 1, 1);
	setScrollFactor('sun', 0.1, 0.1);
	setProperty('sun.antialiasing', true);
	addLuaSprite('sun', false);

	makeLuaSprite('spikesB', 'stages/faker/sprites/back-spikes', -1550, -1030);
	scaleObject('spikesB', 0.9, 0.9);
	setScrollFactor('spikesB', 0.7, 0.7);
	setProperty('spikesB.antialiasing', true);
	addLuaSprite('spikesB', false);

	makeLuaSprite('clouds', 'stages/faker/sprites/clouds', -750, -730);
	scaleObject('clouds', 0.9, 0.9);
	setScrollFactor('clouds', 0.3, 0.3);
	setProperty('clouds.antialiasing', true);
	addLuaSprite('clouds', false);

	makeLuaSprite('spikesF', 'stages/faker/sprites/front-spikes', -1550, -660);
	scaleObject('spikesF', 0.9, 0.9);
	setScrollFactor('spikesF', 0.8, 0.8);
	setProperty('spikesF.antialiasing', true);
	addLuaSprite('spikesF', false);

	makeLuaSprite('totems', 'stages/faker/sprites/totems', -1520, -1230);
	scaleObject('totems', 0.9, 0.9);
	--setScrollFactor('plant', 0.7, 0.7);
	setProperty('totems.antialiasing', true);
	addLuaSprite('totems', false);

	makeLuaSprite('ground', 'stages/faker/sprites/ground', -2910, -218);
	scaleObject('ground', 1.7, 1.7);
	--setScrollFactor('plant', 0.7, 0.7);
	setProperty('ground.antialiasing', true);
	addLuaSprite('ground', false);

	makeLuaSprite('rocks', 'stages/faker/sprites/rocks', -2100, -245);
	scaleObject('rocks', 1.1, 1.2);
	setScrollFactor('rocks', 1.2, 1.1);
	setProperty('rocks.antialiasing', true);
	addLuaSprite('rocks', false);

	makeAnimatedLuaSprite('screenstatic', 'screenstatic', 0, 0, 'exe');
	addAnimationByPrefix('screenstatic', 'idle', 'screenSTATIC', 24, true);  
	objectPlayAnimation('screenstatic', 'screenstatic', true)
	addLuaSprite('screenstatic', true);
	scaleLuaSprite('screenstatic', 1, 1);
	setObjectCamera('screenstatic','other')
	setPropertyLuaSprite('screenstatic', 'alpha', 0)

	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash',1920,1080,'FFFFFF')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash',0,0)
	setProperty('flash.scale.x',2)
	setProperty('flash.scale.y',2)
	setObjectCamera('flash', 'camOther')
	setProperty('flash.alpha',0);

	precacheImage("Black");
	setProperty('cameraSpeed', 1)
end 

function onStartCountdown()
	doTweenColor('boyfriendColor', 'boyfriendGroup', 'c6a995', 0.1, 'linear');
	doTweenColor('dadColor', 'dadGroup', 'c6a995', 0.1, 'linear');
	doTweenColor('gfColor', 'gfGroup', 'c6a995', 0.1, 'linear');
	doTweenColor('txtColor', 'botplayTxt', 'c6a995', 0.1, 'linear');
	
end

function onUpdate()
	if songName == "faker" then
		if curStep == 891 then
			makeLuaSprite('blackscreen', 'Black', 0, 0)
			addLuaSprite('blackscreen',false)
			setGraphicSize('blackscreen',10000,10000)	
			precacheImage('Black')
			setObjectCamera('blackscreen', 'camOther')
		end
		if followchars == true then
			if mustHitSection == false then
			setProperty('defaultCamZoom',0.65)
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
				setProperty('defaultCamZoom',0.75)
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
				if getProperty('boyfriend.animation.curAnim.name') == 'idle' or getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' or getProperty('boyfriend.animation.curAnim.name') == 'hey' or getProperty('boyfriend.animation.curAnim.name') == 'hey-alt' then
					triggerEvent('Camera Follow Pos',xx2,yy2)
				end
			end
			triggerEvent('Camera Follow Pos','','')
		end
	end
end

function onStepHit()
	if curStep == 272 or curStep == 275 or curStep == 278 or curStep == 288 or curStep == 291 or curStep == 294 or curStep == 304 or curStep == 307 or curStep == 310 or curStep == 584 or curStep == 776 then
		setProperty('flash.alpha',0.7);
		doTweenAlpha('flashthing', 'flash', 0, 0.4, 'linear');
	end
end