package {

	import flash.display.MovieClip;

	public class Spawner extends MovieClip {

		var timer;
		var curtimer;

		public function Spawner(posx: int, posy: int) {
			this.x = posx;
			this.y = posy;
			timer = futype.instance.GetEnemytimer();
			curtimer = timer;
		}

		function Update() {
			curtimer -= 1;
			if (curtimer <= 0) {
				curtimer = timer;
				timer -= timer / (50 - 10 * futype.instance.GetDifficulty());

				var randomy = (Math.floor(Math.random() * (380 - 20 + 1)) + 20);
				var enemy;
				if (Math.random() < 0.8) {
					enemy = new Enemy1(this.x, randomy);
				} else {
					enemy = new Enemy2(this.x, randomy);
				}
				this.parent.addChild(enemy);
				futype.instance.AddBad(enemy);
			}
		}
	}
}