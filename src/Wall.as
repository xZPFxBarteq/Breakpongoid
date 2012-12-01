package
{
	import Box2D.Dynamics.b2World;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import Box2D.Dynamics.*;
	import Box2D.Collision.*;
	import Box2D.Collision.Shapes.*;
	import Box2D.Common.Math.*;
	
	/**
	 * ...
	 * @author barteq
	 */
	public class Wall extends GameObject implements WithBody
	{
		public function Wall(position:FlxPoint, dimensions:FlxPoint, world:b2World)	{
			super(position, dimensions, world);
			makeGraphic(width, height, 0xff3a5c39);
			createBody();
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
			bodyDefinition.angle = 0;
			bodyDefinition.type = b2Body.b2_staticBody;
			
			body = world.CreateBody(bodyDefinition);
			body.CreateFixture(fixtureDefinition);
		}
	}

}
