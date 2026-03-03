function onStepHit()
    if curStep == 1984 then --glitch part
        setProperty('dadGroup.x', getProperty('dadGroup.x') + 300);
        setProperty('dadGroup.y', getProperty('dadGroup.y') - 42);
        setProperty('boyfriendGroup.x', getProperty('boyfriendGroup.x') - 50);
        setProperty('boyfriendGroup.y', getProperty('boyfriendGroup.y') + 10);
    end
end