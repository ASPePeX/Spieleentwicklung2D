package  {
	
	import flash.display.MovieClip;
	
	
	public class Score extends MovieClip {
		
		public function Score(posx: int, posy: int) {
			this.x = posx;
			this.y = posy;
		}
		
		
		public function Update() {
			ScoreL.text = "Score: " + futype.instance.GetScore();
		}
	}
	
}
