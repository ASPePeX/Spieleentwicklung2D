package {

	import flash.display.MovieClip;
	import flash.display.DisplayObject;
	import flash.events.MouseEvent;
	import flash.events.KeyboardEvent;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.media.Sound;
	import flash.ui.Keyboard;

	public class futype extends MovieClip {

		private static var _instance: futype;

		var configXML: XML = new XML();
		var urlLoader: URLLoader = new URLLoader();
		var soundtrack: Sound;
		var gunshot: Sound;
		var explosion: Sound;
		var diff: int;

		var goodStuff: Array = new Array();
		var badStuff: Array = new Array();
		var score: int;

		var guntimer;
		var enemytimer;

		var gameState: Boolean;

		public function futype() {
			_instance = this;
			urlLoader.load(new URLRequest("config.xml"));
			urlLoader.addEventListener(Event.COMPLETE, processXML);
			soundtrack = new SoundTrack();
			soundtrack.play(0, 99);
			gunshot = new GunshotSound();
			explosion = new ExplosionSound();
		}

		public static function get instance(): futype {
			return _instance;
		}

		private function processXML(e: Event): void {
			configXML = new XML(e.target.data);
			guntimer = configXML.value.(@name == "gun-timer");
			enemytimer = configXML.value.(@name == "enemy-timer");
		}

		public function SetDifficulty(_diff: int) {
			diff = _diff;
		}

		public function GetDifficulty(): int {
			return diff;
		}

		public function AddGood(_object: DisplayObject) {
			goodStuff.push(_object);
		}

		public function RemGood(_object: DisplayObject) {
			for (var i: Number = 0; i < goodStuff.length; i++) {
				if (goodStuff[i] == _object) {
					goodStuff.splice(i, 1);
				}
			}
		}

		public function AddBad(_object: DisplayObject) {
			badStuff.push(_object);
		}

		public function RemBad(_object: DisplayObject) {
			for (var i: Number = 0; i < badStuff.length; i++) {
				if (badStuff[i] == _object) {
					badStuff.splice(i, 1);
				}
			}
		}

		public function CheckCollisions() {
			for each(var good in goodStuff) {
				for each(var bad in badStuff) {
					if (good.hitTestObject(bad)) {
						futype.instance.PlaySoundExplosion();
						if (good is Player) {
							good.Damage();
							bad.Destroy();
						} else {
							good.Destroy();
							score += 10
							bad.Destroy();
						}
					}
				}
			}
		}

		public function EndGame() {
			for each(var good in goodStuff) {
				good.Destroy();
			}
			for each(var bad in badStuff) {
				bad.Destroy();
			}
			gameState = false;
			score = 0;
		}

		public function GetScore(): int {
			return score;
		}

		public function PlaySoundExplosion() {
			explosion.play();
		}

		public function PlaySoundGunshot() {
			gunshot.play();
		}

		public function GetGamestate(): Boolean {
			return gameState;
		}

		public function SetGamestate(gs: Boolean) {
			gameState = gs;
		}

		public function GetGuntimer(): Number {
			return guntimer;
		}

		public function GetEnemytimer(): Number {
			return enemytimer;
		}

	}
}