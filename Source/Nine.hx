package;


import openfl.display.Sprite;
import openfl.display.Graphics;
import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.Lib;

import openfl.geom.Point;

import components.circle.CircleWithOnlyBorder;
import components.circle.CircleWithFill;

import components.shape.Shape1;
import components.OGSprite;

import util.PatternFactory;

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

	//
	private var lastCircleRadius:Float;
	//
	private var dContainer:OGSprite;
	private var pFactory:PatternFactory;
	
	public function new () {
		super ();

		this.enterFrameCounter = 0;
		this.cacheTime = 0;
		this.isPlaying = true;

		this.lastCircleRadius = 0;
		
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

		var centerPoint = new Point(stage.stageWidth/2,stage.stageHeight/2);
		
		this.dContainer = new OGSprite();
		//this.dContainer.drawCenter();
		this.dContainer.x = centerPoint.x;
		this.dContainer.y = centerPoint.y;
		addChild(dContainer);
		
		this.pFactory = new PatternFactory(this.dContainer,centerPoint);

		construct();
		
		addEventListener(Event.ENTER_FRAME,this_onEnterFrame);
		this.stage.addEventListener(MouseEvent.CLICK,onStageClick);
		
	}

	private function construct():Void{
		// Empty
	}

	private function onStageClick(e:MouseEvent):Void{
		this.isPlaying = !this.isPlaying;
	}

	private function update(deltaTime:Int):Void{
		/*
		// animate
		sprite.x += speed * deltaTime;
		*/

		//pFactory.drawPattern5(dContainer,enterFrameCounter,deltaTime);
		//pFactory.drawPattern8(dContainer,enterFrameCounter,deltaTime);
		pFactory.drawPattern9(dContainer,enterFrameCounter,deltaTime);
	}
	
	
}