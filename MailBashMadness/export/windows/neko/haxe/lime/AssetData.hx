package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("assets/data/data-goes-here.txt", "assets/data/data-goes-here.txt");
			type.set ("assets/data/data-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/HouseTile.png", "assets/data/HouseTile.png");
			type.set ("assets/data/HouseTile.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/data/Map1.tmx", "assets/data/Map1.tmx");
			type.set ("assets/data/Map1.tmx", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/RoadLawnTiles.jpg", "assets/data/RoadLawnTiles.jpg");
			type.set ("assets/data/RoadLawnTiles.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/data/Tiles.jpg", "assets/data/Tiles.jpg");
			type.set ("assets/data/Tiles.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/BatterFrame1.png", "assets/images/BatterFrame1.png");
			type.set ("assets/images/BatterFrame1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/batterframe2.png", "assets/images/batterframe2.png");
			type.set ("assets/images/batterframe2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/batterframe3.png", "assets/images/batterframe3.png");
			type.set ("assets/images/batterframe3.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/batterspritesheet.jpg", "assets/images/batterspritesheet.jpg");
			type.set ("assets/images/batterspritesheet.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/clearlyacar.png", "assets/images/clearlyacar.png");
			type.set ("assets/images/clearlyacar.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Cutscene/Cutscene1.png", "assets/images/Cutscene/Cutscene1.png");
			type.set ("assets/images/Cutscene/Cutscene1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Cutscene/Cutscene2.png", "assets/images/Cutscene/Cutscene2.png");
			type.set ("assets/images/Cutscene/Cutscene2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Cutscene/Cutscene3.png", "assets/images/Cutscene/Cutscene3.png");
			type.set ("assets/images/Cutscene/Cutscene3.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Cutscene/Cutscene4.png", "assets/images/Cutscene/Cutscene4.png");
			type.set ("assets/images/Cutscene/Cutscene4.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Cutscene/Cutscene5.png", "assets/images/Cutscene/Cutscene5.png");
			type.set ("assets/images/Cutscene/Cutscene5.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/CutsceneTest.png", "assets/images/CutsceneTest.png");
			type.set ("assets/images/CutsceneTest.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/fix_attempt.png", "assets/images/fix_attempt.png");
			type.set ("assets/images/fix_attempt.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/house1.png", "assets/images/house1.png");
			type.set ("assets/images/house1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/house1up (2).png", "assets/images/house1up (2).png");
			type.set ("assets/images/house1up (2).png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/house1up.png", "assets/images/house1up.png");
			type.set ("assets/images/house1up.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/house2.png", "assets/images/house2.png");
			type.set ("assets/images/house2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/house2right.png", "assets/images/house2right.png");
			type.set ("assets/images/house2right.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/HouseTile.png", "assets/images/HouseTile.png");
			type.set ("assets/images/HouseTile.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/HouseTiles.png", "assets/images/HouseTiles.png");
			type.set ("assets/images/HouseTiles.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/images-go-here.txt", "assets/images/images-go-here.txt");
			type.set ("assets/images/images-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/Lawn/bot.png", "assets/images/Lawn/bot.png");
			type.set ("assets/images/Lawn/bot.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Lawn/botandleft.png", "assets/images/Lawn/botandleft.png");
			type.set ("assets/images/Lawn/botandleft.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Lawn/botandright.png", "assets/images/Lawn/botandright.png");
			type.set ("assets/images/Lawn/botandright.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Lawn/botleftdiag.png", "assets/images/Lawn/botleftdiag.png");
			type.set ("assets/images/Lawn/botleftdiag.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Lawn/botrightdiag.png", "assets/images/Lawn/botrightdiag.png");
			type.set ("assets/images/Lawn/botrightdiag.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Lawn/grass.png", "assets/images/Lawn/grass.png");
			type.set ("assets/images/Lawn/grass.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Lawn/leftvert.png", "assets/images/Lawn/leftvert.png");
			type.set ("assets/images/Lawn/leftvert.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Lawn/rightvert.png", "assets/images/Lawn/rightvert.png");
			type.set ("assets/images/Lawn/rightvert.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Lawn/top.png", "assets/images/Lawn/top.png");
			type.set ("assets/images/Lawn/top.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Lawn/topandleft.png", "assets/images/Lawn/topandleft.png");
			type.set ("assets/images/Lawn/topandleft.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Lawn/topandright.png", "assets/images/Lawn/topandright.png");
			type.set ("assets/images/Lawn/topandright.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Lawn/topleftdiag.png", "assets/images/Lawn/topleftdiag.png");
			type.set ("assets/images/Lawn/topleftdiag.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Lawn/toprightdiag.png", "assets/images/Lawn/toprightdiag.png");
			type.set ("assets/images/Lawn/toprightdiag.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/mailboxframe1.png", "assets/images/mailboxframe1.png");
			type.set ("assets/images/mailboxframe1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/mailboxframe2.png", "assets/images/mailboxframe2.png");
			type.set ("assets/images/mailboxframe2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/opening.sai", "assets/images/opening.sai");
			type.set ("assets/images/opening.sai", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/Road/backwardDiagonal.png", "assets/images/Road/backwardDiagonal.png");
			type.set ("assets/images/Road/backwardDiagonal.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Road/bottomleftdiag.png", "assets/images/Road/bottomleftdiag.png");
			type.set ("assets/images/Road/bottomleftdiag.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Road/bottomrightdiag.png", "assets/images/Road/bottomrightdiag.png");
			type.set ("assets/images/Road/bottomrightdiag.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Road/forwardDiagonal.png", "assets/images/Road/forwardDiagonal.png");
			type.set ("assets/images/Road/forwardDiagonal.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Road/horizBot.png", "assets/images/Road/horizBot.png");
			type.set ("assets/images/Road/horizBot.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Road/horizMid.png", "assets/images/Road/horizMid.png");
			type.set ("assets/images/Road/horizMid.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Road/horizTop.png", "assets/images/Road/horizTop.png");
			type.set ("assets/images/Road/horizTop.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Road/Intersection.png", "assets/images/Road/Intersection.png");
			type.set ("assets/images/Road/Intersection.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Road/road.sai", "assets/images/Road/road.sai");
			type.set ("assets/images/Road/road.sai", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/Road/topleftdiag.png", "assets/images/Road/topleftdiag.png");
			type.set ("assets/images/Road/topleftdiag.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Road/toprightdiag.png", "assets/images/Road/toprightdiag.png");
			type.set ("assets/images/Road/toprightdiag.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Road/VertLeft.png", "assets/images/Road/VertLeft.png");
			type.set ("assets/images/Road/VertLeft.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Road/VertRight.png", "assets/images/Road/VertRight.png");
			type.set ("assets/images/Road/VertRight.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/RoadLawnTiles.jpg", "assets/images/RoadLawnTiles.jpg");
			type.set ("assets/images/RoadLawnTiles.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/speechbubbleForBatter.png", "assets/images/speechbubbleForBatter.png");
			type.set ("assets/images/speechbubbleForBatter.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/speechbubbleForDriver.png", "assets/images/speechbubbleForDriver.png");
			type.set ("assets/images/speechbubbleForDriver.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/speechbubbleForPassenger.png", "assets/images/speechbubbleForPassenger.png");
			type.set ("assets/images/speechbubbleForPassenger.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/stopsign.png", "assets/images/stopsign.png");
			type.set ("assets/images/stopsign.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Tiles.jpg", "assets/images/Tiles.jpg");
			type.set ("assets/images/Tiles.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/titleandcutscene.png", "assets/images/titleandcutscene.png");
			type.set ("assets/images/titleandcutscene.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/tree1.png", "assets/images/tree1.png");
			type.set ("assets/images/tree1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/tree2.png", "assets/images/tree2.png");
			type.set ("assets/images/tree2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/TruckSprite.png", "assets/images/TruckSprite.png");
			type.set ("assets/images/TruckSprite.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/music/music-goes-here.txt", "assets/music/music-goes-here.txt");
			type.set ("assets/music/music-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/music/Music_1.wav", "assets/music/Music_1.wav");
			type.set ("assets/music/Music_1.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/music/Whiskey_on_the_Mississippi.mp3", "assets/music/Whiskey_on_the_Mississippi.mp3");
			type.set ("assets/music/Whiskey_on_the_Mississippi.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
			path.set ("assets/sounds/bathit.wav", "assets/sounds/bathit.wav");
			type.set ("assets/sounds/bathit.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/batmiss.wav", "assets/sounds/batmiss.wav");
			type.set ("assets/sounds/batmiss.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/drift.wav", "assets/sounds/drift.wav");
			type.set ("assets/sounds/drift.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/mailhitmail.wav", "assets/sounds/mailhitmail.wav");
			type.set ("assets/sounds/mailhitmail.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/ph.wav", "assets/sounds/ph.wav");
			type.set ("assets/sounds/ph.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/truckhitwall.wav", "assets/sounds/truckhitwall.wav");
			type.set ("assets/sounds/truckhitwall.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/truckloop.wav", "assets/sounds/truckloop.wav");
			type.set ("assets/sounds/truckloop.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/truckrevup.wav", "assets/sounds/truckrevup.wav");
			type.set ("assets/sounds/truckrevup.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/truckslow.wav", "assets/sounds/truckslow.wav");
			type.set ("assets/sounds/truckslow.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/To Do List Sound+Music.txt", "assets/To Do List Sound+Music.txt");
			type.set ("assets/To Do List Sound+Music.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/sounds/beep.ogg", "assets/sounds/beep.ogg");
			type.set ("assets/sounds/beep.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/flixel.ogg", "assets/sounds/flixel.ogg");
			type.set ("assets/sounds/flixel.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/fonts/nokiafc22.ttf", "assets/fonts/nokiafc22.ttf");
			type.set ("assets/fonts/nokiafc22.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("assets/fonts/arial.ttf", "assets/fonts/arial.ttf");
			type.set ("assets/fonts/arial.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
