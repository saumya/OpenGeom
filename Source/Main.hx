package;


import openfl.display.Sprite;
import openfl.display.Graphics;
import openfl.events.Event;
import openfl.Lib;

import openfl.geom.Point;

import components.circle.CircleWithOnlyBorder;
import components.circle.CircleWithFill;


class Main extends Sprite {
	
	private var cacheTime:Int;
	private var speed:Float;

	private var envSprite:Sprite;

	private var circleRadius:Int;
	private var centerPoint:Point;

	
	private var circle1:CircleWithOnlyBorder;
	private var circle2:CircleWithOnlyBorder;
	private var cEyeOfVesicaPiscis:CircleWithOnlyBorder;
	private var circle3:CircleWithOnlyBorder;

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
		
		counter+=0.01;
		/*
		var x1 = circle1.x + circleRadius * Math.cos(counter);
		var y1 = circle1.y + circleRadius * Math.sin(counter);

		var x2 = circle2.x + circleRadius * Math.cos(counter);
		var y2 = circle2.y + circleRadius * Math.sin(counter);
		*/
		/*
		// moving circle
		cMove.x = x1;
		cMove.y = y1;
		*/

		/*
		var gX1 = envSprite.localToGlobal(new Point(x1,y1));

		//trace('x1,y1',x1,y1);
		//trace('gX1.x,gX1.y',gX1.x,gX1.y);
		
		//cMove.hitTestObject(circle2);
		//if( cMove.hitTestObject(circle2) ){
		if( circle2.hitTestPoint(gX1.x,gX1.y,true) ){
			trace('=======================================');
			trace(counter);
			trace('x1,y1',x1,y1);
			trace('x2,y2',x2,y2);
			trace('=========== xxxxxxxxxxxx =============');
		}
		*/

		circle1.update();
		circle2.update();
		circle3.update();
		cEyeOfVesicaPiscis.update();
		
		

		
		
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
		/*
		// ===================================
		// Center Mark of the Creation
		var cLength:Int = 1;
		var gfxCS : Graphics = envSprite.graphics;
		
        gfxCS.clear();
        gfxCS.lineStyle( 2, 0xAAAAAA );

		gfxCS.lineTo(cLength,0);
        gfxCS.moveTo(0,0);
        gfxCS.lineTo(0,cLength);
        gfxCS.moveTo(0,0);
        gfxCS.lineTo( (-1*cLength),0);
        gfxCS.moveTo(0,0);
        gfxCS.lineTo(0,(-1*cLength));
		// ===================================
		*/

		// 1-circle
		circle1 = new CircleWithOnlyBorder(circleRadius);
		envSprite.addChild(circle1);
		//circle1.showCenter();
		circle1.x = (circleRadius/2)*(-1);//moving left

		// 2-circle
		//var circle2:CircleWithOnlyBorder = new CircleWithOnlyBorder(circleRadius);
		circle2 = new CircleWithOnlyBorder(circleRadius);
		envSprite.addChild(circle2);
		circle2.x = (circleRadius/2)*(1);//moving right

		// Eye of VesicaPiscis
		cEyeOfVesicaPiscis = new CircleWithOnlyBorder(circleRadius/2);
		envSprite.addChild(cEyeOfVesicaPiscis);
		
		// Co-ordinates got from hitTest
		// 349.757104789173,386.742322559402
		// 350.347067140206,213.598768351489
		//var p1 = new Point(349.757104789173,386.742322559402);
		//var p2 = new Point(350.347067140206,213.598768351489);
		var p1 = new Point(0.622025723277773,86.2404227243339); // Center
		var p2 = new Point(0.347067140205596,-86.4012316485108);
		//
		// 3-circle : Its going to be the center of the creation
		circle3 = new CircleWithOnlyBorder(circleRadius);
		envSprite.addChild(circle3);
		circle3.x = p1.x;
		circle3.y = p1.y;
		//circle3.showCenter();
		//circle2.showCenter();
		//circle1.showCenter();

		/*
		// 4-circle
		var circle4:CircleWithOnlyBorder = new CircleWithOnlyBorder(circleRadius);
		envSprite.addChild(circle4);
		circle4.x = p2.x;
		circle4.y = p2.y;
		*/
		

		/*
		// Movement-circle
		cMove = new CircleWithOnlyBorder(4);
		envSprite.addChild(cMove);
		*/
		/*
		var c:CircleWithFill = new CircleWithFill(2);
		envSprite.addChild(c);
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