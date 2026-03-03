function onCreate()
    -- Background elements
    makeLuaSprite('sky', 'bgs/too-slow/15', -666.5, -264.5)
    addLuaSprite('sky', false)
    setProperty('sky.scale.x', 1.5)
    setProperty('sky.scale.y', 1.5)

    makeLuaSprite('hiddenmountains', 'bgs/too-slow/14', -666.5, -262.5)
    addLuaSprite('hiddenmountains', false)
    setProperty('hiddenmountains.scale.x', 1.5)
    setProperty('hiddenmountains.scale.y', 1.5)

    makeLuaSprite('mountains', 'bgs/too-slow/13', -671.5, -266.5)
    addLuaSprite('mountains', false)
    setProperty('mountains.scale.x', 1.5)
    setProperty('mountains.scale.y', 1.5)

    makeLuaSprite('fuckedbushes', 'bgs/too-slow/12', -676.5, -264.5)
    addLuaSprite('fuckedbushes', false)
    setProperty('fuckedbushes.scale.x', 1.5)
    setProperty('fuckedbushes.scale.y', 1.5)

    makeLuaSprite('3', 'bgs/too-slow/1112', -666, -249)
    setProperty('3.alpha', 0)
    addLuaSprite('3', false)
    setProperty('3.scale.x', 1.5)
    setProperty('3.scale.y', 1.5)

    makeLuaSprite('smalltrees', 'bgs/too-slow/11', -679.25, -258)
    addLuaSprite('smalltrees', false)
    setProperty('smalltrees.scale.x', 1.5)
    setProperty('smalltrees.scale.y', 1.5)

    makeLuaSprite('coconuts', 'bgs/too-slow/10', -678.5, -264.5)
    addLuaSprite('coconuts', false)
    setProperty('coconuts.scale.x', 1.5)
    setProperty('coconuts.scale.y', 1.5)

    makeLuaSprite('floor', 'bgs/too-slow/9', -680, -264.5)
    addLuaSprite('floor', false)
    setProperty('floor.scale.x', 1.5)
    setProperty('floor.scale.y', 1.5)

    makeLuaSprite('leafy', 'bgs/too-slow/8', -688, -264.5)
    addLuaSprite('leafy', false)
    setProperty('leafy.scale.x', 1.5)
    setProperty('leafy.scale.y', 1.5)

    makeLuaSprite('2', 'bgs/too-slow/78', -663, -251)
    setProperty('2.alpha', 0)
    addLuaSprite('2', false)
    setProperty('2.scale.x', 1.5)
    setProperty('2.scale.y', 1.5)

    makeLuaSprite('knuxsandwich', 'bgs/too-slow/7', -678.25, -271)
    setProperty('knuxsandwich.alpha', 0)
    addLuaSprite('knuxsandwich', false)
    setProperty('knuxsandwich.scale.x', 1.5)
    setProperty('knuxsandwich.scale.y', 1.5)

    makeLuaSprite('eggbody', 'bgs/too-slow/6', -671.75, -270)
    setProperty('eggbody.alpha', 0)
    addLuaSprite('eggbody', false)
    setProperty('eggbody.scale.x', 1.5)
    setProperty('eggbody.scale.y', 1.5)

    makeLuaSprite('egghead', 'bgs/too-slow/5', -680.25, -273.75)
    setProperty('egghead.alpha', 0)
    addLuaSprite('egghead', false)
    setProperty('egghead.scale.x', 1.5)
    setProperty('egghead.scale.y', 1.5)

    makeLuaSprite('tailshead', 'bgs/too-slow/4', -668.25, -215)
    addLuaSprite('tailshead', false)
    setProperty('tailshead.scale.x', 1.5)
    setProperty('tailshead.scale.y', 1.5)

    makeLuaSprite('tailtail', 'bgs/too-slow/3', -687.25, -253)
    addLuaSprite('tailtail', false)
    setProperty('tailtail.scale.x', 1.5)
    setProperty('tailtail.scale.y', 1.5)

    makeLuaSprite('trees', 'bgs/too-slow/2', -674, -237)
    addLuaSprite('trees', false)
    setProperty('trees.scale.x', 1.5)
    setProperty('trees.scale.y', 1.5)

    makeLuaSprite('therocks', 'bgs/too-slow/1', -690, -256)
    addLuaSprite('therocks', false)
    setProperty('therocks.scale.x', 1.5)
    setProperty('therocks.scale.y', 1.5)


    -- Animated sprites
    makeAnimatedLuaSprite('fireanimated', 'bgs/too-slow/Fire background', -119.5, 60.5)
    addAnimationByPrefix('fireanimated', 'Fire background', 'Fire background', 24, true)
    setProperty('fireanimated.alpha', 0)
    setProperty('fireanimated.scale.x', 1.9)
    setProperty('fireanimated.scale.y', 1.9)
    addLuaSprite('fireanimated', true)

    makeLuaSprite('1', 'bgs/too-slow/0', -669, -259)
    setProperty('1.alpha', 0)
    addLuaSprite('1', true)
    setProperty('1.scale.x', 1.5)
    setProperty('1.scale.y', 1.5)

    makeAnimatedLuaSprite('knuxdead', 'bgs/too-slow/Dead Knux hang', -676, -274)
    addAnimationByPrefix('knuxdead', 'Hanging Knux', 'Hanging Knux', 24, true)
    setProperty('knuxdead.alpha', 0)
    addLuaSprite('knuxdead', false)
    setProperty('knuxdead.scale.x', 1.5)
    setProperty('knuxdead.scale.y', 1.5)

end

function onStepHit()    
    if curStep == 770 then
       setProperty('1.alpha',0.1)
       setProperty('2.alpha',0.1)
       setProperty('3.alpha',0.1)
       setProperty('knuxdead.alpha',1)
       setProperty('knuxsandwich.alpha',1)
    end
    if curStep == 943 then
       setProperty('1.alpha',0.2)
       setProperty('2.alpha',0.2)
       setProperty('3.alpha',0.2)
    end
    if curStep == 1180 then
       setProperty('1.alpha',0.3)
       setProperty('2.alpha',0.3)
       setProperty('3.alpha',0.3)
       setProperty('eggbody.alpha',1)
       setProperty('egghead.alpha',1)
    end
    if curStep == 1300 then
       setProperty('1.alpha',0.4)
       setProperty('2.alpha',0.4)
       setProperty('3.alpha',0.4)
    end
    if curStep == 1400 then
       setProperty('1.alpha',0.5)
       setProperty('2.alpha',0.5)
       setProperty('3.alpha',0.5)
    end
    if curStep == 1580 then
       setProperty('1.alpha',0.6)
       setProperty('2.alpha',0.6)
       setProperty('3.alpha',0.6)
    end
    if curStep == 1715 then
       setProperty('1.alpha',0.7)
       setProperty('2.alpha',0.7)
       setProperty('3.alpha',0.7)
    end
    if curStep == 1850 then
       setProperty('1.alpha',0.8)
       setProperty('2.alpha',0.8)
       setProperty('3.alpha',0.8)
    end
    if curStep == 1900 then
       setProperty('1.alpha',0.9)
       setProperty('2.alpha',0.9)
       setProperty('3.alpha',0.9)
    end
    if curStep == 1968 then
       setProperty('fireanimated', 1)
       setProperty('1.alpha',1)
       setProperty('2.alpha',1)
       setProperty('3.alpha',1)
    end
end