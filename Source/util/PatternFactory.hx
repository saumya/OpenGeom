//
package util;

import openfl.display.Sprite;
import openfl.display.Graphics;

import openfl.geom.Point;

import components.shape.Shape1;
import components.circle.CircleWithFill;

class PatternFactory {
	
	private var sBoard:Sprite;
	private var pCenter:Point;

	//draw
	private var lastPoint:Point;

	public function new(sCanvas:Sprite,center:Point) {
		//pCenter = new Point(0,0);
		sBoard = sCanvas;
		pCenter = center;
		//
		lastPoint = new Point(0,0);
	}
	//must be called after drawPattern() else it will return a blank Sprite
	public function getPattern():Sprite{
		return sBoard;
	}
	public function drawPattern(s:Sprite):Void{
		sBoard.addChild( getPetalPattern(4) );		
	}
	// n Petals
	public function getPetalPattern(petals:Int=2):Sprite{
		
		var s:Sprite = new Sprite();
		var r:Float = 0;

		var devideBy:Float = 360/petals;

		for (i in 0 ... 360) {
			var s1:Shape1 = new Shape1();
			if (i%devideBy==0) {
				s1.x = r * Math.cos(i);
				s1.y = r * Math.sin(i);
				s1.rotation = i;
				s.addChild(s1);
			}
		}

		return s;
	}
	// Generic Pattern
	public function drawPattern1(dContainer:Sprite,enterFrameCounter:Int,deltaTime:Int):Void{

		var r:Float = deltaTime;
		var radius:Float = 10;
		var xPos:Float = 0;
		var yPos:Float = 0;
		
		var d = (10)*enterFrameCounter;
		var e = 1 * enterFrameCounter;

		
		var xx:Float = 1;
		var yy:Float = 1;

		var radianAngle : Float = enterFrameCounter * (180/Math.PI) ;

		xx = Math.cos(radianAngle);
		yy = Math.sin(radianAngle);
		xPos = radianAngle * xx * (1/100) ;
		yPos = radianAngle * yy * (1/100) ;

		var angle:Float = radianAngle/2;
		var cXX:Float = Math.cos(angle);
		var cYY:Float = Math.sin(angle);
		var cxPos:Float = radianAngle * cXX * (1/1000);
		var cyPos:Float = radianAngle * cYY * (1/1000);


		dContainer.graphics.lineStyle(1,0xFFFFFF);
		//dContainer.graphics.lineTo(xPos,yPos);
		dContainer.graphics.curveTo(cxPos,cyPos,xPos,yPos);
		dContainer.graphics.moveTo(xPos,yPos);
	}
	public function drawPattern2(dContainer:Sprite,enterFrameCounter:Int,deltaTime:Int):Void{

		var r:Float = deltaTime;
		//var radius:Float = 10;
		var mi:Float = (1/100);
		
		var d = (10)*enterFrameCounter;
		var e = 1 * enterFrameCounter;

		var radianAngle : Float = enterFrameCounter * (180/Math.PI) ;

		var xx:Float = Math.cos(radianAngle);
		var yy:Float = Math.sin(radianAngle);
		var xPos:Float = radianAngle * mi * xx  ;
		var yPos:Float = radianAngle * mi * yy  ;
		
		var halfAngle:Float = radianAngle/2;

		var cXX:Float = Math.cos(halfAngle);
		var cYY:Float = Math.sin(halfAngle);
		var cxPos:Float = radianAngle * mi * xx * 3/4 ;
		var cyPos:Float = radianAngle * mi * yy * 3/4 ;
		
		//cxPos = xPos*1.1;
		//cyPos = yPos*1.1;
		
		/*
		var cxPos:Float = ( xPos - lastPoint.x ) / 2 ;
		var cyPos:Float = ( yPos - lastPoint.y ) / 2 ;
		*/

		/*
		var c1:CircleWithFill = new CircleWithFill(1,0xFF0000);
		dContainer.addChild(c1);
		c1.x = xPos;
		c1.y = yPos;

		var c2:CircleWithFill = new CircleWithFill(2,0x00FF00);
		dContainer.addChild(c2);
		c2.x = cxPos;
		c2.y = cyPos;
		*/
		
		
		dContainer.graphics.lineStyle(1,0xFFFFFF);
		//dContainer.graphics.lineTo(xPos,yPos);
		dContainer.graphics.curveTo(cxPos,cyPos,xPos,yPos);
		dContainer.graphics.moveTo(xPos,yPos);

		lastPoint.x = xPos;
		lastPoint.y = yPos;
	}

	public function drawPattern3(dContainer:Sprite,enterFrameCounter:Int,deltaTime:Int):Void{
		var r:Float = deltaTime;
		//var radius:Float = 10;
		var mi:Float = (1/1);
		
		var d = (10)*enterFrameCounter;
		var e = 1 * enterFrameCounter;

		var dd:Float = 1;

		//var radianAngle : Float = enterFrameCounter * (180/Math.PI) ;
		var radianAngle : Float = enterFrameCounter ;

		var xx:Float = Math.cos(radianAngle);
		var yy:Float = Math.sin(radianAngle);
		var xPos:Float = radianAngle * xx * mi ;
		var yPos:Float = radianAngle * yy * mi ;
		
		var halfAngle:Float = radianAngle/2;

		var cXX:Float = Math.cos(halfAngle);
		var cYY:Float = Math.sin(halfAngle);
		var cxPos:Float = halfAngle * cXX * mi ;
		var cyPos:Float = halfAngle * cYY * mi ;

		trace('====== vvvvvvv ================');
		trace('enterFrameCounter',enterFrameCounter);
		trace('radianAngle',radianAngle,'halfAngle',halfAngle);
		trace('cXX',cXX,'cYY',cYY);
		trace('lastPoint.x',lastPoint.x,'lastPoint.y',lastPoint.y);
		trace('xPos',xPos,'yPos',yPos);
		trace('cxPos',cxPos,'cyPos',cyPos);
		
		/*
		var c1:CircleWithFill = new CircleWithFill(2,0xFF0000);
		dContainer.addChild(c1);
		c1.x = xPos;
		c1.y = yPos;
		*/
		/*
		var c2:CircleWithFill = new CircleWithFill(1,0x00FF00);
		dContainer.addChild(c2);
		c2.x = cxPos;
		c2.y = cyPos;
		*/

		trace('====== xxxxxx ================');

		dContainer.graphics.lineStyle(1,0xFFFFFF);
		//dContainer.graphics.lineTo(xPos,yPos);

		if(lastPoint.x==0){
			// Do Nothing
			dContainer.graphics.moveTo(xPos,yPos);
		}else{
			dContainer.graphics.curveTo(cxPos,cyPos,xPos,yPos);
			dContainer.graphics.moveTo(xPos,yPos);
			/*
			dContainer.graphics.lineTo(cxPos,cyPos);
			dContainer.graphics.moveTo(cxPos,cyPos);
			dContainer.graphics.lineTo(xPos,yPos);
			dContainer.graphics.moveTo(xPos,yPos);
			*/
		}
		

		lastPoint.x = xPos;
		lastPoint.y = yPos;
	}

	public function drawPattern4(dContainer:Sprite,enterFrameCounter:Int,deltaTime:Int):Void{
		var r:Float = deltaTime;
		//var radius:Float = 10;
		var mi:Float = (1/1);
		
		var d = (10)*enterFrameCounter;
		var e = 1 * enterFrameCounter;

		var dd:Float = 1;

		//var radianAngle : Float = enterFrameCounter * (180/Math.PI) ;
		var radianAngle : Float = enterFrameCounter ;

		var xx:Float = Math.cos(radianAngle);
		var yy:Float = Math.sin(radianAngle);
		var xPos:Float = radianAngle * xx * mi ;
		var yPos:Float = radianAngle * yy * mi ;
		
		var halfAngle:Float = radianAngle/2;

		var cXX:Float = Math.cos(halfAngle);
		var cYY:Float = Math.sin(halfAngle);
		var cxPos:Float = halfAngle * cXX * mi ;
		var cyPos:Float = halfAngle * cYY * mi ;

		trace('====== vvvvvvv ================');
		trace('enterFrameCounter',enterFrameCounter);
		trace('radianAngle',radianAngle,'halfAngle',halfAngle);
		trace('cXX',cXX,'cYY',cYY);
		trace('lastPoint.x',lastPoint.x,'lastPoint.y',lastPoint.y);
		trace('xPos',xPos,'yPos',yPos);
		trace('cxPos',cxPos,'cyPos',cyPos);
		
		/*
		var c1:CircleWithFill = new CircleWithFill(2,0xFF0000);
		dContainer.addChild(c1);
		c1.x = xPos;
		c1.y = yPos;
		*/
		/*
		var c2:CircleWithFill = new CircleWithFill(1,0x00FF00);
		dContainer.addChild(c2);
		c2.x = cxPos;
		c2.y = cyPos;
		*/

		trace('====== xxxxxx ================');

		dContainer.graphics.lineStyle(1,0xFFFFFF);
		//dContainer.graphics.lineTo(xPos,yPos);

		if(lastPoint.x==0){
			// Do Nothing
			dContainer.graphics.moveTo(xPos,yPos);
		}else{
			dContainer.graphics.curveTo(cxPos,cyPos,xPos,yPos);
			dContainer.graphics.moveTo(xPos,yPos);
			/*
			dContainer.graphics.lineTo(cxPos,cyPos);
			dContainer.graphics.moveTo(cxPos,cyPos);
			dContainer.graphics.lineTo(xPos,yPos);
			dContainer.graphics.moveTo(xPos,yPos);
			*/
		}
		

		lastPoint.x = xPos;
		lastPoint.y = yPos;
	}


}