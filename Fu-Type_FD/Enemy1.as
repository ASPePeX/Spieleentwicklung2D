package {

	public class Enemy1 extends Enemy {

		public function Enemy1(posx: int, posy: int) {
			this.x = posx;
			this.y = posy;
			speed = 3 + futype.instance.GetDifficulty();
		}
	}
}