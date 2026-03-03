function onUpdate(elapsed)
	if curStep >= 0 and curStep <= 575 then
	  songPos = getSongPosition()
	  local currentBeat = (songPos/1000)*(bpm/120)
	  doTweenY(dadTweenY, 'dad', 100-100*math.sin((currentBeat*0.25)*math.pi),0.001)
	end
	
	if curStep == 576 then
		doTweenY('dadReset','dad',202,1.2, 'quadInOut')
	end
	
	if curStep >= 880 then
	  songPos = getSongPosition()
	  local currentBeat = (songPos/1000)*(bpm/120)
	  doTweenY(dadTweenY, 'dad', 100-100*math.sin((currentBeat*0.25)*math.pi),0.001)
	end
end