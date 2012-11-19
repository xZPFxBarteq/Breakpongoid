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
		
		private var timeText:FlxText;
		private var timetxt:String = "xxx";
		
		override public function create():void
		{
			player1 = new Player(new FlxPoint(10, 110));
			player2 = new Player(new FlxPoint(300, 110));
			ball = new Ball(new FlxPoint(50, 50));
			
			timeText = new FlxText(10, 10, 10, timetxt, true);
			
			add(player1);
			add(player2);
			add(ball);
			add(timeText);
		}
		
		override public function update():void
		{
			//FlxG.collide();
			if (FlxG.keys.UP)
			{
				if (player1.y > 3)
				{
					player1.y = player1.y - 3;
				}
				
			}
			
			if (FlxG.keys.DOWN)
			{
				if (player1.y < HelloWorld.windowHeight - player1.height - 3)
				{
					player1.y = player1.y + 3;
				}
			}
			ball.updatePosition();
			super.update();
		}
	
	}
}