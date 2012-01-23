package com.dzinersCombine.view;
import nme.display.Sprite;

/**
 * Base container of our application
 * 
 * @author saumya
 */

class ApplicationContainer extends Sprite
{

	public function new() 
	{
		super();
		this.init();
	}
	
	private function init() 
	{
		trace(this);
	}
	
}