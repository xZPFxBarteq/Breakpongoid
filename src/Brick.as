package
{
	import org.flixel.FlxCamera;
	import flash.events.TextEvent;
	import org.flixel.FlxBasic;
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
	 */
	public class Brick extends GameObject implements WithBody
	{
		public var bonus:Bonus;
		public var id:int;
		public static var _height:int = 20;
		public static var _width:int = 10;
		
		public function Brick(x:int, y:int, id:int, world:b2World)
		{
			super(new FlxPoint(x, y), new FlxPoint(_width, _height), world);
			bonus = new Bonus();
			immovable = true;
			elasticity = 1;
			makeGraphic(width, height, 0xff3a43b2);
			createBody();
		}
		
		public function createBody():void
		{
			var boxShape:b2PolygonShape = new b2PolygonShape();
			boxShape.SetAsBox((width / 2) / HelloWorld.pixelMeterRatio, (height / 2) / HelloWorld.pixelMeterRatio);
			
			var fixtureDefinition:b2FixtureDef = new b2FixtureDef();
			fixtureDefinition.friction = 0.0;
			fixtureDefinition.restitution = 1.0;
			fixtureDefinition.density = 1.0;
			fixtureDefinition.shape = boxShape;
			
			var bodyDefinition:b2BodyDef = new b2BodyDef();
			bodyDefinition.position.Set((x + (width / 2)) / HelloWorld.pixelMeterRatio, (y + (height / 2)) / HelloWorld.pixelMeterRatio);
			bodyDefinition.angle = 0;
			bodyDefinition.type = b2Body.b2_staticBody;
			
			body = world.CreateBody(bodyDefinition);
			body.CreateFixture(fixtureDefinition);
			
			body.SetUserData(new BodyType(BodyType.BRICK));
		}
	
	/*private function killBrick():void {
	   //TODO wywolac bonus
	   kill();
	   }
	
	   override public function update():void {
	   super.update();
	
	 }*/
	}

}