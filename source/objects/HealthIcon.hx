package objects;

import flixel.FlxSprite;
import openfl.utils.Assets as OpenFlAssets;

using StringTools;

class HealthIcon extends FlxSprite
{
	public var sprTracker:FlxSprite;
	private var isOldIcon:Bool = false;
	private var isPlayer:Bool = false;
	private var AnimDadIcon:Bool = false;
	private var char:String = '';

	public function new(char:String = 'bf', isPlayer:Bool = false, ?AnimDadIcon:Bool = false)
	{
		super();
		isOldIcon = (char == 'bf-old');
		this.isPlayer = isPlayer;
		this.AnimDadIcon = AnimDadIcon;
		if (AnimDadIcon && !isPlayer) {
			changeIconAnimated(char);
		} else {
			changeIcon(char);
		}
		scrollFactor.set();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
	}

	public function swapOldIcon() {
		if(isOldIcon = !isOldIcon) changeIcon('bf-old');
		else changeIcon('bf');
	}

	private var iconOffsets:Array<Float> = [0, 0];
	public function changeIcon(char:String) {
		if(this.char != char) {
			var name:String = 'icons/' + char;
			if(!Paths.fileExists('images/' + name + '.png', IMAGE)) name = 'icons/icon-' + char; //Older versions of psych engine's support
			if(!Paths.fileExists('images/' + name + '.png', IMAGE)) name = 'icons/icon-face'; //Prevents crash from missing icon
			var file:Dynamic = Paths.image(name);
			
			loadGraphic(file); //Load stupidly first for getting the file size
			loadGraphic(file, true, Math.floor(width / 2), Math.floor(height)); //Then load it fr
			iconOffsets[0] = (width - 150) / 2;
			iconOffsets[1] = (width - 150) / 2;
			updateHitbox();
			
			animation.add(char, [0, 1], 0, false, isPlayer);
			animation.play(char);
			this.char = char;
			
			antialiasing = ClientPrefs.globalAntialiasing;
			if(char.endsWith('-pixel')) {
				antialiasing = false;
			}
		}
	}
	
	public function changeIconAnimated(char:String) {
		switch (char) {	
			case 'soink':
				frames = Paths.getSparrowAtlas('icons/animated/soink');
				animation.addByIndices('n', 'icons0', [0], "", 24, true);
				animation.addByIndices('d', 'icons0', [1,2,3,4,5,6,7,8], "", 24, true);
				
			case 'soink-glitch':
				frames = Paths.getSparrowAtlas('icons/animated/soink');
				animation.addByIndices('n', 'icons-glitch', [0,1,2,3,4,5,6,7], "", 24, true);
				animation.addByIndices('d', 'icons-glitch', [8,9,10,11,12,13,14,15], "", 24, true);

			default:
				frames = Paths.getSparrowAtlas('icons/animated/' + char);
				animation.addByPrefix('n', 'normal', 24, true);
				animation.addByPrefix('d', 'defeat', 24, true);
		}
		animation.play('n');
		updateHitbox();
		this.char = char;
		antialiasing = ClientPrefs.globalAntialiasing;
	}
	
	override function updateHitbox() {
		super.updateHitbox();
		offset.x = iconOffsets[0];
		offset.y = iconOffsets[1];
	}

	public function getCharacter():String {
		return char;
	}
}
