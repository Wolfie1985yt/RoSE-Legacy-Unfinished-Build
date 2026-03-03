local bfXPos = 0;
local bfYPos = 0;
local gfXPos = 0;
local gfYPos = 0;

function onCreate()
	if getPropertyFromClass('backend.ClientPrefs', 'PotatoOptimization') == false then
	if songName == 'malediction' then	
		--malediction bg
		makeLuaSprite('skyMaleAddiction', 'bgs/curse/malediction/Sky', -970, -505);
		scaleObject('skyMaleAddiction', 1.3, 1.3);
		setScrollFactor('skyMaleAddiction', 0.3, 0.3);
		setProperty('skyMaleAddiction.alpha', 1);
		addLuaSprite('skyMaleAddiction', false);
		
		makeLuaSprite('treesback', 'bgs/curse/malediction/treesback', -970, -505);
		scaleObject('treesback', 1.3, 1.3);
		setScrollFactor('treesback', 0.6, 0.6);
		setProperty('treesback.alpha', 1);
		addLuaSprite('treesback', false);
		
		makeLuaSprite('treesfront', 'bgs/curse/malediction/Treesfront', -970, -505);
		scaleObject('treesfront', 1.3, 1.3);
		setScrollFactor('treesfront', 0.7, 0.7);
		setProperty('treesfront.alpha', 1);
		addLuaSprite('treesfront', false);
		
		makeLuaSprite('floorback', 'bgs/curse/malediction/Floorback', -970, -505);
		scaleObject('floorback', 1.3, 1.3);
		setScrollFactor('floorback', 0.8, 0.8);
		setProperty('floorback.alpha', 1);
		addLuaSprite('floorback', false);
		
		makeLuaSprite('floorfront', 'bgs/curse/malediction/Floorfront', -970, -505);
		scaleObject('floorfront', 1.3, 1.3);
		setScrollFactor('floorfront', 1, 1);
		setProperty('floorfront.alpha', 1);
		addLuaSprite('floorfront', false);
		
		makeAnimatedLuaSprite('fountin', 'bgs/curse/malediction/Male addiction Fountain', -970, -505);
		setScrollFactor('fountin', 1, 1);
		addAnimationByPrefix('fountin', 'idle', 'Fountain', 24, true);
		setProperty('fountin.antialiasing', true);
		scaleObject('fountin', 1.3, 1.3)
		addLuaSprite('fountin', false);
		
		--extricate hex / good ending bg (for malediction)
		makeLuaSprite('sky', 'bgs/curse/good/sky', -450, -6700);
		scaleObject('sky', 1, 1);
		setScrollFactor('sky', 0.2, 0.2);
		setProperty('sky.alpha', 0.000001);
		addLuaSprite('sky', false);
		
		makeLuaSprite('light_back', 'bgs/curse/good/light_back', -1050, -6700);
		scaleObject('light_back', 1, 1);
		setScrollFactor('light_back', 0.2, 0.2);
		setProperty('light_back.alpha', 0.000001);
		addLuaSprite('light_back', false);
		
		makeLuaSprite('light_front', 'bgs/curse/good/light_front', -1050, -6700);
		scaleObject('light_front', 1, 1);
		setScrollFactor('light_front', 0.2, 0.2);
		setProperty('light_front.alpha', 0.000001);
		addLuaSprite('light_front', true);
		
		makeLuaSprite('cloud2-day', 'bgs/curse/good/day/clouds2', -650, -350);
		scaleObject('cloud2-day', 1.1, 1.1);
		setScrollFactor('cloud2-day', 0.4, 0.4);
		setProperty('cloud2-day.alpha', 0.000001);
		addLuaSprite('cloud2-day', false);
		
		makeLuaSprite('cloud1-day', 'bgs/curse/good/day/clouds1', -650, -350);
		scaleObject('cloud1-day', 1.1, 1.1);
		setScrollFactor('cloud1-day', 0.4, 0.4);
		setProperty('cloud1-day.alpha', 0.000001);
		addLuaSprite('cloud1-day', false);
		
		makeAnimatedLuaSprite('water-day', 'bgs/curse/good/day/Curse_water_Day', -650, -375);
		scaleObject('water-day', 1.1, 1.1);
		setScrollFactor('water-day', 0.4, 0.4);
		addAnimationByPrefix('water-day', 'idle', 'Water D', 23, true);
		setProperty('water-day.alpha', 0.000001);
		addLuaSprite('water-day', false);
		
		makeLuaSprite('city-day', 'bgs/curse/good/day/beach', -650, -380);
		scaleObject('city-day', 1.1, 1.1);
		setScrollFactor('city-day', 0.4, 0.4);
		setProperty('city-day.antialiasing', true);
		setProperty('city-day.alpha', 0.000001);
		addLuaSprite('city-day', false);
		
		makeLuaSprite('bridge-day', 'bgs/curse/good/day/bridge', -740, -340);
		scaleObject('bridge-day', 1.12, 1.12);
		setScrollFactor('bridge-day', 1, 1);
		setProperty('bridge-day.antialiasing', true);
		setProperty('bridge-day.alpha', 0.000001);
		addLuaSprite('bridge-day', false);
		
		--unblessful hedgehog / bad ending bg (for malediction)
		
		makeLuaSprite('skyBad', 'bgs/curse/bad/sky', -1150, -700);
		scaleObject('skyBad', 1.5, 1.5);
		setScrollFactor('skyBad', 1.3, 1.3);
		setProperty('skyBad.antialiasing', true);
		setProperty('skyBad.alpha', 0.000001);
		addLuaSprite('skyBad', false);
		
		makeLuaSprite('cityBad2', 'bgs/curse/bad/city2', -950, -700);
		scaleObject('cityBad2', 1.5, 1.5);
		setScrollFactor('cityBad2', 0.4, 0.4);
		setProperty('cityBad2.antialiasing', true);
		setProperty('cityBad2.alpha', 0.000001);
		addLuaSprite('cityBad2', false);
		
		makeLuaSprite('cityBad1', 'bgs/curse/bad/city1', -1150, -700);
		scaleObject('cityBad1', 1.5, 1.5);
		setScrollFactor('cityBad1', 0.6, 0.6);
		setProperty('cityBad1.antialiasing', true);
		setProperty('cityBad1.alpha', 0.000001);
		addLuaSprite('cityBad1', false);
		
		makeLuaSprite('treesBad', 'bgs/curse/bad/trees', -1150, -700);
		scaleObject('treesBad', 1.5, 1.5);
		setScrollFactor('treesBad', 0.8, 0.8);
		setProperty('treesBad.antialiasing', true);
		setProperty('treesBad.alpha', 0.000001);
		addLuaSprite('treesBad', false);
		
		makeLuaSprite('floorBad', 'bgs/curse/bad/floor', -1150, -700);
		scaleObject('floorBad', 1.5, 1.5);
		setScrollFactor('floorBad', 1, 1);
		setProperty('floorBad.antialiasing', true);
		setProperty('floorBad.alpha', 0.000001);
		addLuaSprite('floorBad', false);
		
		--rockslide bg
		
		makeLuaSprite('rockSky', 'bgs/curse/malediction/rockslide/sky', -900, -525);
		scaleObject('rockSky', 1, 1);
		setScrollFactor('rockSky', 0.4, 0.4);
		setProperty('rockSky.alpha', 0.000001);
		addLuaSprite('rockSky', false);
		
		makeLuaSprite('rockBackMountains', 'bgs/curse/malediction/rockslide/waybackmoutains', -900, -525);
		scaleObject('rockBackMountains', 1, 1);
		setScrollFactor('rockBackMountains', 0.6, 0.6);
		setProperty('rockBackMountains.alpha', 0.000001);
		addLuaSprite('rockBackMountains', false);
		
		makeLuaSprite('backclouds', 'bgs/curse/malediction/rockslide/backclouds', -900, -525);
		scaleObject('backclouds', 1, 1);
		setScrollFactor('backclouds', 0.6, 0.6);
		setProperty('backclouds.alpha', 0.000001);
		addLuaSprite('backclouds', false);
		
		makeLuaSprite('rockMidMountains', 'bgs/curse/malediction/rockslide/midmoutains', -800, -425);
		scaleObject('rockMidMountains', 1, 1);
		setScrollFactor('rockMidMountains', 0.7, 0.7);
		setProperty('rockMidMountains.alpha', 0.000001);
		addLuaSprite('rockMidMountains', false);
		
		makeLuaSprite('frontclouds', 'bgs/curse/malediction/rockslide/frontclouds', -900, -525);
		scaleObject('frontclouds', 1, 1);
		setScrollFactor('frontclouds', 0.7, 0.7);
		setProperty('frontclouds.alpha', 0.000001);
		addLuaSprite('frontclouds', false);
		
		makeLuaSprite('siderocks', 'bgs/curse/malediction/rockslide/siderocks', -900, -525);
		scaleObject('siderocks', 1, 1);
		setScrollFactor('siderocks', 0.9, 0.9);
		setProperty('siderocks.alpha', 0.000001);
		addLuaSprite('siderocks', false);
		
		makeLuaSprite('backrocks', 'bgs/curse/malediction/rockslide/backrocks', -900, -525);
		scaleObject('backrocks', 1, 1);
		setScrollFactor('backrocks', 1, 1);
		setProperty('backrocks.alpha', 0.000001);
		addLuaSprite('backrocks', false);
		
		makeLuaSprite('ground', 'bgs/curse/malediction/rockslide/ground', -900, -525);
		scaleObject('ground', 1, 1);
		setScrollFactor('ground', 1, 1);
		setProperty('ground.alpha', 0.000001);
		addLuaSprite('ground', false);
		
		makeLuaSprite('frontrocks', 'bgs/curse/malediction/rockslide/frontrocks', -900, -525);
		scaleObject('frontrocks', 1, 1);
		setScrollFactor('frontrocks', 1.1, 1.1);
		setProperty('frontrocks.alpha', 0.000001);
		setProperty('frontrocks.alpha',0);
		addLuaSprite('frontrocks', true);
	end
	
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
		
		makeAnimatedLuaSprite('water-evening', 'bgs/curse/good/sunset/Curse_water_Sunset', -650, -375);
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
	
	if songName == 'unblessful-hedgehog' then
		makeLuaSprite('skyBad', 'bgs/curse/bad/sky', -1150, -700);
		scaleObject('skyBad', 1.5, 1.5);
		setScrollFactor('skyBad', 1.3, 1.3);
		setProperty('skyBad.antialiasing', true);
		addLuaSprite('skyBad', false);

		makeLuaSprite('cityBad2', 'bgs/curse/bad/city2', -950, -700);
		scaleObject('cityBad2', 1.5, 1.5);
		setScrollFactor('cityBad2', 0.4, 0.4);
		setProperty('cityBad2.antialiasing', true);
		addLuaSprite('cityBad2', false);

		makeLuaSprite('cityBad1', 'bgs/curse/bad/city1', -1150, -700);
		scaleObject('cityBad1', 1.5, 1.5);
		setScrollFactor('cityBad1', 0.6, 0.6);
		setProperty('cityBad1.antialiasing', true);
		addLuaSprite('cityBad1', false);
	
		makeLuaSprite('treesBad', 'bgs/curse/bad/trees', -1150, -700);
		scaleObject('treesBad', 1.5, 1.5);
		setScrollFactor('treesBad', 0.8, 0.8);
		setProperty('treesBad.antialiasing', true);
		addLuaSprite('treesBad', false);
	
		makeLuaSprite('floorBad', 'bgs/curse/bad/floor', -1150, -700);
		scaleObject('floorBad', 1.5, 1.5);
		setScrollFactor('floorBad', 1, 1);
		setProperty('floorBad.antialiasing', true);
		addLuaSprite('floorBad', false);
	end
	
	makeAnimatedLuaSprite('static', 'bgs/curse/malediction/staticCurse', -350, -300);
	scaleObject('static', 1.75, 1.75);
	setScrollFactor('static', 0, 0);
	addAnimationByPrefix('static', 'static', 'menuSTATICNEW instance 1', 24, true);
	setProperty('static.antialiasing', true);
	setProperty('static.alpha', 0);
	addLuaSprite('static', false);
	
	makeLuaSprite('blk', '', 0, 0);
	makeGraphic('blk',1920,1080,'000000')
	addLuaSprite('blk', false);
	setLuaSpriteScrollFactor('blk',0,0)
	setProperty('blk.scale.x',2)
	setProperty('blk.scale.y',2)
	setProperty('blk.alpha',0)
	
	end
end

function onCreatePost()
	bfXPos = getProperty('boyfriend.x');
	bfYPos = getProperty('boyfriend.y');
	gfXPos = getProperty('gf.x');
	gfYPos = getProperty('gf.y');
end

function onUpdate(elapsed)


    songPos = getPropertyFromClass('Conductor', 'songPosition');
 
    currentBeat = (songPos / 300) * (bpm / 180)
	
	
	if songName == "malediction" then
		if curStep == 736 then
			doTweenAlpha('static','static',1,2,'linear')
			doTweenAlpha('frontRocksAlpha','frontrocks',0,2,'linear')
			setProperty('rockSky.alpha', 1);
			setProperty('rockBackMountains.alpha', 1);
			setProperty('backclouds.alpha', 1);
			setProperty('rockMidMountains.alpha', 1);
			setProperty('frontclouds.alpha', 1);
			setProperty('siderocks.alpha', 1);
			setProperty('backrocks.alpha', 1);
			setProperty('ground.alpha', 1);
			setProperty('frontrocks.alpha', 1);
			setProperty('boyfriend.x',900)
			setProperty('boyfriend.y',250)
			setProperty('gf.x',400)
			setProperty('gf.y',120)
			removeLuaSprite('skyMaleAddiction');
			removeLuaSprite('treesback');
			removeLuaSprite('treesfront');
			removeLuaSprite('floorback');
			removeLuaSprite('floorfront');
			removeLuaSprite('fountin');
		end
		
		if curStep == 760 then
			doTweenAlpha('static','static',0.5,2,'linear')
			doTweenAlpha('frontRocksAlpha','frontrocks',0.5,2,'linear')
		end
		
		if curStep == 784 then
			doTweenAlpha('static','static',1,2,'linear')
			doTweenAlpha('frontRocksAlpha','frontrocks',0,2,'linear')
		end
		
		if curStep == 808 then
			doTweenAlpha('static','static',0.5,2,'linear')
			doTweenAlpha('frontRocksAlpha','frontrocks',0.5,2,'linear')
		end
		
		if curStep == 832 then
			doTweenAlpha('static','static',1,2,'linear')
			doTweenAlpha('frontRocksAlpha','frontrocks',0,2,'linear')
		end
		
		if curStep == 856 then
			doTweenAlpha('static','static',0.5,2,'linear')
			doTweenAlpha('frontRocksAlpha','frontrocks',0.5,2,'linear')
		end

		if curStep == 880 then
			doTweenAlpha('static','static',1,2,'linear')
			doTweenAlpha('frontRocksAlpha','frontrocks',0,2,'linear')
		end
		
		if curStep == 904 then
			doTweenAlpha('static','static',0.5,2,'linear')
			doTweenAlpha('frontRocksAlpha','frontrocks',0.5,2,'linear')
		end
		
		if curStep == 928 then
			doTweenAlpha('static','static',1,2,'linear')
			doTweenAlpha('frontRocksAlpha','frontrocks',0,2,'linear')
		end
		
		if curStep == 952 then
			doTweenAlpha('static','static',0.5,2,'linear')
			doTweenAlpha('frontRocksAlpha','frontrocks',0.5,2,'linear')
		end
		
		if curStep == 976 then
			doTweenAlpha('static','static',1,2,'linear')
			doTweenAlpha('frontRocksAlpha','frontrocks',0,2,'linear')
		end
		
		if curStep == 992 then
			if getProperty('songMisses') <= 10 then
				setProperty('sky.alpha', 1);
				setProperty('light_back.alpha', 1);
				setProperty('light_front.alpha', 1);
				setProperty('cloud2-day.alpha', 1);
				setProperty('cloud1-day.alpha', 1);
				setProperty('water-day.alpha', 1);
				setProperty('city-day.alpha', 1);
				setProperty('bridge-day.alpha', 1);
				setProperty('dad.x',20)
				setProperty('dad.y',80)
				setProperty('gf.x',420)
				setProperty('gf.y',95)
				setProperty('boyfriend.x',850)
				setProperty('boyfriend.y',310)
			else
				setProperty('skyBad.visible',true)
				setProperty('cityBad2.visible',true)
				setProperty('cityBad1.visible',true)
				setProperty('treesBad.visible',true)
				setProperty('floorBad.visible',true)
				setProperty('dad.x',20)
				setProperty('dad.y',80)
				setProperty('gf.x',320)
				setProperty('gf.y',155)
				setProperty('boyfriend.x',700)
				setProperty('boyfriend.y',290)
			end

			doTweenAlpha('static','static',0,1,'linear')
			doTweenAlpha('frontRocksAlpha','frontrocks',0,1,'linear')
			doTweenAlpha('rockSkyAlpha','rockSky',0,1,'linear')
			doTweenAlpha('rockBackMountainsAlpha','rockBackMountains',0,1,'linear')
			doTweenAlpha('backcloudsAlpha','backclouds',0,1,'linear')
			doTweenAlpha('rockMidMountainsAlpha','rockMidMountains',0,1,'linear')
			doTweenAlpha('frontcloudsAlpha','frontclouds',0,1,'linear')
			doTweenAlpha('siderocksAlpha','siderocks',0,1,'linear')
			doTweenAlpha('backrocksAlpha','backrocks',0,1,'linear')
			doTweenAlpha('groundAlpha','ground',0,1,'linear')
			setProperty('boyfriend.x',bfXPos)
			setProperty('boyfriend.y',bfYPos)
			setProperty('gf.x',gfXPos)
			setProperty('gf.y',gfYPos)
		end
	end
	if songName == 'extricate-hex' then
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
	if songName == "unblessful-hedgehog" then
		if curStep == 0 then
			doTweenAlpha('blk','blk',1,20,'linear')
			setProperty('defaultCamZoom',0.75)
		end
		if curStep == 256 then
			doTweenAlpha('blk','blk',0,0.1,'linear')
			setProperty('defaultCamZoom',0.65)
			doTweenAlpha('static','static',0.7,1,'linear')
		end
		if curStep == 384 then
			doTweenAlpha('static','static',1,1.5,'linear')
		end
		if curStep == 512 then
			doTweenAlpha('static','static',0.5,1.5,'linear')
		end
		if curStep == 768 then
			doTweenAlpha('static','static',1,1.5,'linear')
			setProperty('defaultCamZoom',0.75)
		end
		if curStep == 1023 then
			doTweenAlpha('static','static',0.7,1.5,'linear')
			setProperty('defaultCamZoom',0.65)
		end
		if curStep == 1279 then
			doTweenAlpha('static','static',0.2,1.5,'linear')
			setProperty('defaultCamZoom',0.75)
		end
		if curStep == 1407 then
			doTweenAlpha('static','static',1,1.5,'linear')
			setProperty('defaultCamZoom',0.65)
		end
		if curStep == 1535 then
			doTweenAlpha('static','static',0.5,1.5,'linear')
		end		
		if curStep == 1791 then
			doTweenAlpha('static','static',1,1.5,'linear')
		end		
		if curStep == 2048 then 
			doTweenAlpha('blk','blk',1,23,'linear')
		    doTweenAlpha('static','static',0,23,'linear')
			setProperty('defaultCamZoom',0.75)
		end
	end
end
function onSongStart()
	if songName == 'extricate-hex' then
		doTweenY('skyTween1','sky',-3100,100,'quadInOut')
		doTweenY('light1Tween1','light_back',-3100,100,'quadInOut')
		doTweenY('light2Tween1','light_front',-3100,100,'quadInOut')
		
		doTweenAlpha('eveningTween1','cloud2-evening',1,100,'quadInOut');
		doTweenAlpha('eveningTween2','cloud1-evening',1,100,'quadInOut');
		doTweenAlpha('eveningTween3','water-evening',1,100,'quadInOut');
		doTweenAlpha('eveningTween4','city-evening',1,100,'quadInOut');
		doTweenAlpha('eveningTween5','bridge-evening',1,100,'quadInOut');
	end
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