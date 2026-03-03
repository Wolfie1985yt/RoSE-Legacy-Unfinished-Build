function onCreatePost()
		initLuaShader("pixel")
	    makeLuaSprite("shaderImage")
	    makeGraphic("shaderImage", screenWidth, screenHeight)
	    setSpriteShader("shaderImage", "pixel")
	    addHaxeLibrary("ShaderFilter", "openfl.filters")
	    runHaxeCode([[
	        trace(ShaderFilter);
	        game.camGame.setFilters([new ShaderFilter(game.getLuaObject("shaderImage").shader)]);
	        game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("shaderImage").shader)]);
	    ]])
	setProperty('camHUD.alpha',0)
end
function onStepHit()
	if curStep == 10 then
		doTweenAlpha('camHUD', 'camHUD', 1, 1)
	end
	if curStep == 1005 then
		runHaxeCode('game.camGame.setFilters();')
		runHaxeCode('game.camHUD.setFilters();')
		runHaxeCode('game.camOther.setFilters();')
	end
	if curStep == 2336 then
		setProperty('dadGroup.x', 140)
		setProperty('dadGroup.y', 105)
		initLuaShader("pixel")
	    makeLuaSprite("shaderImage")
	    makeGraphic("shaderImage", screenWidth, screenHeight)
	    setSpriteShader("shaderImage", "pixel")
	    addHaxeLibrary("ShaderFilter", "openfl.filters")
	    runHaxeCode([[
	        trace(ShaderFilter);
	        game.camGame.setFilters([new ShaderFilter(game.getLuaObject("shaderImage").shader)]);
	        game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("shaderImage").shader)]);
	    ]])
	end
	if curStep == 2848 then
		runHaxeCode('game.camGame.setFilters();')
		runHaxeCode('game.camHUD.setFilters();')
		runHaxeCode('game.camOther.setFilters();')
	end
end
function onSongStart()
	setProperty('camHUD.alpha',0)
end
function noteMiss(id, direction, noteType, sustain)
	if curStep >= 1005 and curStep <= 1016 then
		setProperty('health',0)
	end
end
function onResume()
	if curStep < 1005 then
			initLuaShader("pixel")
		    makeLuaSprite("shaderImage")
		    makeGraphic("shaderImage", screenWidth, screenHeight)
		    setSpriteShader("shaderImage", "pixel")
		    addHaxeLibrary("ShaderFilter", "openfl.filters")
		    runHaxeCode([[
		        trace(ShaderFilter);
		        game.camGame.setFilters([new ShaderFilter(game.getLuaObject("shaderImage").shader)]);
		        game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("shaderImage").shader)]);
		    ]])
		setProperty('camHUD.alpha',0)
	end
	if curStep >= 2336 and curStep <= 2847 then
		setProperty('dadGroup.x', 140)
		setProperty('dadGroup.y', 105)
		initLuaShader("pixel")
	    makeLuaSprite("shaderImage")
	    makeGraphic("shaderImage", screenWidth, screenHeight)
	    setSpriteShader("shaderImage", "pixel")
	    addHaxeLibrary("ShaderFilter", "openfl.filters")
	    runHaxeCode([[
	        trace(ShaderFilter);
	        game.camGame.setFilters([new ShaderFilter(game.getLuaObject("shaderImage").shader)]);
	        game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("shaderImage").shader)]);
	    ]])
	end
end