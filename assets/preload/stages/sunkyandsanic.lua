local disco = false;
local discoPink = true;
local discoBlue = false;
local discoGreen = false;
local discoRed = false;
local discoOpOne = false;
local discoOpTwo = false;
local camBeat1 = false;
local camBeat2 = false;

function onCreate()
	if getPropertyFromClass('backend.ClientPrefs', 'PotatoOptimization') == false then
		makeLuaSprite('sanicbg1','bgs/nostalgic-duo/sanicbg-1',0,-200)
		addLuaSprite('sanicbg1',false)
		scaleObject('sanicbg1',2,2)
		setProperty('sanicbg1.antialiasing',true)
		
		makeLuaSprite('flashingshit2', '', 0, 0);
		makeGraphic('flashingshit2',1920,1080,'FFFFFF')
		addLuaSprite('flashingshit2', true);
		setLuaSpriteScrollFactor('flashingshit2',0,0)
		setProperty('flashingshit2.scale.x',2)
		setProperty('flashingshit2.scale.y',2)
		setProperty('flashingshit2.alpha',0)
		setObjectCamera('flashingshit2', 'hud')
	end
end
function onStepHit()
	if getPropertyFromClass('backend.ClientPrefs', 'PotatoOptimization') == false then	
		if curStep == 640 then
			disco = true;
			discoOpTwo = true;	
			camBeat1 = false;
			camBeat2 = true;
		end
		if curStep == 768 then
			disco = false;
			discoOpTwo = false;	
			camBeat2 = false;
			camBeat1 = true;
		end
		if curStep == 1025 then
			camBeat1 = false;
		end
		if curStep == 384 then
			camBeat1 = true;
			makeLuaSprite('sanicbg2','bgs/nostalgic-duo/sanicbg-2',10,-230)
			addLuaSprite('sanicbg2',false)
			scaleObject('sanicbg2',2,2)
			setProperty('sanicbg2.antialiasing',true)
			
			removeLuaSprite('sanicbg1')
		end
		if curStep == 640 then
			makeLuaSprite('sanicbg3','bgs/nostalgic-duo/sanicbg-3',150,050)
			addLuaSprite('sanicbg3',false)
			scaleObject('sanicbg3',2.1,2.1)
			
			setProperty('dad.x', 810)
			setProperty('dad.y', 1005)
			setProperty('boyfriend.x', 2050)
			setProperty('boyfriend.y', 820)
			removeLuaSprite('sanicbg2')
		end
	end			
end
function onUpdate(elapsed)
	setProperty('gf.visible',false)
end
function onBeatHit()
	if camBeat1 == true then
		if curBeat % 2 == 0 then
			triggerEvent('Add Camera Zoom', 0.03, 0.03)
		end
	end
	if camBeat2 == true then
		if curBeat % 1 == 0 then
			triggerEvent('Add Camera Zoom', 0.03, 0.03)
		end
	end
	if disco == true and (getPropertyFromClass('backend.ClientPrefs', 'flashing') == true) then
		if curBeat % 2 == 0 then
			if discoPink == true then
				setProperty('flashingshit2.color', getColorFromHex('FF63CB'))
				discoGreen = true;
				discoPink = false;
			end
			if discoBlue == true then
				setProperty('flashingshit2.color', getColorFromHex('00FFFF'))
				discoRed = true;
				discoBlue = false;
			end
			
			if discoOpOne == true then
				setProperty('flashingshit2.alpha',0.2)
			end
			if discoOpTwo == true then
				setProperty('flashingshit2.alpha',0.4)
			end
			doTweenAlpha('flashingshit2','flashingshit2',0,1,'linear')
		else
			if discoGreen == true then
				setProperty('flashingshit2.color', getColorFromHex('93FFB0'))
				discoBlue = true;
				discoGreen = false;
			end
			if discoRed == true then
				setProperty('flashingshit2.color', getColorFromHex('F9393F'))
				discoPink = true;
				discoRed = false;
			end
			
			if discoOpOne == true then
				setProperty('flashingshit2.alpha',0.2)
			end
			if discoOpTwo == true then
				setProperty('flashingshit2.alpha',0.4)
			end
			doTweenAlpha('flashingshit2','flashingshit2',0,1,'linear')
		end
	end
end