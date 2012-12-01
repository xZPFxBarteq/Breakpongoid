package  
{
	import Box2D.Dynamics.*;
	import Box2D.Collision.*;
	import Box2D.Collision.Shapes.*;
	import Box2D.Common.Math.*;
	/**
	 * ...
	 * @author matt
	 */
	public class BrickWall 
	{
		public var bricks:Array = new Array(); 
		private var world:b2World;
		
		public function BrickWall(playerId:int,world:b2World) {
			this.world = world;
			var brickId:int = 1;
			
			if (playerId == 1) {
				for (var  i:int = 15; i < (HelloWorld.windowHeight-15); i += Brick._height + 4) {
					bricks.push(new Brick(5, i, brickId, this.world));
					brickId++;
				}
			}
			else if (playerId == 2) {
				for ( var i:int = 15; i < (HelloWorld.windowHeight-15); i += Brick._height + 4) {
					bricks.push(new Brick(HelloWorld.windowWidth-Brick._width-5, i, brickId, this.world));
					brickId++;
				}
			}
		}
		
	}

}