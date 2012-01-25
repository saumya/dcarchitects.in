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
		this.graphics.beginFill(0x000000,0.2);
		this.graphics.drawRect(0, 0, 700, 300);
		this.graphics.endFill();
		this.graphics.beginFill(0xFFFFFF,0.5);
		this.graphics.drawRect(10, 10, 680, 280);
		this.graphics.endFill();
	}
	
}