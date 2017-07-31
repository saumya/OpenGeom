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
		var s1:Shape1 = new Shape1();
		sBoard.addChild(s1);
	}
}