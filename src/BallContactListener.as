package
{
	import Box2D.Dynamics.b2ContactListener;
	import Box2D.Dynamics.Contacts.b2Contact;
	
	/**
	 * ...
	 * @author barteq
	 */
	public class BallContactListener extends b2ContactListener
	{
		
		public function BallContactListener()
		{
		
		}
		
		override public function EndContact(contact:b2Contact):void
		{
			var firstObjectData:ContactData = contact.GetFixtureA().GetBody().GetUserData() as ContactData;
			var secondObjectData:ContactData = contact.GetFixtureB().GetBody().GetUserData() as ContactData;
			if (firstObjectData.getBodyType() == BodyType.BALL && secondObjectData.getBodyType() == BodyType.PLAYER)
			{
				secondObjectData.getOnContact().call();
			}
			
			if (firstObjectData.getBodyType() == BodyType.PLAYER && secondObjectData.getBodyType() == BodyType.BALL)
			{
				firstObjectData.getOnContact().call();
			}
		}
	}

}