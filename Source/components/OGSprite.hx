//
package components;

import openfl.display.Sprite;
import openfl.display.Graphics;


class OGSprite extends Sprite {

	private var halfLength:Float;

	public function new() {
		super();
		halfLength = 100;
	}

	public function drawCenter():Void{
		var g:Graphics = this.graphics;
		g.clear();
		g.lineStyle(1,0xFFFFFF);
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