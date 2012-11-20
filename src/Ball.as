package
{
	import flash.events.TextEvent;
	import org.flixel.FlxSprite;
	import org.flixel.FlxPoint;
	import org.flixel.FlxObject;
	
	/**
	 * ...
	 * @author matt
	 */
	public class Ball extends FlxSprite
	{
		
		public function Ball(position:FlxPoint)
		{
			this.width = 5;
			this.height = 5;
			this.x = position.x;
			this.y = position.y;
			this.velocity = new FlxPoint(75, 75);
			makeGraphic(width, height, 0xFFFF0000);
			elasticity = 1;
			angularVelocity = 0;
		}
		
		override public function update():void
		{
			super.update();
			
			if ((this.x <= 0) || (this.x >= HelloWorld.windowWidth - width))
				velocity.x *= -1;
			
			if ((this.y <= 0) || (this.y >= HelloWorld.windowHeight - height))
				velocity.y *= -1;
		
		}
	
	}

}