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
		/*
		var circle1:CircleWithOnlyBorder = new CircleWithOnlyBorder(90);
		this.addChild(circle1);
		circle1.x = this.stage.stageWidth/2;
		circle1.y = this.stage.stageHeight/2;
		
		var centerPoint:Point = new Point(this.stage.stageWidth/2,this.stage.stageHeight/2);
		*/
		/*
		var g:Graphics = this.graphics;
		//g.beginFill(0xAAAAAA);
		
		g.lineStyle(4,0xFFFFFF);
		g.moveTo(centerPoint.x,centerPoint.y);
		
		//g.lineTo(centerPoint.x+50,centerPoint.y-100);
		//g.lineTo(centerPoint.x+0,centerPoint.y-200);
		//g.curveTo(centerPoint.x+100,centerPoint.y-300,0,0);
		
		g.curveTo(centerPoint.x+100,centerPoint.y-50,centerPoint.x,centerPoint.y-200);
		//g.moveTo(centerPoint.x+200,centerPoint.y-100);
		g.curveTo(centerPoint.x-100,centerPoint.y-50,centerPoint.x,centerPoint.y);
		*/
		/*
		var s1:Shape1 = new Shape1();
		this.addChild(s1);
		//s1.x = centerPoint.x;
		//s1.y = centerPoint.y;
		s1.setPosition(centerPoint);
		s1.rotation = 45;
		*/

		//pFactory.drawPattern(this.dContainer);
		/*
		var s:Sprite = pFactory.getPetalPattern(2);
		this.dContainer.addChild(s);
		*/
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
		
		/*
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
		*/

		/*
		//pattern:8
		var r = deltaTime;
		var radius = 60 + (20 * Math.sin(enterFrameCounter));
		var c2:CircleWithOnlyBorder = new CircleWithOnlyBorder(70);
		this.addChild(c2);
		
		//var randomNum = (100*Math.random());
		var xPos = (enterFrameCounter/2)*Math.sin(enterFrameCounter);
		var yPos = (enterFrameCounter/2)*Math.cos(enterFrameCounter);
		if (enterFrameCounter%5 == 0) {
			xPos = (-1)*xPos;
			yPos = (-1)*yPos;
		}
		
		c2.x = (this.stage.stageWidth/2)+ xPos ;
		c2.y = (this.stage.stageHeight/2)+ yPos ;
		*/

		/*
		//pattern:9
		var r = deltaTime;
		var radius = 60 + (20 * Math.sin(enterFrameCounter));
		var c2:CircleWithOnlyBorder = new CircleWithOnlyBorder(radius);
		this.addChild(c2);
		
		//var randomNum = (100*Math.random());
		var xPos = (enterFrameCounter/2)*Math.sin(enterFrameCounter);
		var yPos = (enterFrameCounter/2)*Math.cos(enterFrameCounter);
		if (enterFrameCounter%5 == 0) {
			xPos = (-1)*xPos;
			yPos = (-1)*yPos;
		}
		
		c2.x = (this.stage.stageWidth/2)+ xPos ;
		c2.y = (this.stage.stageHeight/2)+ yPos ;
		*/

		//pattern : 10
		var r:Float = deltaTime;
		var radius:Float = 10;
		var xPos:Float = 0;
		var yPos:Float = 0;

		
		var d = (10)*enterFrameCounter;
		var e = 1 * enterFrameCounter;

		
		var xx:Float = 1;
		var yy:Float = 1;
		/*
		if (enterFrameCounter % 15 == 0) {
			var s:Sprite = pFactory.getPetalPattern(2);
			s.scaleX = s.scaleY = 0.5;
			s.rotation = enterFrameCounter;
			dContainer.addChild(s);
		}
		*/
		
		/*
		if (enterFrameCounter % 45 == 0) {
			var s:Sprite = pFactory.getPetalPattern(6);
			s.scaleX = s.scaleY = 0.75;
			s.rotation = enterFrameCounter;
			dContainer.addChild(s);
		}
		
		if (enterFrameCounter % 90 == 0) {
			var s:Sprite = pFactory.getPetalPattern(8);
			s.scaleX = s.scaleY = 1.0;
			s.rotation = enterFrameCounter;
			dContainer.addChild(s);
		}
		*/


		/*
		if(enterFrameCounter%2 == 0){
			xx = Math.sin(enterFrameCounter);
			yy = Math.cos(enterFrameCounter);
		}else{
			xx = Math.cos(enterFrameCounter);
			yy = Math.sin(enterFrameCounter);
		}
		
		xPos = d * xx / 40 ;
		yPos = d * yy / 40 ;
		
		//this.lastCircleRadius = radius;
		
		var c2:CircleWithOnlyBorder = new CircleWithOnlyBorder(radius);
		this.addChild(c2);

		c2.x = (this.stage.stageWidth/2)+ xPos ;
		c2.y = (this.stage.stageHeight/2)+ yPos ;
		*/

		//var centerPoint:Point = new Point(this.stage.stageWidth/2,this.stage.stageHeight/2);
		
		/*
		xx = Math.sin(enterFrameCounter);
		yy = Math.cos(enterFrameCounter);
		xPos =  xx * 100 ;
		yPos =  yy * 100 ;
		*/

		/*
		var s1:Shape1 = new Shape1();
		//var s1:CircleWithOnlyBorder = new CircleWithOnlyBorder(40);
		//s1.scaleX = s1.scaleY = 0.6;
		//this.dContainer.addChild(s1);

		//trace(enterFrameCounter+': deltaTime='+deltaTime);

		if (enterFrameCounter % 90 == 0) {
			this.dContainer.addChild(s1);
			s1.x = 1 * ( Math.sin( enterFrameCounter ) ) ;
			s1.y = (-1) * 1 * ( Math.cos( enterFrameCounter ) ) ;
			s1.rotation = enterFrameCounter;
		}
		*/

		xx = Math.cos(enterFrameCounter);
		yy = Math.sin(enterFrameCounter);
		xPos = enterFrameCounter * xx * (1/4) ;
		yPos = enterFrameCounter * yy * (1/4) ;

		var angle:Float = enterFrameCounter/2;
		var cXX:Float = Math.cos(angle);
		var cYY:Float = Math.sin(angle);
		var cxPos:Float = angle * cXX * (1/4);
		var cyPos:Float = angle * cYY * (1/4);


		dContainer.graphics.lineStyle(1,0xFFFFFF);
		//dContainer.graphics.lineTo(xPos,yPos);
		dContainer.graphics.curveTo(cxPos,cyPos,xPos,yPos);
		dContainer.graphics.moveTo(xPos,yPos);

		

		//if (enterFrameCounter<=360) {
			//if (enterFrameCounter % 10 == 0) {
				/*
				var s1:Shape1 = new Shape1();
				//s1.setPosition(centerPoint);
				//s1.scaleX = s1.scaleY = Math.sin(enterFrameCounter);
				s1.scaleX = s1.scaleY = 0.4;
				this.dContainer.addChild(s1);

				s1.x = 100*( Math.cos(enterFrameCounter) ) ;
				s1.y = 100*( Math.sin(enterFrameCounter) ) ;
				//s1.rotation = enterFrameCounter;
				*/

				/*
				xx = Math.sin(enterFrameCounter);
				yy = Math.cos(enterFrameCounter);
				
				var s1:Shape1 = new Shape1();
				s1.x = centerPoint.x ;
				s1.y = centerPoint.y ;
				s1.rotation = enterFrameCounter;

				if(enterFrameCounter % 22.5 == 0){
					s1.scaleX = s1.scaleY = 0.6;
					this.addChild(s1);
				}
				if(enterFrameCounter % 60 == 0){
					s1.scaleX = s1.scaleY = 0.8;
					this.addChild(s1);
				}
				*/
			//} 
			//
		//}
		

		//
		//trace('enterFrameCounter=before='+enterFrameCounter);
		//this.enterFrameCounter += 1;
		//trace('enterFrameCounter=after='+enterFrameCounter);
	}
	
	
}