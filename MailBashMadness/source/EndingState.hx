package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxColor;

class EndingState extends FlxState
{
	var frame = 0; //the frame of the cutscene that is active
	var totalFrames = 1; //the total number of frames in the intro cutscene
	var cutscenes : Array<String>;
	var image : FlxSprite;
	var restart : Bool = false;
	override public function create():Void
	{
		cutscenes = ["assets/images/CutsceneTest.png"]; //an array that stores the file path to the cutscene pngs
		image = new FlxSprite(cutscenes[frame]);
		add(image);
		super.create();
	}
	
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		if (FlxG.keys.anyJustPressed(["SPACE", "ENTER"]) && frame != totalFrames)
		{
			frame++;
			if (frame == totalFrames)
			{
				restart = true;
				//THIS IS BASICALLY THE FINAL SCREEN
			}
			else
			{
				image.loadGraphic(cutscenes[frame]);
			}
		}
		if (FlxG.keys.anyJustPressed(["R"]) && restart)
		{
			FlxG.resetGame();
		}
		super.update();
	}	
}