package com.dzinersCombine.view.factory;
import com.dzinersCombine.view.ButtonBase;

/**
 * ...
 * @author saumya
 */

class ButtonFactory 
{

	public function new() 
	{
		//Nothings to be dafault
	}
	
	public function getButtonBaseObject():ButtonBase
	{
		var b:ButtonBase = new ButtonBase();
		return b;
	}
	
}