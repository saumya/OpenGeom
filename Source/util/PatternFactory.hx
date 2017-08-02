//
package util;

import openfl.display.Sprite;
import openfl.display.Graphics;

import openfl.geom.Point;

import components.shape.Shape1;

class PatternFactory {
	
	private var sBoard:Sprite;
	private var pCenter:Point;

	public function new(sCanvas:Sprite,center:Point) {
		//pCenter = new Point(0,0);
		sBoard = sCanvas;
		pCenter = center;
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
}