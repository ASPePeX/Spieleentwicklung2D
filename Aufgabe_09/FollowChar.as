package  {
	
	import flash.display.MovieClip;
	
	
	public class FollowChar extends Char {
		
		
		public function FollowChar() {
			super();
		}
		
		public function updateF(_col:Boolean, _x:int)
		{
			if ((this.x - _x) > 80)
			{
				trace("Dist:" + (this.x - _x) + ",Direction: " + this.direction_);
				direction_ = -1;
				this.x += speed * direction_;
				FC.setAction("Walk");
			}
			else if ((this.x - _x) < -80)
			{
				trace("Dist:" + (this.x - _x) + ",Direction: " + this.direction_);
				direction_ = 1;
				this.x += speed * direction_;
				FC.setAction("Walk");
			}
			else
			{
				FC.setAction("Idle");
				direction_ = 0;
			}

		}
	}
	
}
