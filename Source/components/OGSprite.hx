//
package components;

import openfl.display.Sprite;
import openfl.display.Graphics;


class OGSprite extends Sprite {

	private var halfLength:Float;
	private var lineThickness:Float;
	private var lineColor:UInt;
	private var lineAlpha:Float;

	public function new() {
		super();
		halfLength = 10;
		lineThickness = 0.5;
		lineColor = 0xFFFFFF;
		lineAlpha = 1.0;
	}

	public function move(newX:Float,newY:Float):Void{
		this.x = newX;
		this.y = newY;
		//TODO: Animate this move
	}

	public function drawCenter():Void{
		var g:Graphics = this.graphics;
		g.clear();
		g.lineStyle(lineThickness,lineColor, lineAlpha);
		g.lineTo(halfLength,0);
		g.moveTo(0,0);
		g.lineTo(-1*halfLength,0);
		g.moveTo(0,0);
		g.lineTo(0,halfLength);
		g.moveTo(0,0);
		g.lineTo(0,-1*halfLength);
		g.moveTo(0,0);
	}
}