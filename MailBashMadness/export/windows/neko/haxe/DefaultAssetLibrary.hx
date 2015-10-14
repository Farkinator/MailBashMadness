#if !lime_hybrid


package;


import haxe.Timer;
import haxe.Unserializer;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.MovieClip;
import openfl.events.Event;
import openfl.text.Font;
import openfl.media.Sound;
import openfl.net.URLRequest;
import openfl.utils.ByteArray;
import openfl.Assets;

#if neko
import neko.vm.Deque;
import neko.vm.Thread;
#elseif cpp
import cpp.vm.Deque;
import cpp.vm.Thread;
#end

#if sys
import sys.FileSystem;
#end

#if ios
import openfl._legacy.utils.SystemPath;
#end


@:access(openfl.media.Sound)
class DefaultAssetLibrary extends AssetLibrary {
	
	
	private static var loaded = 0;
	private static var loading = 0;
	private static var workerIncomingQueue = new Deque<Dynamic> ();
	private static var workerResult = new Deque<Dynamic> ();
	private static var workerThread:Thread;
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		Font.registerFont (__ASSET__assets_fonts_nokiafc22_ttf);
		Font.registerFont (__ASSET__assets_fonts_arial_ttf);
		
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		
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
						
						if (eventCallback != null) {
							
							eventCallback (this, "change");
							
						}
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		
	}
	
	
	public override function exists (id:String, type:AssetType):Bool {
		
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == type || ((type == SOUND || type == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			if (type == BINARY || type == null || (assetType == BINARY && type == TEXT)) {
				
				return true;
				
			}
			
		}
		
		return false;
		
	}
	
	
	public override function getBitmapData (id:String):BitmapData {
		
		if (className.exists (id)) {
			
			return cast (Type.createInstance (className.get (id), []), BitmapData);
			
		} else {
			
			return BitmapData.load (path.get (id));
			
		}
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		if (className.exists (id)) {
			
			return cast (Type.createInstance (className.get (id), []), ByteArray);
			
		} else {
			
			return ByteArray.readFile (path.get (id));
			
		}
		
	}
	
	
	public override function getFont (id:String):Font {
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			Font.registerFont (fontClass);
			return cast (Type.createInstance (fontClass, []), Font);
			
		} else {
			
			return new Font (path.get (id));
			
		}
		
	}
	
	
	public override function getMusic (id:String):Sound {
		
		if (className.exists (id)) {
			
			return cast (Type.createInstance (className.get (id), []), Sound);
			
		} else {
			
			return new Sound (new URLRequest (path.get (id)), null, true);
			
		}
		
	}
	
	
	public override function getPath (id:String):String {
		
		#if ios
		
		return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		#else
		
		return path.get (id);
		
		#end
		
	}
	
	
	public override function getSound (id:String):Sound {
		
		if (className.exists (id)) {
			
			return cast (Type.createInstance (className.get (id), []), Sound);
			
		} else {
			
			return new Sound (new URLRequest (path.get (id)), null, type.get (id) == MUSIC);
			
		}
		
	}
	
	
	public override function getText (id:String):String {
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.readUTFBytes (bytes.length);
			
		}
		
	}
	
	
	public override function isLocal (id:String, type:AssetType):Bool {
		
		return true;
		
	}
	
	
	public override function list (type:AssetType):Array<String> {
		
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (type == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadBitmapData (id:String, handler:BitmapData -> Void):Void {
		
		__load (getBitmapData, id, handler);
		
	}
	
	
	public override function loadBytes (id:String, handler:ByteArray -> Void):Void {
		
		__load (getBytes, id, handler);
		
	}
	
	
	public override function loadFont (id:String, handler:Font -> Void):Void {
		
		__load (getFont, id, handler);
		
	}
	
	
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = ByteArray.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = ByteArray.readFile ("../res/manifest");
			#elseif emscripten
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
								
								path.set (asset.id, asset.path);
								type.set (asset.id, Type.createEnum (AssetType, asset.type));
								
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
	
	
	public override function loadMusic (id:String, handler:Sound -> Void):Void {
		
		__load (getMusic, id, handler);
		
	}
	
	
	public override function loadSound (id:String, handler:Sound -> Void):Void {
		
		__load (getSound, id, handler);
		
	}
	
	
	public override function loadText (id:String, handler:String -> Void):Void {
		
		var callback = function (bytes:ByteArray):Void {
			
			if (bytes == null) {
				
				handler (null);
				
			} else {
				
				handler (bytes.readUTFBytes (bytes.length));
				
			}
			
		}
		
		loadBytes (id, callback);
		
	}
	
	
	private static function __doWork ():Void {
		
		while (true) {
			
			var message = workerIncomingQueue.pop (true);
			
			if (message == "WORK") {
				
				var getMethod = workerIncomingQueue.pop (true);
				var id = workerIncomingQueue.pop (true);
				var handler = workerIncomingQueue.pop (true);
				
				var data = getMethod (id);
				workerResult.add ("RESULT");
				workerResult.add (data);
				workerResult.add (handler);
				
			} else if (message == "EXIT") {
				
				break;
				
			}
			
		}
		
	}
	
	
	private inline function __load<T> (getMethod:String->T, id:String, handler:T->Void):Void {
		
		workerIncomingQueue.add ("WORK");
		workerIncomingQueue.add (getMethod);
		workerIncomingQueue.add (id);
		workerIncomingQueue.add (handler);
		
		loading++;
		
	}
	
	
	public static function __poll ():Void {
		
		if (loading > loaded) {
			
			if (workerThread == null) {
				
				workerThread = Thread.create (__doWork);
				
			}
			
			var message = workerResult.pop (false);
			
			while (message == "RESULT") {
				
				loaded++;
				
				var data = workerResult.pop (true);
				var handler = workerResult.pop (true);
				
				if (handler != null) {
					
					handler (data);
					
				}
				
				message = workerResult.pop (false);
				
			}
			
		} else {
			
			if (workerThread != null) {
				
				workerIncomingQueue.add ("EXIT");
				workerThread = null;
				
			}
			
		}
		
	}
	
	
}


#if (windows || mac || linux)


@:font("C:/HaxeToolkit/haxe/lib/flixel/3,3,11/assets/fonts/nokiafc22.ttf") @:keep #if display private #end class __ASSET__assets_fonts_nokiafc22_ttf extends flash.text.Font {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/3,3,11/assets/fonts/arial.ttf") @:keep #if display private #end class __ASSET__assets_fonts_arial_ttf extends flash.text.Font {}





#else


class __ASSET__assets_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { super (); __fontPath = "assets/fonts/nokiafc22.ttf"; fontName = "Nokia Cellphone FC Small";  }}
class __ASSET__assets_fonts_arial_ttf extends openfl.text.Font { public function new () { super (); __fontPath = "assets/fonts/arial.ttf"; fontName = "Arial";  }}


#end


#else


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
		
		path.set ("assets/data/data-goes-here.txt", "assets/data/data-goes-here.txt");
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		path.set ("assets/data/HouseTile.png", "assets/data/HouseTile.png");
		type.set ("assets/data/HouseTile.png", AssetType.IMAGE);
		path.set ("assets/data/Map1.tmx", "assets/data/Map1.tmx");
		type.set ("assets/data/Map1.tmx", AssetType.TEXT);
		path.set ("assets/data/RoadLawnTiles.jpg", "assets/data/RoadLawnTiles.jpg");
		type.set ("assets/data/RoadLawnTiles.jpg", AssetType.IMAGE);
		path.set ("assets/data/Tiles.jpg", "assets/data/Tiles.jpg");
		type.set ("assets/data/Tiles.jpg", AssetType.IMAGE);
		path.set ("assets/images/BatterFrame1.png", "assets/images/BatterFrame1.png");
		type.set ("assets/images/BatterFrame1.png", AssetType.IMAGE);
		path.set ("assets/images/batterframe2.png", "assets/images/batterframe2.png");
		type.set ("assets/images/batterframe2.png", AssetType.IMAGE);
		path.set ("assets/images/batterframe3.png", "assets/images/batterframe3.png");
		type.set ("assets/images/batterframe3.png", AssetType.IMAGE);
		path.set ("assets/images/batterspritesheet.jpg", "assets/images/batterspritesheet.jpg");
		type.set ("assets/images/batterspritesheet.jpg", AssetType.IMAGE);
		path.set ("assets/images/clearlyacar.png", "assets/images/clearlyacar.png");
		type.set ("assets/images/clearlyacar.png", AssetType.IMAGE);
		path.set ("assets/images/Cutscene/Cutscene1.png", "assets/images/Cutscene/Cutscene1.png");
		type.set ("assets/images/Cutscene/Cutscene1.png", AssetType.IMAGE);
		path.set ("assets/images/Cutscene/Cutscene2.png", "assets/images/Cutscene/Cutscene2.png");
		type.set ("assets/images/Cutscene/Cutscene2.png", AssetType.IMAGE);
		path.set ("assets/images/Cutscene/Cutscene3.png", "assets/images/Cutscene/Cutscene3.png");
		type.set ("assets/images/Cutscene/Cutscene3.png", AssetType.IMAGE);
		path.set ("assets/images/Cutscene/Cutscene4.png", "assets/images/Cutscene/Cutscene4.png");
		type.set ("assets/images/Cutscene/Cutscene4.png", AssetType.IMAGE);
		path.set ("assets/images/Cutscene/Cutscene5.png", "assets/images/Cutscene/Cutscene5.png");
		type.set ("assets/images/Cutscene/Cutscene5.png", AssetType.IMAGE);
		path.set ("assets/images/CutsceneTest.png", "assets/images/CutsceneTest.png");
		type.set ("assets/images/CutsceneTest.png", AssetType.IMAGE);
		path.set ("assets/images/fix_attempt.png", "assets/images/fix_attempt.png");
		type.set ("assets/images/fix_attempt.png", AssetType.IMAGE);
		path.set ("assets/images/house1.png", "assets/images/house1.png");
		type.set ("assets/images/house1.png", AssetType.IMAGE);
		path.set ("assets/images/house1up (2).png", "assets/images/house1up (2).png");
		type.set ("assets/images/house1up (2).png", AssetType.IMAGE);
		path.set ("assets/images/house1up.png", "assets/images/house1up.png");
		type.set ("assets/images/house1up.png", AssetType.IMAGE);
		path.set ("assets/images/house2.png", "assets/images/house2.png");
		type.set ("assets/images/house2.png", AssetType.IMAGE);
		path.set ("assets/images/house2right.png", "assets/images/house2right.png");
		type.set ("assets/images/house2right.png", AssetType.IMAGE);
		path.set ("assets/images/HouseTile.png", "assets/images/HouseTile.png");
		type.set ("assets/images/HouseTile.png", AssetType.IMAGE);
		path.set ("assets/images/HouseTiles.png", "assets/images/HouseTiles.png");
		type.set ("assets/images/HouseTiles.png", AssetType.IMAGE);
		path.set ("assets/images/images-go-here.txt", "assets/images/images-go-here.txt");
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		path.set ("assets/images/Lawn/bot.png", "assets/images/Lawn/bot.png");
		type.set ("assets/images/Lawn/bot.png", AssetType.IMAGE);
		path.set ("assets/images/Lawn/botandleft.png", "assets/images/Lawn/botandleft.png");
		type.set ("assets/images/Lawn/botandleft.png", AssetType.IMAGE);
		path.set ("assets/images/Lawn/botandright.png", "assets/images/Lawn/botandright.png");
		type.set ("assets/images/Lawn/botandright.png", AssetType.IMAGE);
		path.set ("assets/images/Lawn/botleftdiag.png", "assets/images/Lawn/botleftdiag.png");
		type.set ("assets/images/Lawn/botleftdiag.png", AssetType.IMAGE);
		path.set ("assets/images/Lawn/botrightdiag.png", "assets/images/Lawn/botrightdiag.png");
		type.set ("assets/images/Lawn/botrightdiag.png", AssetType.IMAGE);
		path.set ("assets/images/Lawn/grass.png", "assets/images/Lawn/grass.png");
		type.set ("assets/images/Lawn/grass.png", AssetType.IMAGE);
		path.set ("assets/images/Lawn/leftvert.png", "assets/images/Lawn/leftvert.png");
		type.set ("assets/images/Lawn/leftvert.png", AssetType.IMAGE);
		path.set ("assets/images/Lawn/rightvert.png", "assets/images/Lawn/rightvert.png");
		type.set ("assets/images/Lawn/rightvert.png", AssetType.IMAGE);
		path.set ("assets/images/Lawn/top.png", "assets/images/Lawn/top.png");
		type.set ("assets/images/Lawn/top.png", AssetType.IMAGE);
		path.set ("assets/images/Lawn/topandleft.png", "assets/images/Lawn/topandleft.png");
		type.set ("assets/images/Lawn/topandleft.png", AssetType.IMAGE);
		path.set ("assets/images/Lawn/topandright.png", "assets/images/Lawn/topandright.png");
		type.set ("assets/images/Lawn/topandright.png", AssetType.IMAGE);
		path.set ("assets/images/Lawn/topleftdiag.png", "assets/images/Lawn/topleftdiag.png");
		type.set ("assets/images/Lawn/topleftdiag.png", AssetType.IMAGE);
		path.set ("assets/images/Lawn/toprightdiag.png", "assets/images/Lawn/toprightdiag.png");
		type.set ("assets/images/Lawn/toprightdiag.png", AssetType.IMAGE);
		path.set ("assets/images/mailboxframe1.png", "assets/images/mailboxframe1.png");
		type.set ("assets/images/mailboxframe1.png", AssetType.IMAGE);
		path.set ("assets/images/mailboxframe2.png", "assets/images/mailboxframe2.png");
		type.set ("assets/images/mailboxframe2.png", AssetType.IMAGE);
		path.set ("assets/images/opening.sai", "assets/images/opening.sai");
		type.set ("assets/images/opening.sai", AssetType.TEXT);
		path.set ("assets/images/Road/backwardDiagonal.png", "assets/images/Road/backwardDiagonal.png");
		type.set ("assets/images/Road/backwardDiagonal.png", AssetType.IMAGE);
		path.set ("assets/images/Road/bottomleftdiag.png", "assets/images/Road/bottomleftdiag.png");
		type.set ("assets/images/Road/bottomleftdiag.png", AssetType.IMAGE);
		path.set ("assets/images/Road/bottomrightdiag.png", "assets/images/Road/bottomrightdiag.png");
		type.set ("assets/images/Road/bottomrightdiag.png", AssetType.IMAGE);
		path.set ("assets/images/Road/forwardDiagonal.png", "assets/images/Road/forwardDiagonal.png");
		type.set ("assets/images/Road/forwardDiagonal.png", AssetType.IMAGE);
		path.set ("assets/images/Road/horizBot.png", "assets/images/Road/horizBot.png");
		type.set ("assets/images/Road/horizBot.png", AssetType.IMAGE);
		path.set ("assets/images/Road/horizMid.png", "assets/images/Road/horizMid.png");
		type.set ("assets/images/Road/horizMid.png", AssetType.IMAGE);
		path.set ("assets/images/Road/horizTop.png", "assets/images/Road/horizTop.png");
		type.set ("assets/images/Road/horizTop.png", AssetType.IMAGE);
		path.set ("assets/images/Road/Intersection.png", "assets/images/Road/Intersection.png");
		type.set ("assets/images/Road/Intersection.png", AssetType.IMAGE);
		path.set ("assets/images/Road/road.sai", "assets/images/Road/road.sai");
		type.set ("assets/images/Road/road.sai", AssetType.TEXT);
		path.set ("assets/images/Road/topleftdiag.png", "assets/images/Road/topleftdiag.png");
		type.set ("assets/images/Road/topleftdiag.png", AssetType.IMAGE);
		path.set ("assets/images/Road/toprightdiag.png", "assets/images/Road/toprightdiag.png");
		type.set ("assets/images/Road/toprightdiag.png", AssetType.IMAGE);
		path.set ("assets/images/Road/VertLeft.png", "assets/images/Road/VertLeft.png");
		type.set ("assets/images/Road/VertLeft.png", AssetType.IMAGE);
		path.set ("assets/images/Road/VertRight.png", "assets/images/Road/VertRight.png");
		type.set ("assets/images/Road/VertRight.png", AssetType.IMAGE);
		path.set ("assets/images/RoadLawnTiles.jpg", "assets/images/RoadLawnTiles.jpg");
		type.set ("assets/images/RoadLawnTiles.jpg", AssetType.IMAGE);
		path.set ("assets/images/speechbubbleForBatter.png", "assets/images/speechbubbleForBatter.png");
		type.set ("assets/images/speechbubbleForBatter.png", AssetType.IMAGE);
		path.set ("assets/images/speechbubbleForDriver.png", "assets/images/speechbubbleForDriver.png");
		type.set ("assets/images/speechbubbleForDriver.png", AssetType.IMAGE);
		path.set ("assets/images/speechbubbleForPassenger.png", "assets/images/speechbubbleForPassenger.png");
		type.set ("assets/images/speechbubbleForPassenger.png", AssetType.IMAGE);
		path.set ("assets/images/stopsign.png", "assets/images/stopsign.png");
		type.set ("assets/images/stopsign.png", AssetType.IMAGE);
		path.set ("assets/images/Tiles.jpg", "assets/images/Tiles.jpg");
		type.set ("assets/images/Tiles.jpg", AssetType.IMAGE);
		path.set ("assets/images/titleandcutscene.png", "assets/images/titleandcutscene.png");
		type.set ("assets/images/titleandcutscene.png", AssetType.IMAGE);
		path.set ("assets/images/tree1.png", "assets/images/tree1.png");
		type.set ("assets/images/tree1.png", AssetType.IMAGE);
		path.set ("assets/images/tree2.png", "assets/images/tree2.png");
		type.set ("assets/images/tree2.png", AssetType.IMAGE);
		path.set ("assets/images/TruckSprite.png", "assets/images/TruckSprite.png");
		type.set ("assets/images/TruckSprite.png", AssetType.IMAGE);
		path.set ("assets/music/music-goes-here.txt", "assets/music/music-goes-here.txt");
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		path.set ("assets/music/Music_1.wav", "assets/music/Music_1.wav");
		type.set ("assets/music/Music_1.wav", AssetType.SOUND);
		path.set ("assets/music/Whiskey_on_the_Mississippi.mp3", "assets/music/Whiskey_on_the_Mississippi.mp3");
		type.set ("assets/music/Whiskey_on_the_Mississippi.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/bathit.wav", "assets/sounds/bathit.wav");
		type.set ("assets/sounds/bathit.wav", AssetType.SOUND);
		path.set ("assets/sounds/batmiss.wav", "assets/sounds/batmiss.wav");
		type.set ("assets/sounds/batmiss.wav", AssetType.SOUND);
		path.set ("assets/sounds/drift.wav", "assets/sounds/drift.wav");
		type.set ("assets/sounds/drift.wav", AssetType.SOUND);
		path.set ("assets/sounds/mailhitmail.wav", "assets/sounds/mailhitmail.wav");
		type.set ("assets/sounds/mailhitmail.wav", AssetType.SOUND);
		path.set ("assets/sounds/ph.wav", "assets/sounds/ph.wav");
		type.set ("assets/sounds/ph.wav", AssetType.SOUND);
		path.set ("assets/sounds/truckhitwall.wav", "assets/sounds/truckhitwall.wav");
		type.set ("assets/sounds/truckhitwall.wav", AssetType.SOUND);
		path.set ("assets/sounds/truckloop.wav", "assets/sounds/truckloop.wav");
		type.set ("assets/sounds/truckloop.wav", AssetType.SOUND);
		path.set ("assets/sounds/truckrevup.wav", "assets/sounds/truckrevup.wav");
		type.set ("assets/sounds/truckrevup.wav", AssetType.SOUND);
		path.set ("assets/sounds/truckslow.wav", "assets/sounds/truckslow.wav");
		type.set ("assets/sounds/truckslow.wav", AssetType.SOUND);
		path.set ("assets/To Do List Sound+Music.txt", "assets/To Do List Sound+Music.txt");
		type.set ("assets/To Do List Sound+Music.txt", AssetType.TEXT);
		path.set ("assets/sounds/beep.ogg", "assets/sounds/beep.ogg");
		type.set ("assets/sounds/beep.ogg", AssetType.SOUND);
		path.set ("assets/sounds/flixel.ogg", "assets/sounds/flixel.ogg");
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
		id = "assets/images/Cutscene/Cutscene1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Cutscene/Cutscene2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Cutscene/Cutscene3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Cutscene/Cutscene4.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Cutscene/Cutscene5.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/CutsceneTest.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/fix_attempt.png";
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
		id = "assets/images/opening.sai";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
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
		id = "assets/images/speechbubbleForBatter.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/speechbubbleForDriver.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/speechbubbleForPassenger.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/stopsign.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Tiles.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/titleandcutscene.png";
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
		id = "assets/music/music-goes-here.txt";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/music/Music_1.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/music/Whiskey_on_the_Mississippi.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/bathit.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/batmiss.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/drift.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/mailhitmail.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/ph.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/truckhitwall.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/truckloop.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/truckrevup.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/truckslow.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/To Do List Sound+Music.txt";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
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
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		
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
















































































@:keep @:bind #if display private #end class __ASSET__assets_fonts_nokiafc22_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_arial_ttf extends null { }


#elseif html5
















































































@:keep #if display private #end class __ASSET__assets_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { super (); name = "Nokia Cellphone FC Small"; } } 
@:keep #if display private #end class __ASSET__assets_fonts_arial_ttf extends lime.text.Font { public function new () { super (); name = "Arial"; } } 


#else



#if (windows || mac || linux || cpp)


@:font("C:/HaxeToolkit/haxe/lib/flixel/3,3,11/assets/fonts/nokiafc22.ttf") #if display private #end class __ASSET__assets_fonts_nokiafc22_ttf extends lime.text.Font {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/3,3,11/assets/fonts/arial.ttf") #if display private #end class __ASSET__assets_fonts_arial_ttf extends lime.text.Font {}



#end
#end

#if (openfl && !flash)
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__assets_fonts_nokiafc22_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_arial_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__assets_fonts_arial_ttf (); src = font.src; name = font.name; super (); }}

#end

#end


#end