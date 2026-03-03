package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.FlxState;
import flixel.input.gamepad.FlxGamepad;
import flixel.addons.transition.FlxTransitionableState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.input.keyboard.FlxKey;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.FlxCamera;
import flixel.util.FlxStringUtil;
import flixel.util.FlxTimer;
import flixel.ui.FlxBar;
import flixel.FlxCamera;
import flixel.addons.ui.FlxInputText;
import flixel.addons.ui.FlxUI9SliceSprite;
import flixel.addons.ui.FlxUI;
import flixel.addons.ui.FlxUICheckBox;
import flixel.addons.ui.FlxUIInputText;
import flixel.addons.ui.FlxUINumericStepper;
import flixel.addons.ui.FlxUITabMenu;
import flixel.addons.ui.FlxUITooltip.FlxUITooltipStyle;
import lime.system.Clipboard;
import haxe.Timer;
import haxe.io.Bytes;
import sys.FileSystem;
import sys.io.File;
import openfl.ui.Keyboard;
#if android
import openfl.events.KeyboardEvent;
import flash.events.TextEvent;
import openfl.display.Stage;
import flash.ui.Keyboard;
#end
import flixel.addons.display.FlxBackdrop; 
import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;
import flixel.FlxObject;
import flixel.input.mouse.FlxMouseEventManager;
import openfl.display.BlendMode;
import lime.app.Application;
import flixel.math.FlxMath;
import objects.SoundTestList as SoundTestList;
#if (VIDEOS_ALLOWED && !mobile)
import vlc.MP4Handler as VideoHandler;
#end
#if mobile
import vlc.MP4Handler;
#end
#if linux
import Discord.DiscordClient;
#end
using Lambda;

class SoundTestState extends MusicBeatState
{
	private var camGame:FlxCamera;
	var bg:FlxBackdrop;
	var SoundTestTxt:FlxText;
	var cameoImg:FlxSprite;
	var whiteshit:FlxSprite;
	var cheats:Bool = (ClientPrefs.getGameplaySetting('practice', false) || ClientPrefs.getGameplaySetting('botplay', false));
	
	var GoreContent:Bool = false;
	var GoreWarningMenu:Bool = false;
	public static var goreCloseShit:Bool = false;
	
	var soundCooldown:Bool = true;
	var letsgo:Bool = true;
	var nowImage:Bool = false;
	var woahmanstopspammin:Bool = true;
	
	var soundTestGroup:FlxTypedSpriteGroup<FlxSprite>;
	var pcmNO:FlxText;
	var daNO:FlxText;
	var pcmNO_NUMBER:FlxText;
	var daNO_NUMBER:FlxText;
	
	var daValue:Int = 0;
	var pcmValue:Int = 0;
	
	var codesBtnOff:FlxSprite;
	var codesBtnOn:FlxSprite;
	var codesPanel:FlxSprite;
	var codesGroup:FlxTypedSpriteGroup<FlxSprite>;
	var codesGroupSplashes:FlxTypedSpriteGroup<FlxSprite>;
	var codesPanelGroup:FlxTypedSpriteGroup<FlxSprite>;
	var codesPanelActivated:Bool = false;
	var codesMenuScroll:Int = 0;
	var codeSelected:Int = 0;
	
	function isEven(value:Float) return value % 2 == 0;
	override function create() {
		var Cursor = new states.CursorLoadState();

		Paths.clearUnusedMemory();
		persistentUpdate = persistentDraw = true;
		goreCloseShit = false;
		#if linux
		var rpcName:String = 'In Sound Test Menu';
		if (TranslationLanguages.Text.exists(rpcName) && ClientPrefs.Language != 'English')
			rpcName = TranslationLanguages.Text[rpcName];
		DiscordClient.imageRpc = 'sound-test';
		DiscordClient.smallImageRpc = '';
		DiscordClient.changePresence(rpcName, null);
		#end	
		PlayState.storyPlaylist = [];
		
		FlxTransitionableState.skipNextTransIn = false;
		openSubState(new SonicTransition(1.0, true));
		
		camGame = new FlxCamera();
		FlxG.cameras.reset(camGame);
		FlxCamera.defaultCameras = [camGame];
		
		new FlxTimer().start(0.1, function(tmr:FlxTimer) {
			FlxG.sound.playMusic(Paths.music('breakfast', 'shared'));
		});

		PlayState.isStory = false;
		PlayState.isEncore = false;
		PlayState.isExtras = false;
		PlayState.isSound = true;
		PlayState.isFreeplay = false;
		
		PlayState.BFEncoreSkins = false;
		PlayState.BFSkins = false;
		PlayState.GFEncoreSkins = false;
		PlayState.GFSkins = false;
		
		PlayState.ChaosCutscene = true;
		PlayState.showSTCutscene = true;
		
		FlxG.sound.music.stop();
		SoundTestList.init();
		
		bg = new FlxBackdrop(Paths.image('sound-test/bg'), 0, 0, false, true);
		bg.antialiasing = ClientPrefs.globalAntialiasing;
		bg.screenCenter();
		add(bg);
		
		soundTestGroup = new FlxTypedSpriteGroup<FlxSprite>();
		add(soundTestGroup);
		
		SoundTestTxt = new FlxText(0, 0, 0, 'SOUND TEST', 35);
		SoundTestTxt.screenCenter();
		SoundTestTxt.y -= 160;
		SoundTestTxt.x -= 46;
		SoundTestTxt.setFormat(Paths.font("sonic-cd-menu-font.ttf"), 35, FlxColor.fromRGB(0, 163, 255));
		SoundTestTxt.setBorderStyle(SHADOW, FlxColor.BLACK, 4, 1);
		soundTestGroup.add(SoundTestTxt);
		if (TranslationLanguages.Text.exists(SoundTestTxt.text) && ClientPrefs.Language != 'English')
			SoundTestTxt.text = TranslationLanguages.Text[SoundTestTxt.text];
		
		pcmNO = new FlxText(FlxG.width / 6, FlxG.height / 2, 0, 'PCM  NO .', 25);
		pcmNO.setFormat(Paths.font("sonic-cd-menu-font.ttf"), 25, FlxColor.fromRGB(174, 179, 251));
		pcmNO.setBorderStyle(SHADOW, FlxColor.fromRGB(106, 110, 159), 4, 1);
		pcmNO.x += 35;
		soundTestGroup.add(pcmNO);
		
		daNO = new FlxText(768, FlxG.height / 2, 0, 'DA  NO .', 25);
		daNO.setFormat(Paths.font("sonic-cd-menu-font.ttf"), 25, FlxColor.fromRGB(174, 179, 251));
		daNO.setBorderStyle(SHADOW, FlxColor.fromRGB(106, 110, 159), 4, 1);
		soundTestGroup.add(daNO);
		
		pcmNO_NUMBER = new FlxText(FlxG.width / 6, FlxG.height / 2, 0, '0', 25);
		pcmNO_NUMBER.x += 224;
		pcmNO_NUMBER.setFormat(Paths.font("sonic-cd-menu-font.ttf"), 25, FlxColor.fromRGB(174, 179, 251));
		pcmNO_NUMBER.setBorderStyle(SHADOW, FlxColor.fromRGB(106, 110, 159), 4, 1);
		soundTestGroup.add(pcmNO_NUMBER);
		
		daNO_NUMBER = new FlxText(FlxG.width / 6, FlxG.height / 2, 0, '0', 25);
		daNO_NUMBER.x += daNO.x - 55;
		daNO_NUMBER.setFormat(Paths.font("sonic-cd-menu-font.ttf"), 25, FlxColor.fromRGB(174, 179, 251));
		daNO_NUMBER.setBorderStyle(SHADOW, FlxColor.fromRGB(106, 110, 159), 4, 1);
		soundTestGroup.add(daNO_NUMBER);
		
		codesPanelGroup = new FlxTypedSpriteGroup<FlxSprite>();
		add(codesPanelGroup);
		codesGroupSplashes = new FlxTypedSpriteGroup<FlxSprite>();
		codesGroup = new FlxTypedSpriteGroup<FlxSprite>();
		var codesX:Int = 425;
		var codesY:Int = 0;
		
		codesBtnOff = new FlxSprite(649+codesX,0).loadGraphic(Paths.image('sound-test/btn-off'));
		codesBtnOff.antialiasing = ClientPrefs.globalAntialiasing;
		codesPanelGroup.add(codesBtnOff);
		
		codesBtnOn = new FlxSprite(649+codesX,0).loadGraphic(Paths.image('sound-test/btn-on'));
		codesBtnOn.antialiasing = ClientPrefs.globalAntialiasing;
		codesPanelGroup.add(codesBtnOn);
		codesBtnOn.alpha = 0;
		
		codesPanel = new FlxSprite(857+codesX,0).loadGraphic(Paths.image('sound-test/panel'));
		codesPanel.antialiasing = ClientPrefs.globalAntialiasing;
		codesPanelGroup.add(codesPanel);
		
		for (i in 0...SoundTestList.codesSTMenuOrder.length) {
			var code:String = SoundTestList.codesSTMenuOrder[i];
			SoundTestList.pushCode(Std.parseInt(code.split("-")[0]), Std.parseInt(code.split("-")[1]));
		
			var splash:FlxSprite = new FlxSprite(863+codesX,0+codesY).loadGraphic(Paths.image('sound-test/code'));
			splash.antialiasing = ClientPrefs.globalAntialiasing;
			if (!isEven(i)) splash.color = 0xFF828282;
			splash.ID = i;
			codesGroupSplashes.add(splash);
			#if desktop
			FlxMouseEventManager.add(splash, null, null, codesGroupClick,null,false,true,false);
			#end
			
			var firstNum:String = code.split("-")[0];
			if (firstNum.length <= 1) firstNum = '0'+firstNum;
			var secondNum:String = code.split("-")[1];
			if (secondNum.length <= 1) secondNum = '0'+secondNum;
			var codeName:String = SoundTestList.codes.get(code).split('-')[1];
			if (TranslationLanguages.Text.exists(codeName) && ClientPrefs.Language != 'English')
				codeName = TranslationLanguages.Text[codeName];
			var text:FlxText = new FlxText(872+codesX, 9+codesY, FlxG.width, firstNum+' '+secondNum+' - '+codeName.toUpperCase(), 10);
			text.setFormat(Paths.font("sonic-cd-menu-font.ttf"), 10, FlxColor.WHITE);
			text.antialiasing = ClientPrefs.globalAntialiasing;
			codesGroup.add(text);
			var codeLocked:String = 'UNKNOWN';
			if (TranslationLanguages.Text.exists(codeLocked) && ClientPrefs.Language != 'English')
				codeLocked = TranslationLanguages.Text[codeLocked];
			if (!ClientPrefs.SoundTestCodesUnlocked.contains(code.split("-")[0]+'-'+code.split("-")[1]))
				text.text = '?? ?? - '+codeLocked;
			
			var iconFileName:String = '';
			var iconFlip:Bool = false;
			switch(SoundTestList.codeType) {
				case 'images':
					if (FileSystem.exists('assets/images/icons/sound-test/images.png')) {
						iconFileName = 'sound-test/images';
					} else { if (FileSystem.exists('assets/images/icons/sound-test/icon-images.png')) {
							iconFileName = 'sound-test/icon-images';
						} else {
							iconFileName = 'icon-face';
						}
					}
				case 'videos':
					if (FileSystem.exists('assets/images/icons/sound-test/videos.png')) {
						iconFileName = 'sound-test/videos';
					} else { if (FileSystem.exists('assets/images/icons/sound-test/icon-videos.png')) {
							iconFileName = 'sound-test/icon-videos';
						} else {
							iconFileName = 'icon-face';
						}
					}
				case 'songs':
					if (FileSystem.exists('assets/images/icons/sound-test/icon-'+SoundTestList.codeIcon+'.png')) {
						iconFileName = 'sound-test/icon-'+SoundTestList.codeIcon;
					} else {
						if (FileSystem.exists('assets/images/icons/'+SoundTestList.codeIcon+'.png')) {
							iconFileName = SoundTestList.codeIcon;
						} else { if (FileSystem.exists('assets/images/icons/icon-'+SoundTestList.codeIcon+'.png')) {
								iconFileName = 'icon-'+SoundTestList.codeIcon;
							} else {
								iconFileName = 'icon-face';
							}
						}
					}
					iconFlip = true;
			}
			if (!ClientPrefs.SoundTestCodesUnlocked.contains(code.split("-")[0]+'-'+code.split("-")[1]))
				iconFileName = 'sound-test/icon-locked';
			
			var icon:HealthIcon = new HealthIcon(iconFileName, iconFlip);
			icon.antialiasing = ClientPrefs.globalAntialiasing;
			icon.scale.set(0.285, 0.285);
			icon.x = 1180+codesX;
			icon.y = -50+codesY;
			codesGroup.add(icon);
			codesY += 44;
		}
		codesPanelGroup.add(codesGroupSplashes);
		codesPanelGroup.add(codesGroup);
		
		cameoImg = new FlxSprite();
		cameoImg.visible = false;
		add(cameoImg);
		
		whiteshit = new FlxSprite().makeGraphic(1280, 720, FlxColor.WHITE);
		whiteshit.alpha = 0;
		add(whiteshit);
		
		super.create();
		
		#if mobile
		addVirtualPad(LEFT_FULL, A_B_C);
		#end
	}

	function codesGroupClick(object:FlxObject) {
		if (FlxG.mouse.overlaps(codesPanelGroup) && woahmanstopspammin) {
			if (object.ID != codeSelected) {
				codeSelected = object.ID;
			}
		}
	}

	function scrollCodes(num:Int) {
		codesMenuScroll += num;
		if (codesMenuScroll > SoundTestList.codes.array().length-16) codesMenuScroll = 0;
		if (codesMenuScroll < 0) codesMenuScroll = SoundTestList.codes.array().length-16;
	}

	function changeNumber(selection:Int) {
		if (letsgo) {
			pcmValue += selection;
			if (pcmValue < 0) pcmValue = 99;
			if (pcmValue > 99) pcmValue = 0;
		} else {
			daValue += selection;
			if (daValue < 0) daValue = 99;
			if (daValue > 99) daValue = 0;
		}
	}

	function flashyWashy(lol:Bool) {
		if (lol == true) {
			FlxG.sound.play(Paths.sound('confirmMenu'), 0.4);
			FlxTween.tween(whiteshit, {alpha: 1}, 0.4);
		} else {
			FlxTween.color(whiteshit, 0.1, FlxColor.WHITE, FlxColor.BLUE);
			FlxTween.tween(whiteshit, {alpha: 0}, 0.2);
		}
	}
	function enterCode(firstNum:Int=0, secondNum:Int=0) {
		if (SoundTestList.codes.exists(Std.string(firstNum)+'-'+Std.string(secondNum))) {
			if (!ClientPrefs.SoundTestCodesUnlocked.contains(Std.string(firstNum)+'-'+Std.string(secondNum)) && !cheats) {
				ClientPrefs.SoundTestCodesUnlocked.push(Std.string(firstNum)+'-'+Std.string(secondNum));
				ClientPrefs.saveSettings();
			}
			codesPanelActivated = false;
			SoundTestList.pushCode(firstNum, secondNum);
			switch (SoundTestList.codeType) {
				case 'images':
					woahmanstopspammin = false;
					flashyWashy(true);
					new FlxTimer().start(2, function(tmr:FlxTimer) {
						cameoImg.visible = true;
						cameoImg.loadGraphic(Paths.image('cameostuff/' + SoundTestList.codeImgOrVideo));
						cameoImg.setSize(1280, 720);
						flashyWashy(false);
						FlxG.sound.music.stop();
					});
					new FlxTimer().start(2.1, function(tmr:FlxTimer) {
						if (SoundTestList.codeImgSound) FlxG.sound.play(Paths.sound('cameostuff/' + SoundTestList.codeImgOrVideo));	
						nowImage = true;
					});
				
				case 'videos':
					woahmanstopspammin = false;
					flashyWashy(true);
					new FlxTimer().start(2, function(tmr:FlxTimer) {
						flashyWashy(false);
						FlxG.sound.music.stop();
					});
					new FlxTimer().start(2.1, function(tmr:FlxTimer) {
						if (!ClientPrefs.UnlockedGalleryVideos.contains(SoundTestList.codeClientPrefsPushString) && SoundTestList.codePushClientPrefs) {
							ClientPrefs.UnlockedGalleryVideos.push(SoundTestList.codeClientPrefsPushString);
							ClientPrefs.saveSettings();
						}
						#if desktop
						var video:VideoHandler = new VideoHandler();
						video.play(Paths.video('SoundTest/' + SoundTestList.codeImgOrVideo));
						video.volume = 300;
						video.onEndReached.add(function() { 
							LoadingState.loadAndSwitchState(new SoundTestState()); 
							new FlxTimer().start(1, function(dispose:FlxTimer) {
								video.stop(); 
								video.dispose(); 
							});
						}, true);
						#else
						var video:MP4Handler = new MP4Handler();
						video.playVideo(Paths.video('SoundTest/' + SoundTestList.codeImgOrVideo));
						video.finishCallback = function() {
							LoadingState.loadAndSwitchState(new SoundTestState());
						}
						#end
					});

				case 'substates':
					if(firstNum == 19 && secondNum == 96)
						LoadingState.loadAndSwitchState(new minigames.SonicEdusoft());
					else if (firstNum == 23 && secondNum == 2) {
						ClientPrefs.SpeedwayUnlocked = true;
						ClientPrefs.saveSettings();
						LoadingState.loadAndSwitchState(new minigames.Stardustspeedway());
					}
				
				case 'songs':
					woahmanstopspammin = false;
					if (SoundTestList.codeWeek) {
						PlayState.isStoryMode = true;
						PlayState.storyPlaylist = SoundTestList.codeSongs;
						PlayState.SONG = Song.loadFromJson(PlayState.storyPlaylist[0].toLowerCase() + '-hard', PlayState.storyPlaylist[0].toLowerCase());
						PlayState.campaignScore = 0;
					} else {
						PlayState.SONG = Song.loadFromJson(SoundTestList.codeSongs[0] + '-hard', SoundTestList.codeSongs[0]);
					}
					PlayState.storyDifficulty = 2; 
					PlayState.storyWeek = SoundTestList.codeWeekNum;
					PlayState.isSound = true;
					FlxTransitionableState.skipNextTransIn = true;
					FlxTransitionableState.skipNextTransOut = true;
					if (firstNum == 0 && secondNum == 50)
						Main.DisableCustomCursor = true;
					if (!ClientPrefs.gore)
						GoreContent = SoundTestList.codeGore;
					else
						GoreContent = false;
					if (!ClientPrefs.charactersUnlocked.contains(SoundTestList.codeClientPrefsPushString) && !cheats && SoundTestList.codePushClientPrefs) {
						ClientPrefs.charactersUnlocked.push(SoundTestList.codeClientPrefsPushString);
						ClientPrefs.saveSettings();
					}
					if (!GoreContent) {
						FlxTween.tween(whiteshit, {alpha: 1}, 0.4);
						FlxG.sound.play(Paths.sound('confirmMenu'));
						FlxG.sound.music.fadeOut(0.5, 0);
						new FlxTimer().start(1, function(tmr:FlxTimer) {
							Main.InPlaystate = true;
							LoadingState.loadAndSwitchState(new PlayState());
						});
					} else {
						openSubState(new substates.GoreWarningSubstate(true, true, true, 1, true, 'st', 'playstate'));
						GoreWarningMenu = true;
					}
			}
		} else {
			if (soundCooldown) {
				soundCooldown = false;
				FlxG.sound.play(Paths.sound('deniedMOMENT'));
				new FlxTimer().start(0.8, function(tmr:FlxTimer) {
					soundCooldown = true;
				});
			}
		}
	}
	var holdTime:Float = 0;
	override public function update(elapsed:Float) {
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
		#end

		bg.velocity.set(0, 50);
		if ((controls.UI_LEFT_P || controls.UI_RIGHT_P) #if desktop && !FlxG.mouse.overlaps(pcmNO) && !FlxG.mouse.overlaps(pcmNO_NUMBER) && !FlxG.mouse.overlaps(daNO) && !FlxG.mouse.overlaps(daNO_NUMBER) && !FlxG.mouse.overlaps(codesPanelGroup) #end && woahmanstopspammin) letsgo = !letsgo;
		#if desktop
		if (FlxG.mouse.overlaps(pcmNO) || FlxG.mouse.overlaps(pcmNO_NUMBER)) letsgo = true;
		if (FlxG.mouse.overlaps(daNO) || FlxG.mouse.overlaps(daNO_NUMBER)) letsgo = false;
		#end

		if (codesPanelActivated) {
			codesBtnOn.alpha = FlxMath.lerp(codesBtnOn.alpha, 1, CoolUtil.boundTo(elapsed * 12, 0, 1));
			codesBtnOff.alpha = FlxMath.lerp(codesBtnOff.alpha, 0, CoolUtil.boundTo(elapsed * 12, 0, 1));
			codesPanelGroup.x = FlxMath.lerp(codesPanelGroup.x, -425, CoolUtil.boundTo(elapsed * 12, 0, 1));
			soundTestGroup.x = FlxMath.lerp(soundTestGroup.x, -180, CoolUtil.boundTo(elapsed * 20, 0, 1));
			
			codesGroupSplashes.forEach(function(spr:FlxSprite) {
				if (FlxG.mouse.overlaps(codesPanelGroup)) {
					if (codeSelected == spr.ID)
						spr.alpha = FlxMath.lerp(spr.alpha, 1, CoolUtil.boundTo(elapsed * 24, 0, 1));
					else
						spr.alpha = FlxMath.lerp(spr.alpha, 0.5, CoolUtil.boundTo(elapsed * 24, 0, 1));
				} else {
					spr.alpha = FlxMath.lerp(spr.alpha, 1, CoolUtil.boundTo(elapsed * 24, 0, 1));
				}
			});
			if (ClientPrefs.SoundTestCodesUnlocked.contains(SoundTestList.codesSTMenuOrder[codeSelected].split('-')[0]+'-'+SoundTestList.codesSTMenuOrder[codeSelected].split('-')[1])) {
				if (FlxG.mouse.overlaps(codesPanelGroup) && FlxG.mouse.justPressed) {
					pcmValue = Std.parseInt(SoundTestList.codesSTMenuOrder[codeSelected].split('-')[0]);
					daValue = Std.parseInt(SoundTestList.codesSTMenuOrder[codeSelected].split('-')[1]);
				}
			}
		} else {
			codesBtnOn.alpha = FlxMath.lerp(codesBtnOn.alpha, 0, CoolUtil.boundTo(elapsed * 12, 0, 1));
			codesBtnOff.alpha = FlxMath.lerp(codesBtnOff.alpha, 1, CoolUtil.boundTo(elapsed * 12, 0, 1));
			codesPanelGroup.x = FlxMath.lerp(codesPanelGroup.x, 0, CoolUtil.boundTo(elapsed * 12, 0, 1));
			soundTestGroup.x = FlxMath.lerp(soundTestGroup.x, 0, CoolUtil.boundTo(elapsed * 20, 0, 1));
			codesGroupSplashes.forEach(function(spr:FlxSprite) {
				spr.alpha = FlxMath.lerp(spr.alpha, 1, CoolUtil.boundTo(elapsed * 24, 0, 1));
			});
		}
		codesGroupSplashes.y = FlxMath.lerp(codesGroupSplashes.y, 44*-codesMenuScroll, CoolUtil.boundTo(elapsed * 12, 0, 1));
		codesGroup.y = FlxMath.lerp(codesGroup.y, 44*-codesMenuScroll, CoolUtil.boundTo(elapsed * 12, 0, 1));

		var shiftMult:Int = 1;
		if(FlxG.keys.pressed.SHIFT) shiftMult = 3;
		
		if (!GoreWarningMenu) {
			if (woahmanstopspammin) {
				if (controls.UI_UP_P) {
					changeNumber(-shiftMult);
					holdTime = 0;
				}
				if (controls.UI_DOWN_P) {
					changeNumber(shiftMult);
					holdTime = 0;
				}
				if(controls.UI_DOWN || controls.UI_UP) {
					var checkLastHold:Int = Math.floor((holdTime - 0.5) * 15);
					holdTime += elapsed;
					var checkNewHold:Int = Math.floor((holdTime - 0.5) * 15);

					if(holdTime > 0.5 && checkNewHold - checkLastHold > 0)
						changeNumber((checkNewHold - checkLastHold) * (controls.UI_UP ? -shiftMult : shiftMult));
				}
				#if desktop
				if (!FlxG.mouse.overlaps(codesPanelGroup)) {
					if(FlxG.mouse.wheel != 0) {
						changeNumber(-shiftMult * FlxG.mouse.wheel);
						holdTime = 0;
					}
				} else {
					if(FlxG.mouse.wheel != 0) {
						scrollCodes(-shiftMult * FlxG.mouse.wheel);
						holdTime = 0;
					}
				}
				#end
			}
			
			if (FlxG.mouse.overlaps(codesBtnOn) && FlxG.mouse.justPressed)
				codesPanelActivated = !codesPanelActivated;

			if ((controls.ACCEPT #if desktop || ((FlxG.mouse.justPressedMiddle || FlxG.mouse.justPressed) && !FlxG.mouse.overlaps(codesPanelGroup)) #end) && woahmanstopspammin) enterCode(pcmValue, daValue);
			if ((controls.ACCEPT #if desktop || ((FlxG.mouse.justPressedMiddle || FlxG.mouse.justPressed) && !FlxG.mouse.overlaps(codesPanelGroup)) #end) && !woahmanstopspammin && nowImage) LoadingState.loadAndSwitchState(new SoundTestState());
			if ((controls.BACK #if desktop || FlxG.mouse.justPressedRight #end) && woahmanstopspammin && !nowImage) {
				if (!codesPanelActivated) {
					LoadingState.loadAndSwitchState(new MainMenuState());
					woahmanstopspammin = false;
				} else {
					codesPanelActivated = false;
				}
			}
		}

		if (letsgo) {
			pcmNO.setFormat(Paths.font("sonic-cd-menu-font.ttf"), 25, FlxColor.fromRGB(254, 174, 0));
			pcmNO.setBorderStyle(SHADOW, FlxColor.fromRGB(253, 36, 3), 4, 1);
		
			daNO.setFormat(Paths.font("sonic-cd-menu-font.ttf"), 25, FlxColor.fromRGB(174, 179, 251));
			daNO.setBorderStyle(SHADOW, FlxColor.fromRGB(106, 110, 159), 4, 1);
		} else {
			pcmNO.setFormat(Paths.font("sonic-cd-menu-font.ttf"), 25, FlxColor.fromRGB(174, 179, 251));
			pcmNO.setBorderStyle(SHADOW, FlxColor.fromRGB(106, 110, 159), 4, 1);
		
			daNO.setFormat(Paths.font("sonic-cd-menu-font.ttf"), 25, FlxColor.fromRGB(254, 174, 0));
			daNO.setBorderStyle(SHADOW, FlxColor.fromRGB(253, 36, 3), 4, 1);
		}
			
		if (pcmValue < 10)
			pcmNO_NUMBER.text = '0' + Std.string(pcmValue);
		else
			pcmNO_NUMBER.text = Std.string(pcmValue);
		if (daValue < 10)
			daNO_NUMBER.text = '0' + Std.string(daValue);
		else
			daNO_NUMBER.text = Std.string(daValue);
		
		if (goreCloseShit) {
			GoreWarningMenu = false;
			woahmanstopspammin = true;
			FlxTransitionableState.skipNextTransIn = false; 
			FlxTransitionableState.skipNextTransOut = false; 
			goreCloseShit = false;
		}
		super.update(elapsed);
	}
}