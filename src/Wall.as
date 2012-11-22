package  
{
	/**
	 * ...
	 * @author matt
	 */
	public class Wall {
		public var bricks:Array = new Array(); 
		
		public function Wall(playerId:int) {
			var brickId:int = 1;
			if (playerId == 1) {
				for (var  i:int = 5; i < HelloWorld.windowHeight; i += Brick._height + 4) {
					bricks.push(new Brick(5, i, brickId));
					brickId++;
				}
			}
			else if (playerId == 2) {
				for ( var i:int = 5; i < HelloWorld.windowHeight; i += Brick._height + 4) {
					bricks.push(new Brick(HelloWorld.windowWidth-Brick._width-5, i, brickId));
					brickId++;
				}
			}
			
			
		}
		
	}

}