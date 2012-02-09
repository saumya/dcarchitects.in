package com.dzinersCombine.view;
import nme.display.Graphics;
import nme.display.Sprite;
import nme.text.Font;
import nme.text.TextField;
import nme.text.TextFormat;
import nme.text.TextFormatAlign;

/**
 * ...
 * @author saumya
 */

class ButtonBase extends Sprite
{
	private var label:TextField;
	//
	private var font:Font;
	private var format:TextFormat;

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
		//this.label.embedFonts = true;
		this.label.x = 5;
		//
		this.addChild(this.label);
		//
		this.format = new TextFormat (16, 0x000000);
		//this.format.letterSpacing = 2;
		//this.format.align = TextFormatAlign.CENTER;
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
		this.label.defaultTextFormat = this.format;
		this.label.text = s;
	}
	
	public function getName():String
	{
		return this.label.text;
	}
	
}