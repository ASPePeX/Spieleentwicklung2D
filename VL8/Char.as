package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	
	
	public class Char extends MovieClip {

		public var jumping = false;
		public var moving = false;
		public var speed = 3;
		public var direction_ = 0;
		public var dropspeed = 0.2;

		
		public function Char()
		{
		this.addEventListener(MouseEvent.CLICK, isClicked);
		}
		
		public function update(collision:Boolean)
		{
			//trace(dropspeed);
			this.y += dropspeed;
			dropspeed += 0.2;
			
			if (collision)
			{
				this.y -= 0.2;
				dropspeed = 0.2;
			}
			
			if ((direction_ > 0 && moving && !(this.x > stage.stageWidth)) || (direction_ < 0 && moving && !(this.x < 0)))
			{
				this.x += speed * direction_;
				this.scaleX = direction_;
			}
		
		}
		
		public function setAction(_action:String)
		{
			//trace("Start " + _action);
			if (!jumping)
			{
				switch (_action)
				{
					case "Idle" :
						gotoAndPlay("Idle");
						moving = false;
						break;
					case "Walk" :
						if (!moving)
						{
							gotoAndPlay("Walk");
							moving = true;
						}
						//x += speed;
						break;
					case "Jump" :
						gotoAndPlay("Jump");
						jumping = true;
						dropspeed = -8.0;
						this.y -= 20;
						break;
				}
			}
		}
		public function isClicked(_event:Event)
		{
				trace("----------------");
				trace(_event.type);
				trace(_event.eventPhase);
				trace(_event.target.name);
				trace(_event.currentTarget.name);
		}
	}
	
}
