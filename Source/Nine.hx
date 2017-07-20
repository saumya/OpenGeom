package;


import openfl.display.Sprite;
import openfl.display.Graphics;
import openfl.events.Event;
import openfl.events.MouseEvent;
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

	private var isPlaying:Bool;
	
	public function new () {
		super ();

		this.enterFrameCounter = 0;
		this.cacheTime = 0;
		this.isPlaying = true;
		
		//addEventListener(Event.ENTER_FRAME,this_onEnterFrame);
		addEventListener(Event.ADDED_TO_STAGE,this_onAddedToStage);
	}

	private function this_onEnterFrame(event:Event):Void{
		if(this.isPlaying){
			var currentTime = Lib.getTimer();
			update(currentTime-cacheTime);
			
			cacheTime = currentTime;
			this.enterFrameCounter ++;
		}
	}

	private function this_onAddedToStage(e:Event):Void{
		removeEventListener(Event.ADDED_TO_STAGE,this_onAddedToStage);
		//centerPoint = new Point(stage.stageWidth/2,stage.stageHeight/2);
		//construct();
		addEventListener(Event.ENTER_FRAME,this_onEnterFrame);
		this.stage.addEventListener(MouseEvent.CLICK,onStageClick);
	}

	private function construct():Void{
		var circle1:CircleWithOnlyBorder = new CircleWithOnlyBorder(90);
		this.addChild(circle1);
		circle1.x = this.stage.stageWidth/2;
		circle1.y = this.stage.stageHeight/2;
	}

	private function onStageClick(e:MouseEvent):Void{
		this.isPlaying = !this.isPlaying;
	}

	private function update(deltaTime:Int):Void{
		/*
		// animate
		sprite.x += speed * deltaTime;
		*/

		//circle3.y = circle1.y + circleRadius * Math.sin(speed * deltaTime);

		//trace('deltaTime:'+deltaTime);

		//var num = (90/2*(deltaTime+1));
		//trace('num:'+num);

		//pattern:1
		//var c2:CircleWithOnlyBorder = new CircleWithOnlyBorder(deltaTime);
		//pattern:2
		//var c2:CircleWithOnlyBorder = new CircleWithOnlyBorder(enterFrameCounter);
		//pattern:3
		//var c2:CircleWithOnlyBorder = new CircleWithOnlyBorder(20);
		/*
		//pattern:4
		var r = 12 + 9 * Math.sin(enterFrameCounter);
		var c2:CircleWithOnlyBorder = new CircleWithOnlyBorder(r);
		*/
		/*
		//pattern:5
		var r = 12 + 9 * Math.sin(Math.random()*enterFrameCounter);
		var c2:CircleWithOnlyBorder = new CircleWithOnlyBorder(r);
		//
		this.addChild(c2);
		c2.x = (this.stage.stageWidth/2)+enterFrameCounter*Math.sin(enterFrameCounter) ;
		c2.y = (this.stage.stageHeight/2)+enterFrameCounter*Math.cos(enterFrameCounter) ;
		*/
		/*
		//pattern:6
		var r = deltaTime;
		var c2:CircleWithOnlyBorder = new CircleWithOnlyBorder(30);
		this.addChild(c2);
		c2.x = (this.stage.stageWidth/2) + enterFrameCounter * Math.sin (enterFrameCounter) ;
		c2.y = (this.stage.stageHeight/2) + enterFrameCounter * Math.cos (enterFrameCounter) ;
		*/
		
		//pattern:7
		var r = deltaTime;
		var radius = 20 * Math.sin(enterFrameCounter);
		var c2:CircleWithOnlyBorder = new CircleWithOnlyBorder(radius);
		this.addChild(c2);
		
		//var randomNum = (100*Math.random());
		var xPos = (enterFrameCounter/2)*Math.sin(enterFrameCounter);
		var yPos = (enterFrameCounter/2)*Math.cos(enterFrameCounter);
		if (enterFrameCounter%3 == 0) {
			xPos = (-1)*xPos;
			yPos = (-1)*yPos;
		}
		

		c2.x = (this.stage.stageWidth/2)+ xPos ;
		c2.y = (this.stage.stageHeight/2)+ yPos ;


		//
		this.enterFrameCounter ++;
	}
	
	
}