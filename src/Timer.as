package  
{
	import flash.utils.getTimer;
	import flash.utils.Timer;
	/**
	 * ...
	 * @author matt
	 */
	public class Timer 
	{
		public var time:int;
		//ms
		public var duration:int;
		
		public function Timer(duration:int) 
		{
			this.duration = duration;		
		}
		public function start(): void {
			time = flash.utils.getTimer();
		}
		
		public function timeOut():Boolean  {

			if ( (getTimer() - time) > (duration)) {
				return true;
			}else {
				return false;
			}
		}
		
	}

}