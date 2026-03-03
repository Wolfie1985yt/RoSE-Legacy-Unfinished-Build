package;

import flixel.addons.transition.FlxTransitionableState;
import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;
import flixel.math.FlxMath;
import flixel.addons.display.FlxBackdrop;
import flixel.FlxG;
#if linux
import Discord.DiscordClient;
#end
import flixel.FlxSprite;

class MainMenuBrandonRemake extends MusicBeatState {
	var menuItems:Array<Dynamic> = [
		{name: "story_mode", redirect: new StoryMenuState()},
		{name: "encore", redirect: new states.EncoreState()},
		{name: "freeplay", redirect: new states.FreeplayState()},
		{name: "sound_test", redirect: new SoundTestState()},
		{name: "credits", redirect: new states.CreditsState()},
		{name: "options", redirect: new options.OptionsNewState()}
	];

	var menuObjects:FlxTypedSpriteGroup<FlxSprite> = new FlxTypedSpriteGroup<FlxSprite>();

	var curSelected:Int = 0;

	var canMove:Bool = true;

    override public function create() {
        super.create();
		
		FlxTransitionableState.skipNextTransIn = false;
		openSubState(new SonicTransition(1.0, true));

        #if linux
		var rpcName:String = 'In Main Menu';
		if (TranslationLanguages.Text.exists(rpcName) && ClientPrefs.Language != 'English')
			rpcName = TranslationLanguages.Text[rpcName];
		DiscordClient.smallImageRpc = '';
		DiscordClient.imageRpc = 'icon';
		DiscordClient.changePresence(rpcName, null);
		#end

        var BG = new FlxSprite(0, 0);
		BG.frames = Paths.getSparrowAtlas('mainmenu/bg-new');
		BG.animation.addByPrefix('bgAnim', 'bg', 20);
		BG.setGraphicSize(Std.int(BG.width * 2.00));
		BG.animation.play('bgAnim');
		BG.color = 0xFF515151;
		BG.updateHitbox();
		BG.screenCenter();
		add(BG);
		
        var char = new FlxSprite().loadGraphic(Paths.image('mainmenu/arts/' + if (FlxG.random.bool(30)) "secret/" + FlxG.random.getObject(objects.MainMenuArtsList.secretArts) else FlxG.random.getObject(ClientPrefs.UnlockedMenuArts)));
		char.screenCenter();
        add(char);

		var ButtonsBG = new FlxSprite().loadGraphic(Paths.image('mainmenu/buttons-bg'));
		ButtonsBG.screenCenter();
		add(ButtonsBG);

		add(menuObjects);

		for (i => item in menuItems) {
			var obj = new FlxSprite(735 + (i * 35), 105 + (i * 125));
			obj.frames = Paths.getSparrowAtlas("mainmenu/buttons/" + item.name);
			obj.animation.addByIndices("idle", item.name, [0], "");
			obj.animation.addByIndices("select", item.name, [1], "");
			obj.animation.play("idle");
			menuObjects.add(obj);
		}

		var downSpikes = new FlxBackdrop(Paths.image('mainmenu/spikes'), 1, 1, true, false);
		downSpikes.velocity.x = 35;
		add(downSpikes);
    }

    override public function update(elapsed:Float) {
        super.update(elapsed);

		if (controls.UI_UP_P && canMove || FlxG.mouse.wheel < 0 && canMove) {
			curSelected = FlxMath.wrap(curSelected - 1, 0, menuItems.length - 1);
			FlxG.sound.play(Paths.sound('changeSelection'), 0.4);
		}

		if (controls.UI_DOWN_P && canMove || FlxG.mouse.wheel > 0 && canMove) {
			curSelected = FlxMath.wrap(curSelected + 1, 0, menuItems.length - 1);
			FlxG.sound.play(Paths.sound('changeSelection'), 0.4);
		}

		if (controls.ACCEPT && canMove) {
			flixel.effects.FlxFlicker.flicker(menuObjects.members[curSelected]);
			FlxG.sound.play(Paths.sound('confirmMenu'), 0.4, false, null, true, function(){FlxG.switchState(menuItems[curSelected].redirect);});
		}

		for (i => obj in menuObjects.members) {
			if (i == curSelected)
				obj.animation.play("select");
			else
				obj.animation.play("idle");
		}

		menuObjects.y = FlxMath.lerp(menuObjects.y, curSelected * -45, 0.35 * 60 * elapsed);
		menuObjects.x = FlxMath.lerp(menuObjects.x, curSelected * -25, 0.35 * 60 * elapsed);
    }
}