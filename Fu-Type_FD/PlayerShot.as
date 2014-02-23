package {

	import flash.display.MovieClip;


	public class PlayerShot extends MovieClip {

		var speed;

		public function PlayerShot(posx: int, posy: int) {
			this.x = posx;
			this.y = posy;
			speed = 10;
			futype.instance.PlaySoundGunshot();
		}

		public function Update() {
			this.x += speed;

			if (this.x > 600) {
				Destroy();
			}

		}
		
		public function Destroy() {
				futype.instance.RemGood(this);
				this.parent.removeChild(this);
		}
	}

}