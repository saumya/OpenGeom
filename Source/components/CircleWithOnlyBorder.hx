package components;

import openfl.display.Sprite;
import openfl.display.Graphics;

class CircleWithOnlyBorder extends Sprite {

    private var radiusOfCircle:Float;

    public function new(radius:Float){
        super ();
        radiusOfCircle = radius;
        construct();
    }

    public function construct():Void{
        var gfx : Graphics = this.graphics;
        gfx.clear();
        gfx.lineStyle( 2, 0xAAAAAA );
        //center align
        //gfx.drawCircle(radiusOfCircle/2,radiusOfCircle/2,radiusOfCircle);
        //left align
        gfx.drawCircle(0,0,radiusOfCircle);
    }

}