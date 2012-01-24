package com.dzinersCombine.view.components;
import nme.display.Sprite;
import nme.text.TextField;

/**
 * ...
 * @author saumya
 */

class VCard extends Sprite
{
	private var who:TextField;
	private var what:TextField;

	public function new() 
	{
		super();
		this.init();
	}
	
	private function init():Void 
	{
		this.graphics.beginFill(0xCCCCCC);
		this.graphics.drawRect(0, 0, 150, 80);
		this.graphics.endFill();
		//
		this.who = new TextField();
		this.who.width = 90;
		this.who.selectable = false;
		this.who.mouseEnabled = false;
		this.what = new TextField();
		this.what.width = 90;
		this.what.selectable = false;
		this.what.mouseEnabled = false;
		//
		this.who.x = this.what.x = 10;
		this.who.y = 10;
		this.what.y = 40;
		this.who.text = this.what.text = 'Mr. 007 .';
		//
		this.addChild(this.who);
		this.addChild(this.what);
	}
	
	public function setName(s:String):Void
	{
		this.who.text = s;
	}
	
	public function setDesignation(s:String):Void
	{
		this.what.text = s;
	}
	
}