//

package components.shape;

import openfl.display.Sprite;
import openfl.display.Graphics;

import openfl.geom.Point;


// Petal shape
class Shape1 extends Sprite {
	public function new() {
		super();
		construct();
	}
	private function construct():Void{
		var g:Graphics = this.graphics;
		var centerPoint:Point = new Point(0,0);
		g.lineStyle(1,0xFFFFFF);
		g.curveTo(centerPoint.x+100,centerPoint.y-50,centerPoint.x,centerPoint.y-200);
		g.curveTo(centerPoint.x-100,centerPoint.y-50,centerPoint.x,centerPoint.y);
	}
	public function setPosition(newPoint:Point):Void{
		this.x = newPoint.x;
		this.y = newPoint.y;
	}
}