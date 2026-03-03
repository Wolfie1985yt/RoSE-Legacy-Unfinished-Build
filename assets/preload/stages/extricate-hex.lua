function onCreate()
	if getPropertyFromClass('backend.ClientPrefs', 'PotatoOptimization') == false then
		if songName == 'extricate-hex' then
			makeLuaSprite('sky', 'bgs/curse/good/sky', -450, -6700);
			scaleObject('sky', 1, 1);
			setScrollFactor('sky', 0.2, 0.2);
			addLuaSprite('sky', false);
			
			makeLuaSprite('light_back', 'bgs/curse/good/light_back', -1050, -6700);
			scaleObject('light_back', 1, 1);
			setScrollFactor('light_back', 0.2, 0.2);
			addLuaSprite('light_back', false);
			
			makeLuaSprite('light_front', 'bgs/curse/good/light_front', -1050, -6700);
			scaleObject('light_front', 1, 1);
			setScrollFactor('light_front', 0.2, 0.2);
			addLuaSprite('light_front', true);
			
			makeLuaSprite('cloud2-day', 'bgs/curse/good/day/clouds2', -650, -350);
			scaleObject('cloud2-day', 1.1, 1.1);
			setScrollFactor('cloud2-day', 0.4, 0.4);
			addLuaSprite('cloud2-day', false);
			
			makeLuaSprite('cloud1-day', 'bgs/curse/good/day/clouds1', -650, -350);
			scaleObject('cloud1-day', 1.1, 1.1);
			setScrollFactor('cloud1-day', 0.4, 0.4);
			addLuaSprite('cloud1-day', false);
			
			makeLuaSprite('cloud2-evening', 'bgs/curse/good/sunset/clouds2', -650, -350);
			scaleObject('cloud2-evening', 1.1, 1.1);
			setScrollFactor('cloud2-evening', 0.4, 0.4);
			setProperty('cloud2-evening.alpha',0);
			addLuaSprite('cloud2-evening', false);
			
			makeLuaSprite('cloud1-evening', 'bgs/curse/good/sunset/clouds1', -650, -350);
			scaleObject('cloud1-evening', 1.1, 1.1);
			setScrollFactor('cloud1-evening', 0.4, 0.4);
			setProperty('cloud1-evening.alpha',0);
			addLuaSprite('cloud1-evening', false);
			
			makeLuaSprite('cloud2-night', 'bgs/curse/good/night/clouds2', -650, -350);
			scaleObject('cloud2-night', 1.1, 1.1);
			setScrollFactor('cloud2-night', 0.4, 0.4);
			setProperty('cloud2-night.alpha',0);
			addLuaSprite('cloud2-night', false);
			
			makeLuaSprite('cloud1-night', 'bgs/curse/good/night/clouds1', -650, -350);
			scaleObject('cloud1-night', 1.1, 1.1);
			setScrollFactor('cloud1-night', 0.4, 0.4);
			setProperty('cloud1-night.alpha',0);
			addLuaSprite('cloud1-night', false);
			
			makeAnimatedLuaSprite('water-day', 'bgs/curse/good/day/Curse_water_Day', -650, -375);
			scaleObject('water-day', 1.1, 1.1);
			setScrollFactor('water-day', 0.4, 0.4);
			addAnimationByPrefix('water-day', 'idle', 'Water D', 23, true);
			setProperty('water-day.alpha', 1);
			addLuaSprite('water-day', false);
			
			makeAnimatedLuaSprite('water-evening', 'bgs/curse/good/sunset/Curse_water_Sun', -650, -375);
			scaleObject('water-evening', 1.1, 1.1);
			setScrollFactor('water-evening', 0.4, 0.4);
			addAnimationByPrefix('water-evening', 'idle', 'Water S', 23, true);
			setProperty('water-evening.alpha', 0);
			addLuaSprite('water-evening', false);
			
			makeAnimatedLuaSprite('water-night', 'bgs/curse/good/night/Curse_water_Night', -650, -375);
			scaleObject('water-night', 1.1, 1.1);
			setScrollFactor('water-night', 0.4, 0.4);
			addAnimationByPrefix('water-night', 'idle', 'Water N', 23, true);
			setProperty('water-night.alpha', 0);
			addLuaSprite('water-night', false);
			
			makeLuaSprite('city-day', 'bgs/curse/good/day/beach', -650, -380);
			scaleObject('city-day', 1.1, 1.1);
			setScrollFactor('city-day', 0.4, 0.4);
			setProperty('city-day.antialiasing', true);
			addLuaSprite('city-day', false);
			
			makeLuaSprite('city-evening', 'bgs/curse/good/sunset/beach', -650, -380);
			scaleObject('city-evening', 1.1, 1.1);
			setScrollFactor('city-evening', 0.4, 0.4);
			setProperty('city-evening.antialiasing', true);
			setProperty('city-evening.alpha',0);
			addLuaSprite('city-evening', false);
			
			makeLuaSprite('city-night', 'bgs/curse/good/night/beach', -650, -380);
			scaleObject('city-night', 1.1, 1.1);
			setScrollFactor('city-night', 0.4, 0.4);
			setProperty('city-night.antialiasing', true);
			setProperty('city-night.alpha',0);
			addLuaSprite('city-night', false);
			
			makeLuaSprite('bridge-day', 'bgs/curse/good/day/bridge', -740, -340);
			scaleObject('bridge-day', 1.12, 1.12);
			setScrollFactor('bridge-day', 1, 1);
			setProperty('bridge-day.antialiasing', true);
			addLuaSprite('bridge-day', false);
			
			makeLuaSprite('bridge-evening', 'bgs/curse/good/sunset/bridge', -740, -340);
			scaleObject('bridge-evening', 1.12, 1.12);
			setScrollFactor('bridge-evening', 1, 1);
			setProperty('bridge-evening.antialiasing', true);
			setProperty('bridge-evening.alpha',0);
			addLuaSprite('bridge-evening', false);
			
			makeLuaSprite('bridge-night', 'bgs/curse/good/night/bridge', -740, -340);
			scaleObject('bridge-night', 1.12, 1.12);
			setScrollFactor('bridge-night', 1, 1);
			setProperty('bridge-night.antialiasing', true);
			setProperty('bridge-night.alpha',0);
			addLuaSprite('bridge-night', false);
		end
	end
	makeLuaSprite('blackscreen', '', 0, 0);
	makeGraphic('blackscreen',1920,1080,'000000')
	addLuaSprite('blackscreen', false);
	setLuaSpriteScrollFactor('blackscreen',0,0)
	setProperty('blackscreen.scale.x',2)
	setProperty('blackscreen.scale.y',2)
	setObjectCamera('blackscreen', 'camOther')
	setProperty('blackscreen.alpha',0);
	
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash',1920,1080,'FFFFFF')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash',0,0)
	setProperty('flash.scale.x',2)
	setProperty('flash.scale.y',2)
	setObjectCamera('flash', 'camOther')
	setProperty('flash.alpha',0);
end
function onSongStart()
	doTweenY('skyTween1','sky',-3100,100,'quadInOut')
	doTweenY('light1Tween1','light_back',-3100,100,'quadInOut')
	doTweenY('light2Tween1','light_front',-3100,100,'quadInOut')
	
	doTweenAlpha('eveningTween1','cloud2-evening',1,100,'quadInOut');
	doTweenAlpha('eveningTween2','cloud1-evening',1,100,'quadInOut');
	doTweenAlpha('eveningTween3','water-evening',1,100,'quadInOut');
	doTweenAlpha('eveningTween4','city-evening',1,100,'quadInOut');
	doTweenAlpha('eveningTween5','bridge-evening',1,100,'quadInOut');
end
function onTweenCompleted(tag)
	if tag == 'skyTween1' then
		doTweenY('skyTween2','sky',-200,80,'quadInOut')
		doTweenY('light1Tween2','light_back',-200,80,'quadInOut')
		doTweenY('light2Tween2','light_front',-200,80,'quadInOut')
		
		doTweenAlpha('nightTween1','cloud2-night',1,80,'quadInOut');
		doTweenAlpha('nightTween2','cloud1-night',1,80,'quadInOut');
		doTweenAlpha('nightTween3','water-night',1,80,'quadInOut');
		doTweenAlpha('nightTween4','city-night',1,80,'quadInOut');
		doTweenAlpha('nightTween5','bridge-night',1,80,'quadInOut');
		doTweenAlpha('nightTween6','cloud2-day',0,80,'quadInOut');
		doTweenAlpha('nightTween7','cloud2-evening',0,80,'quadInOut');
		doTweenAlpha('nightTween8','cloud1-day',0,80,'quadInOut');
		doTweenAlpha('nightTween9','cloud1-evening',0,80,'quadInOut');
	end
end
function onUpdate(elapsed)

    songPos = getPropertyFromClass('Conductor', 'songPosition');
 
    currentBeat = (songPos / 300) * (bpm / 180)
	
end
function onStepHit()
	if curStep == 1536 then
		setProperty('blackscreen.alpha',1);
	end
	if curStep == 1568 then
		setProperty('flash.alpha',1);
		setProperty('blackscreen.alpha',0);
		doTweenAlpha('flashbang','flash',0,1,'linear');
	end
	if curStep == 2464 then
		setProperty('blackscreen.alpha',1);
		setProperty('flash.alpha',1);
		doTweenAlpha('flashbang','flash',0,1,'linear');
	end
end
