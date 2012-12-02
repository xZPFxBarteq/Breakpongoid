package  
{
	/**
	 * ...
	 * @author matt
	 */
	public class Motion 
	{
		// Ujemne X - lewo , Y -w dol, dodatnie X - w prawo, Y - w gore.
		public var directionX:Number=1;
		public var directionY:Number = -1;
		
		// Przeskoki po X i Y.
		public var accelerationX:Number=0;
		public var accelerationY:Number=0;
		
		public function Motion(accelerationX:Number,accelerationY:Number) 
		{
			this.accelerationX = accelerationX;
			this.accelerationY = accelerationY;
		}
		
		public function changeDirectionX():void {
			this.directionX = directionX * ( -1);
		}
		
		public function changeDirectionY():void {
			this.directionY = directionY * ( -1);
		}
	}

}