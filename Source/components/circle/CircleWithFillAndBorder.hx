//
package components.circle;

import openfl.display.Sprite;
import openfl.display.Graphics;

class CircleWithFillAndBorder extends Sprite {

    private var radiusOfCircle:Float;
    private var colorOfCircle:Int;
	
	public function new(radius:Float=100,cColor:Int=0xAAAAAA) {
		super();
		radiusOfCircle = radius;
        colorOfCircle = cColor;
		construct();
	}
	public function construct():Void{
        var gfx : Graphics = this.graphics;
        gfx.clear();
        gfx.lineStyle( 2, 0xAAAAAA );
        gfx.beginFill( colorOfCircle );
        //center align
        //gfx.drawCircle(radiusOfCircle/2,radiusOfCircle/2,radiusOfCircle);
        //left align
        gfx.drawCircle(0,0,radiusOfCircle);
        gfx.endFill();
        gfx.drawCircle(0,0,radiusOfCircle);
    }
}