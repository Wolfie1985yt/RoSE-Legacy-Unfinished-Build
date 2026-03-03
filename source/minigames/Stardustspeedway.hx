package minigames;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxState;
import flixel.FlxCamera;
import flixel.group.FlxGroup;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import openfl.display.BitmapData;
import openfl.geom.Rectangle;

class Stardustspeedway extends FlxState {
    public var maxSpeed:Float = 340;
    public var accelerationRate:Float = 200;
    public var gravity:Float = 800;
    public var maxFallSpeed:Float = 1000;
    public var allowJump:Bool = true;
    public var jumping = false;

    public var center:FlxPoint;
    public var centerP:FlxSprite;
    var camGame:FlxCamera;
    var followSonic:Bool = true;

    var player:FlxSprite;
    var playerAnims:FlxSprite;
    var sensorL:FlxSprite;
    var sensorR:FlxSprite;
    var sensorLL:FlxSprite;
    var sensorRR:FlxSprite;
    var sensorLLL:FlxSprite;
    var sensorRRR:FlxSprite;
    var sensorLH:FlxSprite;
    var sensorRH:FlxSprite;
    var camFollowPoint:FlxSprite;

    var levelBitmap:FlxSprite;
    var hitboxGroup:FlxSpriteGroup;
    var fg:FlxSprite;
    var bg:FlxSprite;

    var gpuCache:Bool = false;

    var angle:Float = 0;

    var slope:Bool = false;
    var slopeReset:FlxTimer;

    var distanceL:Int = 0;
    var distanceR:Int = 0;
    var lastDistanceL:Int = 0;
    var lastDistanceR:Int = 0;
    var slopeType = 0;

    var touchingFloor = false;

    var slopeSpeedX:Float = 1;
    var slopeSpeedY:Float = 1;

    var airborne = false;
    var wall = false;
    var wallLeft = false;
    var wallRight = false;
    var ninety = false;
    var forcedSlope = false;

    var currentAnim:String = '';
    var ending = '';

    var vel:Float;
    var acc:Float;
    
    override public function create() {
        super.create();
        
        if (ClientPrefs.GPUCaching) {
            gpuCache = true;
            ClientPrefs.GPUCaching = false;
        }

        centerP = new FlxSprite(0, 0);
        center = FlxPoint.get(centerP.x, centerP.y);

        camGame = new FlxCamera();
        camGame.bgColor.alpha = 0;
        FlxG.cameras.reset(camGame);
        FlxCamera.defaultCameras = [camGame];
        persistentUpdate = true;
        persistentDraw = true;
        camGame.zoom = 3;

        levelBitmap = new FlxSprite(0, 0).loadGraphic(Paths.image('bgs/prey/debugShit/hitboxes'));
        levelBitmap.visible = true;
        add(levelBitmap);

        bg = new FlxSprite(0, 0).loadGraphic(Paths.image('bgs/prey/back'));
        bg.visible = true;
        bg.antialiasing = false;

        fg = new FlxSprite(0, 0).loadGraphic(Paths.image('bgs/prey/front'));
        fg.visible = true;
        fg.antialiasing = false;

        hitboxGroup = new FlxSpriteGroup();

        player = new FlxSprite(0, 0).loadGraphic(Paths.image('bgs/prey/debugShit/sonic'));
        player.visible = true;
        player.antialiasing = false;
        player.screenCenter();
        player.y += 57;

        playerAnims = new FlxSprite(0, 0);
        playerAnims.frames = Paths.getSparrowAtlas('bgs/prey/sonic', 'preload');
        playerAnims.animation.addByPrefix('idle', 'idle', 24);
        playerAnims.animation.addByPrefix('idle-a', 'idle', 24);
        playerAnims.animation.addByPrefix('bored', 'bored', 4);
        playerAnims.animation.addByPrefix('bored-loop', 'bored-loop', 4);
        playerAnims.animation.addByPrefix('walk', 'walkNon', 12);
        playerAnims.animation.addByPrefix('walk-a', 'walkAngled', 12);
        playerAnims.animation.addByPrefix('timetravel', 'timetravel', 24);
        playerAnims.animation.addByPrefix('skid', 'skid', 12);
        playerAnims.animation.addByPrefix('skid-a', 'skid', 12);
        playerAnims.animation.addByPrefix('pump', 'push', 24);
        playerAnims.animation.addByPrefix('peelout', 'peelout', 24);
        playerAnims.animation.addByPrefix('peeloutAngledngled', 'peeloutAngled', 24);
        playerAnims.animation.addByPrefix('crouch', 'down', 24);
        playerAnims.animation.addByPrefix('lookup', 'up', 24);
        playerAnims.animation.addByPrefix('jump', 'jump', 24);
        playerAnims.animation.addByPrefix('leave', 'outtahere', 24);
        playerAnims.animation.addByPrefix('death', 'death', 24);
        playerAnims.animation.addByPrefix('hit', 'hit', 24);
        playerAnims.animation.addByPrefix('balance-forward', 'balance-forward', 24);
        playerAnims.animation.addByPrefix('balance-back', 'balance-back', 24);
        playerAnims.animation.addByPrefix('run', 'baserunNon', 24);
        playerAnims.animation.addByPrefix('run-a', 'baserunAngled', 24);
        playerAnims.y += 57;
        playerAnims.visible = true;
        playerAnims.antialiasing = false;
        playerAnims.drag.x = maxSpeed * 6;

        camFollowPoint = new FlxSprite(0, 0);
        camFollowPoint.frames = Paths.getSparrowAtlas('bgs/prey/sonic', 'preload');
        camFollowPoint.animation.addByPrefix('idle', 'idle', 24);
        camFollowPoint.animation.addByPrefix('idle-a', 'idle', 24);
        camFollowPoint.animation.addByPrefix('bored', 'bored', 4);
        camFollowPoint.animation.addByPrefix('bored-loop', 'bored-loop', 4);
        camFollowPoint.animation.addByPrefix('walk', 'walkNon', 12);
        camFollowPoint.animation.addByPrefix('walk-a', 'walkAngled', 12);
        camFollowPoint.animation.addByPrefix('timetravel', 'timetravel', 24);
        camFollowPoint.animation.addByPrefix('skid', 'skid', 12);
        camFollowPoint.animation.addByPrefix('skid-a', 'skid', 12);
        camFollowPoint.animation.addByPrefix('pump', 'push', 24);
        camFollowPoint.animation.addByPrefix('peelout', 'peelout', 24);
        camFollowPoint.animation.addByPrefix('peeloutAngledngled', 'peeloutAngled', 24);
        camFollowPoint.animation.addByPrefix('crouch', 'down', 24);
        camFollowPoint.animation.addByPrefix('lookup', 'up', 24);
        camFollowPoint.animation.addByPrefix('jump', 'jump', 24);
        camFollowPoint.animation.addByPrefix('leave', 'outtahere', 24);
        camFollowPoint.animation.addByPrefix('death', 'death', 24);
        camFollowPoint.animation.addByPrefix('hit', 'hit', 24);
        camFollowPoint.animation.addByPrefix('balance-forward', 'balance-forward', 24);
        camFollowPoint.animation.addByPrefix('balance-back', 'balance-back', 24);
        camFollowPoint.animation.addByPrefix('run', 'baserunNon', 24);
        camFollowPoint.animation.addByPrefix('run-a', 'baserunAngled', 24);
        camFollowPoint.y += 57;
        camFollowPoint.visible = false;
        camFollowPoint.antialiasing = false;
        camFollowPoint.drag.x = maxSpeed * 6;

        sensorL   = createSensor('bgs/prey/debugShit/sensor1');
        sensorR   = createSensor('bgs/prey/debugShit/sensor2');
        sensorLL  = createSensor('bgs/prey/debugShit/sensorL');
        sensorLH  = createSensor('bgs/prey/debugShit/sensorLH');
        sensorRR  = createSensor('bgs/prey/debugShit/sensorR');
        sensorLLL = createSensor('bgs/prey/debugShit/sensorL');
        sensorRRR = createSensor('bgs/prey/debugShit/sensorR');
        sensorRH  = createSensor('bgs/prey/debugShit/sensorRH');

        hitboxGroup = new FlxSpriteGroup();

        getPixelColors(levelBitmap);
        add(hitboxGroup);
        add(bg);
        add(player);
        add(playerAnims);
        add(camFollowPoint);
        add(fg);

        add(sensorL);
        add(sensorR);
        add(sensorLL);
        add(sensorRR);
        add(sensorLLL);
        add(sensorRRR);
        add(sensorLH);
        add(sensorRH);
    }
    
    private function animToPlay(anim:String) {
        if(slope && Math.abs(distanceL - distanceR) > 2 && !airborne) {
            ending = '-a';
        } else {
            ending = '';
        }

        if(jumping)
            anim = 'jump';

        anim += ending;

        if(currentAnim != anim)
            playerAnims.animation.play(anim,true);
        currentAnim = anim;
        //trace(anim + " L: " + distanceL + " R: " + distanceR + " " + player.angle + " " + slope + " Wall: " + wall + " Jumping: " + jumping);
    }

    private function createSensor(imagePath:String):FlxSprite {
        var sensor:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image(imagePath));
        var bounds:Rectangle = getAlphaBounds(sensor.pixels);
        sensor.setSize(bounds.width, bounds.height);
        sensor.offset.set(bounds.x, bounds.y);
        sensor.x += bounds.x;
        sensor.y += bounds.y;
        sensor.antialiasing = false;
        sensor.visible = true;
        return sensor;
    }

    // Scans bitmap data and returns the smallest rectangle containing all nontransparent pixels.
    function getAlphaBounds(bitmapData:BitmapData):Rectangle {
        var bounds:Rectangle = new Rectangle();
        var found:Bool = false;

        for (y in 0...bitmapData.height) {
            for (x in 0...bitmapData.width) {
                var pixel:Int = bitmapData.getPixel32(x, y);
                var alpha:Int = (pixel >> 24) & 0xFF;
                if (alpha > 0) {
                    if (!found) {
                        bounds.x = x; 
                        bounds.y = y;
                        bounds.width = 1;
                        bounds.height = 1;
                        found = true;
                    } else {
                        bounds.width = Math.max(bounds.width, x - bounds.x + 1);
                        bounds.height = Math.max(bounds.height, y - bounds.y + 1);
                    }
                }
            }
        }
        return bounds;
    }
    
    var counter:Int = 0;
    function getPixelColors(sprite:FlxSprite):Void {
        var bitmapData:BitmapData = sprite.pixels;
        var width:Int = bitmapData.width;
        var height:Int = bitmapData.height;
        for (j in 0...height) {
            for (k in 0...width) {
                var color:Int = bitmapData.getPixel(k, j);
                if(color != 0) {
                    var hitbox:FlxSprite = new FlxSprite(k + levelBitmap.x, j + levelBitmap.y)
                        .loadGraphic(Paths.image('bgs/prey/hitboxPoint'), false, 1, 1);
                    hitbox.immovable = true;
                    hitbox.antialiasing = false;
                    hitbox.visible = false;
                    hitbox.ID = counter;
                    hitboxGroup.add(hitbox);
                    counter++;
                }
            }
        }
        if(gpuCache)
            ClientPrefs.GPUCaching = true;

        trace("Living hitboxes: " + hitboxGroup.countLiving());
        trace("Total hitboxes: " + counter);
    }
    
    override function update(elapsed:Float) {
        super.update(elapsed);

        FlxG.collide(player, hitboxGroup);
        // FlxG.collide(player, slopeGroup);
        FlxG.collide(sensorLL, hitboxGroup);
        // FlxG.collide(sensorLL, slopeGroup);
        FlxG.collide(sensorRR, hitboxGroup);
        // FlxG.collide(sensorRR, slopeGroup);
        
        FlxG.worldBounds.set(0, 0, 10000, 10000);
        FlxG.camera.follow(camFollowPoint, LOCKON, 1);

        updateSensors();
        
        player.maxVelocity.set(maxSpeed, maxFallSpeed);
        player.acceleration.y = gravity;
        player.drag.x = maxSpeed * 6;

        angle = getAngle();
        handleMovement(elapsed);
    }

    private function handlePlayerSpeed(num:Float) {
        var currentSpeed = player.velocity.x;
        if(currentSpeed+num > maxSpeed)
            player.velocity.x = maxSpeed;
        else if(currentSpeed+num < -maxSpeed)
            player.velocity.x = -maxSpeed;
        else
            player.velocity.x += num;
    }

    private function teleportToFloor():Void {
        var floorY:Float = -1;
        player.acceleration.y = 0;
        player.velocity.y = 0;
        
        for (hitbox in hitboxGroup.members) {
            if (hitbox != null && hitbox.exists) {
                if ((hitbox.x + hitbox.width > player.x) && (hitbox.x < player.x + player.width)) {
                    if (hitbox.y >= player.y) {
                        if (floorY == -1 || hitbox.y < floorY) {
                            floorY = hitbox.y;
                        }
                    }
                }
            }
        }
        
        if (player.y != floorY - player.height) {
            if (floorY != -1) {
                player.y = floorY - player.height;
            } else {
                player.reset(50, 50);
            }
        }
    }

    private function handleMovement(elapsed:Float):Void {
        if (FlxG.keys.anyPressed([RIGHT]) && !FlxG.keys.anyPressed([LEFT]) && !FlxG.keys.anyPressed([UP]) && !FlxG.keys.anyPressed([DOWN])) {
            player.acceleration.x = accelerationRate;
        } else if (FlxG.keys.anyPressed([LEFT]) && !FlxG.keys.anyPressed([RIGHT]) && !FlxG.keys.anyPressed([UP]) && !FlxG.keys.anyPressed([DOWN])) {
            player.acceleration.x = -accelerationRate;
        } else {
            player.acceleration.x = 0;
        }

        if(currentAnim == 'run-a' || currentAnim == 'run') {
            slopeSpeedX = slopeSpeedY = 2;
        } else {
            slopeSpeedX = slopeSpeedY = 1;
        }

        if(player.isTouching(FlxObject.LEFT) || player.isTouching(FlxObject.RIGHT)) {
            if(!slope) {
                player.velocity.x = 0;
                player.acceleration.x = 0;
            }
        }

        if(player.isTouching(FlxObject.FLOOR) || FlxG.overlap(sensorL, hitboxGroup) || FlxG.overlap(sensorR, hitboxGroup) || distanceR == 1 || distanceR == 0 || distanceL == 1 || distanceL == 0)
            touchingFloor = true;
        else
            touchingFloor = false;

        if(FlxG.overlap(sensorLH, hitboxGroup)) {
            wallRight = false;
            wallLeft = true;
            wall = true;
        } else if(FlxG.overlap(sensorRH, hitboxGroup)) {
            wallLeft = false;
            wallRight = true;
            wall = true;
        } else {
            wallLeft = false;
            wallRight = false;
            wall = false;
        }

        if (FlxG.keys.anyPressed([R]))
            player.reset(50, 50);

        if (FlxG.keys.anyPressed([SPACE]) && touchingFloor && allowJump) {
            jumping = true;
            player.velocity.y = -400;
        } else if (touchingFloor) {
            jumping = false;
        }

        if (FlxG.overlap(sensorLLL, hitboxGroup) != FlxG.overlap(sensorRRR, hitboxGroup) && distanceL != distanceR && !jumping && !airborne || forcedSlope) {
            slope = true;
        } else {
            slope = false;
        }

        if (player.velocity.x < 0) {
            playerAnims.flipX = true;
            player.flipX = true;
        } else if (player.velocity.x > 0) {
            playerAnims.flipX = false;
            player.flipX = false;
        }

        trace(wall + " " + slope);

        if (player.isTouching(FlxObject.RIGHT) && wall && slope) {
            trace("test5" + " " + vel);
            player.velocity.y = -300;
            player.acceleration.y = -300;
            ninety = true;
        } else if (player.isTouching(FlxObject.LEFT) && wall && slope) {
            trace("test5" + " " + vel);
            player.velocity.y = -300;
            player.acceleration.y = -300;
            ninety = true;
        } else if (player.isTouching(FlxObject.RIGHT) && !FlxG.keys.anyPressed([RIGHT]) && !wall) {
            trace("test1");
            player.y-=slopeSpeedY;
            player.x+=slopeSpeedX;
            Std.int(player.y);
            ninety = false;
            player.velocity.x = vel;
            player.acceleration.x = acc;
            player.velocity.x -= 10;
            player.acceleration.x -= 10;
            vel -= 10;
            acc -= 10;
        } else if (player.isTouching(FlxObject.LEFT) && !FlxG.keys.anyPressed([LEFT]) && !wall) {
            trace("test2");
            player.y-=slopeSpeedY;
            player.x-=slopeSpeedX;
            Std.int(player.y);
            ninety = false;
            player.velocity.x = vel;
            player.acceleration.x = acc;
            player.velocity.x += 10;
            player.acceleration.x += 10;
            vel += 10;
            acc += 10;
        } else if (player.isTouching(FlxObject.RIGHT) && FlxG.keys.anyPressed([RIGHT]) && !wall) {
            trace("test3");
            player.y-=slopeSpeedY;
            player.x+=slopeSpeedX;
            Std.int(player.y);
            ninety = false;
            player.velocity.x = vel;
            player.acceleration.x = acc;
        } else if (player.isTouching(FlxObject.LEFT) && FlxG.keys.anyPressed([LEFT]) && !wall) {
            trace("test4");
            player.y-=slopeSpeedY;
            player.x-=slopeSpeedX;
            Std.int(player.y);
            ninety = false;
            player.velocity.x = vel;
            player.acceleration.x = acc;
        } else {
            vel = player.velocity.x;
            acc = player.acceleration.x;
            ninety = false;
        }

        if (!ninety && !jumping && slope && !FlxG.overlap(sensorLL, hitboxGroup) && !FlxG.overlap(sensorRR, hitboxGroup)) {
            teleportToFloor();
        }
        //trace(distanceL + " " + distanceR + " " + slopeSpeedX + " " + slopeSpeedY + " " + player.x + " " + player.y);

        if (player.velocity.x == 0 && player.velocity.y == 0 && !FlxG.keys.anyPressed([RIGHT, LEFT, UP, DOWN, SPACE]) && !jumping)
            animToPlay('idle');
        else if (player.velocity.x > maxSpeed/2 && FlxG.keys.anyPressed([LEFT]) && !airborne || player.velocity.x < -maxSpeed/2 && FlxG.keys.anyPressed([RIGHT]) && !airborne)
            animToPlay('skid');
        else if (player.velocity.x <= maxSpeed/2 && player.velocity.x > 0|| player.velocity.x >= -maxSpeed/2 && player.velocity.x < 0)
            animToPlay('walk');
        else if (player.velocity.x > maxSpeed/2 && player.velocity.x <= maxSpeed || player.velocity.x >= -maxSpeed && player.velocity.x < -maxSpeed/2 && !jumping)
            animToPlay('run');
        else if (player.velocity.x > maxSpeed || player.velocity.x < -maxSpeed && !jumping)
            animToPlay('peelout');
        else if (jumping)
            animToPlay('jump');
        else if (FlxG.keys.anyPressed([DOWN]) && player.velocity.x == 0 && player.velocity.y == 0)
            animToPlay('crouch');
        else if (FlxG.keys.anyPressed([UP])  && player.velocity.x == 0 && player.velocity.y == 0)
            animToPlay('lookup');
        else
            animToPlay('idle');
    }

    private function getAngle(?type:Int):Float {
        var bitmapData:BitmapData = levelBitmap.pixels;
        
        if (distanceL != 0)
            lastDistanceL = distanceL;
        if (distanceR != 0)
            lastDistanceR = distanceR;
        
        var foundL = false;
        var foundR = false;

        for (i in 0...30) {
            var colorL:Int = bitmapData.getPixel(Std.int(sensorL.x), Std.int(sensorL.y + i));
            if (colorL != 0) {
                distanceL = i;
                foundL = true;
                trace(colorL);
            }
            var colorR:Int = bitmapData.getPixel(Std.int(sensorR.x), Std.int(sensorR.y + i));
            if (colorR != 0) {
                distanceR = i;
                foundR = true;
                trace(colorR);
            }

            if(colorL == 255 || colorR == 255 || colorL == 170 || colorR == 170)
                forcedSlope = true;
            else
                forcedSlope = false;

            if(colorR != 0 && colorL != 0)
                break;
        }
        if (!foundL)
            distanceL = -6;

        if (!foundR)
            distanceR = -6;
        
        if(distanceL == -6 || distanceR == -6)
            airborne = true;
        else
            airborne = false;

        if (distanceL > distanceR && player.velocity.x < 0 && ending == '-a') {
            playerAnims.angle = -90;
            return -90;
        } else if (distanceL < distanceR && player.velocity.x > 0 && ending == '-a') {
            playerAnims.angle = 90;
            return 90;  
        } else if (player.velocity.x == 0 || touchingFloor) {
            if (!slope) {
                playerAnims.angle = 0;
                return 0;
            }
        }
        playerAnims.angle = 0;
        return 90;
    }
    
    private function updateSensors():Void {
        var sensors = [sensorL, sensorLL, sensorLLL, sensorLH, sensorR, sensorRR, sensorRRR, sensorRH];
        for (sensor in sensors) {
            sensor.drag.x = player.drag.x;
            sensor.velocity.x = player.velocity.x;
            sensor.velocity.y = player.velocity.y;
            sensor.acceleration.x = player.acceleration.x;
            sensor.acceleration.y = player.acceleration.y;
            sensor.maxVelocity.set(maxSpeed, maxFallSpeed);

            playerAnims.drag.x = player.drag.x;
            playerAnims.velocity.x = player.velocity.x;
            playerAnims.velocity.y = player.velocity.y;
            playerAnims.acceleration.x = player.acceleration.x;
            playerAnims.acceleration.y = player.acceleration.y;
            playerAnims.maxVelocity.set(maxSpeed, maxFallSpeed);
        }
        
        sensorLL.visible = false;
        sensorRR.visible = false;
        sensorLLL.visible = false;
        sensorRRR.visible = false;

        if (distanceL > distanceR && player.velocity.x < 0 && ending == '-a') {
            playerAnims.x = player.x - 25;
            playerAnims.y = player.y - 15;
        } else if (distanceL < distanceR && player.velocity.x > 0 && ending == '-a') {
            playerAnims.x = player.x - 28;
            playerAnims.y = player.y - 11;
        } else {
            playerAnims.x = player.x - 21;
            playerAnims.y = player.y - 21;
        }

        if (followSonic) {
            camFollowPoint.x = player.x;
            camFollowPoint.y = player.y;
            camFollowPoint.drag.x = player.drag.x;
            camFollowPoint.velocity.x = player.velocity.x;
            camFollowPoint.velocity.y = player.velocity.y;
            camFollowPoint.acceleration.x = player.acceleration.x;
            camFollowPoint.acceleration.y = player.acceleration.y;
            camFollowPoint.maxVelocity.set(maxSpeed, maxFallSpeed);
        }

        sensorL.x = player.x;
        sensorL.y = player.y + 29;
        
        sensorLL.x = player.x;
        sensorLL.y = player.y + 21;
        
        sensorR.x = player.x + 14;
        sensorR.y = player.y + 29;
        
        sensorRR.x = player.x + 14;
        sensorRR.y = player.y + 21;
        
        sensorLLL.x = player.x;
        sensorLLL.y = player.y + 26;
        
        sensorRRR.x = player.x + 14;
        sensorRRR.y = player.y + 26;

        sensorLH.x = player.x - 1;
        sensorLH.y = player.y + 2;

        sensorRH.x = player.x + 15;
        sensorRH.y = player.y + 2;
    }
}
