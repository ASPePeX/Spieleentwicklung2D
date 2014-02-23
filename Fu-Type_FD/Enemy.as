package {

	import flash.display.MovieClip;

	public class Enemy extends MovieClip {

		var speed = 1;

		public function Enemy() {}

		public function Update() {
			this.x -= speed;

			if (this.x < -100) {
				Destroy();
			}
		}

		public function Destroy() {
			futype.instance.RemBad(this);
			this.parent.removeChild(this);
		}
	}
}