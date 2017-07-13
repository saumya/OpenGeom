package;


import openfl.display.Sprite;
import openfl.display.Graphics;
import openfl.events.Event;
import openfl.Lib;

import openfl.geom.Point;

import components.circle.CircleWithOnlyBorder;
import components.circle.CircleWithFill;

// Entry app
class Nine extends Sprite {
	public function new() {
		super();
		this.addChild(new NineApp());
	}
}

// actual app
class NineApp extends Sprite {

	private var cacheTime:Int;
	private var enterFrameCounter:Int;
	
	public function new () {
		super ();

		this.enterFrameCounter = 0;
		this.cacheTime = 0;
		
		addEventListener(Event.ENTER_FRAME,this_onEnterFrame);
		addEventListener(Event.ADDED_TO_STAGE,this_onAddedToStage);
	}

	private function this_onEnterFrame(event:Event):Void{
		var currentTime = Lib.getTimer();
		update(currentTime-cacheTime);
		
		cacheTime = currentTime;
		this.enterFrameCounter ++;
	}

	private function this_onAddedToStage(e:Event):Void{
		removeEventListener(Event.ADDED_TO_STAGE,this_onAddedToStage);
		//centerPoint = new Point(stage.stageWidth/2,stage.stageHeight/2);
		construct();
	}

	private function construct():Void{
		var circle1:CircleWithOnlyBorder = new CircleWithOnlyBorder(90);
		this.addChild(circle1);
		circle1.x = this.stage.stageWidth/2;
		circle1.y = this.stage.stageHeight/2;
	}

	private function update(deltaTime:Int):Void{
		/*
		// animate
		sprite.x += speed * deltaTime;
		*/

		//circle3.y = circle1.y + circleRadius * Math.sin(speed * deltaTime);

		//trace('deltaTime:'+deltaTime);

		var num = (90/2*(deltaTime+1));
		//trace('num:'+num);
		var c2:CircleWithOnlyBorder = new CircleWithOnlyBorder(deltaTime);
		this.addChild(c2);
		c2.x = this.stage.stageWidth/2 ;
		c2.y = this.stage.stageHeight/2 ;
		
	}
	
	
}