package  
{
	/**
	 * ...
	 * @author matt
	 */
	public class Wall {
		public var bricks:Array = new Array(); 
		
		public function Wall() {
			bricks.push(new Brick(100, 100,1),new Brick(110, 100,2));
			
		}
		
	}

}