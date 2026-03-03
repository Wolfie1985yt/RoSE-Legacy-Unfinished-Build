function onCreatePost()
	if getPropertyFromClass('states.PlayState', 'isFixedAspectRatio') == true then
		runHaxeCode([[
			var posFix:Int = 0;
			if (game.sonicHUDSongs.contains(states.PlayState.SONG.song.toLowerCase()) || game.fatalUI)
				posFix = 10;
			game.playerStrums.forEach(function(spr:FlxSprite) {
				spr.x -= 80 - posFix;
			});
			game.opponentStrums.forEach(function(spr:FlxSprite) {
				spr.x += 80 + posFix;
			});
			if (game.sonicHUDSongs.contains(states.PlayState.SONG.song.toLowerCase()) || game.fatalUI)
				game.sonicHUD.x += 150;
		]]) 
	end
	if getPropertyFromClass('states.PlayState', 'isFixedAspectRatio') == true then
		if getPropertyFromClass('backend.ClientPrefs', 'middleScroll') == false then
			noteTweenX('dadFix', 0, 175, 0.01, 'quartInOut')
			noteTweenX('dadFix2', 1, 282, 0.01, 'quartInOut')
			noteTweenX('dadFix3', 2, 390, 0.01, 'quartInOut')
			noteTweenX('dadFix4', 3, 497, 0.01, 'quartInOut')
				
			noteTweenX('bfFix', 4, 680, 0.01, 'quartInOut')
			noteTweenX('bfFix2', 5, 787, 0.01, 'quartInOut')
			noteTweenX('bfFix3', 6, 894, 0.01, 'quartInOut')
			noteTweenX('bfFix4', 7, 1001, 0.01, 'quartInOut')
		else
			noteTweenX('dadFix', 0, 185, 0.01, 'quartInOut')
			noteTweenX('dadFix2', 1, 292, 0.01, 'quartInOut')
			noteTweenX('dadFix3', 2, 881, 0.01, 'quartInOut')
			noteTweenX('dadFix4', 3, 988, 0.01, 'quartInOut')
		end
		runHaxeCode([[
			var posFix:Int = 80;
			var posXonePlayer:Int = 20;
			var posXtwoPlayer:Int = 12;
			if (states.PlayState.SONG.player2 == 'sunky' && states.PlayState.SONG.player1 != 'sanic') {
				posXonePlayer = 0;
				posXtwoPlayer = 8;
			}
			var posXoneOpponent:Int = 20;
			var posXtwoOpponent:Int = 12;
			if (states.PlayState.SONG.player2 == 'sunky') {
				posXoneOpponent = 0;
				posXtwoOpponent = 8;
			}
			if (!game.sonicHUDSongs.contains(states.PlayState.SONG.song.toLowerCase()) && !game.fatalUI) {
				game.playerStrums.forEach(function(spr:FlxSprite) {
					spr.scale.x = 0.7;
					spr.scale.y = 0.7;
					switch(spr.ID) {
						case 0:
							spr.x = 752.6 + posXonePlayer - posFix;
						case 1:
							spr.x = 858.8 + posXtwoPlayer - posFix;
						case 2:
							spr.x = 965 - posXtwoPlayer - posFix;
						case 3:
							spr.x = 1071.2 - posXonePlayer - posFix;
					}
				});
				game.opponentStrums.forEach(function(spr:FlxSprite) {
					spr.scale.x = 0.7;
					spr.scale.y = 0.7;
					switch(spr.ID) {
						case 0:
							spr.x = 102.6 + posXoneOpponent + posFix;
						case 1:
							spr.x = 208.8 + posXtwoOpponent + posFix;
						case 2:
							spr.x =  315 - posXtwoOpponent + posFix;
						case 3:
							spr.x = 421.2 - posXoneOpponent + posFix;
					}
				});
			}
		]])
	else
		runHaxeCode([[
			var posFix:Int = 0;
			var posXonePlayer:Int = 0;
			var posXtwoPlayer:Int = 0;
			if (states.PlayState.SONG.player1 != 'sanic') {
				posXonePlayer = 20;
				posXtwoPlayer = 20;
			}
			var posXoneOpponent:Int = 2;
			var posXtwoOpponent:Int = 10;
			if (!game.sonicHUDSongs.contains(states.PlayState.SONG.song.toLowerCase()) && !game.fatalUI && states.PlayState.SONG.player2 == 'sunky') {
				game.playerStrums.forEach(function(spr:FlxSprite) {
					switch(spr.ID) {
						case 0:
							spr.x = 752.6 + posXonePlayer - posFix;
						case 1:
							spr.x = 858.8 + posXtwoPlayer - posFix;
						case 2:
							spr.x = 965 - posXtwoPlayer - posFix;
						case 3:
							spr.x = 1071.2 - posXonePlayer - posFix;
					}
				});
				game.opponentStrums.forEach(function(spr:FlxSprite) {
					switch(spr.ID) {
						case 0:
							spr.x = 102.6 + posXoneOpponent + posFix;
						case 1:
							spr.x = 208.8 + posXtwoOpponent + posFix;
						case 2:
							spr.x =  315 - posXtwoOpponent + posFix;
						case 3:
							spr.x = 421.2 - posXoneOpponent + posFix;
					}
				});
			}
		]])
	end
end

function onUpdate()
			if songName == 'critical-error' then
				noteTweenX('bfFix', 4, 430, 0.01, 'quartInOut')
				noteTweenX('bfFix2', 5, 537, 0.01, 'quartInOut')
				noteTweenX('bfFix3', 6, 644, 0.01, 'quartInOut')
				noteTweenX('bfFix4', 7, 751, 0.01, 'quartInOut')
				
				noteTweenX('dadFix', 0, 206, 0.01, 'quartInOut')
				noteTweenX('dadFix2', 1, 313, 0.01, 'quartInOut')
				noteTweenX('dadFix3', 2, 868, 0.01, 'quartInOut')
				noteTweenX('dadFix4', 3, 975, 0.01, 'quartInOut')
			end
	end

function onStartCountdown()
	if getPropertyFromClass('states.PlayState', 'isFixedAspectRatio') == true then
		if getPropertyFromClass('ClientPrefs', 'middleScroll') == false then
			if songName == 'b4cksl4sh' or songName == 'fatality' or songName == 'critical-error' then
				noteTweenX('dadFix', 0, 175, 0.01, 'quartInOut')
				noteTweenX('dadFix2', 1, 282, 0.01, 'quartInOut')
				noteTweenX('dadFix3', 2, 390, 0.01, 'quartInOut')
				noteTweenX('dadFix4', 3, 497, 0.01, 'quartInOut')
				
				noteTweenX('bfFix', 4, 680, 0.01, 'quartInOut')
				noteTweenX('bfFix2', 5, 787, 0.01, 'quartInOut')
				noteTweenX('bfFix3', 6, 894, 0.01, 'quartInOut')
				noteTweenX('bfFix4', 7, 1001, 0.01, 'quartInOut')
			end
		end
		runHaxeCode([[
			var posFix:Int = 80;
			var posXonePlayer:Int = 20;
			var posXtwoPlayer:Int = 12;
			if (states.PlayState.SONG.player2 == 'sunky' && states.PlayState.SONG.player1 != 'sanic') {
				posXonePlayer = 0;
				posXtwoPlayer = 8;
			}
			var posXoneOpponent:Int = 20;
			var posXtwoOpponent:Int = 12;
			if (states.PlayState.SONG.player2 == 'sunky') {
				posXoneOpponent = 0;
				posXtwoOpponent = 8;
			}
			if (!game.sonicHUDSongs.contains(states.PlayState.SONG.song.toLowerCase()) && !game.fatalUI) {
				game.playerStrums.forEach(function(spr:FlxSprite) {
					spr.scale.x = 0.7;
					spr.scale.y = 0.7;
					switch(spr.ID) {
						case 0:
							spr.x = 752.6 + posXonePlayer - posFix;
						case 1:
							spr.x = 858.8 + posXtwoPlayer - posFix;
						case 2:
							spr.x = 965 - posXtwoPlayer - posFix;
						case 3:
							spr.x = 1071.2 - posXonePlayer - posFix;
					}
				});
				game.opponentStrums.forEach(function(spr:FlxSprite) {
					spr.scale.x = 0.7;
					spr.scale.y = 0.7;
					switch(spr.ID) {
						case 0:
							spr.x = 102.6 + posXoneOpponent + posFix;
						case 1:
							spr.x = 208.8 + posXtwoOpponent + posFix;
						case 2:
							spr.x =  315 - posXtwoOpponent + posFix;
						case 3:
							spr.x = 421.2 - posXoneOpponent + posFix;
					}
				});
			}
		]])
	else
		runHaxeCode([[
			var posFix:Int = 0;
			var posXonePlayer:Int = 0;
			var posXtwoPlayer:Int = 0;
			if (states.PlayState.SONG.player1 != 'sanic') {
				posXonePlayer = 20;
				posXtwoPlayer = 20;
			}
			var posXoneOpponent:Int = 2;
			var posXtwoOpponent:Int = 10;
			if (!game.sonicHUDSongs.contains(states.PlayState.SONG.song.toLowerCase()) && !game.fatalUI && states.PlayState.SONG.player2 == 'sunky') {
				game.playerStrums.forEach(function(spr:FlxSprite) {
					switch(spr.ID) {
						case 0:
							spr.x = 752.6 + posXonePlayer - posFix;
						case 1:
							spr.x = 858.8 + posXtwoPlayer - posFix;
						case 2:
							spr.x = 965 - posXtwoPlayer - posFix;
						case 3:
							spr.x = 1071.2 - posXonePlayer - posFix;
					}
				});
				game.opponentStrums.forEach(function(spr:FlxSprite) {
					switch(spr.ID) {
						case 0:
							spr.x = 102.6 + posXoneOpponent + posFix;
						case 1:
							spr.x = 208.8 + posXtwoOpponent + posFix;
						case 2:
							spr.x =  315 - posXtwoOpponent + posFix;
						case 3:
							spr.x = 421.2 - posXoneOpponent + posFix;
					}
				});
			}
		]])
	end
end