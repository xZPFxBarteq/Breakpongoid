package  
{
	
	import org.flixel.FlxGame;
	[SWF(width="640", height="480", backgroundColor="#000000")] //Set the size and color of the Flash file
	
	/**
	 * @author barteq
	 */
	public class HelloWorld extends FlxGame
	{
		public static var windowWidth:Number = 500;
		public static var windowHeight:Number = 240;
		
		public function HelloWorld() {
			super(windowWidth, windowHeight, PlayState, 2);
		}
		
	}

}