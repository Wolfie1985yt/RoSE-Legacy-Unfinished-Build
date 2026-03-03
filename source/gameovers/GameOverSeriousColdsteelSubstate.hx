package gameovers;

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
import backend.Controls;
#if (VIDEOS_ALLOWED && !mobile)
import vlc.MP4Handler as VideoHandler;
#end
#if mobile
import vlc.MP4Handler;
#end

class GameOverSeriousColdsteelSubstate extends MusicBeatSubstate
{
	public static var instance:GameOverSeriousColdsteelSubstate;

	var coolcamera:FlxCamera;
	var blackScreen:FlxSprite;
	#if desktop
	var video:VideoHandler = new VideoHandler();
	#else
	var video:MP4Handler;
	#end
	var videoIsFinished:Bool = false;

	override function create()
	{
		instance = this;
		PlayState.instance.callOnLuas('onGameOverStart', []);

		super.create();
	}

	public function new()
	{
		super();

		PlayState.instance.setOnLuas('inGameOver', true);

		Conductor.songPosition = 0;

		coolcamera = new FlxCamera();
		coolcamera.bgColor.alpha = 0;
		FlxG.cameras.add(coolcamera);

		Conductor.changeBPM(100);
		FlxG.camera.scroll.set();
		FlxG.camera.target = null;
		
		blackScreen = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		add(blackScreen);
		blackScreen.cameras = [coolcamera];
		#if desktop
		video = new VideoHandler();
		#else
		video = new MP4Handler();
		#end
		switch(FlxG.random.int(0, 10)) {
			default:
				switch(FlxG.random.int(1, 4)) {
					case 1:
						if (!ClientPrefs.UnlockedGalleryVideos.contains('coldsteelSerious-1')) { ClientPrefs.UnlockedGalleryVideos.push('coldsteelSerious-1'); }
						ClientPrefs.saveSettings();
						#if desktop video.play #else video.playVideo #end(Paths.video('PersonelSeriousGameOvers/1'));
						#if desktop
						video.volume = 300;
						#end
					case 2:
						if (!ClientPrefs.UnlockedGalleryVideos.contains('coldsteelSerious-2')) { ClientPrefs.UnlockedGalleryVideos.push('coldsteelSerious-2'); }
						ClientPrefs.saveSettings();
						#if desktop video.play #else video.playVideo #end(Paths.video('PersonelSeriousGameOvers/2'));
						#if desktop
						video.volume = 300;
						#end
					case 3:
						if (!ClientPrefs.UnlockedGalleryVideos.contains('coldsteelSerious-3')) { ClientPrefs.UnlockedGalleryVideos.push('coldsteelSerious-3'); }
						ClientPrefs.saveSettings();
						#if desktop video.play #else video.playVideo #end(Paths.video('PersonelSeriousGameOvers/3'));
						#if desktop
						video.volume = 300;
						#end
					case 4:
						if (!ClientPrefs.UnlockedGalleryVideos.contains('coldsteelSerious-4')) { ClientPrefs.UnlockedGalleryVideos.push('coldsteelSerious-4'); }
						ClientPrefs.saveSettings();
						#if desktop video.play #else video.playVideo #end(Paths.video('PersonelSeriousGameOvers/4'));
						#if desktop
						video.volume = 300;
						#end
				}
			case 6:
				if (!ClientPrefs.UnlockedGalleryVideos.contains('coldsteelSerious-5')) { ClientPrefs.UnlockedGalleryVideos.push('coldsteelSerious-5'); }
				ClientPrefs.saveSettings();
				#if desktop video.play #else video.playVideo #end(Paths.video('PersonelSeriousGameOvers/Secret'));
		}
		#if desktop
		video.onEndReached.add(function() { videoIsFinished = true; video.dispose(); }, true);
		#else
		video.finishCallback = function() { videoIsFinished = true; }
		#end
		
		#if mobile
		addVirtualPad(NONE, A_B);
		addHitboxCamera();
		#end
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		PlayState.instance.callOnLuas('onUpdate', [elapsed]);

		if (controls.ACCEPT)
		{
			endBullshit();
			if (!videoIsFinished)
				#if desktop
				video.dispose();
				#else
				video.finishVideo();
				#end
		}

		if (controls.BACK)
		{
			PlayState.deathCounter = 0;
			PlayState.seenCutscene = false;
			if (!videoIsFinished)
				#if desktop
				video.dispose();
				#else
				video.finishVideo();
				#end
			if(PlayState.isStory) {
				MusicBeatState.switchState(new StoryMenuState());
				FlxG.sound.playMusic(Paths.music('storymode'));
			} else {
				if(PlayState.isEncore) {
					MusicBeatState.switchState(new states.EncoreState());
					FlxG.sound.playMusic(Paths.music('encoremode'));
				} else {
					if(PlayState.isExtras) {
						MusicBeatState.switchState(new extras.ExtraSongsState());
					} else {
						if(PlayState.isSound) {
							MusicBeatState.switchState(new SoundTestState());
						} else {
							if(PlayState.isFreeplay) {
								MusicBeatState.switchState(new states.FreeplayState());
								FlxG.sound.playMusic(Paths.music('freeplaymode'));
							} else {
								MusicBeatState.switchState(new MainMenuState());
							}
						}
					}
				}
			}
			PlayState.instance.callOnLuas('onGameOverConfirm', [false]);
		}

		PlayState.instance.callOnLuas('onUpdatePost', [elapsed]);
	}

	var isEnding:Bool = false;

	function endBullshit():Void
	{
		if (!isEnding)
		{
			isEnding = true;
			new FlxTimer().start(0.7, function(tmr:FlxTimer)
			{
				#if android
				FlxTween.tween(virtualPad, {alpha: 0}, 2); //mariomaster was here
				#end
				FlxG.camera.fade(FlxColor.BLACK, 2, false, function()
				{
					Main.InPlaystate = true;
					MusicBeatState.resetState();
				});
			});
			PlayState.instance.callOnLuas('onGameOverConfirm', [true]);
		}
	}
}
