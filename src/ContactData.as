package  
{
	/**
	 * Przetrzymuje informacje potrzebne w czasie kolizji obiektów.
	 * 
	 * @author barteq
	 */
	public class ContactData 
	{
		private var onContact:Function;
		private var bodyType:String;
		
		public function ContactData(bodyType:String, onContact:Function) 
		{
			this.bodyType = bodyType;
			this.onContact = onContact;
		}
		
		public function getBodyType():String {
			return bodyType;
		}
		
		public function getOnContact():Function {
			return onContact;
		}
	}

}