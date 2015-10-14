package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.FlxCamera;
import flixel.addons.display.shapes.FlxShapeBox;
import flixel.util.FlxSpriteUtil;
import flixel.addons.nape.FlxNapeState;
import flixel.addons.nape.FlxNapeSprite;
import nape.geom.Vec2;
/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxNapeState
{
	var player:Player;
	var hitbox:FlxNapeSprite;
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
		add(player = new Player(200, 200, this));
		
		// FlxG.camera.follow(player, FlxCamera.STYLE_LOCKON, 1);

	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();
	}	
	//Create a rectangle in the playstate, and check if there is a mailbox in it.
	public function swingBat():Void{
		hitbox = new FlxNapeSprite();
		var hitbox_origin:Vec2 = new Vec2(0,0);
		hitbox_origin.setxy(player.body.position.x+Math.cos(player.body.rotation)*800, player.body.position.y+Math.sin(player.body.rotation)*800);
		// hitbox_origin.add(new Vec2(Math.cos(player.body.rotation), Math.sin(player.body.rotation)));
		// hitbox = new FlxNapeSprite(hitbox_origin.x, hitbox_origin.y, true, false);
		hitbox.makeGraphic(500, 500, FlxColor.WHITE, true);
		hitbox.createRectangularBody();
		hitbox.physicsEnabled = false;
		hitbox.body.position.set(hitbox_origin);
		trace(hitbox.body.position);
		trace(player.body.position);
		hitbox.body.rotation = player.body.rotation;
		// hitbox.angle = player.angle;
		add(hitbox);
	}
}