package
{
	import flash.display.Graphics;
	import flash.events.TextEvent;
	import org.flixel.FlxSprite;
	import org.flixel.FlxPoint;
	import org.flixel.FlxObject;
	import org.flixel.FlxG;
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
		public var flag:int = 0;
		
		public function Ball(position:FlxPoint, world:b2World)
		{
			super(position, new FlxPoint(5, 5), world);
			makeGraphic(5, 5, 0xffff0000);
			alpha = 0.7;
			createBody();
		}
		
		override public function update():void
		{
			x = (body.GetPosition().x * HelloWorld.pixelMeterRatio) - width / 2;
			y = (body.GetPosition().y * HelloWorld.pixelMeterRatio) - height / 2;
			//trace("x: " + x + ", getposX: "+body.GetPosition().x+" + pxMtRatio: "+HelloWorld.pixelMeterRatio+", width: " + width );
			//trace("y: " + y + ", getposY: "+body.GetPosition().y+" + pxMtRatio: "+HelloWorld.pixelMeterRatio+", width: " + height );
			angle = body.GetAngle() * (180 / Math.PI);
			super.update();
		}
		
		public function createBody():void
		{
			var circleShape:b2CircleShape = new b2CircleShape();
			circleShape.SetRadius(2.5 / HelloWorld.pixelMeterRatio);
			
			var fixtureDefinition:b2FixtureDef = new b2FixtureDef();
			fixtureDefinition.friction = 0.0;
			fixtureDefinition.restitution = 1.0;
			fixtureDefinition.density = 0.7;
			fixtureDefinition.shape = circleShape;
			
			var bodyDefinition:b2BodyDef = new b2BodyDef();
			bodyDefinition.position.Set((x + (width / 2)) / HelloWorld.pixelMeterRatio, (y + (height / 2)) / HelloWorld.pixelMeterRatio);
			bodyDefinition.angle = 30 * (Math.PI / 180);
			bodyDefinition.linearVelocity = new b2Vec2(3, 3);
			bodyDefinition.angularVelocity = 1;
			bodyDefinition.type = b2Body.b2_dynamicBody;
			
			body = world.CreateBody(bodyDefinition);
			
			body.CreateFixture(fixtureDefinition);
			
			body.SetUserData(new ContactData(BodyType.BALL, this.onContact));
		}
		
		public function onContact():void
		{
		
		}
		
		public function setLinearVelocity(arg1:Number, arg2:Number):void
		{
			body.SetLinearVelocity(new b2Vec2((body.GetLinearVelocity().x + arg1), (body.GetLinearVelocity().y + arg2)));
		}
		
		public function setBiggerBall():void
		{
			scale = new FlxPoint(5, 5);
			//TODO trzeba także przeskalować body piłki, a dokładniej skasować poprzednie i utworzyć nowe o zadanej wielkości, bo Box2D nie pozwala na skalowanie.
		}
		
		public function setDefaultSizeBall():void
		{
			scale = new FlxPoint(1, 1);
			//TODO trzeba także przeskalować body piłki, a dokładniej skasować poprzednie i utworzyć nowe o zadanej wielkości, bo Box2D nie pozwala na skalowanie.
		}
	}

}