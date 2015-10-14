package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxColor;

class IntroState extends FlxState
{
	var frame = 0; //the frame of the cutscene that is active
	var totalFrames = 5; //the total number of frames in the intro cutscene
	var cutscenes : Array<String>;
	var image : FlxSprite;
	override public function create():Void
	{
		cutscenes = ["assets/images/Cutscene/Cutscene1.png","assets/images/Cutscene/Cutscene2.png","assets/images/Cutscene/Cutscene3.png","assets/images/Cutscene/Cutscene4.png","assets/images/Cutscene/Cutscene5.png"]; //an array that stores the file path to the cutscene pngs
		image = new FlxSprite(cutscenes[frame]);
		add(image);
		FlxG.camera.fade(FlxColor.BLACK, .33, true);
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
		if (FlxG.keys.anyJustPressed(["SPACE", "ENTER"]))
		{
			frame++;
			if (frame == totalFrames)
			{
				FlxG.camera.fade(0xff000000,1, false,function() {
					FlxG.switchState(new PlayState());
				});
			}
			else
			{
				image.loadGraphic(cutscenes[frame]);
			}
		}
		super.update();
	}	
	private function onFade() : Void
	{
		FlxG.switchState(new PlayState());
	}
}