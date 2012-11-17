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
		
		private var player1Sprite:FlxSprite;
		private var player2Sprite:FlxSprite;
		private var ballSprite:FlxSprite;
		private var timer:Timer;
		private var timeText:FlxText;
		private var timetxt:String="xxx";

		override public function create():void
		{
			player1 = new Player();
			player2 = new Player();
			ball = new Ball();
			timer = new Timer(5);
			
			player1Sprite = new FlxSprite(1, 20).makeGraphic(player1.height, player1.width, 0xff3a5c39);
			player2Sprite = new FlxSprite(100, 100).makeGraphic(player2.height, player2.width, 0xFFFF0000);
			ballSprite = new FlxSprite(50, 50).makeGraphic(5, 5, 0xFFFF0000);
			timeText = new FlxText(10, 10, 10, timetxt, true);
			
			add(player1Sprite);
			add(player2Sprite);
			add(ballSprite);
			add(timeText);
			
			timer.start();
		}
		override public function update():void
		{
			//FlxG.collide();
			if (FlxG.keys.LEFT) {
				if (player1Sprite.x > 5) {
					player1.position.x = player1.position.x - 3;
					player1Sprite.x = player1.position.x;
				}
				
			}
			if (FlxG.keys.RIGHT) {
				if (player1Sprite.x < 300  ) {
					player1.position.x = player1.position.x + 3;
					player1Sprite.x = player1.position.x;
				}
				
			}
			if (FlxG.keys.UP) {
				if (player1.position.y > 3) {
					player1.position.y = player1.position.y - 3;
					player1Sprite.y = player1.position.y;
				}
				
			}
				
			if (FlxG.keys.DOWN) {
				player1.position.y = player1.position.y + 3;
				player1Sprite.y = player1.position.y;
			}
			if (timer.timeOut()) {
				ball.updatePosition();
				ballSprite.x = ball.position.x;
				ballSprite.y = ball.position.y;
				timer.start();
			}
			super.update();
			
		}
		 
		private function onDeadTimeout (timer:FlxTimer):void {
			timer.stop() ;
			ball.updatePosition();
			ballSprite.x = ball.position.x;
			ballSprite.y = ball.position.y;
			timer.start (1.0, 1, onDeadTimeout);
		}
		
	}
}