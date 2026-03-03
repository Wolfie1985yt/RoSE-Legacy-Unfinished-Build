package states;

#if linux
import Discord.DiscordClient;
#end
#if desktop
import sys.thread.Thread;
#end
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.input.keyboard.FlxKey;
import flixel.addons.display.FlxGridOverlay;
import haxe.Json;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
#if MODS_ALLOWED
import sys.FileSystem;
import sys.io.File;
#end
import sys.io.Process;
import backend.MacroData as MacroData;
//import flixel.graphics.FlxGraphic;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.addons.transition.FlxTransitionableState;
import flixel.group.FlxGroup;
import flixel.input.gamepad.FlxGamepad;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import flixel.system.FlxSound;
import flixel.system.ui.FlxSoundTray;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import lime.app.Application;
import openfl.Assets;
import flixel.math.FlxMath;

using StringTools;
class TitleState extends MusicBeatState
{
	var transitioning:Bool = false;
	
	var logoBl:FlxSprite;
	var logoONE:FlxSprite;
	var logoTWO:FlxSprite;
	var logoTHREE:FlxSprite;
	var titleText:FlxSprite;
	var blackScreen:FlxSprite;
	var glitchBG:FlxSprite;
	var spikes:FlxSprite;
	var StopFlying:Bool = false;
	
	var LangRu:FlxSprite;
	var LangBr:FlxSprite;
	var LangEng:FlxSprite;
	var LangEs:FlxSprite;

	var britPressed:Int = 0;
	var british:Bool = false;
	var brishTimer:Bool = false;
	var britishTimer:FlxTimer;
	var krima = false;
	var anniversaryDay = false;
	var anniversaryMonth = false;

	var crash:Int = 0;

	var menulaugh:String = 'menulaugh';
	
	var yeClickPls:Bool = false;
	
	override public function create():Void
	{	
		persistentUpdate = true;

		var currentMonth:Int = Date.now().getMonth();
		var currentDay:Int = Date.now().getUTCDate();
	
		switch(currentMonth) {
			case 11:
				krima = true;
			case 5:
				anniversaryMonth = true;
			default:
				krima = false;
				anniversaryMonth = false;
		}
		switch(currentDay) {
			case 23,24,25,26,27,28,29:
				anniversaryDay = true;
			default:
				anniversaryDay = false;
		}
		trace(currentDay);

		#if linux
		#if desktop
		WeekData.loadTheFirstEnabledMod();
		#end

		FlxG.game.focusLostFramerate = 60;
		FlxG.keys.preventDefaultKeys = [TAB];
		backend.PlayerSettings.init();
		FlxG.save.bind('funkin', 'ninjamuffin99');
		ClientPrefs.loadPrefs();
		Highscore.load();
		
		FlxG.sound.muted = ClientPrefs.volMuted;
		FlxG.sound.volume = ClientPrefs.volVolume;
		
		#end
		#if mobile
		FlxG.android.preventDefaultKeys = [BACK];
		#end
		Paths.clearUnusedMemory();
		Paths.clearStoredMemory();

		if (ClientPrefs.VisibleMouse)
			FlxG.mouse.visible = true;
		else
			FlxG.mouse.visible = false;
	
		new FlxTimer().start(0.10, function(tmr:FlxTimer)
		{
			FlxG.sound.play(Paths.sound('TitleLaugh'), 0.7);
			new FlxTimer().start(1.45, function(tmr:FlxTimer)
			{
				FlxG.sound.playMusic(Paths.music('freakyMenu'), 0.7);
				FlxG.sound.play(Paths.sound('showMoment', 'shared'), 0.7);
				skipIntro();
			});
		});

		Conductor.changeBPM(102);

		FlxTransitionableState.skipNextTransIn = true;
		FlxTransitionableState.skipNextTransOut = true;
		
		ClientPrefs.StartVideo = false;
		if (!ClientPrefs.StartVideoSaw) ClientPrefs.StartVideoSaw = true;
		ClientPrefs.saveSettings();
		
		#if linux
		var rpcName:String = 'In Title Menu';
		if (TranslationLanguages.Text.exists(rpcName) && ClientPrefs.Language != 'English')
			rpcName = TranslationLanguages.Text[rpcName];
		DiscordClient.changePresence(rpcName, null);
		#end
		
		if (ClientPrefs.LogoStyle != 'Restoration') {
			glitchBG = new FlxSprite(0, 0);
			glitchBG.frames = Paths.getSparrowAtlas('title/NewTitleMenuBG');
			glitchBG.antialiasing = ClientPrefs.globalAntialiasing;
			glitchBG.animation.addByPrefix('glitch', 'TitleMenuSSBG instance 1', 24);
			glitchBG.setGraphicSize(Std.int(glitchBG.width * 3.00));
			glitchBG.animation.play('glitch');
			glitchBG.updateHitbox();
			glitchBG.screenCenter();
			add(glitchBG);
			
			if (ClientPrefs.LogoStyle == 'Restored') { logoBl = new FlxSprite(0, 0).loadGraphic(Paths.image('LogoR', 'exe')); }
			if (ClientPrefs.LogoStyle == 'Restored Old') { logoBl = new FlxSprite(0, 0).loadGraphic(Paths.image('LogoR_OLD', 'exe')); }
			if (ClientPrefs.LogoStyle == 'Sonic.exe') { logoBl = new FlxSprite(0, 0).loadGraphic(Paths.image('Logo', 'exe')); }
			logoBl.antialiasing = ClientPrefs.globalAntialiasing;
			logoBl.setGraphicSize(Std.int(logoBl.width * 0.50));
			logoBl.updateHitbox();
			logoBl.screenCenter();
			add(logoBl);

			titleText = new FlxSprite(0, 0);
			titleText.frames = Paths.getSparrowAtlas('title/titleEnter');
			titleText.animation.addByPrefix('idle', "Press Enter to Begin instance 1", 24);
			titleText.animation.addByPrefix('press', "ENTER PRESSED instance 1", 24, false);
			titleText.antialiasing = ClientPrefs.globalAntialiasing;
			titleText.animation.play('idle');
			titleText.updateHitbox();
			titleText.screenCenter(X);
			add(titleText);
		} else {
			glitchBG = new FlxSprite(0, 0);
			glitchBG.frames = Paths.getSparrowAtlas('title/static');
			glitchBG.antialiasing = false;
			glitchBG.animation.addByPrefix('glitch', 'anim', 18);
			glitchBG.setGraphicSize(Std.int(glitchBG.width * 1.00));
			glitchBG.animation.play('glitch');
			glitchBG.updateHitbox();
			glitchBG.screenCenter();
			add(glitchBG);
			
			spikes = new FlxSprite(0, 140);
			spikes.frames = Paths.getSparrowAtlas('title/spikes');
			spikes.antialiasing = ClientPrefs.globalAntialiasing;
			spikes.animation.addByPrefix('anim', 'anim', 5);
			spikes.setGraphicSize(Std.int(spikes.width * 1.00));
			spikes.animation.play('anim');
			spikes.updateHitbox();
			add(spikes);
			
			if(krima) {
				logoONE = new FlxSprite(0, -130).loadGraphic(Paths.image('Restoration-1-c', 'exe'));
				logoTWO = new FlxSprite(0, -130).loadGraphic(Paths.image('Restoration-2-c', 'exe'));
				logoTHREE = new FlxSprite(0, -130).loadGraphic(Paths.image('Restoration-3-c', 'exe'));
			} else {
				logoONE = new FlxSprite(0, -90).loadGraphic(Paths.image('Restoration-1', 'exe'));
				logoTWO = new FlxSprite(0, -90).loadGraphic(Paths.image('Restoration-2', 'exe'));
				logoTHREE = new FlxSprite(0, -90).loadGraphic(Paths.image('Restoration-3', 'exe'));
			}
			logoONE.antialiasing = ClientPrefs.globalAntialiasing;
			logoONE.setGraphicSize(Std.int(logoONE.width * 0.50));
			logoONE.updateHitbox();
			logoONE.screenCenter(X);
			add(logoONE);
			
			logoTWO.antialiasing = ClientPrefs.globalAntialiasing;
			logoTWO.setGraphicSize(Std.int(logoTWO.width * 0.50));
			logoTWO.updateHitbox();
			logoTWO.screenCenter(X);
			add(logoTWO);
			
			logoTHREE.antialiasing = ClientPrefs.globalAntialiasing;
			logoTHREE.setGraphicSize(Std.int(logoTHREE.width * 0.50));
			logoTHREE.updateHitbox();
			logoTHREE.screenCenter(X);
			add(logoTHREE);

			titleText = new FlxSprite(0, 565);
			titleText.frames = Paths.getSparrowAtlas('title/titleEnter-new');
			titleText.animation.addByIndices('idle', 'enter', [0,1,2,3], "", 18);
			titleText.animation.addByIndices('press', 'enter', [4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27], "", 24, false);
			titleText.antialiasing = ClientPrefs.globalAntialiasing;
			titleText.setGraphicSize(Std.int(titleText.width * 0.75));
			titleText.animation.play('idle');
			titleText.updateHitbox();
			titleText.screenCenter(X);
			add(titleText);
		}

		LangRu = new FlxSprite(FlxG.width-145, -15).loadGraphic(Paths.image('options/lang/ru'));
		LangRu.antialiasing = ClientPrefs.globalAntialiasing;
		LangRu.scrollFactor.set();
		LangRu.setGraphicSize(Std.int(LangRu.width * 0.75));
		add(LangRu);
		LangBr = new FlxSprite(FlxG.width-145, -15).loadGraphic(Paths.image('options/lang/br'));
		LangBr.antialiasing = ClientPrefs.globalAntialiasing;
		LangBr.scrollFactor.set();
		LangBr.setGraphicSize(Std.int(LangBr.width * 0.75));
		add(LangBr);
		LangEng = new FlxSprite(FlxG.width-145, -15).loadGraphic(Paths.image('options/lang/eng'));
		LangEng.antialiasing = ClientPrefs.globalAntialiasing;
		LangEng.scrollFactor.set();
		LangEng.setGraphicSize(Std.int(LangEng.width * 0.75));
		add(LangEng);
		LangEs = new FlxSprite(FlxG.width-145, -15).loadGraphic(Paths.image('options/lang/es'));
		LangEs.antialiasing = ClientPrefs.globalAntialiasing;
		LangEs.scrollFactor.set();
		LangEs.setGraphicSize(Std.int(LangEs.width * 0.75));
		add(LangEs);
		switch(ClientPrefs.Language) {
			case 'Russian': LangRu.color = 0xFF404040;
			case 'Spanish': LangEs.color = 0xFF404040;
			case 'English': LangEng.color = 0xFF404040;
			case 'British': LangBr.color = 0xFF404040; british = true;
		}
		LangRu.alpha = 0;
		LangEng.alpha = 0;
		LangEs.alpha = 0;

		blackScreen = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		add(blackScreen);
		
		new FlxTimer().start(1.25, function(tmr:FlxTimer) {
			switch(ClientPrefs.Language) {
				case 'Russian': FlxTween.tween(LangRu, {alpha: 1}, 0.3, {ease: FlxEase.quadInOut});
				case 'Spanish': FlxTween.tween(LangEs, {alpha: 1}, 0.3, {ease: FlxEase.quadInOut});
				case 'English': FlxTween.tween(LangEng, {alpha: 1}, 0.3, {ease: FlxEase.quadInOut});
				case 'British': FlxTween.tween(LangBr, {alpha: 1}, 0.3, {ease: FlxEase.quadInOut});
			}
		});
		new FlxTimer().start(1.55, function(tmr:FlxTimer) {
			yeClickPls = true;
		});
		
		var Cursor = new states.CursorLoadState();

		// if()
	}

    private function die() {
        crash++;
        die();
    }

	override function update(elapsed:Float)
	{
		#if desktop
		var gamepad:FlxGamepad = FlxG.gamepads.lastActive;
		
        if (gamepad != null && ClientPrefs.controllerMode == false) {
			ClientPrefs.controllerMode = true;
			ClientPrefs.saveSettings();
			trace('Controller Connected: ' + ClientPrefs.controllerMode);
		}
		if (gamepad == null && ClientPrefs.controllerMode == true) {
			ClientPrefs.controllerMode = false;
			ClientPrefs.saveSettings();
			trace('Controller Connected: ' + ClientPrefs.controllerMode);
		}

		if (!british) {
			switch(britPressed) {
				case 0:
					if (FlxG.keys.justPressed.B) {
						brishTimer = true;
						britPressed = 1;
						trace("BRI");
					} else if (brishTimer) {
						brishTimer = false;
						britishTimer = new FlxTimer().start(6.0, function(tmr:FlxTimer)
						{ 
							britPressed = 0;
							trace("british reset" + britPressed);
						});
					}
				case 1:
					if (FlxG.keys.justPressed.R) {
						brishTimer = true;
						britPressed = 0;
						LangRu.alpha = 0;
						LangEng.alpha = 0;
						LangEs.alpha = 0;
						LangBr.alpha = 1;
						ClientPrefs.Language = 'British';
						ClientPrefs.saveSettings();
						TranslationLanguages.Text = TranslationLanguages.TextBritish;
						TranslationLanguages.Files = [];
						trace("ISH");
						britishTimer.cancel();
						british = true;
					} else if (brishTimer) {
						brishTimer = false;
						britishTimer = new FlxTimer().start(6.0, function(tmr:FlxTimer)
						{ 
							britPressed = 0;
							trace("british reset" + britPressed);
						});
					}
			}
		}
		#end
		if (FlxG.sound.music != null)
			Conductor.songPosition = FlxG.sound.music.time;
		
		if (ClientPrefs.LogoStyle == 'Restoration' && !StopFlying && !krima) {
			if (logoONE.y == -115) FlxTween.tween(logoONE, {y: -90}, 2, {ease: FlxEase.quadInOut});
			if (logoONE.y == -90) FlxTween.tween(logoONE, {y: -115}, 2, {ease: FlxEase.quadInOut});
			if (logoONE.y == -115) FlxTween.tween(logoTWO, {y: -90}, 1.7, {ease: FlxEase.quadInOut});
			if (logoONE.y == -90) FlxTween.tween(logoTWO, {y: -115}, 1.7, {ease: FlxEase.quadInOut});
			if (logoONE.y == -115) FlxTween.tween(logoTHREE, {y: -90}, 1.55, {ease: FlxEase.quadInOut});
			if (logoONE.y == -90) FlxTween.tween(logoTHREE, {y: -115}, 1.55, {ease: FlxEase.quadInOut});
		} else if (ClientPrefs.LogoStyle == 'Restoration' && !StopFlying && krima) {
			if (logoONE.y == -155) FlxTween.tween(logoONE, {y: -130}, 2, {ease: FlxEase.quadInOut});
			if (logoONE.y == -130) FlxTween.tween(logoONE, {y: -155}, 2, {ease: FlxEase.quadInOut});
			if (logoONE.y == -155) FlxTween.tween(logoTWO, {y: -130}, 1.7, {ease: FlxEase.quadInOut});
			if (logoONE.y == -130) FlxTween.tween(logoTWO, {y: -155}, 1.7, {ease: FlxEase.quadInOut});
			if (logoONE.y == -155) FlxTween.tween(logoTHREE, {y: -130}, 1.55, {ease: FlxEase.quadInOut});
			if (logoONE.y == -130) FlxTween.tween(logoTHREE, {y: -155}, 1.55, {ease: FlxEase.quadInOut});
		}

		if (yeClickPls) {
			var pressedEnter:Bool = (FlxG.keys.justPressed.ENTER || controls.ACCEPT || FlxG.mouse.justPressedMiddle || FlxG.mouse.justPressed) && !FlxG.mouse.overlaps(LangEng);

			if (FlxG.mouse.overlaps(LangEng)) {
				switch(ClientPrefs.Language) {
					case 'English': LangEng.color = 0xFFFFFFFF;
					case 'Spanish': LangEs.color = 0xFFFFFFFF;
					case 'Russian': LangRu.color = 0xFFFFFFFF;
					case 'British': LangBr.color = 0xFFFFFFFF;
				}
				if (FlxG.mouse.justPressed) {
					switch(ClientPrefs.Language) {
						case 'British': 
							LangRu.alpha = 0;
							LangEng.alpha = 1;
							LangEs.alpha = 0;
							LangBr.alpha = 0;
							british = false;
							ClientPrefs.Language = 'English';
							ClientPrefs.saveSettings();
							TranslationLanguages.Text = [];
							TranslationLanguages.Files = [];
						case 'English': 
							LangRu.alpha = 0;
							LangEng.alpha = 0;
							LangEs.alpha = 1;
							LangBr.alpha = 0;
							ClientPrefs.Language = 'Spanish';
							ClientPrefs.saveSettings();
							TranslationLanguages.Text = TranslationLanguages.TextSpanish;
							TranslationLanguages.Files = TranslationLanguages.FilesSpanish;
						case 'Spanish': 
							LangRu.alpha = 1;
							LangEng.alpha = 0;
							LangEs.alpha = 0;
							LangBr.alpha = 0;
							ClientPrefs.Language = 'Russian';
							ClientPrefs.saveSettings();
							TranslationLanguages.Text = TranslationLanguages.TextRussian;
							TranslationLanguages.Files = TranslationLanguages.FilesRussian;
						case 'Russian': 
							LangRu.alpha = 0;
							LangEng.alpha = 1;
							LangEs.alpha = 0;
							LangBr.alpha = 0;
							ClientPrefs.Language = 'English';
							ClientPrefs.saveSettings();
							TranslationLanguages.Text = [];
							TranslationLanguages.Files = [];
					}
				}
			}
			if (!FlxG.mouse.overlaps(LangEng)) {
				switch(ClientPrefs.Language) {
					case 'English': LangEng.color = 0xFF404040;
					case 'British': LangBr.color = 0xFF404040;
					case 'Spanish': LangEs.color = 0xFF404040;
					case 'Russian': LangRu.color = 0xFF404040;
				}
			}
			
			#if mobile
			for (touch in FlxG.touches.list)
			{
				if (touch.justPressed)
				{
					pressedEnter = true;
				}
			}
			#end
		
			if (!transitioning)
			{
				if(pressedEnter)
				{
					if(titleText != null) titleText.animation.play('press');
					StopFlying = true;

					FlxG.camera.flash(FlxColor.RED, 1);
					if (ClientPrefs.LogoStyle != 'Restoration')
						FlxG.sound.play(Paths.sound('menulaugh-old', 'preload'), 0.7);
					else
						FlxG.sound.play(Paths.sound(menulaugh, 'preload'), 0.7);
					FlxG.sound.play(Paths.sound('menumomentclick'), 0.7);

					transitioning = true;

					FlxTween.tween(glitchBG, {alpha: 0}, 0.8, {});

					FlxTween.tween(titleText, {alpha: 0}, 1.0, {
						startDelay: 0.7,
					});

					FlxTween.tween(blackScreen, {alpha: 1}, 2, {});

					new FlxTimer().start(2.5, function(tmr:FlxTimer)
					{
						MusicBeatState.switchState(new MainMenuState());
						closedState = true;
					});
				}
			}
		}
		super.update(elapsed);
	}
	
	public static var closedState:Bool = false;

	function skipIntro():Void
	{
		FlxG.camera.flash(FlxColor.RED, 2);
		blackScreen.alpha = 0;
		transitioning = false;
	}
}
