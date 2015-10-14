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
		
		var tileWidth = tiledLevel.tileWidth;
		var tileHeight = tiledLevel.tileHeight;
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
			
			var tileGID:Int = getStartGid(tiledLevel, tileSheetName);
			
			level.loadMap(layer.tileArray, tilesheetPath, tileWidth, tileHeight, FlxTilemap.OFF, tileGID);
			add(level);
		}
		add(player = new Player(200, 200, this));
	}
	
	function getStartGid (tiledLevel:TiledMap, tilesheetName:String):Int
    {
        // This function gets the starting GID of a tilesheet
 
        // Note: "0" is empty tile, so default to a non-empty "1" value.
        var tileGID:Int = 1;
 
        for (tileset in tiledLevel.tilesets)
        {
            // We need to search the tileset's firstGID -- to do that,
            // we compare the tilesheet paths. If it matches, we
            // extract the firstGID value.
            var tilesheetPath:Path = new Path(tileset.imageSource);
            var thisTilesheetName = tilesheetPath.file + "." + tilesheetPath.ext;
            if (thisTilesheetName == tilesheetName)
            {
                tileGID = tileset.firstGID;
            }
        }
 
        return tileGID;
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