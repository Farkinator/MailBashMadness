package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxAngle;
import flixel.util.FlxPoint;

class Player extends FlxSprite{
	public var MAX_SPEED:Int = 800;
	// The pick-up speed of the car. NOTE THAT THIS IS NOT A VECTOR, IT IS A SCALAR.
	public var ACCEL:Int = 1000;
	public var DECEL:Float = 1000;
	// A tuning number for how tightly our car turns. The bigger, the tighter the turn
	public var TURNTIGHTNESS:Float = 5;
	//These are the acceleration and velocity vectors in car space. The fields acceleration and velocity are the 
	// values in world space, which isn't particularly helpful when we're doing turns and stuff.
	public var caraccel:FlxPoint = new FlxPoint(0,0);
	public var car_speed:Float = 0;
	// The acceleration vector is a combination of the scalar from up there and the amount we're turning by.
	public var carvelocity:FlxPoint = new FlxPoint(0,0);
	var parent:PlayState;
	public var wheelAngle:Int;
	public function new(X:Float=0, Y:Float=0, Parent:PlayState){
		super(X, Y);
		loadGraphic("assets/images/clearlyacar.png", true, 60, 80);
		drag.set(MAX_SPEED * 8, MAX_SPEED * 8);
		angularDrag = 1200;
		// maxVelocity.set(MAX_SPEED, MAX_SPEED);

		parent = Parent;
		updateHitbox();
		wheelAngle = 0;

	}
	public function magnitude(point:FlxPoint):Float{
		return Math.sqrt(point.x*point.x + point.y*point.y);
	}

	public override function update():Void{
		var accel_modifier:Float = 0;
		var deceleration:Float = DECEL;
		var accel:Float = ACCEL;
		var max_speed:Float = MAX_SPEED;
		var handling:Float = 1;
		var a_c:Float = 0;

		//I really want analog input.
		if(FlxG.keys.anyPressed(["A"])){
			//we're turning left. 
			accel_modifier = -1;
		} else if(FlxG.keys.anyPressed(["D"])){
			accel_modifier = 1;
		} else {
			accel_modifier = 0;
		}
		if(FlxG.keys.pressed.SPACE){
			max_speed = MAX_SPEED/2;
			deceleration = DECEL /2;
			handling *= 2.5;
		}
		acceleration.set(0);
		//Treat the car like a trike, treat the back wheels as pivot points
		if(FlxG.keys.anyPressed(["W"])){
			//Get the speed of the car in object space, do the standard dv/dt = a * t.
			if(accel_modifier == 0){
			}
			car_speed = car_speed + accel * FlxG.elapsed;
			if(car_speed > max_speed ){
				if(FlxG.keys.pressed.SPACE){
					car_speed -= deceleration / 20;
				} else {
					car_speed = max_speed;
				}
			}
		} else {

			car_speed -= deceleration * FlxG.elapsed;

			if(car_speed < 0){
				car_speed = 0;
			}
			
		}
		//Turn radius is directly affected by how fast you're going. The faster you go, the bigger your turn radius.
		var turn_radius:Float = car_speed / TURNTIGHTNESS + 100;
		//Now we have our radius and our tangential speed, time to find what centripetal accel can keep us going in this circle.
		// a_c = v^2/r, which cancels down to v/TIGHTNESS. I just thought I'd make this clearer so it doesn't look like demon magic.
		if(turn_radius != 0){
			a_c = (car_speed * car_speed)/turn_radius;
		} 
		// v = aV * r - > v / r = aV, but sadly this is in rad/seconds so we need to convert to degree/second.
		if(car_speed != 0){
			angularVelocity = (car_speed/turn_radius) * 57.2958 * accel_modifier * handling;
	
		} 
		//Now we have the two perpendicular components of our car's acceleration! Man, this has been quite a journey.
		// accel_modifier will make the acceleration dependent on which way we're steering.
		caraccel.set(a_c * accel_modifier * handling, accel);
		// Now let's find the velocity of the car in car space by simply multiplying both of these fields by time elapsed.
		// Sort of redundant given that we needed the y component of this to determine the x component, but cut me some slack.
		carvelocity.set(caraccel.x * FlxG.elapsed, car_speed);
		// This is basically a change of basis function. Just ignore the silliness.
		if(carvelocity.x != 0 || carvelocity.y !=0){

 			velocity = FlxAngle.rotatePoint(carvelocity.x, carvelocity.y, 0, 0, angle);
	 		
	 	} else {
	 		velocity.set(0,0);
	 	}
		super.update();
	}

} 