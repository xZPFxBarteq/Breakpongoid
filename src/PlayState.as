package
{
	import org.flixel.*;
	
	/**
	 * @author barteq
	 */
	public class PlayState extends FlxState
	{
		private var player1:Player;
		private var player2:Player;
		
		private var player1Sprite:FlxSprite;
		private var player2Sprite:FlxSprite;

		
		override public function create():void
		{
			player1 = new Player();
			player2 = new Player();
			
			player1Sprite = new FlxSprite(1, 20).makeGraphic(player1.height, player1.width, 0xFFFF0000);
			player2Sprite = new FlxSprite(100, 100).makeGraphic(player2.height, player2.width, 0xFFFF0000);
			
			add(player1Sprite);
			add(player2Sprite);
		}
		override public function update():void
		{
			FlxG.collide();
			player1Sprite.acceleration.x = 0;
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
			
			super.update();
			
		}
		
	}
}