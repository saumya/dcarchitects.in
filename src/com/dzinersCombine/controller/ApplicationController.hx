package com.dzinersCombine.controller;
import com.dzinersCombine.view.ApplicationContainer;
import nme.events.Event;
import nme.display.Sprite;
import nme.Lib;

/**
 * ...
 * @author saumya
 */

class ApplicationController 
{
	private var view:ApplicationContainer;
	
	public function new(a:ApplicationContainer) 
	{
		this.view = a;
		this.init();
	}
	
	private function init() 
	{
		this.view.addEventListener('needXmlEvent',onXmlRequest);
		this.view.init();
	}
	
	private function onXmlRequest(e:Event):Void 
	{
		//Lib.trace(this);
		this.view.makeMenu();
	}
	
}