package
{
	import flash.events.TextEvent;
	import org.flixel.FlxSprite;
	import org.flixel.FlxPoint;
	
	/**
	 * ...
	 * @author matt
	 */
	public class Ball extends FlxSprite
	{
		public var motion:Motion;
		
		public function Ball(position:FlxPoint)
		{
			this.width = 5;
			this.height = 5;
			this.x = position.x;
			this.y = position.y;
			makeGraphic(width, height, 0xFFFF0000);
			motion = new Motion(3, 3);
		}
		
		public function updatePosition():void
		{
			x += motion.directionX * motion.accelerationX;
			y += motion.directionY * motion.accelerationY;
			if (x > HelloWorld.windowWidth || x < 0)
			{
				motion.changeDirectionX();
			}
			if (y > HelloWorld.windowHeight || y < 0)
			{
				motion.changeDirectionY();
			}
		}
	
	}

}