package  
{
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author matt
	 */
	public class Player extends FlxSprite
	{
		
		public function Player(position:FlxPoint) 
		{
			this.width = 10;
			this.height = 30;
			this.x = position.x;
			this.y = position.y;			
			makeGraphic(width, height, 0xff3a5c39);
			immovable = true;
			elasticity = 1;
		}
		
	}

}