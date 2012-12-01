package  
{
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2World;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	
	/**
	 * Matka wszystkich obiektów w grze.
	 * @author barteq
	 */
	public class GameObject extends FlxSprite
	{
		
		protected var body:b2Body;
		protected var world:b2World;
		
		public function GameObject(position:FlxPoint, dimensions:FlxPoint, world:b2World ) 
		{
			super(position.x, position.y);
			this.width = dimensions.x;
			this.height = dimensions.y;
			this.world = world;
		}
		
	}

}