package  
{
	import flash.events.TextEvent;
	/**
	 * ...
	 * @author matt
	 */
	public class Ball 
	{
		public var position:Position;
		public var motion:Motion;
		
		//public var color:
		
		public function Ball() 
		{
			position = new Position(50, 50);
			motion = new Motion(6,6);
		}
		
		public function updatePosition():void {
			position.x = position.x + motion.directionX * motion.accelerationX;
			position.y = position.y + motion.directionY * motion.accelerationY;
			if (position.x > HelloWorld.windowWidgh || position.x < 5) {
				motion.changeDirectionX();
			}
			if (position.y > HelloWorld.windowHeight || position.y < 10 ) {
				motion.changeDirectionY();
			}
		}
		
	}

}