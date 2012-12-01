package
{
	import mx.core.FlexSprite;
	import org.flixel.*;
	
	/**
	 * @author barteq
	 */
	public class PlayState extends FlxState
	{
		private var player1:Player;
		private var player2:Player;
		private var ball:Ball;
		private var wallGroup1:FlxGroup;
		private var wallGroup2:FlxGroup;
		
		private var scoreText:FlxText;
		private var score:String = "";
		
		override public function create():void {
			player1 = new Player(1,new FlxPoint(40, 110));
			player2 = new Player(2,new FlxPoint(280, 110));
			ball = new Ball(new FlxPoint(50, 50));
			wallGroup1 = new FlxGroup();
			wallGroup2 = new FlxGroup();
			
			score = player1.wall.size + " : " + player2.wall.size;
			scoreText = new FlxText(100, 10, 10, score, true);
			add(player1);
			add(player2);
			add(ball);
			add(scoreText);
			for (var i:int = 0; i < player1.wall.bricks.length; i++) {
				//add(player1.wall.bricks[i]);
				wallGroup1.add(player1.wall.bricks[i]);
			}
			for (var i:int = 0; i < player2.wall.bricks.length; i++) {
				//add(player2.wall.bricks[i]);
				wallGroup2.add(player2.wall.bricks[i]);
			}
			add(wallGroup1);
			add(wallGroup2);	
		}
		
		private function wallCollision1(target:FlxSprite, source:FlxSprite):void {
			player1.wall.size--;
			score = player1.wall.size + " : " + player2.wall.size;
			target.kill();
		}
		private function wallCollision2(target:FlxSprite, source:FlxSprite):void {
			player2.wall.size--;
			score = player1.wall.size + " : " + player2.wall.size;
			target.kill();
		}
  
		override public function update():void
		{
			super.update();
			//Zakomentowac dwie linijki to beda kolizje z rakietka
			
			FlxG.collide(wallGroup1, ball, wallCollision1);
			FlxG.collide(wallGroup2, ball, wallCollision2);
			FlxG.collide();
			       

			
			if (FlxG.keys.UP)
			{
				if (player2.y > 3)
				{
					player2.y = player2.y - 3;
					if (ball.justTouched(FlxObject.RIGHT || FlxObject.LEFT))
					{
						ball.angularVelocity += 100;
					}
				}
				
			}
			
			if (FlxG.keys.DOWN)
			{
				if (player2.y < HelloWorld.windowHeight - player2.height - 3)
				{
					player2.y = player2.y + 3;
					if (ball.justTouched(FlxObject.RIGHT || FlxObject.LEFT))
					{
						ball.angularVelocity -= 100;
					}
				}
			}
			
			if (FlxG.keys.W)
			{
				if (player1.y > 3)
				{
					player1.y = player1.y - 3;
					if (ball.justTouched(FlxObject.RIGHT || FlxObject.LEFT))
					{
						ball.angularVelocity += 100;
					}
				}
			}
			
			if (FlxG.keys.S)
			{
				if (player1.y < HelloWorld.windowHeight - player1.height - 3)
				{
					player1.y = player1.y + 3;
					if (ball.justTouched(FlxObject.RIGHT || FlxObject.LEFT))
					{
						ball.angularVelocity -= 100;
					}
				}
			}
			
		
		}
	
	}
}