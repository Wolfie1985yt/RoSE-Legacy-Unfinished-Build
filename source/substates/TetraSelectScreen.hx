package substates;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSubState;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.text.FlxText;
import flixel.FlxSprite;
import flixel.FlxCamera;

class TetraSelectScreen extends MusicBeatSubstate
{
	var coolcamera:FlxCamera;
	var coolcamera2:FlxCamera;
	var blackScreen:FlxSprite;
	var Select1:FlxSprite;
	var Select2:FlxSprite;
	var Select1DeSel:FlxSprite;
	var Select2DeSel:FlxSprite;
	var canPressEnter:Bool = false;
	var fatal:Bool = true;
	public function new()
	{
		super();

		coolcamera = new FlxCamera();
		coolcamera.bgColor.alpha = 0;
		FlxG.cameras.add(coolcamera);
		coolcamera2 = new FlxCamera();
		coolcamera2.bgColor.alpha = 0;
		FlxG.cameras.add(coolcamera2);
		FlxG.camera.zoom = 1.00;
		
		Select1 = new FlxSprite(0, 0).loadGraphic(Paths.image('freeplay-encore/song-version-select/too-slow-encore/ver-1'));
		Select1.antialiasing = true;
		Select1.scrollFactor.set();
		Select1.screenCenter();
		Select1.visible = true;
		add(Select1);
		
		Select2 = new FlxSprite(0, 0).loadGraphic(Paths.image('freeplay-encore/song-version-select/too-slow-encore/ver-2'));
		Select2.antialiasing = true;
		Select2.scrollFactor.set();
		Select2.screenCenter();
		Select2.visible = false;
		add(Select2);
		
		Select1DeSel = new FlxSprite(0, 0).loadGraphic(Paths.image('freeplay-encore/song-version-select/too-slow-encore/ver-1-eyes'));
		Select1DeSel.antialiasing = true;
		Select1DeSel.scrollFactor.set();
		Select1DeSel.screenCenter();
		Select1DeSel.visible = false;
		add(Select1DeSel);
		
		Select2DeSel = new FlxSprite(0, 0).loadGraphic(Paths.image('freeplay-encore/song-version-select/too-slow-encore/ver-2-eyes'));
		Select2DeSel.antialiasing = true;
		Select2DeSel.scrollFactor.set();
		Select2DeSel.screenCenter();
		Select2DeSel.visible = true;
		add(Select2DeSel);

		blackScreen = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		blackScreen.cameras = [coolcamera2];
		add(blackScreen);

		FlxG.sound.playMusic(Paths.music('rosy-mechanic', 'preload'), 0);
		
		new FlxTimer().start(1.45, function(tmr:FlxTimer)
		{
			canPressEnter = true;
		});
		new FlxTimer().start(0.4, function(tmr:FlxTimer)
		{
			FlxG.sound.music.fadeIn(1, 0, 1.0);
			FlxTween.tween(blackScreen, {alpha: 0}, 0.5);
		});
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (controls.ACCEPT)
		{	
			if (canPressEnter)
			{
				endBullshit();
				canPressEnter = false;
			}
		}
		if (controls.UI_LEFT_P) {
			Select1.visible = true;
			Select2.visible = false;
			Select1DeSel.visible = false;
			Select2DeSel.visible = true;
			fatal = true;
		}
		if (controls.UI_RIGHT_P) {
			fatal = false;
			Select1.visible = false;
			Select2.visible = true;
			Select1DeSel.visible = true;
			Select2DeSel.visible = false;
		}
	}

	var isEnding:Bool = false;

	function endBullshit():Void
	{
		if (!isEnding)
		{
			new FlxTimer().start(1.0, function(DADA:FlxTimer)
			{
				FlxTween.tween(blackScreen, {alpha: 1}, 0.5);
			});
			if (fatal == false) {
				isEnding = true;
				FlxG.sound.music.fadeOut(0.25, 0);
				FlxG.sound.play(Paths.music('rosy-mechanic-enter', 'preload'), 1.0);
				new FlxTimer().start(1, function(tmr:FlxTimer) { Main.InPlaystate = true; LoadingState.loadAndSwitchState(new PlayState()); });
				PlayState.SONG = Song.loadFromJson('tetrabrachial' + '-hard-sl4sh', 'tetrabrachial');
				ClientPrefs.fatalSide = false;
				ClientPrefs.saveSettings();
				new FlxTimer().start(1, function(tmr:FlxTimer)
				{
					FlxG.camera.fade(FlxColor.BLACK, 1, false, function()
					{
						Main.InPlaystate = true;
						LoadingState.loadAndSwitchState(new PlayState());
					});
				});
			}
			if (fatal == true) {
				isEnding = true;
				FlxG.sound.music.fadeOut(0.25, 0);
				FlxG.sound.play(Paths.music('rosy-mechanic-enter', 'preload'), 1.0);
				new FlxTimer().start(1, function(tmr:FlxTimer) { Main.InPlaystate = true; LoadingState.loadAndSwitchState(new PlayState()); });
				PlayState.SONG = Song.loadFromJson('tetrabrachial' + '-hard-fatal', 'tetrabrachial');
				ClientPrefs.fatalSide = true;
				ClientPrefs.saveSettings();
				new FlxTimer().start(1, function(tmr:FlxTimer)
				{
					FlxG.camera.fade(FlxColor.BLACK, 1, false, function()
					{
						Main.InPlaystate = true;
						LoadingState.loadAndSwitchState(new PlayState());
					});
				});
			}
		}
	}
}
