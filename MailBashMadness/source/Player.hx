package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxAngle;
import flixel.util.FlxPoint;
import flixel.tweens.FlxTween;
import flixel.tweens.misc.NumTween;
import flixel.tweens.FlxEase;
import flixel.tweens.misc.VarTween;

class Player extends FlxSprite{
	//+--------------------------------------------+
	//|            CAR TUNING VALUES               |
	//+--------------------------------------------+

	public var MAX_SPEED:Int = 800;
	// The pick-up speed of the car. NOTE THAT THIS IS NOT A VECTOR, IT IS A SCALAR.
	public var ACCEL:Int = 1000;
	public var DECEL:Float = 1000;
	// A tuning number for how tightly our car turns. The bigger, the tighter the turn
	public var TURNTIGHTNESS:Float = 5;
	//If we're traveling basically nowhere, this will be the minimum turn radius.
	public var MIN_TURN_RADIUS:Float = 100.0;

	//+--------------------------------------------+
	//|            BAT TUNING VALUES               |
	//+--------------------------------------------+

	//Recharge rate of the bat.
	public var RECHARGERATE:Float = 3;
	//Total charge duration.
	public var CHARGEDURATION:Float = 1.4;
	//How far along the sweet spot is. After this duration, the player is in overswing.
	public var SWEETSPOT:Float = 1.0;
	//How hard the swing... well, SWINGS!
	public var MAXSWINGSTRENGTH:Float = 80.0;
	// how badly an overswing affects recharge rate.
	public var OVERSWING_PENALTY:Float = 3.0;

	// +--------------------------------------------+
  	// |              LOCAL MEMBERS                 |
    // +--------------------------------------------+
	

	//These are the acceleration and velocity vectors in car space. The fields acceleration and velocity are the 
	// values in world space, which isn't particularly helpful when we're doing turns and stuff.
	// The acceleration vector a vector in car-space. <turning-acceleration, tangential-acceleration>
	// Think of caraccel.y as the horsepower.
	
	public var caraccel:FlxPoint = new FlxPoint(0,0);
	public var car_speed:Float = 0;
	public var carvelocity:FlxPoint = new FlxPoint(0,0);
	var parent:PlayState;
	public var wheelAngle:Int;
	//And now for variables involving a SWING OF THE BAT.
	// How hard we swing. goes from 0 to max swing strength. only stored in the x portion of the point.
	public var swingStrength:FlxPoint = new FlxPoint(0, 0);
	public var swingTweener:VarTween;
	//Charge duration in seconds.
	//If the player overswung.
	public var overCharge:Bool = false;
	// If the bat is on cooldown.
	public var recharging:Bool = false;
	//Whether or not we are charging the bat.
	public var charging:Bool = false;
	public var chargeTimeRemaining:Float = 0;
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
		var turn_radius:Float = car_speed / TURNTIGHTNESS + MIN_TURN_RADIUS;
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

	 	// So that was the movement of the car, here comes... CHARGING THE BAT.
	 	// I want a behavior that builds quadratically towards max power, then falls off dramatically if you don't time it correctly.

	 	//If we're recharging, decrement the amount remaining.
	 	if(recharging){
	 		chargeTimeRemaining -= FlxG.elapsed;
	 		if(chargeTimeRemaining <= 0){
	 			recharging = false;
	 			trace("you may swing hte bat again");
	 		}
	 	}
	 	//You should only be able to swing when the bat is not re-charging.
	 	if(FlxG.mouse.justPressed && !recharging){
	 		/* FlxTween on a variable 
	 		*/
	 		// Tweening numbers is incomprehensible in haxeflixel, imma just do it myself.
	 		charging = true;
	 		overCharge = false;
	 		swingStrength.x = BASE_SWING_STR;
	 		//Chaining together tweens can get messy, but it creates the kind of step-wise dropoff that I want.
	 		swingTweener = FlxTween.tween(swingStrength, {x : MAXSWINGSTRENGTH}, SWEETSPOT, {ease: FlxEase.expoInOut, type: FlxTween.ONESHOT, complete: overSwing});
	 		// trace(swingStrength.x);
	 	}
	 	// You can only release the bat if you were charging to begin with...
	 	if(FlxG.mouse.justReleased && charging){
	 		trace("You should be swinging with a value of " + swingStrength.x);
	 		swingBat(swingTweener);
	 		swingTweener.cancel();


	 	}

		super.update();
	}
	//This will be called if the user over-swings their bat.
	private function overSwing(Tween:FlxTween):Void{
		trace("Starting overswing");
		// Charge duration - sweet spot should give the falloff in the way we want.
		overCharge = true;
		swingTweener = FlxTween.tween(swingStrength, {x:0.0}, CHARGEDURATION - SWEETSPOT, {ease: FlxEase.expoOut, type: FlxTween.ONESHOT, complete: swingBat});
		if(FlxG.mouse.justReleased){
			swingBat(swingTweener);
			swingTweener.cancel();
		}
	}
	//Takes in whether or not a swing was an overswing.
	private function swingBat(Tween:FlxTween):Void{
		recharging = true;
		charging = false;
		if(overCharge == true){
			trace("OUCH! Overswing! Have fun shaking off that stinger");
			chargeTimeRemaining = CHARGEDURATION * OVERSWING_PENALTY;
		} else {
			trace("Well done you aren't an idiot");
			chargeTimeRemaining = CHARGEDURATION;
		}
	}

} 