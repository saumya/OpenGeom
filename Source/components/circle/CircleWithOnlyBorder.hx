/**
** Circle with a border
** @version 1.0.0
**/

package components.circle;

import openfl.display.Sprite;
import openfl.display.Shape;
import openfl.display.Graphics;
import components.circle.CircleWithFill;

class CircleWithOnlyBorder extends Sprite {

    private var radiusOfCircle:Float;
    private var centerSpot:Shape;
    //
    private var revolvingCircle:CircleWithFill;
    private var counter:Float;


    public function new(radius:Float){
        super ();
        radiusOfCircle = radius;
        counter = 0;
        construct();
    }

    public function construct():Void{
        //
        revolvingCircle = new CircleWithFill(5);
        addChild(revolvingCircle);
        //
        var gfx : Graphics = this.graphics;
        gfx.clear();
        gfx.lineStyle( 2, 0xAAAAAA );
        //center align
        //gfx.drawCircle(radiusOfCircle/2,radiusOfCircle/2,radiusOfCircle);
        //left align
        gfx.drawCircle(0,0,radiusOfCircle);
    }
    public function showCenter():Void{
        centerSpot = new Shape();
        addChild(centerSpot);
        //
        var cLength:Int = 5;
        var gfxCS = centerSpot.graphics;
        gfxCS.lineStyle ( 1, 0xFFFFFF );
        gfxCS.lineTo(cLength,0);
        gfxCS.moveTo(0,0);
        gfxCS.lineTo(0,cLength);
        gfxCS.moveTo(0,0);
        gfxCS.lineTo( (-1*cLength),0);
        gfxCS.moveTo(0,0);
        gfxCS.lineTo(0,(-1*cLength));
    }
    public function update():Void{
        counter += 0.01;
        revolvingCircle.x =  radiusOfCircle * Math.cos(counter);
        revolvingCircle.y =  radiusOfCircle * Math.sin(counter);
    }

}