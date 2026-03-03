package;

import flixel.graphics.FlxGraphic;
import flixel.FlxG;
import flixel.FlxGame;
import flixel.FlxState;
import openfl.Assets;
import openfl.Lib;
import openfl.display.FPS;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.display.StageScaleMode;
#if android
import android.content.Context;
import android.os.Build;
import android.widget.Toast;
#end
import backend.MacroData as MacroData;
import sys.FileSystem;
import openfl.utils.Assets as OpenFlAssets;
import openfl.filesystem.File;
import haxe.io.Path;
import haxe.Timer;
import openfl.events.KeyboardEvent;
import openfl.events.MouseEvent;

import backend.ALSoftConfig;

class Main extends Sprite
{
	var gameWidth:Int = 1280;
	var gameHeight:Int = 720;
	// #if (linux || mobile)
	// var initialState:Class<FlxState> = states.TitleState;
	// #else
	var initialState:Class<FlxState> = vlc.Cutscenes; //vlc.Cutscenes minigames.Stardustspeedway
	// #end
	var zoom:Float = -1;
	var framerate:Int = 60;
	var skipSplash:Bool = true;
	var startFullscreen:Bool = false;
	public static var PEEPEEPOOPOOCHECK:Bool = true;
	public static var DisableCustomCursor:Bool = false;
	public static var fpsVar:FPS;
	public static var InPlaystate:Bool = false;
	public static var PCuserName:String = '';

	static final videos:Array<String> = [
		"critical-error-intro",
		"explosion",
		"fof-intro",
		"glasses",
		"guns",
		"HaxeFlixelIntro",
		"HaxeFlixelIntro-fatal-enc",
		"HaxeFlixelIntroXD",
		"hitmarkers",
		"Illuminati",
		"IlluminatiConfirmed",
		"mirror_punch",
		"mlg",
		"noscope",
		"sonicexe-intro",
		"sonicexe-intro-fatal-enc",
		"sonicexe-intro-fe",
		"soulless-intro",
		"sound-test-codes",
		"the-gaze-of-a-god",
		"the-gaze-of-a-god_NoAudio",
		"tt-final",
		"ugly-intro",
		"weed",
		"ycr-encore-intro",
		"i-am-god",
		"i-am-god-NoAudio"
	];

	static final PersonelSeriousGameOvers:Array<String> = [
		"1",
		"2",
		"3",
		"4",
		"Secret"
	];

	static final SanicGameOvers:Array<String> = [
		"1",
		"2",
		"3",
		"4",
		"5",
		"6",
		"7"
	];

	static final SoundTest:Array<String> = [
		"Musicians",
		"ArtFlex",
		"Crack",
		"BeOneWithRestored",
		"GSBL",
		"SpiderSonic",
		"RestoredIsDead",
		"RestorationShorts"
	];

	public static function main():Void
		Lib.current.addChild(new Main());

	public function new() {
		super();

    	PCuserName = #if windows $v{Sys.environment()["USERNAME"]}; #elseif (linux || macos) $v{Sys.environment()["USER"]}; #elseif (android || ios) 'USER'; #end
		trace('PC USERNAME: ' + PCuserName);

        #if android
		Generic.initCrashHandler();
        if (VERSION.SDK_INT > 30)
            Sys.setCwd(Path.addTrailingSlash(Context.getObbDir()));
        else
            Sys.setCwd(Path.addTrailingSlash(Context.getExternalFilesDir()));
        #elseif ios
        Sys.setCwd(LimeSystem.documentsDirectory);
        #end

		#if mobile
		backend.Storage.copyNecessaryFiles();
		#end

		if (stage != null)
			init();
		else
			addEventListener(Event.ADDED_TO_STAGE, init);
	}

	private function init(?E:Event):Void {
		if (hasEventListener(Event.ADDED_TO_STAGE))
			removeEventListener(Event.ADDED_TO_STAGE, init);
		setupGame();
	}

	// static function loopTimer():Void {
	// 	Timer.delay(function() {
	// 		PlayerInfo.updateUserData();
	// 		loopTimer();
	// 	}, 10000);
	// }

	private function setupGame():Void {
		FPS.compileDateFromMain = MacroData.getDate();
		#if mobile
		if (!FileSystem.exists(Generic.returnPath() + 'assets'))
			FileSystem.createDirectory(Generic.returnPath() + 'assets');
		if (!FileSystem.exists(Generic.returnPath() + 'assets/data'))
			FileSystem.createDirectory(Generic.returnPath() + 'assets/data');
		if (!FileSystem.exists(Generic.returnPath() + 'assets/custom_events'))
			FileSystem.createDirectory(Generic.returnPath() + 'assets/custom_events');
		if (!FileSystem.exists(Generic.returnPath() + 'assets/stages'))
			FileSystem.createDirectory(Generic.returnPath() + 'assets/stages');
		if (!FileSystem.exists(Generic.returnPath() + 'assets/videos'))
			FileSystem.createDirectory(Generic.returnPath() + 'assets/videos');
		if (!FileSystem.exists(Generic.returnPath() + 'assets/videos/PersonelSeriousGameOvers'))
			FileSystem.createDirectory(Generic.returnPath() + 'assets/videos/PersonelSeriousGameOvers');
		if (!FileSystem.exists(Generic.returnPath() + 'assets/videos/SanicGameOvers'))
			FileSystem.createDirectory(Generic.returnPath() + 'assets/videos/SanicGameOvers');
		if (!FileSystem.exists(Generic.returnPath() + 'assets/videos/SoundTest'))
			FileSystem.createDirectory(Generic.returnPath() + 'assets/videos/SoundTest');
			
		for (video in videos) {
			Generic.copyContent(Paths.truvideo(video), Paths.truvideo(video));
		}
		#end
		var stageWidth:Int = Lib.current.stage.stageWidth;
		var stageHeight:Int = Lib.current.stage.stageHeight;

		if (zoom == -1) {
			var ratioX:Float = stageWidth / gameWidth;
			var ratioY:Float = stageHeight / gameHeight;
			zoom = Math.min(ratioX, ratioY);
			gameWidth = Math.ceil(stageWidth / zoom);
			gameHeight = Math.ceil(stageHeight / zoom);
		}

		ClientPrefs.loadDefaultKeys();
		FlxGraphic.defaultPersist = true;
		addChild(new FlxGame(gameWidth, gameHeight, initialState, #if (flixel < "5.0.0") zoom, #end framerate, skipSplash, startFullscreen));

		fpsVar = new FPS(10, 3, 0xFFFFFF);
		addChild(fpsVar);
		Lib.current.stage.align = "tl";
		Lib.current.stage.scaleMode = StageScaleMode.NO_SCALE;
		if(fpsVar != null)
			fpsVar.visible = ClientPrefs.showFPS;

		#if html5
		FlxG.autoPause = false;
		if (ClientPrefs.VisibleMouse)
			FlxG.mouse.visible = true;
		else
			FlxG.mouse.visible = false;
		#end
		// loopTimer();
		// PlayerInfo.updateUserData();
	}
	
	public static function dumpCache() {
		@:privateAccess
		for (key in FlxG.bitmap._cache.keys()) {
			var obj = FlxG.bitmap._cache.get(key);
			if (obj != null) {
				Assets.cache.removeBitmapData(key);
				FlxG.bitmap._cache.remove(key);
				obj.destroy();
			}
		}
		Assets.cache.clear("songs");
	}
	public function getFPS():Float
		return fpsVar.currentFPS;	
}
