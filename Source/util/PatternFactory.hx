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
}