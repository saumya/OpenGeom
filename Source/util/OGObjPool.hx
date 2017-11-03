/**
 *
 * The basic Object pool for this library
 * @version : 1.0.0
 *
 **/

package util;

import components.OGSprite;

class OGObjPool {
	
	private var aObj:Array<OGSprite>;

	public function new() {
		aObj = new Array();
	}

	public function addObjToPool(newSprite:OGSprite):Array<OGSprite> {
		this.aObj.push(newSprite);
		return aObj;
	}

	public function getObjFromPool():OGSprite{
		var a:OGSprite = aObj.pop();
		return a;
	}

}