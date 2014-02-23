package {

	import flash.display.MovieClip;

	public class Player extends MovieClip {

		var lifes = 3;
		var movemod = 5;
		var shotTimer = 0;

		public function Player(posx: int, posy: int) {
			this.x = posx;
			this.y = posy;
		}

		public function Update() {
			this.x = Math.max(20, Math.min(530, this.x));
			this.y = Math.max(10, Math.min(390, this.y));
			if (shotTimer > 0)
				shotTimer--;
		}

		public function Move(movex: int, movey: int) {
			this.x += movex * movemod;
			this.y += movey * movemod;
		}

		public function Shoot() {
			if (shotTimer <= 0) {
				var shot = new PlayerShot(this.x, this.y);
				this.parent.addChild(shot);
				futype.instance.AddGood(shot);
				shotTimer = futype.instance.GetGuntimer();
			}
		}

		public function Damage() {
			lifes--;
			switch (lifes) {
				case 2:
					this.gotoAndStop("Med");
					break;
				case 1:
					this.gotoAndStop("Bad");
					break;
				case 0:
					Destroy();
					break;
			}
		}

		private function Destroy() {
			futype.instance.RemGood(this);
			futype.instance.EndGame();
			this.parent.removeChild(this);
		}
	}
}