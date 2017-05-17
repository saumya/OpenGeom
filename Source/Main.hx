package;


import openfl.display.Sprite;
import openfl.events.Event;
import openfl.Lib;

import openfl.geom.Point;

import components.CircleWithOnlyBorder;


class Main extends Sprite {
	
	private var cacheTime:Int;
	private var speed:Float;

	private var envSprite:Sprite;

	private var circleRadius:Int;
	private var centerPoint:Point;

	
	private var circle1:CircleWithOnlyBorder;
	private var circle2:CircleWithOnlyBorder;
	private var cMove:CircleWithOnlyBorder;
	private var counter:Float;
	
	public function new () {
		
		super ();
		
		speed = 0.3;
		cacheTime = Lib.getTimer();

		circleRadius = 100;
		counter = 0;

		addEventListener(Event.ENTER_FRAME,this_onEnterFrame);
		addEventListener(Event.ADDED_TO_STAGE,this_onAddedToStage);
	}

	private function this_onEnterFrame(event:Event):Void{
		var currentTime = Lib.getTimer();
		//update(currentTime-cacheTime);

		cacheTime = currentTime;
		
		counter+=0.1;
		/*
		var x1 = circle1.x + circleRadius * Math.cos(counter);
		var y1 = circle1.y + circleRadius * Math.sin(counter);

		var x2 = circle2.x + circleRadius * Math.cos(counter);
		var y2 = circle2.y + circleRadius * Math.sin(counter);

		cMove.x = x1;
		cMove.y = y1;
		*/

		/*
		//cMove.hitTestObject(circle2);
		//if( cMove.hitTestObject(circle2) ){
		if( circle2.hitTestPoint(x1,y1,true) ){
			trace('=======================================');
			trace(counter);
			trace('x1,y1',x1,y1);
			trace('x2,y2',x2,y2);
			trace('=========== xxxxxxxxxxxx =============');
		}
		*/

		
		
	}

	private function this_onAddedToStage(e:Event):Void{
		removeEventListener(Event.ADDED_TO_STAGE,this_onAddedToStage);
		centerPoint = new Point(stage.stageWidth/2,stage.stageHeight/2);
		construct();
	}

	private function construct():Void{
		
		// environment
		//var size = 200;
		envSprite = new Sprite();
		//envSprite.graphics.beginFill(0x222222);
		//envSprite.graphics.drawRect(0,0,size*2,size*2);
		envSprite.x = centerPoint.x;
		envSprite.y = centerPoint.y;
		addChild(envSprite);
		
		// 1-circle
		//var circle1:CircleWithOnlyBorder = new CircleWithOnlyBorder(circleRadius);
		circle1 = new CircleWithOnlyBorder(circleRadius);
		//addChild(circle1);
		//circle1.x = centerPoint.x;
		//circle1.y = centerPoint.y;

		envSprite.addChild(circle1);

		/*
		// 2-circle
		//var circle2:CircleWithOnlyBorder = new CircleWithOnlyBorder(circleRadius);
		circle2 = new CircleWithOnlyBorder(circleRadius);
		addChild(circle2);
		circle2.x = circle1.x + circleRadius;
		circle2.y = circle1.y;

		// Co-ordinates got from hitTest
		// 349.757104789173,386.742322559402
		// 350.347067140206,213.598768351489
		var p1 = new Point(349.757104789173,386.742322559402);
		var p2 = new Point(350.347067140206,213.598768351489);
		//
		// 3-circle
		var circle3:CircleWithOnlyBorder = new CircleWithOnlyBorder(circleRadius);
		addChild(circle3);
		circle3.x = p2.x;
		circle3.y = p2.y;
		

		// Movement-circle
		//var cMove:CircleWithOnlyBorder = new CircleWithOnlyBorder(4);
		cMove = new CircleWithOnlyBorder(4);
		addChild(cMove);
		//cMove.x = circle1.x + circleRadius * Math.cos(2);
		//cMove.y = circle1.y + circleRadius * Math.sin(2);//on Top point
		//cMove.y = circle1.y + circleRadius * Math.sin(45);//on Bottom point
		*/

		/*
		var circle4:CircleWithOnlyBorder = new CircleWithOnlyBorder(circleRadius/2);
		addChild(circle4);
		circle4.x = centerPoint.x + circleRadius/2;
		circle4.y = centerPoint.y;
		*/

	}

	private function update(deltaTime:Int):Void{
		/*
		// just reversing
		if (sprite.x + sprite.width >= stage.stageWidth || sprite.x < 0) {
			speed *= -1;
		}
		// animate
		sprite.x += speed * deltaTime;
		*/

		//circle3.y = circle1.y + circleRadius * Math.sin(speed * deltaTime);
		/*
		counter++;
		circle3.x = circle1.x + circleRadius * Math.cos(counter);
		circle3.y = circle1.y + circleRadius * Math.sin(counter);
		*/
	}
	
	
}