//
package components.circle;

import openfl.display.Sprite;
import openfl.display.Graphics;

class CircleWithFillAndBorder extends Sprite {

    private var radiusOfCircle:Float;
    private var colorOfCircle:Int;
    private var fillAlpha:Float;

    private var bThickness:Float;
    private var bColor:Int;
    private var bAlpha:Float;
	
	public function new(radius:Float=100,cColor:Int=0xAAAAAA,fAlpha:Float=1.0,borderThickness:Float=2,borderColor:Int=0xAAAAAA,boderAlpha:Float=1.0) {
		super();
		radiusOfCircle = radius;
        colorOfCircle = cColor;
        fillAlpha = fAlpha;
        bThickness = borderThickness;
        bColor = borderColor;
        bAlpha = boderAlpha;
		construct();
	}
	public function construct():Void{
        var gfx : Graphics = this.graphics;
        gfx.clear();
        
        gfx.beginFill( colorOfCircle, fillAlpha );
        //center align
        //gfx.drawCircle(radiusOfCircle/2,radiusOfCircle/2,radiusOfCircle);
        //left align
        gfx.drawCircle(0,0,radiusOfCircle);
        gfx.endFill();
        // border
        gfx.lineStyle( bThickness, bColor, bAlpha );
        gfx.drawCircle(0,0,radiusOfCircle);
    }
}