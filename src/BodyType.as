package
{
	
	/**
	 * Pseudo-enum z typami ciał obiektów.
	 * @author barteq
	 */
	public class BodyType
	{
		
		public static const PLAYER:String = "player";
		public static const BALL:String = "ball";
		public static const WALL:String = "wall";
		public static const BRICK:String = "brick";
		
		private var type:String;
		
		public function BodyType(type:String)
		{
			this.type = type;
		}
		
		public function getType():String
		{
			return type;
		}
	}

}