function onStepHit()
	if curStep == 992 then
		setProperty('dadGroup.x', 140)
		setProperty('dadGroup.y', 105)
	end
end
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
end
function onPause()
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
function onResume()
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