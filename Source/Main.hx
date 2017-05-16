package;


import openfl.display.Sprite;
import openfl.events.Event;
import openfl.Lib;

import openfl.geom.Point;

import components.CircleWithOnlyBorder;


class Main extends Sprite {
	
	private var cacheTime:Int;
	private var speed:Float;
	//private var sprite:Sprite;
	//private var circle1:CircleWithOnlyBorder;
	private var envSprite:Sprite;

	private var circleRadius:Int;
	private var centerPoint:Point;
	
	public function new () {
		
		super ();
		
		/*
		sprite = new Sprite();
		sprite.graphics.beginFill(0xDDDDDD);
		sprite.graphics.drawRect(0,0,100,100);
		sprite.y = 50;
		addChild(sprite);
		*/
		/*
		circle1 = new CircleWithOnlyBorder(50);
		addChild(circle1);
		circle1.x = circle1.y = 0;
		*/
		speed = 0.3;
		cacheTime = Lib.getTimer();

		circleRadius = 100;

		//addEventListener(Event.ENTER_FRAME,this_onEnterFrame);
		addEventListener(Event.ADDED_TO_STAGE,this_onAddedToStage);
	}

	private function this_onEnterFrame(event:Event):Void{
		var currentTime = Lib.getTimer();
		update(currentTime-cacheTime);

		cacheTime = currentTime;
	}

	private function this_onAddedToStage(e:Event):Void{
		removeEventListener(Event.ADDED_TO_STAGE,this_onAddedToStage);
		centerPoint = new Point(stage.stageWidth/2,stage.stageHeight/2);
		construct();
	}

	private function construct():Void{
		/*
		// drawing board
		var size = 200;
		envSprite = new Sprite();
		envSprite.graphics.beginFill(0x222222);
		envSprite.graphics.drawRect(0,0,size*2,size*2);
		envSprite.y = stage.stageHeight/2 - (size);
		envSprite.x = stage.stageWidth/2 - (size);
		addChild(envSprite);
		//
		var circle1:CircleWithOnlyBorder = new CircleWithOnlyBorder(50);
		envSprite.addChild(circle1);
		circle1.x = circle1.y = stage.stageHeight/2;
		*/

		// 1-circle
		var circle1:CircleWithOnlyBorder = new CircleWithOnlyBorder(circleRadius);
		addChild(circle1);
		//circle1.x = stage.stageWidth/2;
		//circle1.y = stage.stageHeight/2;
		circle1.x = centerPoint.x - circleRadius/2;
		circle1.y = centerPoint.y;
		// 2-circle
		var circle2:CircleWithOnlyBorder = new CircleWithOnlyBorder(circleRadius);
		addChild(circle2);
		circle2.x = circle1.x + circleRadius;
		circle2.y = circle1.y;

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
	}
	
	
}