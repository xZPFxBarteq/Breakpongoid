package
{
	import mx.core.FlexSprite;
	import org.flixel.*;
	import Box2D.Dynamics.*;
	import Box2D.Collision.*;
	import Box2D.Collision.Shapes.*;
	import Box2D.Common.Math.*;
	import Box2D.Common.*;
	
	/**
	 * @author barteq
	 */
	public class PlayState extends FlxState
	{
		private var world:b2World;
		private var player1:Player;
		private var player2:Player;
		private var ball:Ball;
		//pozniej zapakowac w jakas klase:
		private var northWall:Wall;
		private var southWall:Wall;
		private var eastWall:Wall;
		private var westWall:Wall;
		
		private var timeText:FlxText;
		private var timetxt:String = "xxx";
		
		override public function create():void
		{
			world = new b2World(new b2Vec2(0, 0), true);	
			northWall = new Wall(new FlxPoint(0, 0), new FlxPoint(HelloWorld.windowWidth, 3), world);
			southWall = new Wall(new FlxPoint(0, 237), new FlxPoint(HelloWorld.windowWidth, 3), world);
			eastWall = new Wall(new FlxPoint(317, 0), new FlxPoint(3, HelloWorld.windowHeight), world);
			westWall = new Wall(new FlxPoint(0, 0), new FlxPoint(3, HelloWorld.windowHeight), world);
			player1 = new Player(new FlxPoint(10, 110), world);
			player2 = new Player(new FlxPoint(300, 110), world);
			ball = new Ball(new FlxPoint(50, 110), world);
			
			timeText = new FlxText(10, 10, 10, timetxt, true);
			
			add(northWall);
			add(southWall);
			add(eastWall);
			add(westWall);
			
			add(player1);
			add(player2);
			add(ball);
			add(timeText);
		}
		
		override public function update():void
		{
			world.Step(FlxG.elapsed, 10, 10);
			super.update();
			
			if (FlxG.keys.UP)
			{
				if (player2.y > 3)
				{
					player2.move(-3);
				}
				
			}
			
			if (FlxG.keys.DOWN)
			{
				if (player2.y < HelloWorld.windowHeight - player2.height - 3)
				{
					player2.move(3);
				}
			}
			
			if (FlxG.keys.W)
			{
				if (player1.y > 3)
				{
					player1.move(-3);
				}
			}
			
			if (FlxG.keys.S)
			{
				if (player1.y < HelloWorld.windowHeight - player1.height - 3)
				{
					player1.move(3);
				}
			}
		}
	
	}
}