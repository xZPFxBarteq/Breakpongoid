package  
{
	import org.flixel.FlxCamera;
	import flash.events.TextEvent;
	import org.flixel.FlxBasic;
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
		public static var _height:int = 20;
		public static var _width:int =10;
		
		public function Brick(x:int, y:int,id:int) {
			this.width = _width;
			this.height = _height;
			this.x = x;
			this.y = y;
			bonus = new Bonus();
			immovable = true;
			elasticity = 1;
			makeGraphic(width, height, 0xff3a43b2);
			
			
		}
		
		private function killBrick():void {
			//TODO wywolac bonus
			kill();
		}
		
		override public function update():void {
			super.update();
			
		}
	}

}