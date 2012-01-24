package com.dzinersCombine.view;
import nme.display.Sprite;

/**
 * ...
 * @author saumya
 */

class Portfolio extends Sprite
{

	public function new() 
	{
		super();
		this.init();
	}
	
	private function init() 
	{
		this.graphics.beginFill(0xFFFFFF, 1);
		this.graphics.drawRect(0, 0, 700, 300);
		this.graphics.endFill();
	}
	
}