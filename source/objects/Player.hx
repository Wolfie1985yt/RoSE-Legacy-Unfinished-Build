package objects;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxObject;


class Player extends FlxSprite {
    public var speed:Float = 400;
    public var gravity:Float = 1200;
    public var allowJump:Bool = false;
    public var maxFallSpeed:Float = 1000;

    public function new(xPos:Float = 0, yPos:Float = 0) {
        super(xPos, yPos);
        loadGraphic(Paths.image('hitboxes/sonicHitbox', 'shared'), 40, 38, true);
        drag.x = speed * 4;
        maxVelocity.set(speed, maxFallSpeed);
    }

    override function update(elapsed:Float) {
        velocity.x = speed;
        acceleration.y = gravity;

        super.update(elapsed);
        // Movement and jumping
    }
}
