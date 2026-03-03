local xx = 250;
local yy = 300;
local xx2 = 620;
local yy2 = 300;
local ofs = 10;
local ofs2 = 10;
local PhaseTwo = false;
local camx = 0;
local camy = 0;
local followchars = false;
local camzoom = 0;

function onCreate()
	if songName == 'thunderbolt' then
		followchars = false;
	else
		followchars = true;
	end
	

	camx = getProperty('camGame.x');
	camy = getProperty('camGame.y');

	makeLuaSprite('sky', 'bgs/nature/sky', -1400, -800);
	scaleObject('sky', 1.4, 1.4);
	setScrollFactor('sky', 1.05, 1.05);
	setProperty('sky.antialiasing', true);
	addLuaSprite('sky', false);
	
	makeLuaSprite('montains', 'bgs/nature/montains', -1000, 0);
	scaleObject('montains', 1.4, 1.4);
	setScrollFactor('montains', 1, 1);
	setProperty('montains.antialiasing', true);
	addLuaSprite('montains', false);
	
	makeLuaSprite('floor', 'bgs/nature/floor', -1400, 500);
	scaleObject('floor', 1.6, 1.6);
	setScrollFactor('floor', 1, 1);
	setProperty('floor.antialiasing', true);
	addLuaSprite('floor', false);
	
	makeLuaSprite('arbutos', 'bgs/nature/arbutos', -1600, 300);
	scaleObject('arbutos', 1.6, 1.6);
	setScrollFactor('arbutos', 1, 1);
	setProperty('arbutos.antialiasing', true);
	addLuaSprite('arbutos', false);
	
	makeLuaSprite('nyyom', '', 0, 0);
	makeGraphic('nyyom',1920,1080,'FFFFFF')
	addLuaSprite('nyyom', true);
	setLuaSpriteScrollFactor('nyyom',0,0)
	setProperty('nyyom.scale.x',2)
	setProperty('nyyom.scale.y',2)
	setProperty('nyyom.alpha',0)
	
	makeLuaSprite('flashingshit', '', 0, 0);
	makeGraphic('flashingshit',1920,1080,'FFFF00')
	addLuaSprite('flashingshit', true);
	setLuaSpriteScrollFactor('flashingshit',0,0)
	setProperty('flashingshit.scale.x',2)
	setProperty('flashingshit.scale.y',2)
	setProperty('flashingshit.alpha',0)
end

function onTimerCompleted(tag)
	if PhaseTwo == true then
		if tag == 'Chu-Fly Up' then
			doTweenY('Chu-TweenUp', 'dad', -170, 2, 'quadInOut')
			runTimer('Chu-Fly Down', 2, 1)
		end
		if tag == 'Chu-Fly Down' then
			doTweenY('Chu-TweenDown', 'dad', -120, 1.5, 'quadInOut')
			runTimer('Chu-Fly Up', 1.5, 1)
		end
	end
end

function onSongStart()
	if songName == 'thunderbolt' then
		--doTweenAngle('camGame', 'camGame', 180, 1, 'quadInOut')
		doTweenZoom('camzoomshit','camGame', 2, .21, 'quadOut')
	end
end

function onBeatHit()
	if songName == 'thunderbolt' then
		if curBeat % 2 == 0 and camzoom == 1 then
			triggerEvent('Add Camera Zoom', 0.03, 0.03)
		end
		if curBeat % 1 == 0 and camzoom == 2 then
			triggerEvent('Add Camera Zoom', 0.03, 0.03)
		end
	end
end
function onUpdate(elapsed)

    songPos = getPropertyFromClass('Conductor', 'songPosition');
 
    currentBeat = (songPos / 300) * (bpm / 180)

	if songName == 'thunderbolt' then
		if curStep == 816 or curStep == 832 or curStep == 880 or curStep == 896 or curStep == 1036 or curStep == 1296 then
			camzoom = 0;
		end
		if curStep == 16 or curStep == 824 or curStep == 840 or curStep == 888 or curStep == 912 then
			camzoom = 1;
		end
		if curStep == 144 or curStep == 848 or curStep == 904 or curStep == 1040 then
			camzoom = 2;
		end
		if curStep <= 0 then
			triggerEvent('Camera Follow Pos', 360, 300)
		end
		if curStep == 1 then
			doTweenZoom('camzoomshit','camGame',0.5, .1, 'linear')
		end
		if curStep == 4 then
			setProperty('camGame.x',380) --dad
			doTweenZoom('camzoomshit','camGame',1, .00001, 'linear')
		end
		if curStep == 8 then
			setProperty('camGame.x',-520) --bf
			setProperty('camGame.y',-220) --bf
		end
		if curStep == 12 then
			setProperty('camGame.x',camx)
			setProperty('camGame.y',camy)
			doTweenZoom('camzoomshit','camGame',0.4, .00001, 'linear')
		end
		if curStep == 16 then
			doTweenZoom('camzoomshit','camGame',0.5, 0.86, 'linear')
			followchars = true
		end
		if curStep == 816 or curStep == 828 or curStep == 876 or curStep == 892 then
			triggerEvent('Cinematic_Bars', 1, '')
		end
		if curStep == 816 or curStep == 832 then
			setProperty('defaultCamZoom',0.7)
			doTweenAngle('camGame','camGame', 15, 0.1)
			xx = 350;
		end
		if curStep == 880 or curStep == 896 then
			setProperty('defaultCamZoom',0.7)
			doTweenAngle('camGame','camGame', -15, 0.1)
			xx2 = 720;
		end
		if curStep == 820 or curStep == 836 or curStep == 884 or curStep == 900 then
			xx = 250;
			triggerEvent('Cinematic_Bars', 2, '')
		end
		if curStep == 824 or curStep == 840 or curStep == 888 or curStep == 904 then
			doTweenAngle('camGame','camGame', 0, 0.1)
			setProperty('defaultCamZoom',0.5)
			xx2 = 620;
		end
	end

	if songName == "extreme-zap" then
		if curStep == 256 then
			setProperty('nyyom.alpha',1)
			doTweenAlpha('Flash0','nyyom',0,1,'linear')
		end
	
		if curStep == 480 then
			doTweenAlpha('Nyom','nyyom',1,2.5,'linear')
		end

		if curStep == 512 then
			setProperty('nyyom.alpha',0)
			setProperty('flashingshit.alpha',1)
			doTweenAlpha('Flash1','flashingshit',0,1,'linear')
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