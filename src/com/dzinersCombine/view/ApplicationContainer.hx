package com.dzinersCombine.view;

import nme.display.Graphics;
import nme.display.Sprite;

import com.eclecticdesignstudio.motion.Actuate;

/**
 * Base container of our application
 * 
 * @author saumya
 */

class ApplicationContainer extends Sprite
{
	private var leftBlock:Sprite ;
	private var rightBlock:Sprite ;

	public function new() 
	{
		super();
		this.init();
	}
	
	private function init() 
	{
		trace(this);
		this.leftBlock = new Sprite();
		this.rightBlock = new Sprite();
		//
		this.addChild(this.leftBlock);
		this.addChild(this.rightBlock);
		//this.rightBlock.x = 400;
		var gl:Graphics = this.leftBlock.graphics;
		var gr:Graphics = this.rightBlock.graphics;
		this.makeItColor(gl, 0xFF0000);
		this.makeItColor(gr, 0xDDDDDD);
		//
		Actuate.tween (this.rightBlock, 1, { x:400 } );
		//make the menu
		var b:ButtonBase = new ButtonBase();
		this.addChild(b);
		b.x = 10;
		b.y = 450;
		b.setBg(0x00FF00);
		b.setLabel('Home');
	}
	
	private function makeItColor(g:Graphics,color:Int):Void
	{
		g.beginFill(color);
		g.drawRect(0, 0, 400, 400);
		g.endFill();
	}
	
}