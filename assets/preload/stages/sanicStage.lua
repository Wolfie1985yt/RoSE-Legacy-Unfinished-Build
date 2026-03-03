function onCreate()
	makeLuaSprite('ytb', 'stages/oldytb-hud', 0, 0);
	setProperty('ytb.antialiasing', false);
	setScrollFactor('ytb', 0, 0);
	scaleObject('ytb', 0.8, 0.8);
	setObjectCamera('ytb', 'other')
	addLuaSprite('ytb', false)
	addLuaSprite('ytb', false);
end