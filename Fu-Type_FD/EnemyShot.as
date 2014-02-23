package {

	public class EnemyShot extends Enemy {

		public function EnemyShot(posx: int, posy: int) {
			this.x = posx;
			this.y = posy;
			speed = 10;
			futype.instance.PlaySoundGunshot();
		}
	}
}