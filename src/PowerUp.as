package  
{
	import org.flixel.FlxPoint;
	/**
	 * ...
	 * @author dKcPL
	 */
	public class PowerUp 
	{
		private var color:Array = new Array(); 
		public function PowerUp(go, powerUpNo:int)  // konstruktor z kulką
		{
			if (go is Ball) {
				var ball:Ball = go;
				switch(powerUpNo) {
					case 0: { //normalne - reset wszystkich możliwości
						if (ball.flag == 1){
							//ball.setLinearVelocity(-10,-10); // 
							ball.flag = 0;
						}
						ball.setDefaultSizeBall();
						break;
					}
					case 1: { //zmiana prędkości na wieksza
						if (ball.flag == 0) { // ta zmienna jest, bo wywolanie tego miejsca jest powiazane z klawiszem
							// po obsludze kolizji bedzie mozna to usunac.
							ball.setLinearVelocity(20,20);
							ball.flag = 1;
						}
						break;
						
					}
					case 2: { // wielkość piłeczki do poprawy
						ball.setBiggerBall();
						break;
					}
						
				}
			}else if (go is Player) {
				// jakies tam power upy z paletką
			}
		}

	}
}