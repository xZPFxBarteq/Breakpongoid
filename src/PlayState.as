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
		private var walls:FlxGroup;
		private var ball:Ball;
		private var player1:Player;
		private var player2:Player;
		private var wallGroup1:FlxGroup;
		private var wallGroup2:FlxGroup;
		//pozniej zapakowac w jakas klase:
		private var northWall:Wall;
		private var southWall:Wall;
		private var eastWall:Wall;
		private var westWall:Wall;
		private var player1Bricks:FlxGroup;
		private var player2Bricks:FlxGroup;
		private var pow:PowerUp;
		
		private var scoreText:FlxText;
		private var score:String = "";
		
		override public function create():void
		{
			world = new b2World(new b2Vec2(0, 0), true);
			var ballContactListener:BallContactListener = new BallContactListener();
			world.SetContactListener(ballContactListener);
			
			walls = new FlxGroup();
			walls.add(new Wall(new FlxPoint(0, 0), new FlxPoint(HelloWorld.windowWidth, 3), world)); //north
			walls.add(new Wall(new FlxPoint(0, 237), new FlxPoint(HelloWorld.windowWidth, 3), world)); //south
			walls.add(new Wall(new FlxPoint(317, 0), new FlxPoint(3, HelloWorld.windowHeight), world)); //east
			walls.add(new Wall(new FlxPoint(0, 0), new FlxPoint(3, HelloWorld.windowHeight), world)); //west
			
			ball = new Ball(new FlxPoint(50, 110), world);
			
			player1 = new Player(new FlxPoint(20, 110), world, 1);
			player2 = new Player(new FlxPoint(290, 110), world, 2);
			player1Bricks = new FlxGroup();
			player2Bricks = new FlxGroup();
			
			for (var i:int = 0; i < player1.wall.bricks.length; i++)
			{
				add(player1.wall.bricks[i]);
				player1Bricks.add(player1.wall.bricks[i]);
				
				add(player2.wall.bricks[i]);
				player2Bricks.add(player2.wall.bricks[i]);
			}
			
			//score = player1.wall.size + " : " + player2.wall.size;
			scoreText = new FlxText(100, 10, 10, score, true);
			
			add(walls);
			add(ball);
			add(player1);
			add(player2);
			add(player1Bricks);
			add(player2Bricks);
			add(scoreText);
		}
		
		private function wallCollision1(target:FlxSprite, source:FlxSprite):void
		{
			//player1.wall.size--;
			//score = player1.wall.size + " : " + player2.wall.size;
			target.kill();
		}
		
		private function wallCollision2(target:FlxSprite, source:FlxSprite):void
		{
			//player2.wall.size--;
			//score = player1.wall.size + " : " + player2.wall.size;
			target.kill();
		}
		
		override public function update():void
		{
			world.Step(FlxG.elapsed, 10, 10);
			super.update();
			
			if (FlxG.keys.UP)
			{
				if (player2.y > 3)
				{
					player2.move(-4);
				}
			}
			if (FlxG.keys.DOWN)
			{
				if (player2.y < HelloWorld.windowHeight - player2.height - 3)
				{
					player2.move(4);
				}
			}
			if (FlxG.keys.justReleased("UP") || FlxG.keys.justReleased("DOWN"))
			{
				player2.move(0);
			}
			
			if (FlxG.keys.W)
			{
				if (player1.y > 3)
				{
					player1.move(-4);
				}
			}
			
			if (FlxG.keys.S)
			{
				if (player1.y < HelloWorld.windowHeight - player1.height - 3)
				{
					player1.move(4);
				}
			}
			
			if (FlxG.keys.justReleased("W") || FlxG.keys.justReleased("S"))
			{
				player1.move(0);
			}
			if (FlxG.keys.F)
			{
				pow = new PowerUp(ball, 1);
			}else if (FlxG.keys.G)
			{
				pow = new PowerUp(ball, 2);
			}
			else if (FlxG.keys.R) 
			{
				pow = new PowerUp(ball, 0);
			}
			
			
			world.ClearForces();
		}
	
	}
}