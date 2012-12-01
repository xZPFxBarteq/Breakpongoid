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
			if (contact.GetFixtureA().GetBody().GetUserData().getType() == BodyType.BALL && contact.GetFixtureB().GetBody().GetUserData().getType() == BodyType.PLAYER)
			{
				trace("PING!");
			}
			
			if (contact.GetFixtureA().GetBody().GetUserData().getType() == BodyType.PLAYER && contact.GetFixtureB().GetBody().GetUserData().getType() == BodyType.BALL)
			{
				trace("PONG!");
			}
		}
	}

}