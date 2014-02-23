package {

	public class Enemy2 extends Enemy {

		var shottimer;
		var curtimer;

		public function Enemy2(posx: int, posy: int) {
			this.x = posx;
			this.y = posy;
			shottimer = 75 - 15 * futype.instance.GetDifficulty();
			curtimer = shottimer;
			speed = 1 + futype.instance.GetDifficulty();
		}

		public override function Update() {
			super.Update();

			curtimer -= 1;
			if (curtimer <= 0) {
				curtimer = shottimer;
				var shot = new EnemyShot(this.x, this.y)
				futype.instance.AddBad(shot);
				this.parent.addChild(shot);
			}
		}
	}
}