//
package components.circle;

import openfl.display.Sprite;
import openfl.display.Graphics;

class CircleWithFill extends Sprite {

    private var radiusOfCircle:Float;
	
	public function new(radius:Float=100) {
		super();
		radiusOfCircle = radius;
		construct();
	}
	public function construct():Void{
        var gfx : Graphics = this.graphics;
        gfx.clear();
        //gfx.lineStyle( 2, 0xAAAAAA );
        gfx.beginFill( 0xAAAAAA );
        //center align
        //gfx.drawCircle(radiusOfCircle/2,radiusOfCircle/2,radiusOfCircle);
        //left align
        gfx.drawCircle(0,0,radiusOfCircle);
    }
}