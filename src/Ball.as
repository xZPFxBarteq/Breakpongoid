package
{
	import flash.events.TextEvent;
	import org.flixel.FlxSprite;
	import org.flixel.FlxPoint;
	import org.flixel.FlxObject;
	import Box2D.Dynamics.*;
	import Box2D.Collision.*;
	import Box2D.Collision.Shapes.*;
	import Box2D.Common.Math.*;
	
	/**
	 * ...
	 * @author matt
	 * @author barteq
	 */
	public class Ball extends GameObject implements WithBody
	{
		
		public function Ball(position:FlxPoint, world:b2World)
		{
			super(position, new FlxPoint(5, 5), world);
			makeGraphic(width, height, 0xFFFF0000);
			createBody();
		}
		
		override public function update():void
		{
			x = (body.GetPosition().x * HelloWorld.pixelMeterRatio) - width / 2;
			y = (body.GetPosition().y * HelloWorld.pixelMeterRatio) - height / 2;
			angle = body.GetAngle() * (180 / Math.PI);
			super.update();
		}
		
		public function createBody():void
		{
			var boxShape:b2PolygonShape = new b2PolygonShape();
			boxShape.SetAsBox((width / 2) / HelloWorld.pixelMeterRatio, (height / 2) / HelloWorld.pixelMeterRatio);
			
			var fixtureDefinition:b2FixtureDef = new b2FixtureDef();
			fixtureDefinition.friction = 0.0;
			fixtureDefinition.restitution = 1.0;
			fixtureDefinition.density = 0.7;			
			fixtureDefinition.shape = boxShape;			
			
			var bodyDefinition:b2BodyDef = new b2BodyDef();
			bodyDefinition.position.Set((x + (width / 2)) / HelloWorld.pixelMeterRatio, (y + (height / 2)) / HelloWorld.pixelMeterRatio);
			bodyDefinition.angle = 30 * (Math.PI / 180);
			bodyDefinition.linearVelocity = new b2Vec2(3, 3);
			bodyDefinition.type = b2Body.b2_dynamicBody;
			
			body = world.CreateBody(bodyDefinition);
			body.CreateFixture(fixtureDefinition);
		}
	
	}

}