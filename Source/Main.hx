package;


import openfl.display.Sprite;
import openfl.events.Event;
import openfl.Lib;


class Main extends Sprite {
	
	private var cacheTime:Int;
	private var speed:Float;
	private var sprite:Sprite;
	
	public function new () {
		
		super ();
		
		sprite = new Sprite();
		sprite.graphics.beginFill(0xDDDDDD);
		sprite.graphics.drawRect(0,0,100,100);
		sprite.y = 50;
		addChild(sprite);

		speed = 0.3;
		cacheTime = Lib.getTimer();

		addEventListener(Event.ENTER_FRAME,this_onEnterFrame);
		
	}

	private function this_onEnterFrame(event:Event):Void{
		var currentTime = Lib.getTimer();
		update(currentTime-cacheTime);

		cacheTime = currentTime;
	}

	private function update(deltaTime:Int):Void{
		// just reversing
		if (sprite.x + sprite.width >= stage.stageWidth || sprite.x < 0) {
			speed *= -1;
		}
		// animate
		sprite.x += speed * deltaTime;
	}
	
	
}