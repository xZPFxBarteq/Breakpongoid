package  
{
	
	import org.flixel.FlxGame;
	[SWF(width="640", height="480", backgroundColor="#000000")] //Set the size and color of the Flash file
	
	/**
	 * @author barteq
	 */
	public class HelloWorld extends FlxGame
	{
		
		public function HelloWorld() 
		{
			super(320, 240, PlayState, 2);
		}
		
	}

}