package com.dzinersCombine.view;
import nme.display.Graphics;
import nme.display.Sprite;
import nme.text.TextField;

/**
 * ...
 * @author saumya
 */

class ButtonBase extends Sprite
{
	private var label:TextField;

	public function new() 
	{
		super();
		this.init();
	}
	
	private function init() 
	{
		var g:Graphics = this.graphics;
		g.beginFill(0xFF0000);
		g.drawRect(0, 0, 100, 20);
		g.endFill();
		//
		this.label = new TextField();
		this.label.width = 90;
		this.label.height = 20;
		this.label.text = 'Label';
		this.label.mouseEnabled = false;
		this.label.selectable = false;
		//
		this.addChild(this.label);
	}
	
	public function setBg(color:Int):Void
	{
		this.graphics.clear();
		this.graphics.beginFill(color);
		this.graphics.drawRect(0, 0, 100, 20);
		this.graphics.endFill();
	}
	
	public function setLabel(s:String):Void
	{
		this.label.text = s;
	}
	
	public function getName():String
	{
		return this.label.text;
	}
	
}