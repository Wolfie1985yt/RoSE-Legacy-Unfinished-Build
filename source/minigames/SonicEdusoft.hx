package minigames;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxState;
import flixel.FlxSubState;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flixel.math.FlxRandom;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.text.FlxText;
import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.addons.transition.FlxTransitionableState;
import flixel.system.scaleModes.StageSizeScaleMode;
import flixel.system.scaleModes.RelativeScaleMode;
import flixel.system.scaleModes.RatioScaleMode;
import flixel.system.FlxSound;
import lime.ui.Window;
import openfl.Lib;
import openfl.system.Capabilities;
import openfl.filters.ShaderFilter;
import openfl.display.Shader;
import shaders.VCRWNB;
import shaders.NTSC;

class SonicEdusoft extends MusicBeatSubstate
{
	var coolcamera:FlxCamera;
	var coolcamera2:FlxCamera;

	var startScreen:FlxSprite;
	var blackScreen:FlxSprite;
	var OverworldDefault:FlxSprite;
	var cityBG:FlxSprite;
	var helicoptor:FlxSprite;
	var charBF:FlxSprite;
	var camFollowPoint:FlxSprite;
	var problem1:FlxSprite;
	var problem2:FlxSprite;
	var problem3:FlxSprite;
	var problem4:FlxSprite;
	var answer1:FlxSprite;
	var answer2:FlxSprite;
	var answer3:FlxSprite;
	var answer4:FlxSprite;
	var choice1:FlxSprite;
	var choice2:FlxSprite;
	var choice3:FlxSprite;
	var choice4:FlxSprite;
	var choice5:FlxSprite;
	var choice6:FlxSprite;
	var choice7:FlxSprite;
	var choice8:FlxSprite;
	var choice9:FlxSprite;
	var choice10:FlxSprite;
	var choice11:FlxSprite;
	var choice12:FlxSprite;
	var choice13:FlxSprite;
	var choice14:FlxSprite;
	var choice15:FlxSprite;
	var choice16:FlxSprite;
	var choice1Sel:FlxSprite;
	var choice2Sel:FlxSprite;
	var choice3Sel:FlxSprite;
	var choice4Sel:FlxSprite;
	var choice5Sel:FlxSprite;
	var choice6Sel:FlxSprite;
	var choice7Sel:FlxSprite;
	var choice8Sel:FlxSprite;
	var choice9Sel:FlxSprite;
	var choice10Sel:FlxSprite;
	var choice11Sel:FlxSprite;
	var choice12Sel:FlxSprite;
	var choice13Sel:FlxSprite;
	var choice14Sel:FlxSprite;
	var choice15Sel:FlxSprite;
	var choice16Sel:FlxSprite;
	var correct:FlxSprite;
	var press:FlxSprite;

	var canPressEnter:Bool = true;
	var followBF:Bool = false;
	var problemState:Bool = false;
	var canMove:Bool = false;
	var allowAnswer:Bool = false;
	var pressFlash:Bool = false;

	var position:Int = 0;
	var problemsLoaded:Int = 0;
	var probNum:Int = 0;
	var problemCalc1:Int = 0;
	var problemCalc2:Int = 0;
	var problemCalc3:Int = 0;
	var problemCalc4:Int = 0;
	var solution1:Int = 0;
	var solution2:Int = 0;
	var solution3:Int = 0;
	var solution4:Int = 0;
	var choiceLoaded:Int = 0;
	var solutionSelected:Int = 0;
	var num1:Int = 0;
	var num2:Int = 0;
	var num3:Int = 0;
	var num4:Int = 0;
	var num5:Int = 0;
	var num6:Int = 0;
	var num7:Int = 0;
	var num8:Int = 0;

	
	var tailsShader:NTSC;
	var curShader:ShaderFilter;
	var pixShader:VCRWNB;

	var additionProblems:Array<Int> = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22];
	var problemsToShow:Array<Int>;
	var numbers:Array<Int> = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];
	var numbersToShow1:Array<Int>;
	var numbersToShow2:Array<Int>;
	var numbersToShow3:Array<Int>;
	var numbersToShow4:Array<Int>;

	var helicopterSound:FlxSound;
	var startSound:FlxSound;

	override public function create()
	{
		FlxG.sound.music.stop();
		
		FlxG.fullscreen = false;
		FlxG.resizeWindow(960, 720);
		FlxG.scaleMode = new RatioScaleMode(true);
		var window = lime.app.Application.current.window;
		window.fullscreen = false;
		window.resizable = false;
		window.x = Math.floor((Capabilities.screenResolutionX / 2) - (960 / 2));
		window.y = Math.floor((Capabilities.screenResolutionY / 2) - (720 / 2));

		coolcamera = new FlxCamera();
		coolcamera2 = new FlxCamera();
		coolcamera2.bgColor.alpha = 0;
		
		FlxG.cameras.reset(coolcamera);
		FlxG.cameras.add(coolcamera2);

		FlxCamera.defaultCameras = [coolcamera];
		persistentUpdate = true;
		persistentDraw = true;

		coolcamera.zoom = 1.25;

		blackScreen = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		blackScreen.cameras = [coolcamera2];
		blackScreen.visible = true;
		add(blackScreen);

		startScreen = new FlxSprite(0, 0);
		startScreen.frames = Paths.getSparrowAtlas('bgs/educator/startScreen');
		startScreen.animation.addByPrefix('idle', 'just idlein around', 16);
		startScreen.animation.play('idle');
		startScreen.scale.x = 3.7;
		startScreen.scale.y = 3.7;
		startScreen.antialiasing = false;
		startScreen.cameras = [coolcamera2];
		startScreen.screenCenter(X);
		startScreen.screenCenter(Y);
		startScreen.x -= 17;
		add(startScreen);

		if (ClientPrefs.Shaders) {
			tailsShader = new NTSC();
			var filter = new ShaderFilter(tailsShader);
			curShader = filter;
			coolcamera.setFilters([curShader]);
			coolcamera2.setFilters([curShader]);
		}

		startSound = new FlxSound().loadEmbedded(Paths.sound('edusoft/title', 'preload'), false, false);
		startSound.play();
	}

	function shuffleArray(arr:Array<Int>):Array<Int> {
		for (i in 0...arr.length) {
			var randomIndex = FlxG.random.int(0, arr.length - 1);
			var temp = arr[i];
			arr[i] = arr[randomIndex];
			arr[randomIndex] = temp;
		}
		return arr;
	}

	function startGame() {
		OverworldDefault = new FlxSprite(1400, -700);
		OverworldDefault.frames = Paths.getSparrowAtlas('bgs/educator/overworld/overworld');
		OverworldDefault.animation.addByPrefix('a', 'watershit', 16);
		OverworldDefault.animation.play('a');
		OverworldDefault.scale.x = 4;
		OverworldDefault.scale.y = 4;
		OverworldDefault.antialiasing = false;
		OverworldDefault.scrollFactor.set(1, 1);
		// OverworldDefault.cameras = [coolcamera];
		add(OverworldDefault);

		cityBG = new FlxSprite(850, -600).loadGraphic(Paths.image('bgs/educator/overworld/city'));
		cityBG.scrollFactor.set(1, 1);
		cityBG.antialiasing = false;
		cityBG.visible = false;
		cityBG.setGraphicSize(920, 740);
		add(cityBG);

		charBF = new FlxSprite(620, 340);
		charBF.frames = Paths.getSparrowAtlas('bgs/educator/sonicSpritesheet');
		charBF.animation.addByPrefix('idlefront', 'idlefront', 16);
		charBF.animation.addByPrefix('idleback', 'idleback', 16);
		charBF.animation.addByPrefix('idleside', 'idleside', 16);
		charBF.animation.addByPrefix('walkfront', 'walkfront', 16);
		charBF.animation.addByPrefix('walkback', 'walkback', 16);
		charBF.animation.addByPrefix('walkside', 'walkside', 16);
		charBF.animation.addByPrefix('jump', 'jump', 16);
		charBF.animation.addByPrefix('heli', 'helicopter', 16);
		charBF.animation.play('idlefront');
		charBF.scale.x = 4;
		charBF.scale.y = 4;
		charBF.antialiasing = false;
		charBF.scrollFactor.set(1, 1);
		add(charBF);

		camFollowPoint = new FlxSprite(620, 340);
		camFollowPoint.frames = Paths.getSparrowAtlas('bgs/educator/followCamPoint');
		camFollowPoint.animation.addByPrefix('idlefront', 'idlefront', 16);
		camFollowPoint.animation.addByPrefix('idleback', 'idleback', 16);
		camFollowPoint.animation.addByPrefix('idleside', 'idleside', 16);
		camFollowPoint.animation.addByPrefix('walkfront', 'walkfront', 16);
		camFollowPoint.animation.addByPrefix('walkback', 'walkback', 16);
		camFollowPoint.animation.addByPrefix('walkside', 'walkside', 16);
		camFollowPoint.animation.addByPrefix('jump', 'jump', 16);
		camFollowPoint.animation.addByPrefix('heli', 'helicopter', 16);
		camFollowPoint.animation.play('idlefront');
		camFollowPoint.scale.x = 4;
		camFollowPoint.scale.y = 4;
		camFollowPoint.antialiasing = false;
		camFollowPoint.scrollFactor.set(1, 1);
		add(camFollowPoint);

		helicoptor = new FlxSprite(850, -600).loadGraphic(Paths.image('bgs/educator/overworld/helicoptor_idle'));
		helicoptor.scale.x = 3;
		helicoptor.scale.y = 3;
		helicoptor.scrollFactor.set(1, 1);
		helicoptor.antialiasing = false;
		// helicoptor.cameras = [coolcamera];
		add(helicoptor);

		FlxTween.tween(blackScreen, {alpha: 0}, 0.5);
		FlxG.sound.playMusic(Paths.music('edusoft/map', 'preload'), 1);

		followBF = true;
		canMove = true;
	}
	
	function loadProblems(type:Int) {
		if (type == 1) {
			if (problemsLoaded == 1) {
				problem1 = new FlxSprite(900, -500).loadGraphic(Paths.image('bgs/educator/overworld/problems/addition/' + probNum));
				problem1.scale.x = 4;
				problem1.scale.y = 4;
				problem1.scrollFactor.set(1, 1);
				problem1.antialiasing = false;
				problem1.visible = true;
				add(problem1);

				answer1 = new FlxSprite(900, -430).loadGraphic(Paths.image('bgs/educator/overworld/answers/addition/' + probNum));
				answer1.scale.x = 4;
				answer1.scale.y = 4;
				answer1.scrollFactor.set(1, 1);
				answer1.antialiasing = false;
				answer1.visible = false;
				add(answer1);

				problemCalc1 = probNum;

				trace("Problem added: " + probNum);
			} else if (problemsLoaded == 2) {
				problem2 = new FlxSprite(900, -500).loadGraphic(Paths.image('bgs/educator/overworld/problems/addition/' + probNum));
				problem2.scale.x = 4;
				problem2.scale.y = 4;
				problem2.scrollFactor.set(1, 1);
				problem2.antialiasing = false;
				problem2.visible = false;
				add(problem2);

				answer2 = new FlxSprite(900, -430).loadGraphic(Paths.image('bgs/educator/overworld/answers/addition/' + probNum));
				answer2.scale.x = 4;
				answer2.scale.y = 4;
				answer2.scrollFactor.set(1, 1);
				answer2.antialiasing = false;
				answer2.visible = false;
				add(answer2);

				problemCalc2 = probNum;

				trace("Problem added: " + probNum);
			} else if (problemsLoaded == 3) {
				problem3 = new FlxSprite(900, -500).loadGraphic(Paths.image('bgs/educator/overworld/problems/addition/' + probNum));
				problem3.scale.x = 4;
				problem3.scale.y = 4;
				problem3.scrollFactor.set(1, 1);
				problem3.antialiasing = false;
				problem3.visible = false;
				add(problem3);

				answer3 = new FlxSprite(900, -430).loadGraphic(Paths.image('bgs/educator/overworld/answers/addition/' + probNum));
				answer3.scale.x = 4;
				answer3.scale.y = 4;
				answer3.scrollFactor.set(1, 1);
				answer3.antialiasing = false;
				answer3.visible = false;
				add(answer3);
				
				problemCalc3 = probNum;

				trace("Problem added: " + probNum);
			} else if (problemsLoaded == 4) {
				problem4 = new FlxSprite(900, -500).loadGraphic(Paths.image('bgs/educator/overworld/problems/addition/' + probNum));
				problem4.scale.x = 4;
				problem4.scale.y = 4;
				problem4.scrollFactor.set(1, 1);
				problem4.antialiasing = false;
				problem4.visible = false;
				add(problem4);

				answer4 = new FlxSprite(900, -430).loadGraphic(Paths.image('bgs/educator/overworld/answers/addition/' + probNum));
				answer4.scale.x = 4;
				answer4.scale.y = 4;
				answer4.scrollFactor.set(1, 1);
				answer4.antialiasing = false;
				answer4.visible = false;
				add(answer4);

				correct = new FlxSprite(935, -530).loadGraphic(Paths.image('bgs/educator/overworld/correct'));
				correct.scale.x = 4;
				correct.scale.y = 4;
				correct.scrollFactor.set(1, 1);
				correct.antialiasing = false;
				correct.visible = false;
				add(correct);
				
				problemCalc4 = probNum;

				trace("Problem added: " + probNum);
				calculateNumbers(1);
			}
		}
		canMove = false;
		problemState = true;
	}

	function calculateProblems() {
		additionProblems = shuffleArray(additionProblems);
		problemsToShow = additionProblems.slice(0,4);
		for (num in problemsToShow) {
			probNum = num;
			problemsLoaded += 1;
			loadProblems(1);
		}
	}

	function calculateNumbers(type:Int) {
		numbers = shuffleArray(numbers);
		numbersToShow1 = numbers.slice(0,8);

		numbers = shuffleArray(numbers);
		numbersToShow2 = numbers.slice(0,8);

		numbers = shuffleArray(numbers);
		numbersToShow3 = numbers.slice(0,8);

		numbers = shuffleArray(numbers);
		numbersToShow4 = numbers.slice(0,8);

		if (type == 1) {
			switch(problemCalc1) {
				case 1:
					solution1 = 9;
				case 2:
					solution1 = 15;
				case 3:
					solution1 = 4;
				case 4:
					solution1 = 11;
				case 5:
					solution1 = 19;
				case 6:
					solution1 = 17;
				case 7:
					solution1 = 19;
				case 8:
					solution1 = 18;
				case 9:
					solution1 = 19;
				case 10:
					solution1 = 8;
				case 11:
					solution1 = 14;
				case 12:
					solution1 = 11;
				case 13:
					solution1 = 5;
				case 14:
					solution1 = 10;
				case 15:
					solution1 = 11;
				case 16:
					solution1 = 14;
				case 17:
					solution1 = 19;
				case 18:
					solution1 = 16;
				case 19:
					solution1 = 13;
				case 20:
					solution1 = 9;
				case 21:
					solution1 = 17;
				case 22:
					solution1 = 20;
			}
			switch(problemCalc2) {
				case 1:
					solution2 = 9;
				case 2:
					solution2 = 15;
				case 3:
					solution2 = 4;
				case 4:
					solution2 = 11;
				case 5:
					solution2 = 19;
				case 6:
					solution2 = 17;
				case 7:
					solution2 = 19;
				case 8:
					solution2 = 18;
				case 9:
					solution2 = 19;
				case 10:
					solution2 = 8;
				case 11:
					solution2 = 14;
				case 12:
					solution2 = 11;
				case 13:
					solution2 = 5;
				case 14:
					solution2 = 10;
				case 15:
					solution2 = 11;
				case 16:
					solution2 = 14;
				case 17:
					solution2 = 19;
				case 18:
					solution2 = 16;
				case 19:
					solution2 = 13;
				case 20:
					solution2 = 9;
				case 21:
					solution2 = 17;
				case 22:
					solution2 = 20;
			}
			switch(problemCalc3) {
				case 1:
					solution3 = 9;
				case 2:
					solution3 = 15;
				case 3:
					solution3 = 4;
				case 4:
					solution3 = 11;
				case 5:
					solution3 = 19;
				case 6:
					solution3 = 17;
				case 7:
					solution3 = 19;
				case 8:
					solution3 = 18;
				case 9:
					solution3 = 19;
				case 10:
					solution3 = 8;
				case 11:
					solution3 = 14;
				case 12:
					solution3 = 11;
				case 13:
					solution3 = 5;
				case 14:
					solution3 = 10;
				case 15:
					solution3 = 11;
				case 16:
					solution3 = 14;
				case 17:
					solution3 = 19;
				case 18:
					solution3 = 16;
				case 19:
					solution3 = 13;
				case 20:
					solution3 = 9;
				case 21:
					solution3 = 17;
				case 22:
					solution3 = 20;
			}
			switch(problemCalc4) {
				case 1:
					solution4 = 9;
				case 2:
					solution4 = 15;
				case 3:
					solution4 = 4;
				case 4:
					solution4 = 11;
				case 5:
					solution4 = 19;
				case 6:
					solution4 = 17;
				case 7:
					solution4 = 19;
				case 8:
					solution4 = 18;
				case 9:
					solution4 = 19;
				case 10:
					solution4 = 8;
				case 11:
					solution4 = 14;
				case 12:
					solution4 = 11;
				case 13:
					solution4 = 5;
				case 14:
					solution4 = 10;
				case 15:
					solution4 = 11;
				case 16:
					solution4 = 14;
				case 17:
					solution4 = 19;
				case 18:
					solution4 = 16;
				case 19:
					solution4 = 13;
				case 20:
					solution4 = 9;
				case 21:
					solution4 = 17;
				case 22:
					solution4 = 20;
			}
		}
		trace("Recalculating Numbers");
		recalculateNumbers();
	}

	function recalculateNumbers() {
		if (!numbersToShow1.contains(solution1)) {
			numbers = shuffleArray(numbers);
			numbersToShow1 = numbers.slice(0,8);
			recalculateNumbers();
			trace("Recalculated Number 1");
		} else if (!numbersToShow2.contains(solution2)) {
			numbers = shuffleArray(numbers);
			numbersToShow2 = numbers.slice(0,8);
			recalculateNumbers();
			trace("Recalculated Number 2");
		} else if (!numbersToShow3.contains(solution3)) {
			numbers = shuffleArray(numbers);
			numbersToShow3 = numbers.slice(0,8);
			recalculateNumbers();
			trace("Recalculated Number 3");
		} else if (!numbersToShow4.contains(solution4)) {
			numbers = shuffleArray(numbers);
			numbersToShow4 = numbers.slice(0,8);
			recalculateNumbers();
			trace("Recalculated Number 4");
		} else {
			for (num in numbersToShow1) {
				choiceLoaded += 1;
				if (choiceLoaded == 1) {
					choice1 = new FlxSprite(833, -812).loadGraphic(Paths.image('bgs/educator/overworld/numbers/' + num + "-deselct"));
					choice1.scale.x = 3.71;
					choice1.scale.y = 3.71;
					choice1.scrollFactor.set(1, 1);
					choice1.antialiasing = false;
					choice1.visible = true;

					choice1Sel = new FlxSprite(833, -812).loadGraphic(Paths.image('bgs/educator/overworld/numbers/' + num + "-selct"));
					choice1Sel.scale.x = 3.71;
					choice1Sel.scale.y = 3.71;
					choice1Sel.scrollFactor.set(1, 1);
					choice1Sel.antialiasing = false;
					choice1Sel.visible = false;

					num1 = num;
				} else if (choiceLoaded == 2) {
					choice2 = new FlxSprite(833, -722).loadGraphic(Paths.image('bgs/educator/overworld/numbers/' + num + "-deselct"));
					choice2.scale.x = 3.71;
					choice2.scale.y = 3.71;
					choice2.scrollFactor.set(1, 1);
					choice2.antialiasing = false;
					choice2.visible = true;

					choice2Sel = new FlxSprite(833, -722).loadGraphic(Paths.image('bgs/educator/overworld/numbers/' + num + "-selct"));
					choice2Sel.scale.x = 3.71;
					choice2Sel.scale.y = 3.71;
					choice2Sel.scrollFactor.set(1, 1);
					choice2Sel.antialiasing = false;
					choice2Sel.visible = false;

					num2 = num;
				} else if (choiceLoaded == 3) {
					choice3 = new FlxSprite(833, -632).loadGraphic(Paths.image('bgs/educator/overworld/numbers/' + num + "-deselct"));
					choice3.scale.x = 3.71;
					choice3.scale.y = 3.71;
					choice3.scrollFactor.set(1, 1);
					choice3.antialiasing = false;
					choice3.visible = true;

					choice3Sel = new FlxSprite(833, -632).loadGraphic(Paths.image('bgs/educator/overworld/numbers/' + num + "-selct"));
					choice3Sel.scale.x = 3.71;
					choice3Sel.scale.y = 3.71;
					choice3Sel.scrollFactor.set(1, 1);
					choice3Sel.antialiasing = false;
					choice3Sel.visible = false;

					num3 = num;
				} else if (choiceLoaded == 4) {
					choice4 = new FlxSprite(950, -632).loadGraphic(Paths.image('bgs/educator/overworld/numbers/' + num + "-deselct"));
					choice4.scale.x = 3.71;
					choice4.scale.y = 3.71;
					choice4.scrollFactor.set(1, 1);
					choice4.antialiasing = false;
					choice4.visible = true;

					choice4Sel = new FlxSprite(950, -632).loadGraphic(Paths.image('bgs/educator/overworld/numbers/' + num + "-selct"));
					choice4Sel.scale.x = 3.71;
					choice4Sel.scale.y = 3.71;
					choice4Sel.scrollFactor.set(1, 1);
					choice4Sel.antialiasing = false;
					choice4Sel.visible = false;

					num4 = num;
				} else if (choiceLoaded == 5) {
					choice5 = new FlxSprite(1067, -632).loadGraphic(Paths.image('bgs/educator/overworld/numbers/' + num + "-deselct"));
					choice5.scale.x = 3.71;
					choice5.scale.y = 3.71;
					choice5.scrollFactor.set(1, 1);
					choice5.antialiasing = false;
					choice5.visible = true;

					choice5Sel = new FlxSprite(1067, -632).loadGraphic(Paths.image('bgs/educator/overworld/numbers/' + num + "-selct"));
					choice5Sel.scale.x = 3.71;
					choice5Sel.scale.y = 3.71;
					choice5Sel.scrollFactor.set(1, 1);
					choice5Sel.antialiasing = false;
					choice5Sel.visible = false;

					num5 = num;
				} else if (choiceLoaded == 6) {
					choice6 = new FlxSprite(1067, -722).loadGraphic(Paths.image('bgs/educator/overworld/numbers/' + num + "-deselct"));
					choice6.scale.x = 3.71;
					choice6.scale.y = 3.71;
					choice6.scrollFactor.set(1, 1);
					choice6.antialiasing = false;
					choice6.visible = true;

					choice6Sel = new FlxSprite(1067, -722).loadGraphic(Paths.image('bgs/educator/overworld/numbers/' + num + "-selct"));
					choice6Sel.scale.x = 3.71;
					choice6Sel.scale.y = 3.71;
					choice6Sel.scrollFactor.set(1, 1);
					choice6Sel.antialiasing = false;
					choice6Sel.visible = false;
					add(choice6Sel);

					num6 = num;
				} else if (choiceLoaded == 7) {
					choice7 = new FlxSprite(1067, -812).loadGraphic(Paths.image('bgs/educator/overworld/numbers/' + num + "-deselct"));
					choice7.scale.x = 3.71;
					choice7.scale.y = 3.71;
					choice7.scrollFactor.set(1, 1);
					choice7.antialiasing = false;
					choice7.visible = true;

					choice7Sel = new FlxSprite(1067, -812).loadGraphic(Paths.image('bgs/educator/overworld/numbers/' + num + "-selct"));
					choice7Sel.scale.x = 3.71;
					choice7Sel.scale.y = 3.71;
					choice7Sel.scrollFactor.set(1, 1);
					choice7Sel.antialiasing = false;
					choice7Sel.visible = false;

					num7 = num;
				} else if (choiceLoaded == 8) {
					choice8 = new FlxSprite(950, -812).loadGraphic(Paths.image('bgs/educator/overworld/numbers/' + num + "-deselct"));
					choice8.scale.x = 3.71;
					choice8.scale.y = 3.71;
					choice8.scrollFactor.set(1, 1);
					choice8.antialiasing = false;
					choice8.visible = true;

					choice8Sel = new FlxSprite(950, -812).loadGraphic(Paths.image('bgs/educator/overworld/numbers/' + num + "-selct"));
					choice8Sel.scale.x = 3.71;
					choice8Sel.scale.y = 3.71;
					choice8Sel.scrollFactor.set(1, 1);
					choice8Sel.antialiasing = false;
					choice8Sel.visible = false;

					num8 = num;
				}
			}
			add(choice7);
			add(choice7Sel);
			add(choice8);
			add(choice8Sel);
			add(choice1);
			add(choice1Sel);
			add(choice2);
			add(choice2Sel);
			add(choice6);
			add(choice6Sel);
			add(choice5);
			add(choice5Sel);
			add(choice4);
			add(choice4Sel);
			add(choice3);
			add(choice3Sel);
			allowAnswer = true;
			problemState = true;
		}
	}

	function loadOtherAnswers(type:Int) {
		choiceLoaded = 0;
		if (type == 1) {
			for (num in numbersToShow2) {
				choiceLoaded += 1;
				if (choiceLoaded == 1) {
					choice9 = new FlxSprite(833, -812).loadGraphic(Paths.image('bgs/educator/overworld/numbers/' + num + "-deselct"));
					choice9.scale.x = 3.71;
					choice9.scale.y = 3.71;
					choice9.scrollFactor.set(1, 1);
					choice9.antialiasing = false;
					choice9.visible = true;
	
					choice9Sel = new FlxSprite(833, -812).loadGraphic(Paths.image('bgs/educator/overworld/numbers/' + num + "-selct"));
					choice9Sel.scale.x = 3.71;
					choice9Sel.scale.y = 3.71;
					choice9Sel.scrollFactor.set(1, 1);
					choice9Sel.antialiasing = false;
					choice9Sel.visible = false;
	
					num1 = num;
				} else if (choiceLoaded == 2) {
					choice10 = new FlxSprite(833, -722).loadGraphic(Paths.image('bgs/educator/overworld/numbers/' + num + "-deselct"));
					choice10.scale.x = 3.71;
					choice10.scale.y = 3.71;
					choice10.scrollFactor.set(1, 1);
					choice10.antialiasing = false;
					choice10.visible = true;
	
					choice10Sel = new FlxSprite(833, -722).loadGraphic(Paths.image('bgs/educator/overworld/numbers/' + num + "-selct"));
					choice10Sel.scale.x = 3.71;
					choice10Sel.scale.y = 3.71;
					choice10Sel.scrollFactor.set(1, 1);
					choice10Sel.antialiasing = false;
					choice10Sel.visible = false;
	
					num2 = num;
				} else if (choiceLoaded == 3) {
					choice11 = new FlxSprite(833, -632).loadGraphic(Paths.image('bgs/educator/overworld/numbers/' + num + "-deselct"));
					choice11.scale.x = 3.71;
					choice11.scale.y = 3.71;
					choice11.scrollFactor.set(1, 1);
					choice11.antialiasing = false;
					choice11.visible = true;
	
					choice11Sel = new FlxSprite(833, -632).loadGraphic(Paths.image('bgs/educator/overworld/numbers/' + num + "-selct"));
					choice11Sel.scale.x = 3.71;
					choice11Sel.scale.y = 3.71;
					choice11Sel.scrollFactor.set(1, 1);
					choice11Sel.antialiasing = false;
					choice11Sel.visible = false;
	
					num3 = num;
				} else if (choiceLoaded == 4) {
					choice12 = new FlxSprite(950, -632).loadGraphic(Paths.image('bgs/educator/overworld/numbers/' + num + "-deselct"));
					choice12.scale.x = 3.71;
					choice12.scale.y = 3.71;
					choice12.scrollFactor.set(1, 1);
					choice12.antialiasing = false;
					choice12.visible = true;
	
					choice12Sel = new FlxSprite(950, -632).loadGraphic(Paths.image('bgs/educator/overworld/numbers/' + num + "-selct"));
					choice12Sel.scale.x = 3.71;
					choice12Sel.scale.y = 3.71;
					choice12Sel.scrollFactor.set(1, 1);
					choice12Sel.antialiasing = false;
					choice12Sel.visible = false;
	
					num4 = num;
				} else if (choiceLoaded == 5) {
					choice13 = new FlxSprite(1067, -632).loadGraphic(Paths.image('bgs/educator/overworld/numbers/' + num + "-deselct"));
					choice13.scale.x = 3.71;
					choice13.scale.y = 3.71;
					choice13.scrollFactor.set(1, 1);
					choice13.antialiasing = false;
					choice13.visible = true;
	
					choice13Sel = new FlxSprite(1067, -632).loadGraphic(Paths.image('bgs/educator/overworld/numbers/' + num + "-selct"));
					choice13Sel.scale.x = 3.71;
					choice13Sel.scale.y = 3.71;
					choice13Sel.scrollFactor.set(1, 1);
					choice13Sel.antialiasing = false;
					choice13Sel.visible = false;
	
					num5 = num;
				} else if (choiceLoaded == 6) {
					choice14 = new FlxSprite(1067, -722).loadGraphic(Paths.image('bgs/educator/overworld/numbers/' + num + "-deselct"));
					choice14.scale.x = 3.71;
					choice14.scale.y = 3.71;
					choice14.scrollFactor.set(1, 1);
					choice14.antialiasing = false;
					choice14.visible = true;
	
					choice14Sel = new FlxSprite(1067, -722).loadGraphic(Paths.image('bgs/educator/overworld/numbers/' + num + "-selct"));
					choice14Sel.scale.x = 3.71;
					choice14Sel.scale.y = 3.71;
					choice14Sel.scrollFactor.set(1, 1);
					choice14Sel.antialiasing = false;
					choice14Sel.visible = false;
					add(choice14Sel);
	
					num6 = num;
				} else if (choiceLoaded == 7) {
					choice15 = new FlxSprite(1067, -812).loadGraphic(Paths.image('bgs/educator/overworld/numbers/' + num + "-deselct"));
					choice15.scale.x = 3.71;
					choice15.scale.y = 3.71;
					choice15.scrollFactor.set(1, 1);
					choice15.antialiasing = false;
					choice15.visible = true;
	
					choice15Sel = new FlxSprite(1067, -812).loadGraphic(Paths.image('bgs/educator/overworld/numbers/' + num + "-selct"));
					choice15Sel.scale.x = 3.71;
					choice15Sel.scale.y = 3.71;
					choice15Sel.scrollFactor.set(1, 1);
					choice15Sel.antialiasing = false;
					choice15Sel.visible = false;
	
					num7 = num;
				} else if (choiceLoaded == 8) {
					choice16 = new FlxSprite(950, -812).loadGraphic(Paths.image('bgs/educator/overworld/numbers/' + num + "-deselct"));
					choice16.scale.x = 3.71;
					choice16.scale.y = 3.71;
					choice16.scrollFactor.set(1, 1);
					choice16.antialiasing = false;
					choice16.visible = true;
	
					choice16Sel = new FlxSprite(950, -812).loadGraphic(Paths.image('bgs/educator/overworld/numbers/' + num + "-selct"));
					choice16Sel.scale.x = 3.71;
					choice16Sel.scale.y = 3.71;
					choice16Sel.scrollFactor.set(1, 1);
					choice16Sel.antialiasing = false;
					choice16Sel.visible = false;
	
					num8 = num;
				}
			}
		}
	}

	function triggerProblem2() {
		trace("Problem2");
		answer1.visible = false;
		problem1.visible = false;
		problem2.visible = true;

		for (num in numbersToShow2) {
			choiceLoaded = 0;
			choiceLoaded += 1;
			if (choiceLoaded == 1) {
				choice1 = new FlxSprite(833, -812).loadGraphic(Paths.image('bgs/educator/overworld/numbers/' + num + "-deselct"));
				choice1.scale.x = 3.71;
				choice1.scale.y = 3.71;
				choice1.scrollFactor.set(1, 1);
				choice1.antialiasing = false;
				choice1.visible = true;

				choice1Sel = new FlxSprite(833, -812).loadGraphic(Paths.image('bgs/educator/overworld/numbers/' + num + "-selct"));
				choice1Sel.scale.x = 3.71;
				choice1Sel.scale.y = 3.71;
				choice1Sel.scrollFactor.set(1, 1);
				choice1Sel.antialiasing = false;
				choice1Sel.visible = false;

				num1 = num;
			} else if (choiceLoaded == 2) {
				choice2 = new FlxSprite(833, -722).loadGraphic(Paths.image('bgs/educator/overworld/numbers/' + num + "-deselct"));
				choice2.scale.x = 3.71;
				choice2.scale.y = 3.71;
				choice2.scrollFactor.set(1, 1);
				choice2.antialiasing = false;
				choice2.visible = true;

				choice2Sel = new FlxSprite(833, -722).loadGraphic(Paths.image('bgs/educator/overworld/numbers/' + num + "-selct"));
				choice2Sel.scale.x = 3.71;
				choice2Sel.scale.y = 3.71;
				choice2Sel.scrollFactor.set(1, 1);
				choice2Sel.antialiasing = false;
				choice2Sel.visible = false;

				num2 = num;
			} else if (choiceLoaded == 3) {
				choice3 = new FlxSprite(833, -632).loadGraphic(Paths.image('bgs/educator/overworld/numbers/' + num + "-deselct"));
				choice3.scale.x = 3.71;
				choice3.scale.y = 3.71;
				choice3.scrollFactor.set(1, 1);
				choice3.antialiasing = false;
				choice3.visible = true;

				choice3Sel = new FlxSprite(833, -632).loadGraphic(Paths.image('bgs/educator/overworld/numbers/' + num + "-selct"));
				choice3Sel.scale.x = 3.71;
				choice3Sel.scale.y = 3.71;
				choice3Sel.scrollFactor.set(1, 1);
				choice3Sel.antialiasing = false;
				choice3Sel.visible = false;

				num3 = num;
			} else if (choiceLoaded == 4) {
				choice4 = new FlxSprite(950, -632).loadGraphic(Paths.image('bgs/educator/overworld/numbers/' + num + "-deselct"));
				choice4.scale.x = 3.71;
				choice4.scale.y = 3.71;
				choice4.scrollFactor.set(1, 1);
				choice4.antialiasing = false;
				choice4.visible = true;

				choice4Sel = new FlxSprite(950, -632).loadGraphic(Paths.image('bgs/educator/overworld/numbers/' + num + "-selct"));
				choice4Sel.scale.x = 3.71;
				choice4Sel.scale.y = 3.71;
				choice4Sel.scrollFactor.set(1, 1);
				choice4Sel.antialiasing = false;
				choice4Sel.visible = false;

				num4 = num;
			} else if (choiceLoaded == 5) {
				choice5 = new FlxSprite(1067, -632).loadGraphic(Paths.image('bgs/educator/overworld/numbers/' + num + "-deselct"));
				choice5.scale.x = 3.71;
				choice5.scale.y = 3.71;
				choice5.scrollFactor.set(1, 1);
				choice5.antialiasing = false;
				choice5.visible = true;

				choice5Sel = new FlxSprite(1067, -632).loadGraphic(Paths.image('bgs/educator/overworld/numbers/' + num + "-selct"));
				choice5Sel.scale.x = 3.71;
				choice5Sel.scale.y = 3.71;
				choice5Sel.scrollFactor.set(1, 1);
				choice5Sel.antialiasing = false;
				choice5Sel.visible = false;

				num5 = num;
			} else if (choiceLoaded == 6) {
				choice6 = new FlxSprite(1067, -722).loadGraphic(Paths.image('bgs/educator/overworld/numbers/' + num + "-deselct"));
				choice6.scale.x = 3.71;
				choice6.scale.y = 3.71;
				choice6.scrollFactor.set(1, 1);
				choice6.antialiasing = false;
				choice6.visible = true;

				choice6Sel = new FlxSprite(1067, -722).loadGraphic(Paths.image('bgs/educator/overworld/numbers/' + num + "-selct"));
				choice6Sel.scale.x = 3.71;
				choice6Sel.scale.y = 3.71;
				choice6Sel.scrollFactor.set(1, 1);
				choice6Sel.antialiasing = false;
				choice6Sel.visible = false;
				add(choice6Sel);

				num6 = num;
			} else if (choiceLoaded == 7) {
				choice7 = new FlxSprite(1067, -812).loadGraphic(Paths.image('bgs/educator/overworld/numbers/' + num + "-deselct"));
				choice7.scale.x = 3.71;
				choice7.scale.y = 3.71;
				choice7.scrollFactor.set(1, 1);
				choice7.antialiasing = false;
				choice7.visible = true;

				choice7Sel = new FlxSprite(1067, -812).loadGraphic(Paths.image('bgs/educator/overworld/numbers/' + num + "-selct"));
				choice7Sel.scale.x = 3.71;
				choice7Sel.scale.y = 3.71;
				choice7Sel.scrollFactor.set(1, 1);
				choice7Sel.antialiasing = false;
				choice7Sel.visible = false;

				num7 = num;
			} else if (choiceLoaded == 8) {
				choice8 = new FlxSprite(950, -812).loadGraphic(Paths.image('bgs/educator/overworld/numbers/' + num + "-deselct"));
				choice8.scale.x = 3.71;
				choice8.scale.y = 3.71;
				choice8.scrollFactor.set(1, 1);
				choice8.antialiasing = false;
				choice8.visible = true;

				choice8Sel = new FlxSprite(950, -812).loadGraphic(Paths.image('bgs/educator/overworld/numbers/' + num + "-selct"));
				choice8Sel.scale.x = 3.71;
				choice8Sel.scale.y = 3.71;
				choice8Sel.scrollFactor.set(1, 1);
				choice8Sel.antialiasing = false;
				choice8Sel.visible = false;

				num8 = num;
			}
		}
		add(choice7);
		add(choice7Sel);
		add(choice8);
		add(choice8Sel);
		add(choice1);
		add(choice1Sel);
		add(choice2);
		add(choice2Sel);
		add(choice6);
		add(choice6Sel);
		add(choice5);
		add(choice5Sel);
		add(choice4);
		add(choice4Sel);
		add(choice3);
		add(choice3Sel);
		allowAnswer = true;
		problemState = true;
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (followBF) {
			camFollowPoint.x = charBF.x;
			camFollowPoint.y = charBF.y;
		}

		// if (followBF){
			// camFollowPoint.x = charBF.x;
			// camFollowPoint.y = charBF.y;
		// }	
		FlxG.camera.follow(camFollowPoint, LOCKON, 1);

		if (controls.BACK)
		{
			Lib.application.window.resizable = true;
			FlxG.scaleMode = new RatioScaleMode(false);
			FlxG.resizeGame(1280, 720);
			FlxG.resizeWindow(1280, 720);
			FlxG.switchState(new MainMenuState());
		}
		#if windows
		FlxG.fullscreen = false;
		#end
		
		if (controls.UI_UP_P && canMove) {
			//direction 1 = x movement ONLY
			//direction 2 = y movement ONLY
			//direction 3 = x AND y (value3 x, value4 y)
			switch(position) {
				case 0:
					movePlayer(3, 835, -110);
					position = 1;
				case 1:
					movePlayer(3, 945, -330);
					position = 2;
				case 2:
					movePlayer(3, 1070, -585);
					position = 3;
				case 3:
					movePlayer(3, 1220, -875);
					position = 4;
				case 7:
					movePlayer(3, 2155, -980);
					position = 12;
				case 8:
					movePlayer(3, 2420, -1135);
					position = 14;
				case 18:
					movePlayer(3, 3370, -50);
					position = 19;
				case 19:
					movePlayer(3, 3440, -200);
					position = 20;
				case 20:
					movePlayer(3, 3510, -350);
					position = 21;
				case 25:
					movePlayer(3, 3180, 340);
					position = 18;
				case 28:
					movePlayer(3, 630, -1480);
					position = 29;
			}
		}
		if (controls.UI_DOWN_P && canMove) {
			//direction 1 = x movement ONLY
			//direction 2 = y movement ONLY
			//direction 3 = x AND y (value3 x, value4 y)
			switch(position) {
				case 1:
					movePlayer(3, 620, 340);
					position = 0;
				case 2:
					movePlayer(3, 835, -110);
					position = 1;
				case 3:
					movePlayer(3, 945, -330);
					position = 2;
				case 4:
					movePlayer(3, 1070, -585);
					position = 3;
				case 12:
					movePlayer(3, 2105, -875);
					position = 7;
				case 14:
					movePlayer(3, 2285, -875);
					position = 8;
				case 18:
					movePlayer(3, 3140, 430);
					position = 25;
				case 19:
					movePlayer(3, 3180, 340);
					position = 18;
				case 20:
					movePlayer(3, 3370, -50);
					position = 19;
				case 21:
					movePlayer(3, 3445, -200);
					position = 20;
				case 28:
					playerSpecialMovement(8);
					position = 27;
				case 29:
					movePlayer(3, 600, -1430);
					position = 28;
			}
		}
		if (controls.UI_LEFT_P && canMove) {
			//direction 1 = x movement ONLY
			//direction 2 = y movement ONLY
			//direction 3 = x AND y (value3 x, value4 y)
			switch(position) {
				case 1:
					movePlayer(1, 735);
					position = 10;
				case 3:
					movePlayer(1, 970);
					position = 27;
				case 4:
					movePlayer(1, 270);
					position = 5;
				case 6:
					movePlayer(1, 1215);
					position = 4;
				case 7:
					movePlayer(1, 1415);
					position = 6;
				case 8:
					movePlayer(1, 2105);
					position = 7;
				case 9:
					movePlayer(1, 2285);
					position = 8;
				case 10:
					playerSpecialMovement(1);
					position = 11;
				case 13:
					movePlayer(1, 620);
					position = 0;
				case 15:
					movePlayer(1, 2410);
					position = 14;
				case 16:
					playerSpecialMovement(5);
					position = 13;
				case 17:
					playerSpecialMovement(6);
					position = 16;
				case 18:
					movePlayer(1, 2250);
					position = 17;
				case 20:
					movePlayer(1, 3245);
					position = 24;
				case 22:
					movePlayer(1, 3180);
					position = 18;
				case 23:
					movePlayer(1, 3370);
					position = 19;
				case 26:
					movePlayer(1, 945);
					position = 2;
				case 27:
					playerSpecialMovement(7);
					position = 28;
				case 29:
					movePlayer(1, 395);
					position = 30;
				case 31:
					movePlayer(1, 630);
					position = 29;
			}
		}
		if (controls.UI_RIGHT_P && canMove) {
			//direction 1 = x movement ONLY
			//direction 2 = y movement ONLY
			//direction 3 = x AND y (value3 x, value4 y)
			switch(position) {
				case 0:
					movePlayer(1, 770);
					position = 13;
				case 2:
					movePlayer(1, 1045);
					position = 26;
				case 4:
					movePlayer(1, 1415);
					position = 6;
				case 5:
					movePlayer(1, 1215);
					position = 4;
				case 6:
					movePlayer(1, 2105);
					position = 7;
				case 7:
					movePlayer(1, 2285);
					position = 8;
				case 8:
					movePlayer(1, 2585);
					position = 9;
				case 10:
					movePlayer(1, 835);
					position = 1;
				case 11:
					playerSpecialMovement(2);
					position = 10;
				case 13:
					playerSpecialMovement(3);
					position = 16;
				case 14:
					movePlayer(1, 2910);
					position = 15;
				case 16:
					playerSpecialMovement(4);
					position = 17;
				case 17:
					movePlayer(1, 3180);
					position = 18;
				case 18:
					movePlayer(1, 3380);
					position = 22;
				case 19:
					movePlayer(1, 3520);
					position = 23;
				case 24:
					movePlayer(1, 3445);
					position = 20;
				case 27:
					movePlayer(1, 1070);
					position = 3;
				case 29:
					movePlayer(1, 830);
					position = 31;
				case 30:
					movePlayer(1, 630);
					position = 29;
			}
		}
		if (controls.UI_UP_P && problemState && allowAnswer) {
			switch(solutionSelected) {
				case 0:
					solutionSelected = 8;
					changeSelection();
				case 1:
					solutionSelected = 3;
					changeSelection();
				case 2:
					solutionSelected = 1;
					changeSelection();
				case 3:
					solutionSelected = 2;
					changeSelection();
				case 4:
					solutionSelected = 8;
					changeSelection();
				case 5:
					solutionSelected = 6;
					changeSelection();
				case 6:
					solutionSelected = 7;
					changeSelection();
				case 7:
					solutionSelected = 5;
					changeSelection();
				case 8:
					solutionSelected = 4;
					changeSelection();
			}
		}
		if (controls.UI_DOWN_P && problemState && allowAnswer) {
			switch(solutionSelected) {
				case 0:
					solutionSelected = 4;
					changeSelection();
				case 1:
					solutionSelected = 2;
					changeSelection();
				case 2:
					solutionSelected = 3;
					changeSelection();
				case 3:
					solutionSelected = 1;
					changeSelection();
				case 4:
					solutionSelected = 8;
					changeSelection();
				case 5:
					solutionSelected = 7;
					changeSelection();
				case 6:
					solutionSelected = 5;
					changeSelection();
				case 7:
					solutionSelected = 6;
					changeSelection();
				case 8:
					solutionSelected = 4;
					changeSelection();
			}
		}
		if (controls.UI_LEFT_P && problemState && allowAnswer) {
			switch(solutionSelected) {
				case 0:
					solutionSelected = 2;
					changeSelection();
				case 1:
					solutionSelected = 7;
					changeSelection();
				case 2:
					solutionSelected = 6;
					changeSelection();
				case 3:
					solutionSelected = 5;
					changeSelection();
				case 4:
					solutionSelected = 3;
					changeSelection();
				case 5:
					solutionSelected = 4;
					changeSelection();
				case 6:
					solutionSelected = 2;
					changeSelection();
				case 7:
					solutionSelected = 8;
					changeSelection();
				case 8:
					solutionSelected = 1;
					changeSelection();
			}
		}
		if (controls.UI_RIGHT_P && problemState && allowAnswer) {
			switch(solutionSelected) {
				case 0:
					solutionSelected = 6;
					changeSelection();
				case 1:
					solutionSelected = 8;
					changeSelection();
				case 2:
					solutionSelected = 6;
					changeSelection();
				case 3:
					solutionSelected = 4;
					changeSelection();
				case 4:
					solutionSelected = 5;
					changeSelection();
				case 5:
					solutionSelected = 3;
					changeSelection();
				case 6:
					solutionSelected = 2;
					changeSelection();
				case 7:
					solutionSelected = 1;
					changeSelection();
				case 8:
					solutionSelected = 7;
					changeSelection();
			}
		}
		if (pressFlash) {
			if (press.alpha == 0)
				FlxTween.tween(press, {alpha: 1}, 1, {ease: FlxEase.linear});
		}
		if (pressFlash) {
			if (press.alpha == 1)
				FlxTween.tween(press, {alpha: 0}, 1, {ease: FlxEase.linear});
		}
				
		if (controls.ACCEPT && canPressEnter) {
			canPressEnter = false;
			FlxTween.tween(startScreen, {alpha: 0}, 1, {ease: FlxEase.linear});
			new FlxTimer().start(1.5, function(tmr:FlxTimer) {
				startSound.stop();
				startSound.destroy();
				startGame();
			});
		}

		if (controls.ACCEPT && problemState && allowAnswer) {
			switch(solutionSelected) {
				case 1:
					if (num1 == solution1) {
						triggerProblem2();
						allowAnswer = false;
					}
				case 2:
					if (num2 == solution1) {
						triggerProblem2();
						allowAnswer = false;
					}
				case 3:
					if (num3 == solution1) {
						triggerProblem2();
						allowAnswer = false;
					}
				case 4:
					if (num4 == solution1) {
						triggerProblem2();
						allowAnswer = false;
					}
				case 5:
					if (num5 == solution1) {
						triggerProblem2();
						allowAnswer = false;
					}
				case 6:
					if (num6 == solution1) {
						triggerProblem2();
						allowAnswer = false;
					}
				case 7:
					if (num3 == solution1) {
						triggerProblem2();
						allowAnswer = false;
					}
				case 8:
					if (num4 == solution1) {
						triggerProblem2();
						allowAnswer = false;
					}
			}
		}

		if (controls.ACCEPT && canMove && !canPressEnter) {
			// triggerProblem(1);
			canMove = false;
			switch(position) {
				case 11:
					FlxTween.tween(blackScreen, {alpha: 1}, 1);	
					new FlxTimer().start(1, function(tmr:FlxTimer) {
						cityBG.visible = true;
						followBF = false;
						helicoptor.visible = false;
						camFollowPoint.x = 955;
						camFollowPoint.y = -570;
						charBF.x = 605;
						charBF.y = -360;
						coolcamera.zoom = 1.07;
						charBF.flipX = false;
						OverworldDefault.visible = false;
						
						press = new FlxSprite(935, -530).loadGraphic(Paths.image('bgs/educator/overworld/press'));
						press.scale.x = 4;
						press.scale.y = 4;
						press.scrollFactor.set(1, 1);
						press.antialiasing = false;
						press.alpha = 0;
						add(press);
						pressFlash = true;
						FlxTween.tween(blackScreen, {alpha: 0}, 1);	
					});
			}
		}
		if (controls.ACCEPT && pressFlash) {
			calculateProblems();
			pressFlash = false;
		}
		if (controls.RESET) { //reset button if position gets fucked
			FlxG.switchState(new SonicEdusoft());  // Replace PlayState with the name of your state
			movePlayer(3, 620, 340);
			position = 0;
		}
	}

	var isEnding:Bool = false;

	function changeSelection() {
		switch(solutionSelected) {
			case 1:
				choice1.visible = false;
				choice1Sel.visible = true;
				choice2.visible = true;
				choice2Sel.visible = false;
				choice3.visible = true;
				choice3Sel.visible = false;
				choice4.visible = true;
				choice4Sel.visible = false;
				choice5.visible = true;
				choice5Sel.visible = false;
				choice6.visible = true;
				choice6Sel.visible = false;
				choice7.visible = true;
				choice7Sel.visible = false;
				choice8.visible = true;
				choice8Sel.visible = false;
			case 2:
				choice1.visible = true;
				choice1Sel.visible = false;
				choice2.visible = false;
				choice2Sel.visible = true;
				choice3.visible = true;
				choice3Sel.visible = false;
				choice4.visible = true;
				choice4Sel.visible = false;
				choice5.visible = true;
				choice5Sel.visible = false;
				choice6.visible = true;
				choice6Sel.visible = false;
				choice7.visible = true;
				choice7Sel.visible = false;
				choice8.visible = true;
				choice8Sel.visible = false;
			case 3:
				choice1.visible = true;
				choice1Sel.visible = false;
				choice2.visible = true;
				choice2Sel.visible = false;
				choice3.visible = false;
				choice3Sel.visible = true;
				choice4.visible = true;
				choice4Sel.visible = false;
				choice5.visible = true;
				choice5Sel.visible = false;
				choice6.visible = true;
				choice6Sel.visible = false;
				choice7.visible = true;
				choice7Sel.visible = false;
				choice8.visible = true;
				choice8Sel.visible = false;
			case 4:
				choice1.visible = true;
				choice1Sel.visible = false;
				choice2.visible = true;
				choice2Sel.visible = false;
				choice3.visible = true;
				choice3Sel.visible = false;
				choice4.visible = false;
				choice4Sel.visible = true;
				choice5.visible = true;
				choice5Sel.visible = false;
				choice6.visible = true;
				choice6Sel.visible = false;
				choice7.visible = true;
				choice7Sel.visible = false;
				choice8.visible = true;
				choice8Sel.visible = false;
			case 5:
				choice1.visible = true;
				choice1Sel.visible = false;
				choice2.visible = true;
				choice2Sel.visible = false;
				choice3.visible = true;
				choice3Sel.visible = false;
				choice4.visible = true;
				choice4Sel.visible = false;
				choice5.visible = false;
				choice5Sel.visible = true;
				choice6.visible = true;
				choice6Sel.visible = false;
				choice7.visible = true;
				choice7Sel.visible = false;
				choice8.visible = true;
				choice8Sel.visible = false;
			case 6:
				choice1.visible = true;
				choice1Sel.visible = false;
				choice2.visible = true;
				choice2Sel.visible = false;
				choice3.visible = true;
				choice3Sel.visible = false;
				choice4.visible = true;
				choice4Sel.visible = false;
				choice5.visible = true;
				choice5Sel.visible = false;
				choice6.visible = false;
				choice6Sel.visible = true;
				choice7.visible = true;
				choice7Sel.visible = false;
				choice8.visible = true;
				choice8Sel.visible = false;
			case 7:
				choice1.visible = true;
				choice1Sel.visible = false;
				choice2.visible = true;
				choice2Sel.visible = false;
				choice3.visible = true;
				choice3Sel.visible = false;
				choice4.visible = true;
				choice4Sel.visible = false;
				choice5.visible = true;
				choice5Sel.visible = false;
				choice6.visible = true;
				choice6Sel.visible = false;
				choice7.visible = false;
				choice7Sel.visible = true;
				choice8.visible = true;
				choice8Sel.visible = false;
			case 8:
				choice1.visible = true;
				choice1Sel.visible = false;
				choice2.visible = true;
				choice2Sel.visible = false;
				choice3.visible = true;
				choice3Sel.visible = false;
				choice4.visible = true;
				choice4Sel.visible = false;
				choice5.visible = true;
				choice5Sel.visible = false;
				choice6.visible = true;
				choice6Sel.visible = false;
				choice7.visible = true;
				choice7Sel.visible = false;
				choice8.visible = false;
				choice8Sel.visible = true;
		}
		trace(solutionSelected);
	}

	public function movePlayer(direction:Int, distance:Int, ?distance2:Int) {
	canMove = false;
	var travelTime:Float;
	var speed:Int = 500;
    
    if (direction == 1) {
        var distX:Float = Math.abs(distance - charBF.x);
        travelTime = distX / speed;
        
        FlxTween.tween(charBF, {x: distance}, travelTime, {ease: FlxEase.linear});
        
        if (charBF.x > distance) {
            charBF.animation.play('walkside');
            charBF.flipX = true;
        } else if (charBF.x < distance) {
            charBF.animation.play('walkside');
            charBF.flipX = false;
        }
        
        new FlxTimer().start(travelTime, function(tmr:FlxTimer) {
            charBF.animation.play('idleside');
            canMove = true;
			trace("Position: " + position);
			trace("X: " + charBF.x);
			trace("Y: " + charBF.y);
        });
        
    } else if (direction == 2) {
        var distY:Float = Math.abs(distance - charBF.y);
        travelTime = distY / speed;
        
        FlxTween.tween(charBF, {y: distance}, travelTime, {ease: FlxEase.linear});
        
        if (charBF.y > distance) {
            charBF.animation.play('walkback');
			charBF.flipX = false;
        } else if (charBF.y < distance) {
            charBF.animation.play('walkfront');
			charBF.flipX = false;
        }
        
        new FlxTimer().start(travelTime, function(tmr:FlxTimer) {
            if (charBF.y > distance) {
                charBF.animation.play('idleback');
				charBF.flipX = false;
            } else {
                charBF.animation.play('idlefront');
				charBF.flipX = false;
            }
            canMove = true;
			trace("Position: " + position);
			trace("X: " + charBF.x);
			trace("Y: " + charBF.y);
        });
        
    } else if (direction == 3) {
        var distX:Float = Math.abs(distance - charBF.x);
        var distY:Float = Math.abs(distance2 - charBF.y);
        var maxDist:Float = Math.max(distX, distY);
        
        travelTime = maxDist / speed;
        
        FlxTween.tween(charBF, {x: distance}, travelTime, {ease: FlxEase.linear});
        FlxTween.tween(charBF, {y: distance2}, travelTime, {ease: FlxEase.linear});
        
        if (charBF.y > distance2) {
            charBF.animation.play('walkback');
			charBF.flipX = false;
        } else if (charBF.y < distance2) {
            charBF.animation.play('walkfront');
			charBF.flipX = false;
        }
        
        new FlxTimer().start(travelTime, function(tmr:FlxTimer) {
            if (charBF.y > distance2) {
                charBF.animation.play('idleback');
				charBF.flipX = false;
            } else {
                charBF.animation.play('idlefront');
				charBF.flipX = false;
            }
            canMove = true;
            trace("Position: " + position);
			trace("X: " + charBF.x);
			trace("Y: " + charBF.y);
        });
	} else {
			trace("Not a acceptable value");
		}
	}
	function playerSpecialMovement(type:Int) {
		canMove = false;
		if (type == 1) {
			charBF.flipX = true;
			charBF.animation.play('jump');
			FlxG.sound.play(Paths.sound('edusoft/jump', 'preload'), 0.7);
			FlxTween.tween(charBF, {y: -160}, 0.3, {ease: FlxEase.quadOut});	
			FlxTween.tween(charBF, {x: 620}, 0.5, {ease: FlxEase.linear});	
			new FlxTimer().start(0.3, function(tmr:FlxTimer)
			{
				FlxTween.tween(charBF, {y: -120}, 0.2, {ease: FlxEase.quadIn});	
				new FlxTimer().start(0.2, function(tmr:FlxTimer)
				{
					FlxTween.tween(charBF, {y: -440}, 0.4, {ease: FlxEase.quadOut});	
					FlxTween.tween(charBF, {x: 365}, 0.8, {ease: FlxEase.linear});	
					new FlxTimer().start(0.4, function(tmr:FlxTimer)
					{
						FlxTween.tween(charBF, {y: -380}, 0.4, {ease: FlxEase.quadIn});
						new FlxTimer().start(0.4, function(tmr:FlxTimer)
						{
							FlxTween.tween(charBF, {y: -480}, 0.3, {ease: FlxEase.quadOut});
							FlxTween.tween(charBF, {x: 205}, 0.6, {ease: FlxEase.linear});										
							new FlxTimer().start(0.3, function(tmr:FlxTimer)
							{
								FlxTween.tween(charBF, {y: -450}, 0.3, {ease: FlxEase.quadIn});
								new FlxTimer().start(0.3, function(tmr:FlxTimer)
								{
									charBF.animation.play('idleside');
									canMove = true;
									trace("Position: " + position);
									trace("X: " + charBF.x);
									trace("Y: " + charBF.y);
								});
							});
						});
					});
				});
			});
		} else if (type == 2) {
			charBF.flipX = false;
			charBF.animation.play('jump');
			FlxG.sound.play(Paths.sound('edusoft/jump', 'preload'), 0.7);
			FlxTween.tween(charBF, {y: -490}, 0.3, {ease: FlxEase.quadOut});
			FlxTween.tween(charBF, {x: 365}, 0.6, {ease: FlxEase.linear});	
			new FlxTimer().start(0.3, function(tmr:FlxTimer)
			{
				FlxTween.tween(charBF, {y: -380}, 0.3, {ease: FlxEase.quadIn});							
				new FlxTimer().start(0.3, function(tmr:FlxTimer)
				{
					FlxTween.tween(charBF, {y: -450}, 0.3, {ease: FlxEase.quadOut}); //735, -110
					FlxTween.tween(charBF, {x: 735}, 0.6, {ease: FlxEase.linear});	
					new FlxTimer().start(0.3, function(tmr:FlxTimer)
					{
						FlxTween.tween(charBF, {y: -110}, 0.3, {ease: FlxEase.quadIn});
						new FlxTimer().start(0.3, function(tmr:FlxTimer)
						{
							charBF.animation.play('idleside');
							canMove = true;
						});
					});
				});
			});
		} else if (type == 3) { //770, 340
			charBF.flipX = false;
			charBF.animation.play('jump');
			FlxG.sound.play(Paths.sound('edusoft/jump', 'preload'), 0.7);
			FlxTween.tween(charBF, {y: 140}, 0.4, {ease: FlxEase.quadOut});
			FlxTween.tween(charBF, {x: 1800}, 1.6, {ease: FlxEase.linear});	
			new FlxTimer().start(0.4, function(tmr:FlxTimer)
			{
				FlxTween.tween(charBF, {y: 340}, 0.4, {ease: FlxEase.quadIn});
				new FlxTimer().start(0.4, function(tmr:FlxTimer)
				{
					FlxTween.tween(charBF, {y: 140}, 0.4, {ease: FlxEase.quadOut});
					new FlxTimer().start(0.4, function(tmr:FlxTimer)
					{
						FlxTween.tween(charBF, {y: 340}, 0.4, {ease: FlxEase.quadIn});
						new FlxTimer().start(0.4, function(tmr:FlxTimer)
						{
							charBF.animation.play('idleside');
							canMove = true;
							trace("Position: " + position);
							trace("X: " + charBF.x);
							trace("Y: " + charBF.y);
						});
					});
				});
			});
		} else if (type == 4) { //770, 340
			charBF.flipX = false;
			charBF.animation.play('jump');
			FlxG.sound.play(Paths.sound('edusoft/jump', 'preload'), 0.7);
			FlxTween.tween(charBF, {y: 140}, 0.4, {ease: FlxEase.quadOut});
			FlxTween.tween(charBF, {x: 2250}, 0.8, {ease: FlxEase.linear});	
			new FlxTimer().start(0.4, function(tmr:FlxTimer)
			{
				FlxTween.tween(charBF, {y: 340}, 0.4, {ease: FlxEase.quadIn});
				new FlxTimer().start(0.4, function(tmr:FlxTimer)
				{
					charBF.animation.play('idleside');
					canMove = true;
					trace("Position: " + position);
					trace("X: " + charBF.x);
					trace("Y: " + charBF.y);
				});
			});
		} else if (type == 5) { //770, 340
			charBF.flipX = true;
			charBF.animation.play('jump');
			FlxG.sound.play(Paths.sound('edusoft/jump', 'preload'), 0.7);
			FlxTween.tween(charBF, {y: 140}, 0.4, {ease: FlxEase.quadOut});
			FlxTween.tween(charBF, {x: 770}, 1.6, {ease: FlxEase.linear});	
			new FlxTimer().start(0.4, function(tmr:FlxTimer)
			{
				FlxTween.tween(charBF, {y: 340}, 0.4, {ease: FlxEase.quadIn});
				new FlxTimer().start(0.4, function(tmr:FlxTimer)
				{
					FlxTween.tween(charBF, {y: 140}, 0.4, {ease: FlxEase.quadOut});
					new FlxTimer().start(0.4, function(tmr:FlxTimer)
					{
						FlxTween.tween(charBF, {y: 340}, 0.4, {ease: FlxEase.quadIn});
						new FlxTimer().start(0.4, function(tmr:FlxTimer)
						{
							charBF.animation.play('idleside');
							canMove = true;
							trace("Position: " + position);
							trace("X: " + charBF.x);
							trace("Y: " + charBF.y);
						});
					});
				});
			});
		} else if (type == 6) { //770, 340
			charBF.flipX = true;
			charBF.animation.play('jump');
			FlxG.sound.play(Paths.sound('edusoft/jump', 'preload'), 0.7);
			FlxTween.tween(charBF, {y: 140}, 0.4, {ease: FlxEase.quadOut});
			FlxTween.tween(charBF, {x: 1800}, 0.8, {ease: FlxEase.linear});	
			new FlxTimer().start(0.4, function(tmr:FlxTimer)
			{
				FlxTween.tween(charBF, {y: 340}, 0.4, {ease: FlxEase.quadIn});
				new FlxTimer().start(0.4, function(tmr:FlxTimer)
				{
					charBF.animation.play('idleside');
					canMove = true;
					trace("Position: " + position);
					trace("X: " + charBF.x);
					trace("Y: " + charBF.y);
				});
			});
		} else if (type == 7) {
			charBF.flipX = false;
			charBF.animation.play('heli');
			helicopterSound = new FlxSound().loadEmbedded(Paths.sound('edusoft/heliFly', 'preload'), true, true);
			helicopterSound.play();
			helicopterSound.volume = 0.3;
			helicoptor.visible = false;
			charBF.x = helicoptor.x;
			charBF.y = helicoptor.y;
			FlxTween.tween(charBF, {y: -800}, 3, {ease: FlxEase.linear});
			new FlxTimer().start(3, function(tmr:FlxTimer)
			{
				FlxTween.tween(charBF, {x: 500}, 2, {ease: FlxEase.linear});	
				FlxTween.tween(charBF, {y: -1400}, 2, {ease: FlxEase.linear});
				new FlxTimer().start(2, function(tmr:FlxTimer)
				{
					FlxTween.tween(charBF, {y: -1330}, 2, {ease: FlxEase.linear});
					new FlxTimer().start(2.05, function(tmr:FlxTimer)
					{
						helicoptor.x = charBF.x;
						helicoptor.y = charBF.y;
						helicoptor.visible = true;
						charBF.x = 600;
						charBF.y = -1430;
						charBF.animation.play('idleside');
						helicopterSound.stop();
						canMove = true;
						trace('Position: ' + position);
						trace('X: ' + charBF.x);
						trace('Y: ' + charBF.y);
					});
				});
			});
		} else if (type == 8) { //850, -600
			charBF.flipX = false;
			charBF.x = helicoptor.x;
			charBF.y = helicoptor.y;
			charBF.animation.play('heli');
			helicopterSound = new FlxSound().loadEmbedded(Paths.sound('edusoft/heliFly', 'preload'), true, true);
			helicopterSound.play();
			helicopterSound.volume = 0.3;
			helicoptor.visible = false;
			FlxTween.tween(charBF, {y: -1400}, 3, {ease: FlxEase.linear});
			new FlxTimer().start(3, function(tmr:FlxTimer)
			{
				FlxTween.tween(charBF, {x: 850}, 2, {ease: FlxEase.linear});	
				FlxTween.tween(charBF, {y: -800}, 2, {ease: FlxEase.linear});
				new FlxTimer().start(2, function(tmr:FlxTimer)
				{
					FlxTween.tween(charBF, {y: -600}, 2, {ease: FlxEase.linear});
					new FlxTimer().start(2.05, function(tmr:FlxTimer)
					{
						helicoptor.x = charBF.x;
						helicoptor.y = charBF.y;
						helicoptor.visible = true;
						charBF.x = 970;
						charBF.y = -585;
						charBF.flipX = true;
						charBF.animation.play('idleside');
						helicopterSound.stop();
						canMove = true;
						trace('Position: ' + position);
						trace('X: ' + charBF.x);
						trace('Y: ' + charBF.y);
					});
				});
			});
		}
	}
}