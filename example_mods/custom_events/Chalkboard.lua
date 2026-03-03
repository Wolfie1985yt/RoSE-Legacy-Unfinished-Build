-- function onCreate()
-- addLuaScript('globalScripts/EducatorScript/NumberBounce')
-- Iclickedanumbah = 0;
-- issaclickytime = false;
-- WordAlpha = 1;
-- YOUDIDITYAYY = false;
-- TimerFinish = false;
-- hitbox = 60;

-- setObjectOrder('1', 99);
-- setObjectOrder('2', 99);
-- setObjectOrder('3', 99);
-- setObjectOrder('4', 99);
-- setObjectOrder('5', 99);
-- setObjectOrder('6', 99);
-- setObjectOrder('7', 99);
-- setObjectOrder('8', 99);
-- setObjectOrder('9', 99);
-- setObjectOrder('0', 99);
-- setObjectOrder('chalkboard', 100);

-- makeLuaSprite('chalkboard', 'EducatorAssets/Blackboard', 380, 200);
-- scaleObject('chalkboard', 2, 2)
-- setObjectCamera('chalkboard', 'hud');

-- makeLuaSprite('Question1', 'EducatorAssets/QUESTON1', 420, 270);
-- scaleObject('Question1', 2, 2)
-- setObjectCamera('Question1', 'hud');

-- makeLuaSprite('Question2', 'EducatorAssets/QUESTON2', 500, 270);
-- scaleObject('Question2', 2, 2)
-- setObjectCamera('Question2', 'hud');

-- makeLuaSprite('Question3', 'EducatorAssets/QUESTON3', 550, 270);
-- scaleObject('Question3', 2, 2)
-- setObjectCamera('Question3', 'hud');

-- makeLuaSprite('Question4', 'EducatorAssets/QUESTON4', 550, 270);
-- scaleObject('Question4', 2, 2)
-- setObjectCamera('Question4', 'hud');

-- makeLuaSprite('Question5', 'EducatorAssets/QUESTON5', 470, 210);
-- scaleObject('Question5', 2, 2)
-- setObjectCamera('Question5', 'hud');

-- makeLuaSprite('Question6', 'EducatorAssets/QUESTON6', 550, 270);
-- scaleObject('Question6', 2, 2)
-- setObjectCamera('Question6', 'hud');

-- makeLuaSprite('Question7', 'EducatorAssets/QUESTON7', 420, 270);
-- scaleObject('Question7', 2, 2)
-- setObjectCamera('Question7', 'hud');

-- makeLuaSprite('Question8', 'EducatorAssets/QUESTON8', 470, 220);
-- scaleObject('Question8', 2, 2)
-- setObjectCamera('Question8', 'hud');

-- makeLuaSprite('Question9', 'EducatorAssets/QUESTON9', 550, 270);
-- scaleObject('Question9', 2, 2)
-- setObjectCamera('Question9', 'hud');

-- makeLuaSprite('1', 'EducatorAssets/1', getRandomInt(0, 1120), getRandomInt(0, 560));
-- setScrollFactor('1', 0,0);
-- setObjectCamera('1', 'other');

-- makeLuaSprite('2', 'EducatorAssets/2', getRandomInt(0, 1120), getRandomInt(0, 560));
-- setScrollFactor('2', 0,0);
-- setObjectCamera('2', 'other');

-- makeLuaSprite('3', 'EducatorAssets/3', getRandomInt(0, 1120), getRandomInt(0, 560));
-- setScrollFactor('3', 0,0);
-- setObjectCamera('3', 'other');

-- makeLuaSprite('4', 'EducatorAssets/4', getRandomInt(0, 1120), getRandomInt(0, 560));
-- setScrollFactor('4', 0,0);
-- setObjectCamera('4', 'other');

-- makeLuaSprite('5', 'EducatorAssets/5', getRandomInt(0, 1120), getRandomInt(0, 560));
-- setScrollFactor('5', 0,0);
-- setObjectCamera('5', 'other');

-- makeLuaSprite('6', 'EducatorAssets/6', getRandomInt(0, 1120), getRandomInt(0, 560));
-- setScrollFactor('6', 0,0);
-- setObjectCamera('6', 'other');

-- makeLuaSprite('7', 'EducatorAssets/7', getRandomInt(0, 1120), getRandomInt(0, 560));
-- setScrollFactor('7', 0,0);
-- setObjectCamera('7', 'other');

-- makeLuaSprite('8', 'EducatorAssets/8', getRandomInt(0, 1120), getRandomInt(0, 560));
-- setScrollFactor('8', 0,0);
-- setObjectCamera('8', 'other');

-- makeLuaSprite('9', 'EducatorAssets/9', getRandomInt(0, 1120), getRandomInt(0, 560));
-- setScrollFactor('9', 0,0);
-- setObjectCamera('9', 'other');

-- makeLuaSprite('0', 'EducatorAssets/0', getRandomInt(0, 1120), getRandomInt(0, 560));
-- setScrollFactor('0', 0,0);
-- setObjectCamera('0', 'other');
-- end

-- function onEvent(name, value1, value2)
-- if name == 'Chalkboard' then

-- math.randomseed(os.time());
-- Question = string.format('Question%i', math.random(1, 9));

-- Iclickedanumbah = 0;
-- TimerFinish = false;
-- Timer = (value1)
-- runTimer('answerthequestiondude', Timer);

-- setProperty('Question1.visible', true);
-- setProperty('Question2.visible', true);
-- setProperty('Question3.visible', true);
-- setProperty('Question4.visible', true);
-- setProperty('Question5.visible', true);
-- setProperty('Question6.visible', true);
-- setProperty('Question7.visible', true);
-- setProperty('Question8.visible', true);
-- setProperty('Question9.visible', true);
-- setProperty('cursor.visible', true);
-- addLuaSprite('chalkboard', true)
-- setProperty('chalkboard.visible', true);
-- setPropertyFromClass('flixel.FlxG', 'mouse.visible', true);
-- setProperty('1.visible', true);
-- setProperty('2.visible', true);
-- setProperty('3.visible', true);
-- setProperty('4.visible', true);
-- setProperty('5.visible', true);
-- setProperty('6.visible', true);
-- setProperty('7.visible', true);
-- setProperty('8.visible', true);
-- setProperty('9.visible', true);
-- setProperty('0.visible', true);
-- setProperty('1.x', getRandomInt(0, 1120))
-- setProperty('1.y', getRandomInt(0, 560))
-- setProperty('2.x', getRandomInt(0, 1120))
-- setProperty('2.y', getRandomInt(0, 560))
-- setProperty('3.x', getRandomInt(0, 1120))
-- setProperty('3.y', getRandomInt(0, 560))
-- setProperty('4.x', getRandomInt(0, 1120))
-- setProperty('4.y', getRandomInt(0, 560))
-- setProperty('5.x', getRandomInt(0, 1120))
-- setProperty('5.y', getRandomInt(0, 560))
-- setProperty('6.x', getRandomInt(0, 1120))
-- setProperty('6.y', getRandomInt(0, 560))
-- setProperty('7.x', getRandomInt(0, 1120))
-- setProperty('7.y', getRandomInt(0, 560))
-- setProperty('8.x', getRandomInt(0, 1120))
-- setProperty('8.y', getRandomInt(0, 560))
-- setProperty('9.x', getRandomInt(0, 1120))
-- setProperty('9.y', getRandomInt(0, 560))
-- setProperty('0.x', getRandomInt(0, 1120))
-- setProperty('0.y', getRandomInt(0, 560))
-- addLuaSprite('1', true)
-- addLuaSprite('2', true)
-- addLuaSprite('3', true)
-- addLuaSprite('4', true)
-- addLuaSprite('5', true)
-- addLuaSprite('6', true)
-- addLuaSprite('7', true)
-- addLuaSprite('8', true)
-- addLuaSprite('9', true)
-- addLuaSprite('0', true)
-- addLuaSprite(Question, true);
-- addLuaSprite('flash', true);

-- setProperty('boyfriend.stunned', true);
-- issaclickytime = true;

-- end
-- end

-- function onUpdate()
--     local function updatePosition(spriteName)
--         local x = getProperty(spriteName .. '.x')
--         local y = getProperty(spriteName .. '.y')
--         local newX = x + math.random(-10, 10) 
--         local newY = y + math.random(-10, 10)
        
--         setProperty(spriteName .. '.x', newX)
--         setProperty(spriteName .. '.y', newY)
--     end

--     updatePosition('1')
--     updatePosition('2')
--     updatePosition('3')
--     updatePosition('4')
--     updatePosition('5')
--     updatePosition('6')
--     updatePosition('7')
--     updatePosition('8')
--     updatePosition('9')
--     updatePosition('0')

--     mouseX = getMouseX('hud') - 50;
--     mouseY = getMouseY('hud') - 55;
--     oneX = getProperty('1.x');
--     oneY = getProperty('1.y');
--     fiveX = getProperty('5.x');
--     fiveY = getProperty('5.y');
--     sixX = getProperty('6.x');
--     sixY = getProperty('6.y');
--     eightX = getProperty('8.x');
--     eightY = getProperty('8.y');
--     nineX = getProperty('9.x');
--     nineY = getProperty('9.y');

-- if issaclickytime == true and Question == 'Question1' and Iclickedanumbah == 0 and mouseClicked() and math.abs(oneX - mouseX) <= hitbox and math.abs(oneY - mouseY) <= hitbox then
-- Iclickedanumbah = 1
-- YOUDIDITYAYY = true

-- elseif issaclickytime == true and Question == 'Question2' and Iclickedanumbah == 0 and mouseClicked() and math.abs(sixX - mouseX) <= hitbox and math.abs(sixY - mouseY) <= hitbox then
-- Iclickedanumbah = 1
-- YOUDIDITYAYY = true

-- elseif issaclickytime == true and Question == 'Question3' and Iclickedanumbah == 0 and mouseClicked() and math.abs(sixX - mouseX) <= hitbox and math.abs(sixY - mouseY) <= hitbox then
-- Iclickedanumbah = 1
-- YOUDIDITYAYY = true

-- elseif issaclickytime == true and Question == 'Question4' and Iclickedanumbah == 0 and mouseClicked() and math.abs(sixX - mouseX) <= hitbox and math.abs(sixY - mouseY) <= hitbox then
-- Iclickedanumbah = 1
-- YOUDIDITYAYY = true

-- elseif issaclickytime == true and Question == 'Question5' and Iclickedanumbah == 0 and mouseClicked() and math.abs(nineX - mouseX) <= hitbox and math.abs(nineY - mouseY) <= hitbox then
-- Iclickedanumbah = 1
-- YOUDIDITYAYY = true

-- elseif issaclickytime == true and Question == 'Question6' and Iclickedanumbah == 0 and mouseClicked() and math.abs(fiveX - mouseX) <= hitbox and math.abs(fiveY - mouseY) <= hitbox then
-- Iclickedanumbah = 1
-- YOUDIDITYAYY = true

-- elseif issaclickytime == true and Question == 'Question7' and Iclickedanumbah == 0 and mouseClicked() and math.abs(fiveX - mouseX) <= hitbox and math.abs(fiveY - mouseY) <= hitbox then
-- Iclickedanumbah = 1
-- YOUDIDITYAYY = true

-- elseif issaclickytime == true and Question == 'Question8' and Iclickedanumbah == 0 and mouseClicked() and math.abs(eightX - mouseX) <= hitbox and math.abs(eightY - mouseY) <= hitbox then
-- Iclickedanumbah = 1
-- YOUDIDITYAYY = true

-- elseif issaclickytime == true and Question == 'Question9' and Iclickedanumbah == 0 and mouseClicked() and math.abs(nineX - mouseX) <= hitbox and math.abs(nineY - mouseY) <= hitbox then
-- Iclickedanumbah = 1
-- YOUDIDITYAYY = true

-- elseif YOUDIDITYAYY == true then
-- issaclickytime = false;
-- setProperty('Question1.alpha', 1);
-- setProperty('1.alpha', 1);
-- setProperty('boyfriend.stunned', false);
-- setProperty('Question1.visible', false);
-- setProperty('Question2.visible', false);
-- setProperty('Question3.visible', false);
-- setProperty('Question4.visible', false);
-- setProperty('Question5.visible', false);
-- setProperty('Question6.visible', false);
-- setProperty('Question7.visible', false);
-- setProperty('Question8.visible', false);
-- setProperty('Question9.visible', false);
-- setProperty('1.visible', false);
-- setProperty('2.visible', false);
-- setProperty('3.visible', false);
-- setProperty('4.visible', false);
-- setProperty('5.visible', false);
-- setProperty('6.visible', false);
-- setProperty('7.visible', false);
-- setProperty('8.visible', false);
-- setProperty('9.visible', false);
-- setProperty('0.visible', false);
-- setProperty('chalkboard.visible', false);
-- setPropertyFromClass('flixel.FlxG', 'mouse.visible', false);
-- Iclickedanumbah = 0;
-- YOUDIDITYAYY = false;
-- TimerFinish = true;
-- end
-- end

-- function onUpdatePost()
-- if Question == 'Question1' then
-- setProperty('Question1.alpha', 1);
-- setProperty('Question2.alpha', 0);
-- setProperty('Question3.alpha', 0);
-- setProperty('Question4.alpha', 0);
-- setProperty('Question5.alpha', 0);
-- setProperty('Question6.alpha', 0);
-- setProperty('Question7.alpha', 0);
-- setProperty('Question8.alpha', 0);
-- setProperty('Question9.alpha', 0);
-- elseif Question == 'Question2' then
-- setProperty('Question1.alpha', 0);
-- setProperty('Question2.alpha', 1);
-- setProperty('Question3.alpha', 0);
-- setProperty('Question4.alpha', 0);
-- setProperty('Question5.alpha', 0);
-- setProperty('Question6.alpha', 0);
-- setProperty('Question7.alpha', 0);
-- setProperty('Question8.alpha', 0);
-- setProperty('Question9.alpha', 0);


-- elseif Question == 'Question3' then
-- setProperty('Question1.alpha', 0);
-- setProperty('Question2.alpha', 0);
-- setProperty('Question3.alpha', 1);
-- setProperty('Question4.alpha', 0);
-- setProperty('Question5.alpha', 0);
-- setProperty('Question6.alpha', 0);
-- setProperty('Question7.alpha', 0);
-- setProperty('Question8.alpha', 0);
-- setProperty('Question9.alpha', 0);


-- elseif Question == 'Question4' then
-- setProperty('Question1.alpha', 0);
-- setProperty('Question2.alpha', 0);
-- setProperty('Question3.alpha', 0);
-- setProperty('Question4.alpha', 1);
-- setProperty('Question5.alpha', 0);
-- setProperty('Question6.alpha', 0);
-- setProperty('Question7.alpha', 0);
-- setProperty('Question8.alpha', 0);
-- setProperty('Question9.alpha', 0);


-- elseif Question == 'Question5' then
--     setProperty('Question1.alpha', 0);
--     setProperty('Question2.alpha', 0);
--     setProperty('Question3.alpha', 0);
--     setProperty('Question4.alpha', 0);
--     setProperty('Question5.alpha', 1);
--     setProperty('Question6.alpha', 0);
--     setProperty('Question7.alpha', 0);
--     setProperty('Question8.alpha', 0);
--     setProperty('Question9.alpha', 0);


-- elseif Question == 'Question6' then
--     setProperty('Question1.alpha', 0);
--     setProperty('Question2.alpha', 0);
--     setProperty('Question3.alpha', 0);
--     setProperty('Question4.alpha', 0);
--     setProperty('Question5.alpha', 0);
--     setProperty('Question6.alpha', 1);
--     setProperty('Question7.alpha', 0);
--     setProperty('Question8.alpha', 0);
--     setProperty('Question9.alpha', 0);

-- elseif Question == 'Question7' then
--     setProperty('Question1.alpha', 0);
--     setProperty('Question2.alpha', 0);
--     setProperty('Question3.alpha', 0);
--     setProperty('Question4.alpha', 0);
--     setProperty('Question5.alpha', 0);
--     setProperty('Question6.alpha', 0);
--     setProperty('Question7.alpha', 1);
--     setProperty('Question8.alpha', 0);
--     setProperty('Question9.alpha', 0);

-- elseif Question == 'Question8' then
--     setProperty('Question1.alpha', 0);
--     setProperty('Question2.alpha', 0);
--     setProperty('Question3.alpha', 0);
--     setProperty('Question4.alpha', 0);
--     setProperty('Question5.alpha', 0);
--     setProperty('Question6.alpha', 0);
--     setProperty('Question7.alpha', 0);
--     setProperty('Question8.alpha', 1);
--     setProperty('Question9.alpha', 0);

-- elseif Question == 'Question9' then
--     setProperty('Question1.alpha', 0);
--     setProperty('Question2.alpha', 0);
--     setProperty('Question3.alpha', 0);
--     setProperty('Question4.alpha', 0);
--     setProperty('Question5.alpha', 0);
--     setProperty('Question6.alpha', 0);
--     setProperty('Question7.alpha', 0);
--     setProperty('Question8.alpha', 0);
--     setProperty('Question9.alpha', 1);
-- end
-- end

-- function onTimerCompleted(tag, loops, loopsLeft)
-- if tag == 'answerthequestiondude' and TimerFinish == false then
-- setProperty('health', -500);
-- end
-- end