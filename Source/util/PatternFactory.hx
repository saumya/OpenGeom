//
package util;

import openfl.display.Sprite;
import openfl.display.Graphics;

import openfl.geom.Point;

class PatternFactory {
	
	private var sBoard:Sprite;
	private var pCenter:Point;

	public function new(sCanvas:Sprite,center:Point) {
		//pCenter = new Point(0,0);
		sBoard = sCanvas;
		pCenter = center;
	}
	public function getPattern():Void{}
	public function drawPattern(s:Sprite):Void{

	}
}