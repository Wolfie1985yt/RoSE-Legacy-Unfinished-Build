--Script by Wolfie_1985
function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'dad-idle' then							
		setProperty('dad.idleSuffix','')
	end
	if tag == 'gf-idle' then							
		setProperty('gf.idleSuffix','')
	end
	if tag == 'bf-idle' then							
		setProperty('boyfriend.idleSuffix','')
	end
end
function opponentNoteHit(membersIndex, notedata, noteType, isSustainNote)
	if noteType == 'GF and Dad' then
		if notedata == 0 then
			triggerEvent('Play Animation', 'singLEFT', 'gf')
		end
		if notedata == 1 then
			triggerEvent('Play Animation', 'singDOWN', 'gf')
		end
		if notedata == 2 then
			triggerEvent('Play Animation', 'singUP', 'gf')
		end
		if notedata == 3 then
			triggerEvent('Play Animation', 'singRIGHT', 'gf')
		end
	end
end
function goodNoteHit(membersIndex, notedata, noteType, isSustainNote)
	if songName == "face-off" then
		if noteType == 'No Animation' then
			--do nothing lol
		else
			setProperty('boyfriend.idleSuffix','-nothing')
			runTimer('bf-idle', 0.3)
			if curStep > 1 and curStep < 448 then
				setProperty('dad.idleSuffix','-nothing')
				runTimer('dad-idle', 0.3)
			end
		end
	end
	if noteType == 'GF and BF' then
		if notedata == 0 then
			triggerEvent('Play Animation', 'singLEFT', 'gf')
		end
		if notedata == 1 then
			triggerEvent('Play Animation', 'singDOWN', 'gf')
		end
		if notedata == 2 then
			triggerEvent('Play Animation', 'singUP', 'gf')
		end
		if notedata == 3 then
			triggerEvent('Play Animation', 'singRIGHT', 'gf')
		end
	end
end
function onEvent(name, value1, value2)
	if name == 'Change Character' then
		setProperty('health', getProperty('health') - 0.0001);
		setProperty('health', getProperty('health') + 0.0001);
	end
end