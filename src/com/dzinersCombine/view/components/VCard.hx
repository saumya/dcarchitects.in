package com.dzinersCombine.view.components;
import nme.display.Sprite;
import nme.text.Font;
import nme.text.TextField;
import nme.text.TextFormat;
import nme.Assets;

/**
 * ...
 * @author saumya
 */

class VCard extends Sprite
{
	private var who:TextField;
	private var what:TextField;
	//
	private var font:Font;
	private var format:TextFormat;

	public function new() 
	{
		super();
		this.init();
	}
	
	private function init():Void 
	{
		//this.font = Assets.getFont ("assets/Matchbook.ttf");
		this.format = new TextFormat (16, 0x000000);
		//
		this.graphics.beginFill(0x000000);
		this.graphics.drawRect(0, 0, 170, 80);
		this.graphics.endFill();
		this.graphics.beginFill(0xFFFFFF);
		this.graphics.drawRect(5, 5, 160, 70);
		this.graphics.endFill();
		//
		this.who = new TextField();
		this.who.width = 120;
		this.who.selectable = false;
		this.who.mouseEnabled = false;
		this.what = new TextField();
		this.what.width = 150;
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
		this.who.defaultTextFormat = this.format;
		//this.who.embedFonts = true;
		this.who.text = s;
	}
	
	public function setDesignation(s:String):Void
	{
		this.what.defaultTextFormat = this.format;
		//this.what.embedFonts = true;
		this.what.text = s;
	}
	
}