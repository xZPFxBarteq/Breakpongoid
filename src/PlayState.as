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
		
		private var timeText:FlxText;
		private var timetxt:String = "xxx";
		
		override public function create():void
		{
			player1 = new Player(1,new FlxPoint(40, 110));
			player2 = new Player(2,new FlxPoint(280, 110));
			ball = new Ball(new FlxPoint(50, 50));
			wallGroup1 = new FlxGroup();
			wallGroup1 = new FlxGroup();
			
			timeText = new FlxText(10, 10, 10, timetxt, true);
			add(player1);
			add(player2);
			add(ball);
			add(timeText);
			for (var i:int = 0; i < player1.wall.bricks.length; i++) {
				add(player1.wall.bricks[i]);
				//wallGroup1.add(player1.wall.bricks[i]);
			}
			for (var i:int = 0; i < player2.wall.bricks.length; i++) {
				add(player2.wall.bricks[i]);
				//wallGroup2.add(player2.wall.bricks[i]);
			}
			
			
		}
		private function cos():void {
			
		}
		
		override public function update():void
		{
			super.update();
			FlxG.collide();
			//FlxG.overlap(wallGroup1, ball, cos);
			//FlxG.overlap(wallGroup2, ball, cos);
			
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