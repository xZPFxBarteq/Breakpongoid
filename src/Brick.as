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
	public class Brick extends FlxSprite
	{
		public var bonus:Bonus;
		public var id:int;
		
		public function Brick(x:int, y:int,id:int) {
			this.width = 5;
			this.height = 10;
			this.x = x;
			this.y = y;
			bonus = new Bonus();
			makeGraphic(width, height, 0xff3a43b2);
			immovable = true;
			
			
			
		}
		
	}

}