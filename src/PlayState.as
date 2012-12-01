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
		private var player1Bricks:FlxGroup;
		private var player2Bricks:FlxGroup;
		
		//TODO pozniej zapakowac w jakas klase:
		private var northWall:Wall;
		private var southWall:Wall;
		private var eastWall:Wall;
		private var westWall:Wall;
		
		private var scoreText:FlxText;
		private var score:String = "";
		
		override public function create():void
		{
			world = new b2World(new b2Vec2(0, 0), true);
			northWall = new Wall(new FlxPoint(0, 0), new FlxPoint(HelloWorld.windowWidth, 3), world);
			southWall = new Wall(new FlxPoint(0, 237), new FlxPoint(HelloWorld.windowWidth, 3), world);
			eastWall = new Wall(new FlxPoint(317, 0), new FlxPoint(3, HelloWorld.windowHeight), world);
			westWall = new Wall(new FlxPoint(0, 0), new FlxPoint(3, HelloWorld.windowHeight), world);
			player1 = new Player(new FlxPoint(20, 110), world, 1);
			player2 = new Player(new FlxPoint(290, 110), world, 2);
			ball = new Ball(new FlxPoint(50, 110), world);
			player1Bricks = new FlxGroup();
			player2Bricks = new FlxGroup();
			
			//score = player1.wall.size + " : " + player2.wall.size;
			scoreText = new FlxText(100, 10, 10, score, true);
			add(northWall);
			add(southWall);
			add(eastWall);
			add(westWall);
			
			add(player1);
			add(player2);
			add(ball);
			add(scoreText);
			
			for (var i:int = 0; i < player1.wall.bricks.length; i++)
			{
				add(player1.wall.bricks[i]);
				player1Bricks.add(player1.wall.bricks[i]);
				
				add(player2.wall.bricks[i]);
				player2Bricks.add(player2.wall.bricks[i]);
			}
			
			add(player1Bricks);
			add(player2Bricks);
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
			//Zakomentowac dwie linijki to beda kolizje z rakietka
			
			FlxG.collide(player1Bricks, ball, wallCollision1);
			FlxG.collide(player2Bricks, ball, wallCollision2);
			FlxG.collide();
			
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
		
			world.ClearForces();
		}
	
	}
}