package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import haxe.io.Path;
import flixel.tile.FlxTilemap;
import flixel.addons.editors.tiled.TiledMap;
import openfl.display.Tilemap;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	var player:Player;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
		
		//Tiled Vodo Magic
		var tiledLevel:TiledMap = new TiledMap("assets/data/Map1.tmx");
		
		var tileSize = tiledLevel.tileWidth;
		var mapW = tiledLevel.width;
		var mapH = tiledLevel.height;
		
		for (layer in tiledLevel.layers)
		{
			var layerData:Array<Int> = layer.tileArray;
			
			var tileSheetName:String = layer.properties.get("tilesheet");
			var tilesheetPath:String = "assets/images/" + tileSheetName;
			
			var level:FlxTilemap = new FlxTilemap();
			
			level.widthInTiles = mapW;
			level.heightInTiles = mapH;
			
			level.loadMap(layer.tileArray, tilesheetPath, tileSize, tileSize, FlxTilemap.OFF, 1);
			add(level);
		}
		add(player = new Player(200, 200, this));
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
}