package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Future;
import lime.app.Preloader;
import lime.app.Promise;
import lime.audio.AudioSource;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Image;
import lime.text.Font;
import lime.utils.ByteArray;
import lime.utils.UInt8Array;
import lime.Assets;

#if sys
import sys.FileSystem;
#end

#if (js && html5)
import lime.net.URLLoader;
import lime.net.URLRequest;
#elseif flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if (openfl && !flash)
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_arial_ttf);
		
		#end
		
		#if flash
		
		className.set ("assets/data/data-goes-here.txt", __ASSET__assets_data_data_goes_here_txt);
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		className.set ("assets/data/HouseTile.png", __ASSET__assets_data_housetile_png);
		type.set ("assets/data/HouseTile.png", AssetType.IMAGE);
		className.set ("assets/data/Map1.tmx", __ASSET__assets_data_map1_tmx);
		type.set ("assets/data/Map1.tmx", AssetType.TEXT);
		className.set ("assets/data/RoadLawnTiles.jpg", __ASSET__assets_data_roadlawntiles_jpg);
		type.set ("assets/data/RoadLawnTiles.jpg", AssetType.IMAGE);
		className.set ("assets/data/Tiles.jpg", __ASSET__assets_data_tiles_jpg);
		type.set ("assets/data/Tiles.jpg", AssetType.IMAGE);
		className.set ("assets/images/BatterFrame1.png", __ASSET__assets_images_batterframe1_png);
		type.set ("assets/images/BatterFrame1.png", AssetType.IMAGE);
		className.set ("assets/images/batterframe2.png", __ASSET__assets_images_batterframe2_png);
		type.set ("assets/images/batterframe2.png", AssetType.IMAGE);
		className.set ("assets/images/batterframe3.png", __ASSET__assets_images_batterframe3_png);
		type.set ("assets/images/batterframe3.png", AssetType.IMAGE);
		className.set ("assets/images/batterspritesheet.jpg", __ASSET__assets_images_batterspritesheet_jpg);
		type.set ("assets/images/batterspritesheet.jpg", AssetType.IMAGE);
		className.set ("assets/images/clearlyacar.png", __ASSET__assets_images_clearlyacar_png);
		type.set ("assets/images/clearlyacar.png", AssetType.IMAGE);
		className.set ("assets/images/CutsceneTest.png", __ASSET__assets_images_cutscenetest_png);
		type.set ("assets/images/CutsceneTest.png", AssetType.IMAGE);
		className.set ("assets/images/house1.png", __ASSET__assets_images_house1_png);
		type.set ("assets/images/house1.png", AssetType.IMAGE);
		className.set ("assets/images/house1up (2).png", __ASSET__assets_images_house1up__2__png);
		type.set ("assets/images/house1up (2).png", AssetType.IMAGE);
		className.set ("assets/images/house1up.png", __ASSET__assets_images_house1up_png);
		type.set ("assets/images/house1up.png", AssetType.IMAGE);
		className.set ("assets/images/house2.png", __ASSET__assets_images_house2_png);
		type.set ("assets/images/house2.png", AssetType.IMAGE);
		className.set ("assets/images/house2right.png", __ASSET__assets_images_house2right_png);
		type.set ("assets/images/house2right.png", AssetType.IMAGE);
		className.set ("assets/images/HouseTile.png", __ASSET__assets_images_housetile_png);
		type.set ("assets/images/HouseTile.png", AssetType.IMAGE);
		className.set ("assets/images/HouseTiles.png", __ASSET__assets_images_housetiles_png);
		type.set ("assets/images/HouseTiles.png", AssetType.IMAGE);
		className.set ("assets/images/images-go-here.txt", __ASSET__assets_images_images_go_here_txt);
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		className.set ("assets/images/Lawn/bot.png", __ASSET__assets_images_lawn_bot_png);
		type.set ("assets/images/Lawn/bot.png", AssetType.IMAGE);
		className.set ("assets/images/Lawn/botandleft.png", __ASSET__assets_images_lawn_botandleft_png);
		type.set ("assets/images/Lawn/botandleft.png", AssetType.IMAGE);
		className.set ("assets/images/Lawn/botandright.png", __ASSET__assets_images_lawn_botandright_png);
		type.set ("assets/images/Lawn/botandright.png", AssetType.IMAGE);
		className.set ("assets/images/Lawn/botleftdiag.png", __ASSET__assets_images_lawn_botleftdiag_png);
		type.set ("assets/images/Lawn/botleftdiag.png", AssetType.IMAGE);
		className.set ("assets/images/Lawn/botrightdiag.png", __ASSET__assets_images_lawn_botrightdiag_png);
		type.set ("assets/images/Lawn/botrightdiag.png", AssetType.IMAGE);
		className.set ("assets/images/Lawn/grass.png", __ASSET__assets_images_lawn_grass_png);
		type.set ("assets/images/Lawn/grass.png", AssetType.IMAGE);
		className.set ("assets/images/Lawn/leftvert.png", __ASSET__assets_images_lawn_leftvert_png);
		type.set ("assets/images/Lawn/leftvert.png", AssetType.IMAGE);
		className.set ("assets/images/Lawn/rightvert.png", __ASSET__assets_images_lawn_rightvert_png);
		type.set ("assets/images/Lawn/rightvert.png", AssetType.IMAGE);
		className.set ("assets/images/Lawn/top.png", __ASSET__assets_images_lawn_top_png);
		type.set ("assets/images/Lawn/top.png", AssetType.IMAGE);
		className.set ("assets/images/Lawn/topandleft.png", __ASSET__assets_images_lawn_topandleft_png);
		type.set ("assets/images/Lawn/topandleft.png", AssetType.IMAGE);
		className.set ("assets/images/Lawn/topandright.png", __ASSET__assets_images_lawn_topandright_png);
		type.set ("assets/images/Lawn/topandright.png", AssetType.IMAGE);
		className.set ("assets/images/Lawn/topleftdiag.png", __ASSET__assets_images_lawn_topleftdiag_png);
		type.set ("assets/images/Lawn/topleftdiag.png", AssetType.IMAGE);
		className.set ("assets/images/Lawn/toprightdiag.png", __ASSET__assets_images_lawn_toprightdiag_png);
		type.set ("assets/images/Lawn/toprightdiag.png", AssetType.IMAGE);
		className.set ("assets/images/mailboxframe1.png", __ASSET__assets_images_mailboxframe1_png);
		type.set ("assets/images/mailboxframe1.png", AssetType.IMAGE);
		className.set ("assets/images/mailboxframe2.png", __ASSET__assets_images_mailboxframe2_png);
		type.set ("assets/images/mailboxframe2.png", AssetType.IMAGE);
		className.set ("assets/images/Road/backwardDiagonal.png", __ASSET__assets_images_road_backwarddiagonal_png);
		type.set ("assets/images/Road/backwardDiagonal.png", AssetType.IMAGE);
		className.set ("assets/images/Road/bottomleftdiag.png", __ASSET__assets_images_road_bottomleftdiag_png);
		type.set ("assets/images/Road/bottomleftdiag.png", AssetType.IMAGE);
		className.set ("assets/images/Road/bottomrightdiag.png", __ASSET__assets_images_road_bottomrightdiag_png);
		type.set ("assets/images/Road/bottomrightdiag.png", AssetType.IMAGE);
		className.set ("assets/images/Road/forwardDiagonal.png", __ASSET__assets_images_road_forwarddiagonal_png);
		type.set ("assets/images/Road/forwardDiagonal.png", AssetType.IMAGE);
		className.set ("assets/images/Road/horizBot.png", __ASSET__assets_images_road_horizbot_png);
		type.set ("assets/images/Road/horizBot.png", AssetType.IMAGE);
		className.set ("assets/images/Road/horizMid.png", __ASSET__assets_images_road_horizmid_png);
		type.set ("assets/images/Road/horizMid.png", AssetType.IMAGE);
		className.set ("assets/images/Road/horizTop.png", __ASSET__assets_images_road_horiztop_png);
		type.set ("assets/images/Road/horizTop.png", AssetType.IMAGE);
		className.set ("assets/images/Road/Intersection.png", __ASSET__assets_images_road_intersection_png);
		type.set ("assets/images/Road/Intersection.png", AssetType.IMAGE);
		className.set ("assets/images/Road/road.sai", __ASSET__assets_images_road_road_sai);
		type.set ("assets/images/Road/road.sai", AssetType.TEXT);
		className.set ("assets/images/Road/topleftdiag.png", __ASSET__assets_images_road_topleftdiag_png);
		type.set ("assets/images/Road/topleftdiag.png", AssetType.IMAGE);
		className.set ("assets/images/Road/toprightdiag.png", __ASSET__assets_images_road_toprightdiag_png);
		type.set ("assets/images/Road/toprightdiag.png", AssetType.IMAGE);
		className.set ("assets/images/Road/VertLeft.png", __ASSET__assets_images_road_vertleft_png);
		type.set ("assets/images/Road/VertLeft.png", AssetType.IMAGE);
		className.set ("assets/images/Road/VertRight.png", __ASSET__assets_images_road_vertright_png);
		type.set ("assets/images/Road/VertRight.png", AssetType.IMAGE);
		className.set ("assets/images/RoadLawnTiles.jpg", __ASSET__assets_images_roadlawntiles_jpg);
		type.set ("assets/images/RoadLawnTiles.jpg", AssetType.IMAGE);
		className.set ("assets/images/stopsign.png", __ASSET__assets_images_stopsign_png);
		type.set ("assets/images/stopsign.png", AssetType.IMAGE);
		className.set ("assets/images/Tiles.jpg", __ASSET__assets_images_tiles_jpg);
		type.set ("assets/images/Tiles.jpg", AssetType.IMAGE);
		className.set ("assets/images/tree1.png", __ASSET__assets_images_tree1_png);
		type.set ("assets/images/tree1.png", AssetType.IMAGE);
		className.set ("assets/images/tree2.png", __ASSET__assets_images_tree2_png);
		type.set ("assets/images/tree2.png", AssetType.IMAGE);
		className.set ("assets/images/TruckSprite.png", __ASSET__assets_images_trucksprite_png);
		type.set ("assets/images/TruckSprite.png", AssetType.IMAGE);
		className.set ("assets/music/Music With Filter No Sirens.wav", __ASSET__assets_music_music_with_filter_no_sirens_wav);
		type.set ("assets/music/Music With Filter No Sirens.wav", AssetType.SOUND);
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		className.set ("assets/music/Whiskey on the Mississippi.mp3", __ASSET__assets_music_whiskey_on_the_mississippi_mp3);
		type.set ("assets/music/Whiskey on the Mississippi.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Mailbox Bat Smack.wav", __ASSET__assets_sounds_mailbox_bat_smack_wav);
		type.set ("assets/sounds/Mailbox Bat Smack.wav", AssetType.SOUND);
		className.set ("assets/sounds/Mailbox Hitting Mailbox A.wav", __ASSET__assets_sounds_mailbox_hitting_mailbox_a_wav);
		type.set ("assets/sounds/Mailbox Hitting Mailbox A.wav", AssetType.SOUND);
		className.set ("assets/sounds/Mailbox Hitting Mailbox B.wav", __ASSET__assets_sounds_mailbox_hitting_mailbox_b_wav);
		type.set ("assets/sounds/Mailbox Hitting Mailbox B.wav", AssetType.SOUND);
		className.set ("assets/sounds/Mailbox Thud.wav", __ASSET__assets_sounds_mailbox_thud_wav);
		type.set ("assets/sounds/Mailbox Thud.wav", AssetType.SOUND);
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		className.set ("assets/sounds/Truck Engine Loop.wav", __ASSET__assets_sounds_truck_engine_loop_wav);
		type.set ("assets/sounds/Truck Engine Loop.wav", AssetType.SOUND);
		className.set ("assets/sounds/Truck Engine Rev Up.wav", __ASSET__assets_sounds_truck_engine_rev_up_wav);
		type.set ("assets/sounds/Truck Engine Rev Up.wav", AssetType.SOUND);
		className.set ("assets/sounds/Truck Engine Slow Down.wav", __ASSET__assets_sounds_truck_engine_slow_down_wav);
		type.set ("assets/sounds/Truck Engine Slow Down.wav", AssetType.SOUND);
		className.set ("assets/sounds/Truck Engine Slow Rev Up.wav", __ASSET__assets_sounds_truck_engine_slow_rev_up_wav);
		type.set ("assets/sounds/Truck Engine Slow Rev Up.wav", AssetType.SOUND);
		className.set ("assets/sounds/Truck Fender Rev Loop Movement.wav", __ASSET__assets_sounds_truck_fender_rev_loop_movement_wav);
		type.set ("assets/sounds/Truck Fender Rev Loop Movement.wav", AssetType.SOUND);
		className.set ("assets/sounds/Truck Fender Rev Loop Slowing Down.wav", __ASSET__assets_sounds_truck_fender_rev_loop_slowing_down_wav);
		type.set ("assets/sounds/Truck Fender Rev Loop Slowing Down.wav", AssetType.SOUND);
		className.set ("assets/sounds/Truck Fender Rev To Constant Movement.wav", __ASSET__assets_sounds_truck_fender_rev_to_constant_movement_wav);
		type.set ("assets/sounds/Truck Fender Rev To Constant Movement.wav", AssetType.SOUND);
		className.set ("assets/sounds/Truck Fender Rev.wav", __ASSET__assets_sounds_truck_fender_rev_wav);
		type.set ("assets/sounds/Truck Fender Rev.wav", AssetType.SOUND);
		className.set ("assets/sounds/Truck Start Up.wav", __ASSET__assets_sounds_truck_start_up_wav);
		type.set ("assets/sounds/Truck Start Up.wav", AssetType.SOUND);
		className.set ("assets/sounds/Truck Start.wav", __ASSET__assets_sounds_truck_start_wav);
		type.set ("assets/sounds/Truck Start.wav", AssetType.SOUND);
		className.set ("assets/To Do List Sound+Music.txt", __ASSET__assets_to_do_list_sound_music_txt);
		type.set ("assets/To Do List Sound+Music.txt", AssetType.TEXT);
		className.set ("assets/sounds/beep.mp3", __ASSET__assets_sounds_beep_mp3);
		type.set ("assets/sounds/beep.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/flixel.mp3", __ASSET__assets_sounds_flixel_mp3);
		type.set ("assets/sounds/flixel.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/beep.ogg", __ASSET__assets_sounds_beep_ogg);
		type.set ("assets/sounds/beep.ogg", AssetType.SOUND);
		className.set ("assets/sounds/flixel.ogg", __ASSET__assets_sounds_flixel_ogg);
		type.set ("assets/sounds/flixel.ogg", AssetType.SOUND);
		className.set ("assets/fonts/nokiafc22.ttf", __ASSET__assets_fonts_nokiafc22_ttf);
		type.set ("assets/fonts/nokiafc22.ttf", AssetType.FONT);
		className.set ("assets/fonts/arial.ttf", __ASSET__assets_fonts_arial_ttf);
		type.set ("assets/fonts/arial.ttf", AssetType.FONT);
		
		
		#elseif html5
		
		var id;
		id = "assets/data/data-goes-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/HouseTile.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/data/Map1.tmx";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/RoadLawnTiles.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/data/Tiles.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/BatterFrame1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/batterframe2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/batterframe3.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/batterspritesheet.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/clearlyacar.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/CutsceneTest.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/house1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/house1up (2).png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/house1up.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/house2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/house2right.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/HouseTile.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/HouseTiles.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/images-go-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/Lawn/bot.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Lawn/botandleft.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Lawn/botandright.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Lawn/botleftdiag.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Lawn/botrightdiag.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Lawn/grass.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Lawn/leftvert.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Lawn/rightvert.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Lawn/top.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Lawn/topandleft.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Lawn/topandright.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Lawn/topleftdiag.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Lawn/toprightdiag.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/mailboxframe1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/mailboxframe2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Road/backwardDiagonal.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Road/bottomleftdiag.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Road/bottomrightdiag.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Road/forwardDiagonal.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Road/horizBot.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Road/horizMid.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Road/horizTop.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Road/Intersection.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Road/road.sai";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/Road/topleftdiag.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Road/toprightdiag.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Road/VertLeft.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Road/VertRight.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/RoadLawnTiles.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/stopsign.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Tiles.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/tree1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/tree2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/TruckSprite.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/music/Music With Filter No Sirens.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/music/music-goes-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/music/Whiskey on the Mississippi.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Mailbox Bat Smack.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Mailbox Hitting Mailbox A.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Mailbox Hitting Mailbox B.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Mailbox Thud.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/sounds-go-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/sounds/Truck Engine Loop.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Truck Engine Rev Up.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Truck Engine Slow Down.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Truck Engine Slow Rev Up.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Truck Fender Rev Loop Movement.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Truck Fender Rev Loop Slowing Down.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Truck Fender Rev To Constant Movement.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Truck Fender Rev.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Truck Start Up.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Truck Start.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/To Do List Sound+Music.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/sounds/beep.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/flixel.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/beep.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/flixel.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/fonts/nokiafc22.ttf";
		className.set (id, __ASSET__assets_fonts_nokiafc22_ttf);
		
		type.set (id, AssetType.FONT);
		id = "assets/fonts/arial.ttf";
		className.set (id, __ASSET__assets_fonts_arial_ttf);
		
		type.set (id, AssetType.FONT);
		
		
		var assetsPrefix = null;
		if (ApplicationMain.config != null && Reflect.hasField (ApplicationMain.config, "assetsPrefix")) {
			assetsPrefix = ApplicationMain.config.assetsPrefix;
		}
		if (assetsPrefix != null) {
			for (k in path.keys()) {
				path.set(k, assetsPrefix + path[k]);
			}
		}
		
		#else
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		
		className.set ("assets/data/data-goes-here.txt", __ASSET__assets_data_data_goes_here_txt);
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		
		className.set ("assets/data/HouseTile.png", __ASSET__assets_data_housetile_png);
		type.set ("assets/data/HouseTile.png", AssetType.IMAGE);
		
		className.set ("assets/data/Map1.tmx", __ASSET__assets_data_map1_tmx);
		type.set ("assets/data/Map1.tmx", AssetType.TEXT);
		
		className.set ("assets/data/RoadLawnTiles.jpg", __ASSET__assets_data_roadlawntiles_jpg);
		type.set ("assets/data/RoadLawnTiles.jpg", AssetType.IMAGE);
		
		className.set ("assets/data/Tiles.jpg", __ASSET__assets_data_tiles_jpg);
		type.set ("assets/data/Tiles.jpg", AssetType.IMAGE);
		
		className.set ("assets/images/BatterFrame1.png", __ASSET__assets_images_batterframe1_png);
		type.set ("assets/images/BatterFrame1.png", AssetType.IMAGE);
		
		className.set ("assets/images/batterframe2.png", __ASSET__assets_images_batterframe2_png);
		type.set ("assets/images/batterframe2.png", AssetType.IMAGE);
		
		className.set ("assets/images/batterframe3.png", __ASSET__assets_images_batterframe3_png);
		type.set ("assets/images/batterframe3.png", AssetType.IMAGE);
		
		className.set ("assets/images/batterspritesheet.jpg", __ASSET__assets_images_batterspritesheet_jpg);
		type.set ("assets/images/batterspritesheet.jpg", AssetType.IMAGE);
		
		className.set ("assets/images/clearlyacar.png", __ASSET__assets_images_clearlyacar_png);
		type.set ("assets/images/clearlyacar.png", AssetType.IMAGE);
		
		className.set ("assets/images/CutsceneTest.png", __ASSET__assets_images_cutscenetest_png);
		type.set ("assets/images/CutsceneTest.png", AssetType.IMAGE);
		
		className.set ("assets/images/house1.png", __ASSET__assets_images_house1_png);
		type.set ("assets/images/house1.png", AssetType.IMAGE);
		
		className.set ("assets/images/house1up (2).png", __ASSET__assets_images_house1up__2__png);
		type.set ("assets/images/house1up (2).png", AssetType.IMAGE);
		
		className.set ("assets/images/house1up.png", __ASSET__assets_images_house1up_png);
		type.set ("assets/images/house1up.png", AssetType.IMAGE);
		
		className.set ("assets/images/house2.png", __ASSET__assets_images_house2_png);
		type.set ("assets/images/house2.png", AssetType.IMAGE);
		
		className.set ("assets/images/house2right.png", __ASSET__assets_images_house2right_png);
		type.set ("assets/images/house2right.png", AssetType.IMAGE);
		
		className.set ("assets/images/HouseTile.png", __ASSET__assets_images_housetile_png);
		type.set ("assets/images/HouseTile.png", AssetType.IMAGE);
		
		className.set ("assets/images/HouseTiles.png", __ASSET__assets_images_housetiles_png);
		type.set ("assets/images/HouseTiles.png", AssetType.IMAGE);
		
		className.set ("assets/images/images-go-here.txt", __ASSET__assets_images_images_go_here_txt);
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		
		className.set ("assets/images/Lawn/bot.png", __ASSET__assets_images_lawn_bot_png);
		type.set ("assets/images/Lawn/bot.png", AssetType.IMAGE);
		
		className.set ("assets/images/Lawn/botandleft.png", __ASSET__assets_images_lawn_botandleft_png);
		type.set ("assets/images/Lawn/botandleft.png", AssetType.IMAGE);
		
		className.set ("assets/images/Lawn/botandright.png", __ASSET__assets_images_lawn_botandright_png);
		type.set ("assets/images/Lawn/botandright.png", AssetType.IMAGE);
		
		className.set ("assets/images/Lawn/botleftdiag.png", __ASSET__assets_images_lawn_botleftdiag_png);
		type.set ("assets/images/Lawn/botleftdiag.png", AssetType.IMAGE);
		
		className.set ("assets/images/Lawn/botrightdiag.png", __ASSET__assets_images_lawn_botrightdiag_png);
		type.set ("assets/images/Lawn/botrightdiag.png", AssetType.IMAGE);
		
		className.set ("assets/images/Lawn/grass.png", __ASSET__assets_images_lawn_grass_png);
		type.set ("assets/images/Lawn/grass.png", AssetType.IMAGE);
		
		className.set ("assets/images/Lawn/leftvert.png", __ASSET__assets_images_lawn_leftvert_png);
		type.set ("assets/images/Lawn/leftvert.png", AssetType.IMAGE);
		
		className.set ("assets/images/Lawn/rightvert.png", __ASSET__assets_images_lawn_rightvert_png);
		type.set ("assets/images/Lawn/rightvert.png", AssetType.IMAGE);
		
		className.set ("assets/images/Lawn/top.png", __ASSET__assets_images_lawn_top_png);
		type.set ("assets/images/Lawn/top.png", AssetType.IMAGE);
		
		className.set ("assets/images/Lawn/topandleft.png", __ASSET__assets_images_lawn_topandleft_png);
		type.set ("assets/images/Lawn/topandleft.png", AssetType.IMAGE);
		
		className.set ("assets/images/Lawn/topandright.png", __ASSET__assets_images_lawn_topandright_png);
		type.set ("assets/images/Lawn/topandright.png", AssetType.IMAGE);
		
		className.set ("assets/images/Lawn/topleftdiag.png", __ASSET__assets_images_lawn_topleftdiag_png);
		type.set ("assets/images/Lawn/topleftdiag.png", AssetType.IMAGE);
		
		className.set ("assets/images/Lawn/toprightdiag.png", __ASSET__assets_images_lawn_toprightdiag_png);
		type.set ("assets/images/Lawn/toprightdiag.png", AssetType.IMAGE);
		
		className.set ("assets/images/mailboxframe1.png", __ASSET__assets_images_mailboxframe1_png);
		type.set ("assets/images/mailboxframe1.png", AssetType.IMAGE);
		
		className.set ("assets/images/mailboxframe2.png", __ASSET__assets_images_mailboxframe2_png);
		type.set ("assets/images/mailboxframe2.png", AssetType.IMAGE);
		
		className.set ("assets/images/Road/backwardDiagonal.png", __ASSET__assets_images_road_backwarddiagonal_png);
		type.set ("assets/images/Road/backwardDiagonal.png", AssetType.IMAGE);
		
		className.set ("assets/images/Road/bottomleftdiag.png", __ASSET__assets_images_road_bottomleftdiag_png);
		type.set ("assets/images/Road/bottomleftdiag.png", AssetType.IMAGE);
		
		className.set ("assets/images/Road/bottomrightdiag.png", __ASSET__assets_images_road_bottomrightdiag_png);
		type.set ("assets/images/Road/bottomrightdiag.png", AssetType.IMAGE);
		
		className.set ("assets/images/Road/forwardDiagonal.png", __ASSET__assets_images_road_forwarddiagonal_png);
		type.set ("assets/images/Road/forwardDiagonal.png", AssetType.IMAGE);
		
		className.set ("assets/images/Road/horizBot.png", __ASSET__assets_images_road_horizbot_png);
		type.set ("assets/images/Road/horizBot.png", AssetType.IMAGE);
		
		className.set ("assets/images/Road/horizMid.png", __ASSET__assets_images_road_horizmid_png);
		type.set ("assets/images/Road/horizMid.png", AssetType.IMAGE);
		
		className.set ("assets/images/Road/horizTop.png", __ASSET__assets_images_road_horiztop_png);
		type.set ("assets/images/Road/horizTop.png", AssetType.IMAGE);
		
		className.set ("assets/images/Road/Intersection.png", __ASSET__assets_images_road_intersection_png);
		type.set ("assets/images/Road/Intersection.png", AssetType.IMAGE);
		
		className.set ("assets/images/Road/road.sai", __ASSET__assets_images_road_road_sai);
		type.set ("assets/images/Road/road.sai", AssetType.TEXT);
		
		className.set ("assets/images/Road/topleftdiag.png", __ASSET__assets_images_road_topleftdiag_png);
		type.set ("assets/images/Road/topleftdiag.png", AssetType.IMAGE);
		
		className.set ("assets/images/Road/toprightdiag.png", __ASSET__assets_images_road_toprightdiag_png);
		type.set ("assets/images/Road/toprightdiag.png", AssetType.IMAGE);
		
		className.set ("assets/images/Road/VertLeft.png", __ASSET__assets_images_road_vertleft_png);
		type.set ("assets/images/Road/VertLeft.png", AssetType.IMAGE);
		
		className.set ("assets/images/Road/VertRight.png", __ASSET__assets_images_road_vertright_png);
		type.set ("assets/images/Road/VertRight.png", AssetType.IMAGE);
		
		className.set ("assets/images/RoadLawnTiles.jpg", __ASSET__assets_images_roadlawntiles_jpg);
		type.set ("assets/images/RoadLawnTiles.jpg", AssetType.IMAGE);
		
		className.set ("assets/images/stopsign.png", __ASSET__assets_images_stopsign_png);
		type.set ("assets/images/stopsign.png", AssetType.IMAGE);
		
		className.set ("assets/images/Tiles.jpg", __ASSET__assets_images_tiles_jpg);
		type.set ("assets/images/Tiles.jpg", AssetType.IMAGE);
		
		className.set ("assets/images/tree1.png", __ASSET__assets_images_tree1_png);
		type.set ("assets/images/tree1.png", AssetType.IMAGE);
		
		className.set ("assets/images/tree2.png", __ASSET__assets_images_tree2_png);
		type.set ("assets/images/tree2.png", AssetType.IMAGE);
		
		className.set ("assets/images/TruckSprite.png", __ASSET__assets_images_trucksprite_png);
		type.set ("assets/images/TruckSprite.png", AssetType.IMAGE);
		
		className.set ("assets/music/Music With Filter No Sirens.wav", __ASSET__assets_music_music_with_filter_no_sirens_wav);
		type.set ("assets/music/Music With Filter No Sirens.wav", AssetType.SOUND);
		
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		
		className.set ("assets/music/Whiskey on the Mississippi.mp3", __ASSET__assets_music_whiskey_on_the_mississippi_mp3);
		type.set ("assets/music/Whiskey on the Mississippi.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Mailbox Bat Smack.wav", __ASSET__assets_sounds_mailbox_bat_smack_wav);
		type.set ("assets/sounds/Mailbox Bat Smack.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/Mailbox Hitting Mailbox A.wav", __ASSET__assets_sounds_mailbox_hitting_mailbox_a_wav);
		type.set ("assets/sounds/Mailbox Hitting Mailbox A.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/Mailbox Hitting Mailbox B.wav", __ASSET__assets_sounds_mailbox_hitting_mailbox_b_wav);
		type.set ("assets/sounds/Mailbox Hitting Mailbox B.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/Mailbox Thud.wav", __ASSET__assets_sounds_mailbox_thud_wav);
		type.set ("assets/sounds/Mailbox Thud.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		
		className.set ("assets/sounds/Truck Engine Loop.wav", __ASSET__assets_sounds_truck_engine_loop_wav);
		type.set ("assets/sounds/Truck Engine Loop.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/Truck Engine Rev Up.wav", __ASSET__assets_sounds_truck_engine_rev_up_wav);
		type.set ("assets/sounds/Truck Engine Rev Up.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/Truck Engine Slow Down.wav", __ASSET__assets_sounds_truck_engine_slow_down_wav);
		type.set ("assets/sounds/Truck Engine Slow Down.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/Truck Engine Slow Rev Up.wav", __ASSET__assets_sounds_truck_engine_slow_rev_up_wav);
		type.set ("assets/sounds/Truck Engine Slow Rev Up.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/Truck Fender Rev Loop Movement.wav", __ASSET__assets_sounds_truck_fender_rev_loop_movement_wav);
		type.set ("assets/sounds/Truck Fender Rev Loop Movement.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/Truck Fender Rev Loop Slowing Down.wav", __ASSET__assets_sounds_truck_fender_rev_loop_slowing_down_wav);
		type.set ("assets/sounds/Truck Fender Rev Loop Slowing Down.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/Truck Fender Rev To Constant Movement.wav", __ASSET__assets_sounds_truck_fender_rev_to_constant_movement_wav);
		type.set ("assets/sounds/Truck Fender Rev To Constant Movement.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/Truck Fender Rev.wav", __ASSET__assets_sounds_truck_fender_rev_wav);
		type.set ("assets/sounds/Truck Fender Rev.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/Truck Start Up.wav", __ASSET__assets_sounds_truck_start_up_wav);
		type.set ("assets/sounds/Truck Start Up.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/Truck Start.wav", __ASSET__assets_sounds_truck_start_wav);
		type.set ("assets/sounds/Truck Start.wav", AssetType.SOUND);
		
		className.set ("assets/To Do List Sound+Music.txt", __ASSET__assets_to_do_list_sound_music_txt);
		type.set ("assets/To Do List Sound+Music.txt", AssetType.TEXT);
		
		className.set ("assets/sounds/beep.mp3", __ASSET__assets_sounds_beep_mp3);
		type.set ("assets/sounds/beep.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/flixel.mp3", __ASSET__assets_sounds_flixel_mp3);
		type.set ("assets/sounds/flixel.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/beep.ogg", __ASSET__assets_sounds_beep_ogg);
		type.set ("assets/sounds/beep.ogg", AssetType.SOUND);
		
		className.set ("assets/sounds/flixel.ogg", __ASSET__assets_sounds_flixel_ogg);
		type.set ("assets/sounds/flixel.ogg", AssetType.SOUND);
		
		className.set ("assets/fonts/nokiafc22.ttf", __ASSET__assets_fonts_nokiafc22_ttf);
		type.set ("assets/fonts/nokiafc22.ttf", AssetType.FONT);
		
		className.set ("assets/fonts/arial.ttf", __ASSET__assets_fonts_arial_ttf);
		type.set ("assets/fonts/arial.ttf", AssetType.FONT);
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						onChange.dispatch ();
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == requestedType || ((requestedType == SOUND || requestedType == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if (requestedType == BINARY && (assetType == BINARY || assetType == TEXT || assetType == IMAGE)) {
				
				return true;
				
			} else if (requestedType == null || path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (requestedType == BINARY || requestedType == null || (assetType == BINARY && requestedType == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getAudioBuffer (id:String):AudioBuffer {
		
		#if flash
		
		var buffer = new AudioBuffer ();
		buffer.src = cast (Type.createInstance (className.get (id), []), Sound);
		return buffer;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return AudioBuffer.fromBytes (cast (Type.createInstance (className.get (id), []), ByteArray));
		else return AudioBuffer.fromFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		#if flash
		
		switch (type.get (id)) {
			
			case TEXT, BINARY:
				
				return cast (Type.createInstance (className.get (id), []), ByteArray);
			
			case IMAGE:
				
				var bitmapData = cast (Type.createInstance (className.get (id), []), BitmapData);
				return bitmapData.getPixels (bitmapData.rect);
			
			default:
				
				return null;
			
		}
		
		return cast (Type.createInstance (className.get (id), []), ByteArray);
		
		#elseif html5
		
		var bytes:ByteArray = null;
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var data = loader.data;
		
		if (Std.is (data, String)) {
			
			bytes = new ByteArray ();
			bytes.writeUTFBytes (data);
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), ByteArray);
		else return ByteArray.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if flash
		
		var src = Type.createInstance (className.get (id), []);
		
		var font = new Font (src.fontName);
		font.src = src;
		return font;
		
		#elseif html5
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Font);
			
		} else {
			
			return Font.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif html5
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Image);
			
		} else {
			
			return Image.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	/*public override function getMusic (id:String):Dynamic {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		//var sound = new Sound ();
		//sound.__buffer = true;
		//sound.load (new URLRequest (path.get (id)));
		//return sound;
		return null;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}*/
	
	
	public override function getPath (id:String):String {
		
		//#if ios
		
		//return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		//#else
		
		return path.get (id);
		
		//#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if html5
		
		var bytes:ByteArray = null;
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var data = loader.data;
		
		if (Std.is (data, String)) {
			
			return cast data;
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes.readUTFBytes (bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.readUTFBytes (bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		#if flash
		
		//if (requestedType != AssetType.MUSIC && requestedType != AssetType.SOUND) {
			
			return className.exists (id);
			
		//}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:String):Array<String> {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (requestedType == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadAudioBuffer (id:String):Future<AudioBuffer> {
		
		var promise = new Promise<AudioBuffer> ();
		
		#if (flash)
		
		if (path.exists (id)) {
			
			var soundLoader = new Sound ();
			soundLoader.addEventListener (Event.COMPLETE, function (event) {
				
				var audioBuffer:AudioBuffer = new AudioBuffer();
				audioBuffer.src = event.currentTarget;
				promise.complete (audioBuffer);
				
			});
			soundLoader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			soundLoader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			soundLoader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getAudioBuffer (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<AudioBuffer> (function () return getAudioBuffer (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadBytes (id:String):Future<ByteArray> {
		
		var promise = new Promise<ByteArray> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = new ByteArray ();
				bytes.writeUTFBytes (event.currentTarget.data);
				bytes.position = 0;
				
				promise.complete (bytes);
				
			});
			loader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.dataFormat = BINARY;
			loader.onComplete.add (function (_):Void {
				
				promise.complete (loader.data);
				
			});
			loader.onProgress.add (function (_, loaded, total) {
				
				if (total == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (loaded / total);
					
				}
				
			});
			loader.onIOError.add (function (_, e) {
				
				promise.error (e);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<ByteArray> (function () return getBytes (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadImage (id:String):Future<Image> {
		
		var promise = new Promise<Image> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				promise.complete (Image.fromBitmapData (bitmapData));
				
			});
			loader.contentLoaderInfo.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.contentLoaderInfo.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var image = new js.html.Image ();
			image.onload = function (_):Void {
				
				promise.complete (Image.fromImageElement (image));
				
			}
			image.onerror = promise.error;
			image.src = path.get (id);
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Image> (function () return getImage (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = ByteArray.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = ByteArray.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = ByteArray.readFile ("assets/manifest");
			#elseif (mac && java)
			var bytes = ByteArray.readFile ("../Resources/manifest");
			#elseif ios
			var bytes = ByteArray.readFile ("assets/manifest");
			#else
			var bytes = ByteArray.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				bytes.position = 0;
				
				if (bytes.length > 0) {
					
					var data = bytes.readUTFBytes (bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								#if ios
								path.set (asset.id, "assets/" + asset.path);
								#else
								path.set (asset.id, asset.path);
								#end
								type.set (asset.id, cast (asset.type, AssetType));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	public override function loadText (id:String):Future<String> {
		
		var promise = new Promise<String> ();
		
		#if html5
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.onComplete.add (function (_):Void {
				
				promise.complete (loader.data);
				
			});
			loader.onProgress.add (function (_, loaded, total) {
				
				if (total == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (loaded / total);
					
				}
				
			});
			loader.onIOError.add (function (_, msg) promise.error (msg));
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getText (id));
			
		}
		
		#else
		
		promise.completeWith (loadBytes (id).then (function (bytes) {
			
			return new Future<String> (function () {
				
				if (bytes == null) {
					
					return null;
					
				} else {
					
					return bytes.readUTFBytes (bytes.length);
					
				}
				
			});
			
		}));
		
		#end
		
		return promise.future;
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__assets_data_data_goes_here_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_housetile_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_data_map1_tmx extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_roadlawntiles_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_data_tiles_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_batterframe1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_batterframe2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_batterframe3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_batterspritesheet_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_clearlyacar_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_cutscenetest_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_house1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_house1up__2__png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_house1up_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_house2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_house2right_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_housetile_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_housetiles_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_images_go_here_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_lawn_bot_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_lawn_botandleft_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_lawn_botandright_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_lawn_botleftdiag_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_lawn_botrightdiag_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_lawn_grass_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_lawn_leftvert_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_lawn_rightvert_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_lawn_top_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_lawn_topandleft_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_lawn_topandright_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_lawn_topleftdiag_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_lawn_toprightdiag_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_mailboxframe1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_mailboxframe2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_road_backwarddiagonal_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_road_bottomleftdiag_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_road_bottomrightdiag_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_road_forwarddiagonal_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_road_horizbot_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_road_horizmid_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_road_horiztop_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_road_intersection_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_road_road_sai extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_road_topleftdiag_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_road_toprightdiag_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_road_vertleft_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_road_vertright_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_roadlawntiles_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_stopsign_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_tiles_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_tree1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_tree2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_trucksprite_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_music_music_with_filter_no_sirens_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_music_music_goes_here_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_music_whiskey_on_the_mississippi_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_mailbox_bat_smack_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_mailbox_hitting_mailbox_a_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_mailbox_hitting_mailbox_b_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_mailbox_thud_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_truck_engine_loop_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_truck_engine_rev_up_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_truck_engine_slow_down_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_truck_engine_slow_rev_up_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_truck_fender_rev_loop_movement_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_truck_fender_rev_loop_slowing_down_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_truck_fender_rev_to_constant_movement_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_truck_fender_rev_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_truck_start_up_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_truck_start_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_to_do_list_sound_music_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_beep_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_flixel_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_beep_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_flixel_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_nokiafc22_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_arial_ttf extends null { }


#elseif html5













































































@:keep #if display private #end class __ASSET__assets_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { super (); name = "Nokia Cellphone FC Small"; } } 
@:keep #if display private #end class __ASSET__assets_fonts_arial_ttf extends lime.text.Font { public function new () { super (); name = "Arial"; } } 


#else



#if (windows || mac || linux || cpp)


@:file("assets/data/data-goes-here.txt") #if display private #end class __ASSET__assets_data_data_goes_here_txt extends lime.utils.ByteArray {}
@:image("assets/data/HouseTile.png") #if display private #end class __ASSET__assets_data_housetile_png extends lime.graphics.Image {}
@:file("assets/data/Map1.tmx") #if display private #end class __ASSET__assets_data_map1_tmx extends lime.utils.ByteArray {}
@:image("assets/data/RoadLawnTiles.jpg") #if display private #end class __ASSET__assets_data_roadlawntiles_jpg extends lime.graphics.Image {}
@:image("assets/data/Tiles.jpg") #if display private #end class __ASSET__assets_data_tiles_jpg extends lime.graphics.Image {}
@:image("assets/images/BatterFrame1.png") #if display private #end class __ASSET__assets_images_batterframe1_png extends lime.graphics.Image {}
@:image("assets/images/batterframe2.png") #if display private #end class __ASSET__assets_images_batterframe2_png extends lime.graphics.Image {}
@:image("assets/images/batterframe3.png") #if display private #end class __ASSET__assets_images_batterframe3_png extends lime.graphics.Image {}
@:image("assets/images/batterspritesheet.jpg") #if display private #end class __ASSET__assets_images_batterspritesheet_jpg extends lime.graphics.Image {}
@:image("assets/images/clearlyacar.png") #if display private #end class __ASSET__assets_images_clearlyacar_png extends lime.graphics.Image {}
@:image("assets/images/CutsceneTest.png") #if display private #end class __ASSET__assets_images_cutscenetest_png extends lime.graphics.Image {}
@:image("assets/images/house1.png") #if display private #end class __ASSET__assets_images_house1_png extends lime.graphics.Image {}
@:image("assets/images/house1up (2).png") #if display private #end class __ASSET__assets_images_house1up__2__png extends lime.graphics.Image {}
@:image("assets/images/house1up.png") #if display private #end class __ASSET__assets_images_house1up_png extends lime.graphics.Image {}
@:image("assets/images/house2.png") #if display private #end class __ASSET__assets_images_house2_png extends lime.graphics.Image {}
@:image("assets/images/house2right.png") #if display private #end class __ASSET__assets_images_house2right_png extends lime.graphics.Image {}
@:image("assets/images/HouseTile.png") #if display private #end class __ASSET__assets_images_housetile_png extends lime.graphics.Image {}
@:image("assets/images/HouseTiles.png") #if display private #end class __ASSET__assets_images_housetiles_png extends lime.graphics.Image {}
@:file("assets/images/images-go-here.txt") #if display private #end class __ASSET__assets_images_images_go_here_txt extends lime.utils.ByteArray {}
@:image("assets/images/Lawn/bot.png") #if display private #end class __ASSET__assets_images_lawn_bot_png extends lime.graphics.Image {}
@:image("assets/images/Lawn/botandleft.png") #if display private #end class __ASSET__assets_images_lawn_botandleft_png extends lime.graphics.Image {}
@:image("assets/images/Lawn/botandright.png") #if display private #end class __ASSET__assets_images_lawn_botandright_png extends lime.graphics.Image {}
@:image("assets/images/Lawn/botleftdiag.png") #if display private #end class __ASSET__assets_images_lawn_botleftdiag_png extends lime.graphics.Image {}
@:image("assets/images/Lawn/botrightdiag.png") #if display private #end class __ASSET__assets_images_lawn_botrightdiag_png extends lime.graphics.Image {}
@:image("assets/images/Lawn/grass.png") #if display private #end class __ASSET__assets_images_lawn_grass_png extends lime.graphics.Image {}
@:image("assets/images/Lawn/leftvert.png") #if display private #end class __ASSET__assets_images_lawn_leftvert_png extends lime.graphics.Image {}
@:image("assets/images/Lawn/rightvert.png") #if display private #end class __ASSET__assets_images_lawn_rightvert_png extends lime.graphics.Image {}
@:image("assets/images/Lawn/top.png") #if display private #end class __ASSET__assets_images_lawn_top_png extends lime.graphics.Image {}
@:image("assets/images/Lawn/topandleft.png") #if display private #end class __ASSET__assets_images_lawn_topandleft_png extends lime.graphics.Image {}
@:image("assets/images/Lawn/topandright.png") #if display private #end class __ASSET__assets_images_lawn_topandright_png extends lime.graphics.Image {}
@:image("assets/images/Lawn/topleftdiag.png") #if display private #end class __ASSET__assets_images_lawn_topleftdiag_png extends lime.graphics.Image {}
@:image("assets/images/Lawn/toprightdiag.png") #if display private #end class __ASSET__assets_images_lawn_toprightdiag_png extends lime.graphics.Image {}
@:image("assets/images/mailboxframe1.png") #if display private #end class __ASSET__assets_images_mailboxframe1_png extends lime.graphics.Image {}
@:image("assets/images/mailboxframe2.png") #if display private #end class __ASSET__assets_images_mailboxframe2_png extends lime.graphics.Image {}
@:image("assets/images/Road/backwardDiagonal.png") #if display private #end class __ASSET__assets_images_road_backwarddiagonal_png extends lime.graphics.Image {}
@:image("assets/images/Road/bottomleftdiag.png") #if display private #end class __ASSET__assets_images_road_bottomleftdiag_png extends lime.graphics.Image {}
@:image("assets/images/Road/bottomrightdiag.png") #if display private #end class __ASSET__assets_images_road_bottomrightdiag_png extends lime.graphics.Image {}
@:image("assets/images/Road/forwardDiagonal.png") #if display private #end class __ASSET__assets_images_road_forwarddiagonal_png extends lime.graphics.Image {}
@:image("assets/images/Road/horizBot.png") #if display private #end class __ASSET__assets_images_road_horizbot_png extends lime.graphics.Image {}
@:image("assets/images/Road/horizMid.png") #if display private #end class __ASSET__assets_images_road_horizmid_png extends lime.graphics.Image {}
@:image("assets/images/Road/horizTop.png") #if display private #end class __ASSET__assets_images_road_horiztop_png extends lime.graphics.Image {}
@:image("assets/images/Road/Intersection.png") #if display private #end class __ASSET__assets_images_road_intersection_png extends lime.graphics.Image {}
@:file("assets/images/Road/road.sai") #if display private #end class __ASSET__assets_images_road_road_sai extends lime.utils.ByteArray {}
@:image("assets/images/Road/topleftdiag.png") #if display private #end class __ASSET__assets_images_road_topleftdiag_png extends lime.graphics.Image {}
@:image("assets/images/Road/toprightdiag.png") #if display private #end class __ASSET__assets_images_road_toprightdiag_png extends lime.graphics.Image {}
@:image("assets/images/Road/VertLeft.png") #if display private #end class __ASSET__assets_images_road_vertleft_png extends lime.graphics.Image {}
@:image("assets/images/Road/VertRight.png") #if display private #end class __ASSET__assets_images_road_vertright_png extends lime.graphics.Image {}
@:image("assets/images/RoadLawnTiles.jpg") #if display private #end class __ASSET__assets_images_roadlawntiles_jpg extends lime.graphics.Image {}
@:image("assets/images/stopsign.png") #if display private #end class __ASSET__assets_images_stopsign_png extends lime.graphics.Image {}
@:image("assets/images/Tiles.jpg") #if display private #end class __ASSET__assets_images_tiles_jpg extends lime.graphics.Image {}
@:image("assets/images/tree1.png") #if display private #end class __ASSET__assets_images_tree1_png extends lime.graphics.Image {}
@:image("assets/images/tree2.png") #if display private #end class __ASSET__assets_images_tree2_png extends lime.graphics.Image {}
@:image("assets/images/TruckSprite.png") #if display private #end class __ASSET__assets_images_trucksprite_png extends lime.graphics.Image {}
@:file("assets/music/Music With Filter No Sirens.wav") #if display private #end class __ASSET__assets_music_music_with_filter_no_sirens_wav extends lime.utils.ByteArray {}
@:file("assets/music/music-goes-here.txt") #if display private #end class __ASSET__assets_music_music_goes_here_txt extends lime.utils.ByteArray {}
@:file("assets/music/Whiskey on the Mississippi.mp3") #if display private #end class __ASSET__assets_music_whiskey_on_the_mississippi_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Mailbox Bat Smack.wav") #if display private #end class __ASSET__assets_sounds_mailbox_bat_smack_wav extends lime.utils.ByteArray {}
@:file("assets/sounds/Mailbox Hitting Mailbox A.wav") #if display private #end class __ASSET__assets_sounds_mailbox_hitting_mailbox_a_wav extends lime.utils.ByteArray {}
@:file("assets/sounds/Mailbox Hitting Mailbox B.wav") #if display private #end class __ASSET__assets_sounds_mailbox_hitting_mailbox_b_wav extends lime.utils.ByteArray {}
@:file("assets/sounds/Mailbox Thud.wav") #if display private #end class __ASSET__assets_sounds_mailbox_thud_wav extends lime.utils.ByteArray {}
@:file("assets/sounds/sounds-go-here.txt") #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends lime.utils.ByteArray {}
@:file("assets/sounds/Truck Engine Loop.wav") #if display private #end class __ASSET__assets_sounds_truck_engine_loop_wav extends lime.utils.ByteArray {}
@:file("assets/sounds/Truck Engine Rev Up.wav") #if display private #end class __ASSET__assets_sounds_truck_engine_rev_up_wav extends lime.utils.ByteArray {}
@:file("assets/sounds/Truck Engine Slow Down.wav") #if display private #end class __ASSET__assets_sounds_truck_engine_slow_down_wav extends lime.utils.ByteArray {}
@:file("assets/sounds/Truck Engine Slow Rev Up.wav") #if display private #end class __ASSET__assets_sounds_truck_engine_slow_rev_up_wav extends lime.utils.ByteArray {}
@:file("assets/sounds/Truck Fender Rev Loop Movement.wav") #if display private #end class __ASSET__assets_sounds_truck_fender_rev_loop_movement_wav extends lime.utils.ByteArray {}
@:file("assets/sounds/Truck Fender Rev Loop Slowing Down.wav") #if display private #end class __ASSET__assets_sounds_truck_fender_rev_loop_slowing_down_wav extends lime.utils.ByteArray {}
@:file("assets/sounds/Truck Fender Rev To Constant Movement.wav") #if display private #end class __ASSET__assets_sounds_truck_fender_rev_to_constant_movement_wav extends lime.utils.ByteArray {}
@:file("assets/sounds/Truck Fender Rev.wav") #if display private #end class __ASSET__assets_sounds_truck_fender_rev_wav extends lime.utils.ByteArray {}
@:file("assets/sounds/Truck Start Up.wav") #if display private #end class __ASSET__assets_sounds_truck_start_up_wav extends lime.utils.ByteArray {}
@:file("assets/sounds/Truck Start.wav") #if display private #end class __ASSET__assets_sounds_truck_start_wav extends lime.utils.ByteArray {}
@:file("assets/To Do List Sound+Music.txt") #if display private #end class __ASSET__assets_to_do_list_sound_music_txt extends lime.utils.ByteArray {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/3,3,11/assets/sounds/beep.mp3") #if display private #end class __ASSET__assets_sounds_beep_mp3 extends lime.utils.ByteArray {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/3,3,11/assets/sounds/flixel.mp3") #if display private #end class __ASSET__assets_sounds_flixel_mp3 extends lime.utils.ByteArray {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/3,3,11/assets/sounds/beep.ogg") #if display private #end class __ASSET__assets_sounds_beep_ogg extends lime.utils.ByteArray {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/3,3,11/assets/sounds/flixel.ogg") #if display private #end class __ASSET__assets_sounds_flixel_ogg extends lime.utils.ByteArray {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/3,3,11/assets/fonts/nokiafc22.ttf") #if display private #end class __ASSET__assets_fonts_nokiafc22_ttf extends lime.text.Font {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/3,3,11/assets/fonts/arial.ttf") #if display private #end class __ASSET__assets_fonts_arial_ttf extends lime.text.Font {}



#end
#end

#if (openfl && !flash)
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__assets_fonts_nokiafc22_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_arial_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__assets_fonts_arial_ttf (); src = font.src; name = font.name; super (); }}

#end

#end