numberpos = {};

function onCreatePost()
	for i = 0,7 do 
		yoff = 10;
		if isStoryMode then yoff = 0 end
        table.insert(numberpos, {getPropertyFromGroup('strumLineNotes', i, 'x'),getPropertyFromGroup('strumLineNotes', i, 'y') + yoff})
	end

makeLuaSprite('1', 'EducatorAssets/1', getRandomInt(0, 100), getRandomInt(0, 100));
setScrollFactor('1', 0,0);
setObjectCamera('1', 'other');

makeLuaSprite('2', 'EducatorAssets/2', getRandomInt(0, 100), getRandomInt(0, 100));
setScrollFactor('2', 0,0);
setObjectCamera('2', 'other');

makeLuaSprite('3', 'EducatorAssets/3', getRandomInt(0, 100), getRandomInt(0, 100));
setScrollFactor('3', 0,0);
setObjectCamera('3', 'other');

makeLuaSprite('4', 'EducatorAssets/4', getRandomInt(0, 100), getRandomInt(0, 100));
setScrollFactor('4', 0,0);
setObjectCamera('4', 'other');

makeLuaSprite('5', 'EducatorAssets/5', getRandomInt(0, 100), getRandomInt(0, 100));
setScrollFactor('5', 0,0);
setObjectCamera('5', 'other');

makeLuaSprite('6', 'EducatorAssets/6', getRandomInt(0, 100), getRandomInt(0, 100));
setScrollFactor('6', 0,0);
setObjectCamera('6', 'other');

makeLuaSprite('7', 'EducatorAssets/7', getRandomInt(0, 100), getRandomInt(0, 100));
setScrollFactor('7', 0,0);
setObjectCamera('7', 'other');

makeLuaSprite('8', 'EducatorAssets/8', getRandomInt(0, 100), getRandomInt(0, 100));
setScrollFactor('8', 0,0);
setObjectCamera('8', 'other');

makeLuaSprite('9', 'EducatorAssets/9', getRandomInt(0, 100), getRandomInt(0, 100));
setScrollFactor('9', 0,0);
setObjectCamera('9', 'other');

makeLuaSprite('0', 'EducatorAssets/0', getRandomInt(0, 100), getRandomInt(0, 100));
setScrollFactor('0', 0,0);
setObjectCamera('0', 'other');

addLuaSprite('1', true)
addLuaSprite('2', true)
addLuaSprite('3', true)
addLuaSprite('4', true)
addLuaSprite('5', true)
addLuaSprite('6', true)
addLuaSprite('7', true)
addLuaSprite('8', true)
addLuaSprite('9', true)
addLuaSprite('0', true)

setProperty('1.visible', false);
setProperty('2.visible', false);
setProperty('3.visible', false);
setProperty('4.visible', false);
setProperty('5.visible', false);
setProperty('6.visible', false);
setProperty('7.visible', false);
setProperty('8.visible', false);
setProperty('9.visible', false);
setProperty('0.visible', false);

	bowowNumberBouncy();
end

function bowowNumberBouncy()

	makeLuaSprite('bordery', nil, 0,0)
	makeGraphic('bordery', 5, getPropertyFromClass("flixel.FlxG", "height"), '000000')
	setProperty('bordery.immovable', true)
	setObjectCamera('bordery', 'camHUD')
	addLuaSprite('bordery', true)

	makeLuaSprite('borderyy', nil, getPropertyFromClass("flixel.FlxG", "width") - 5,0)
	makeGraphic('borderyy', 5, getPropertyFromClass("flixel.FlxG", "height"), '000000')
	setProperty('borderyy.immovable', true)
	setObjectCamera('borderyy', 'camHUD')
	addLuaSprite('borderyy', true)

	makeLuaSprite('borderx', nil, 0,0)
	makeGraphic('borderx', getPropertyFromClass("flixel.FlxG", "width"), 5, '000000')
	setProperty('borderx.immovable', true)
	setObjectCamera('borderx', 'camHUD')
	addLuaSprite('borderx', true)

	makeLuaSprite('borderxx', nil, 0,getPropertyFromClass("flixel.FlxG", "height") - 5)
	makeGraphic('borderxx', getPropertyFromClass("flixel.FlxG", "width"), 5, '000000')
	setProperty('borderxx.immovable', true)
	setObjectCamera('borderxx', 'camHUD')
	addLuaSprite('borderxx', true)

	for i = 0,7 do 
		yoff = 128;
		if isStoryMode then yoff = 0 end
		makeLuaSprite('numberHitBox1' .. i, nil, getProperty('1.x'),getProperty('1.y') + yoff)
        makeGraphic('numberHitBox1' .. i, getProperty('1.width'), getProperty('1.height'), '000000')
        setProperty('numberHitBox1' .. i .. '.x', getProperty('1.x'))
        setProperty('numberHitBox1' .. i .. '.y', getProperty('1.y') + yoff)
        setObjectCamera('numberHitBox1' .. i, 'camHUD')
        addLuaSprite('numberHitBox1' .. i, false)
		setProperty('numberHitBox1' .. i .. '.velocity.x', math.floor(math.random(200,400)))
		setProperty('numberHitBox1' .. i .. '.velocity.y', math.floor(math.random(200,400)))
		setProperty('numberHitBox1' .. i .. '.elasticity', 1)

		makeLuaSprite('numberHitBox2' .. i, nil, getProperty('2.x'),getProperty('2.y') + yoff)
        makeGraphic('numberHitBox2' .. i, getProperty('2.width'), getProperty('2.height'), '000000')
        setProperty('numberHitBox2' .. i .. '.x', getProperty('2.x'))
        setProperty('numberHitBox2' .. i .. '.y', getProperty('2.y') + yoff)
        setObjectCamera('numberHitBox2' .. i, 'camHUD')
        addLuaSprite('numberHitBox2' .. i, false)
		setProperty('numberHitBox2' .. i .. '.velocity.x', math.floor(math.random(200,400)))
		setProperty('numberHitBox2' .. i .. '.velocity.y', math.floor(math.random(200,400)))
		setProperty('numberHitBox2' .. i .. '.elasticity', 1)

		makeLuaSprite('numberHitBox3' .. i, nil, getProperty('3.x'),getProperty('3.y') + yoff)
        makeGraphic('numberHitBox3' .. i, getProperty('3.width'), getProperty('3.height'), '000000')
        setProperty('numberHitBox3' .. i .. '.x', getProperty('3.x'))
        setProperty('numberHitBox3' .. i .. '.y', getProperty('3.y') + yoff)
        setObjectCamera('numberHitBox3' .. i, 'camHUD')
        addLuaSprite('numberHitBox3' .. i, false)
		setProperty('numberHitBox3' .. i .. '.velocity.x', math.floor(math.random(200,400)))
		setProperty('numberHitBox3' .. i .. '.velocity.y', math.floor(math.random(200,400)))
		setProperty('numberHitBox3' .. i .. '.elasticity', 1)

		makeLuaSprite('numberHitBox4' .. i, nil, getProperty('4.x'),getProperty('4.y') + yoff)
        makeGraphic('numberHitBox4' .. i, getProperty('4.width'), getProperty('4.height'), '000000')
        setProperty('numberHitBox4' .. i .. '.x', getProperty('4.x'))
        setProperty('numberHitBox4' .. i .. '.y', getProperty('4.y') + yoff)
        setObjectCamera('numberHitBox4' .. i, 'camHUD')
        addLuaSprite('numberHitBox4' .. i, false)
		setProperty('numberHitBox4' .. i .. '.velocity.x', math.floor(math.random(200,400)))
		setProperty('numberHitBox4' .. i .. '.velocity.y', math.floor(math.random(200,400)))
		setProperty('numberHitBox4' .. i .. '.elasticity', 1)

		makeLuaSprite('numberHitBox5' .. i, nil, getProperty('5.x'),getProperty('5.y') + yoff)
        makeGraphic('numberHitBox5' .. i, getProperty('5.width'), getProperty('5.height'), '000000')
        setProperty('numberHitBox5' .. i .. '.x', getProperty('5.x'))
        setProperty('numberHitBox5' .. i .. '.y', getProperty('5.y') + yoff)
        setObjectCamera('numberHitBox5' .. i, 'camHUD')
        addLuaSprite('numberHitBox5' .. i, false)
		setProperty('numberHitBox5' .. i .. '.velocity.x', math.floor(math.random(200,400)))
		setProperty('numberHitBox5' .. i .. '.velocity.y', math.floor(math.random(200,400)))
		setProperty('numberHitBox5' .. i .. '.elasticity', 1)

		makeLuaSprite('numberHitBox6' .. i, nil, getProperty('6.x'),getProperty('6.y') + yoff)
        makeGraphic('numberHitBox6' .. i, getProperty('6.width'), getProperty('6.height'), '000000')
        setProperty('numberHitBox6' .. i .. '.x', getProperty('6.x'))
        setProperty('numberHitBox6' .. i .. '.y', getProperty('6.y') + yoff)
        setObjectCamera('numberHitBox6' .. i, 'camHUD')
        addLuaSprite('numberHitBox6' .. i, false)
		setProperty('numberHitBox6' .. i .. '.velocity.x', math.floor(math.random(200,400)))
		setProperty('numberHitBox6' .. i .. '.velocity.y', math.floor(math.random(200,400)))
		setProperty('numberHitBox6' .. i .. '.elasticity', 1)

		makeLuaSprite('numberHitBox7' .. i, nil, getProperty('7.x'),getProperty('7.y') + yoff)
        makeGraphic('numberHitBox7' .. i, getProperty('7.width'), getProperty('7.height'), '000000')
        setProperty('numberHitBox7' .. i .. '.x', getProperty('7.x'))
        setProperty('numberHitBox7' .. i .. '.y', getProperty('7.y') + yoff)
        setObjectCamera('numberHitBox7' .. i, 'camHUD')
        addLuaSprite('numberHitBox7' .. i, false)
		setProperty('numberHitBox7' .. i .. '.velocity.x', math.floor(math.random(200,400)))
		setProperty('numberHitBox7' .. i .. '.velocity.y', math.floor(math.random(200,400)))
		setProperty('numberHitBox7' .. i .. '.elasticity', 1)

		makeLuaSprite('numberHitBox8' .. i, nil, getProperty('8.x'),getProperty('8.y') + yoff)
        makeGraphic('numberHitBox8' .. i, getProperty('8.width'), getProperty('8.height'), '000000')
        setProperty('numberHitBox8' .. i .. '.x', getProperty('8.x'))
        setProperty('numberHitBox8' .. i .. '.y', getProperty('8.y') + yoff)
        setObjectCamera('numberHitBox8' .. i, 'camHUD')
        addLuaSprite('numberHitBox8' .. i, false)
		setProperty('numberHitBox8' .. i .. '.velocity.x', math.floor(math.random(200,400)))
		setProperty('numberHitBox8' .. i .. '.velocity.y', math.floor(math.random(200,400)))
		setProperty('numberHitBox8' .. i .. '.elasticity', 1)

		makeLuaSprite('numberHitBox9' .. i, nil, getProperty('9.x'),getProperty('9.y') + yoff)
        makeGraphic('numberHitBox9' .. i, getProperty('9.width'), getProperty('9.height'), '000000')
        setProperty('numberHitBox9' .. i .. '.x', getProperty('9.x'))
        setProperty('numberHitBox9' .. i .. '.y', getProperty('9.y') + yoff)
        setObjectCamera('numberHitBox9' .. i, 'camHUD')
        addLuaSprite('numberHitBox9' .. i, false)
		setProperty('numberHitBox9' .. i .. '.velocity.x', math.floor(math.random(200,400)))
		setProperty('numberHitBox9' .. i .. '.velocity.y', math.floor(math.random(200,400)))
		setProperty('numberHitBox9' .. i .. '.elasticity', 1)

		makeLuaSprite('numberHitBox0' .. i, nil, getProperty('0.x'),getProperty('0.y') + yoff)
        makeGraphic('numberHitBox0' .. i, getProperty('0.width'), getProperty('0.height'), '000000')
        setProperty('numberHitBox0' .. i .. '.x', getProperty('0.x'))
        setProperty('numberHitBox0' .. i .. '.y', getProperty('0.y') + yoff)
        setObjectCamera('numberHitBox0' .. i, 'camHUD')
        addLuaSprite('numberHitBox0' .. i, false)
		setProperty('numberHitBox0' .. i .. '.velocity.x', math.floor(math.random(200,400)))
		setProperty('numberHitBox0' .. i .. '.velocity.y', math.floor(math.random(200,400)))
		setProperty('numberHitBox0' .. i .. '.elasticity', 1)
	end
	itaLooping(elapsed);
end

function onUpdatePost(elapsed)
	itaLooping(elapsed);
end

function itaLooping(elapsed)
	setProperty('borderxx.alpha',HitBoxAlpha)
	setProperty('borderx.alpha',HitBoxAlpha)
	setProperty('bordery.alpha',HitBoxAlpha)
	setProperty('borderyy.alpha',HitBoxAlpha)
	for i = 0,7 do 
		setProperty('numberHitBox1' .. i .. '.alpha', HitBoxAlpha)
		setProperty('1.x',getProperty('numberHitBox1' .. i .. '.x'))
		setProperty('1.y',getProperty('numberHitBox1' .. i .. '.y'))
		isColliding('borderxx','numberHitBox1' .. i)
		isColliding('borderx','numberHitBox1' .. i)
		isColliding('bordery','numberHitBox1' .. i)
		isColliding('borderyy','numberHitBox1' .. i)

		setProperty('numberHitBox2' .. i .. '.alpha', HitBoxAlpha)
		setProperty('2.x',getProperty('numberHitBox2' .. i .. '.x'))
		setProperty('2.y',getProperty('numberHitBox2' .. i .. '.y'))
		isColliding('borderxx','numberHitBox2' .. i)
		isColliding('borderx','numberHitBox2' .. i)
		isColliding('bordery','numberHitBox2' .. i)
		isColliding('borderyy','numberHitBox2' .. i)

		setProperty('numberHitBox3' .. i .. '.alpha', HitBoxAlpha)
		setProperty('3.x',getProperty('numberHitBox3' .. i .. '.x'))
		setProperty('3.y',getProperty('numberHitBox3' .. i .. '.y'))
		isColliding('borderxx','numberHitBox3' .. i)
		isColliding('borderx','numberHitBox3' .. i)
		isColliding('bordery','numberHitBox3' .. i)
		isColliding('borderyy','numberHitBox3' .. i)

		setProperty('numberHitBox4' .. i .. '.alpha', HitBoxAlpha)
		setProperty('4.x',getProperty('numberHitBox4' .. i .. '.x'))
		setProperty('4.y',getProperty('numberHitBox4' .. i .. '.y'))
		isColliding('borderxx','numberHitBox4' .. i)
		isColliding('borderx','numberHitBox4' .. i)
		isColliding('bordery','numberHitBox4' .. i)
		isColliding('borderyy','numberHitBox4' .. i)

		setProperty('numberHitBox5' .. i .. '.alpha', HitBoxAlpha)
		setProperty('5.x',getProperty('numberHitBox5' .. i .. '.x'))
		setProperty('5.y',getProperty('numberHitBox5' .. i .. '.y'))
		isColliding('borderxx','numberHitBox5' .. i)
		isColliding('borderx','numberHitBox5' .. i)
		isColliding('bordery','numberHitBox5' .. i)
		isColliding('borderyy','numberHitBox5' .. i)

		setProperty('numberHitBox6' .. i .. '.alpha', HitBoxAlpha)
		setProperty('6.x',getProperty('numberHitBox6' .. i .. '.x'))
		setProperty('6.y',getProperty('numberHitBox6' .. i .. '.y'))
		isColliding('borderxx','numberHitBox6' .. i)
		isColliding('borderx','numberHitBox6' .. i)
		isColliding('bordery','numberHitBox6' .. i)
		isColliding('borderyy','numberHitBox6' .. i)

		setProperty('numberHitBox7' .. i .. '.alpha', HitBoxAlpha)
		setProperty('7.x',getProperty('numberHitBox7' .. i .. '.x'))
		setProperty('7.y',getProperty('numberHitBox7' .. i .. '.y'))
		isColliding('borderxx','numberHitBox7' .. i)
		isColliding('borderx','numberHitBox7' .. i)
		isColliding('bordery','numberHitBox7' .. i)
		isColliding('borderyy','numberHitBox7' .. i)

		setProperty('numberHitBox8' .. i .. '.alpha', HitBoxAlpha)
		setProperty('8.x',getProperty('numberHitBox8' .. i .. '.x'))
		setProperty('8.y',getProperty('numberHitBox8' .. i .. '.y'))
		isColliding('borderxx','numberHitBox8' .. i)
		isColliding('borderx','numberHitBox8' .. i)
		isColliding('bordery','numberHitBox8' .. i)
		isColliding('borderyy','numberHitBox8' .. i)

		setProperty('numberHitBox9' .. i .. '.alpha', HitBoxAlpha)
		setProperty('9.x',getProperty('numberHitBox9' .. i .. '.x'))
		setProperty('9.y',getProperty('numberHitBox9' .. i .. '.y'))
		isColliding('borderxx','numberHitBox9' .. i)
		isColliding('borderx','numberHitBox9' .. i)
		isColliding('bordery','numberHitBox9' .. i)
		isColliding('borderyy','numberHitBox9' .. i)

		setProperty('numberHitBox0' .. i .. '.alpha', HitBoxAlpha)
		setProperty('0.x',getProperty('numberHitBox0' .. i .. '.x'))
		setProperty('0.y',getProperty('numberHitBox0' .. i .. '.y'))
		isColliding('borderxx','numberHitBox0' .. i)
		isColliding('borderx','numberHitBox0' .. i)
		isColliding('bordery','numberHitBox0' .. i)
		isColliding('borderyy','numberHitBox0' .. i)
	end
end
