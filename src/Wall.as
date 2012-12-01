package  
{
	/**
	 * ...
	 * @author matt
	 */
	public class Wall {
		public var bricks:Array = new Array();
		public var size:int = 0;
		
		public function Wall(playerId:int) {
			var brickId:int = 0;
			if (playerId == 1) {
				for (var  i:int = 5; i < HelloWorld.windowHeight; i += Brick._height + 4) {
					brickId++;
					bricks.push(new Brick(5, i, brickId));
					
				}
				size = brickId;
			}
			else if (playerId == 2) {
				for ( var i:int = 5; i < HelloWorld.windowHeight; i += Brick._height + 4) {
					brickId++;
					bricks.push(new Brick(HelloWorld.windowWidth-Brick._width-5, i, brickId));
					
				}
				size = brickId;
			}
			
			
		}
		
	}

}