package
{
	import Box2D.Dynamics.b2Body;
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
			var firstBody:b2Body = contact.GetFixtureA().GetBody();
			var firstObjectData:ContactData = firstBody.GetUserData() as ContactData;
			var secondBody:b2Body = contact.GetFixtureB().GetBody();
			var secondObjectData:ContactData = secondBody.GetUserData() as ContactData;
			
			if (firstObjectData.getBodyType() == BodyType.BALL && secondObjectData.getBodyType() == BodyType.PLAYER)
			{
				if (secondBody.GetLinearVelocity().y > 0) {
					//porusza się w dół
					firstBody.SetAngularVelocity(firstBody.GetAngularVelocity() + 1);
				} else if (secondBody.GetLinearVelocity().y < 0) {
					//porusza się w górę
					firstBody.SetAngularVelocity(firstBody.GetAngularVelocity() - 1);
				}
				secondObjectData.getOnContact().call();
			}
			else if (firstObjectData.getBodyType() == BodyType.PLAYER && secondObjectData.getBodyType() == BodyType.BALL)
			{
				if (firstBody.GetLinearVelocity().y > 0) {
					//porusza się w dół
					secondBody.SetAngularVelocity(secondBody.GetAngularVelocity() + 1);
				} else if (firstBody.GetLinearVelocity().y < 0) {					
					//porusza się w górę
					secondBody.SetAngularVelocity(secondBody.GetAngularVelocity() - 1);
				}
				firstObjectData.getOnContact().call();
			}
			else if (firstObjectData.getBodyType() == BodyType.BALL && secondObjectData.getBodyType() == BodyType.BRICK)
			{
				secondObjectData.getOnContact().call();
			}
			else if (firstObjectData.getBodyType() == BodyType.BRICK && secondObjectData.getBodyType() == BodyType.BALL)
			{
				firstObjectData.getOnContact().call();
			}
		}
	}

}