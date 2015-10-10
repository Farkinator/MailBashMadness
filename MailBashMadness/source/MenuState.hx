package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxColor;

/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxState
{
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	public static inline var OPTIONS : Int = 2;
	
	var opt0txt : FlxText; //Start Game Choice
	var opt1txt : FlxText; //Quit Game Choice
	var selector : FlxSprite; //Which start game choice you are on
	var selectNum = 0;
	override public function create():Void
	{
		FlxG.state.bgColor = FlxColor.NAVY_BLUE;
		//Simple stuff right here
		opt0txt = new FlxText(FlxG.width * 1/2 - 100, FlxG.height * 1 / 2 - 100, 400, "Start Game");
		opt1txt = new FlxText(FlxG.width * 1/2 - 100, FlxG.height * 1 / 2 - 50, 400, "Start Without Intro");
		opt0txt.size = opt1txt.size = 32;
		add(opt0txt);
		add(opt1txt);
				
		selector = new FlxSprite(); //ADD SPRITE FOR THIS OR CHANGE TO HIGHLIGHT SELECTION <<<
		selector.makeGraphic(10, 10, FlxColor.YELLOW);
		selector.x = opt0txt.x - selector.width - 10;
		add(selector);
		super.create();
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
				switch(selectNum) 
		{
			case 0:
				selector.y = opt0txt.y + 16;
			case 1:
				selector.y = opt1txt.y + 16;
		}
		
		//listen for keys
		if (FlxG.keys.anyJustPressed(['UP', 'W']))
		{
			selectNum = (selectNum - 1 + OPTIONS) % OPTIONS;
		}
		if (FlxG.keys.anyJustPressed(['DOWN', 'S']))
		{
			selectNum = (selectNum + 1 + OPTIONS) % OPTIONS;
		}
		if (FlxG.keys.anyJustPressed(["SPACE", "ENTER"]))
		{
			switch(selectNum)
			{
				case 0:
					FlxG.switchState(new IntroState());
				case 1:
					//Goes straight to the gameplay, no intro story
					FlxG.switchState(new PlayState()); 
			}
			super.update();
		}
		
		super.update();
	}	
}