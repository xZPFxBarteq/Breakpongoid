package
{
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import Box2D.Dynamics.*;
	import Box2D.Collision.*;
	import Box2D.Collision.Shapes.*;
	import Box2D.Common.Math.*;
	
	/**
	 * ...
	 * @author matt
	 */
	public class Player extends GameObject implements WithBody
	{
		public var id:int;
		public var wall:BrickWall;
		
		public function Player(position:FlxPoint, world:b2World, id:int)
		{
			super(position, new FlxPoint(10, 30), world);
			this.id = id;
			wall = new BrickWall(this.id, world);
			makeGraphic(width, height, 0xff3a5c39);
			createBody();
		}
		
		override public function update():void
		{
			x = (body.GetPosition().x * HelloWorld.pixelMeterRatio) - width / 2;
			y = (body.GetPosition().y * HelloWorld.pixelMeterRatio) - height / 2;
			if (y < 2 || y > HelloWorld.windowHeight - height - 2)
			{
				body.SetLinearVelocity(new b2Vec2(0, 0));
			}
			super.update();
		}
		
		public function move(byPixels:int):void
		{
			if (y > 2 || y < HelloWorld.windowHeight - height - 2)
			{
				body.SetLinearVelocity(new b2Vec2(0, byPixels));
			}
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
			bodyDefinition.type = b2Body.b2_kinematicBody;
			bodyDefinition.linearDamping = 1;
			bodyDefinition.allowSleep = false;
			
			body = world.CreateBody(bodyDefinition);
			body.CreateFixture(fixtureDefinition);
			
			body.SetUserData(new ContactData(BodyType.PLAYER, this.onContact));
		}
		
		public function onContact():void
		{
			trace("PING from P" + id);
		}
	
	}

}