local randomnum = 0;
function onBeatHit()
	randomnum = getRandomInt(1,9);
	if curBeat % 4 == 0 and curStep >= 4160 then
		if randomnum == 1 then 
			triggerEvent('Play Animation', 'idle1', 'gf');
		end
		if randomnum == 2 then
			triggerEvent('Play Animation', 'idle2', 'gf');
		end
		if randomnum == 3 then
			triggerEvent('Play Animation', 'idle3', 'gf');
		end
		if randomnum == 4 then
			triggerEvent('Play Animation', 'idle4', 'gf');
		end
		if randomnum == 5 then
			triggerEvent('Play Animation', 'idle5', 'gf');
		end
		if randomnum == 6 then
			triggerEvent('Play Animation', 'idle6', 'gf');
		end
		if randomnum == 7 then
			triggerEvent('Play Animation', 'idle7', 'gf');
		end
		if randomnum == 8 then
			triggerEvent('Play Animation', 'idle8', 'gf');
		end
		if randomnum == 9 then
			triggerEvent('Play Animation', 'idle9', 'gf');
		end
	end
end
function onUpdate()
	if curStep >= 4160 then
		setProperty('gf.idleSuffix','-nothing')
	end
end