package com.dzinersCombine.view;

import com.dzinersCombine.controller.ApplicationController;
import nme.display.Graphics;
import nme.display.Sprite;
import nme.events.Event;
import nme.Lib;

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
		var controller:ApplicationController = new ApplicationController(this);
	}
	
	public function init() 
	{
		Lib.trace(this);
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
		//
		this.dispatchEvent(new Event('needXmlEvent'));
	}
	
	public function makeMenu():Void
	{
		//make the menu
		var btnHome:ButtonBase = new ButtonBase();
		//this.addChild(b);
		btnHome.x = 10;
		btnHome.y = 450;
		//btnHome.setBg(0x00FF00);
		btnHome.setLabel('Home');
		var btnPortfolio:ButtonBase = new ButtonBase();
		//this.addChild(b);
		btnPortfolio.x = 120;
		btnPortfolio.y = 450;
		//btnContact.setBg(0x00FF00);
		btnPortfolio.setLabel('Portfolio');
		var btnAboutUs:ButtonBase = new ButtonBase();
		//this.addChild(b);
		btnAboutUs.x = 230;
		btnAboutUs.y = 450;
		//btnContact.setBg(0x00FF00);
		btnAboutUs.setLabel('About Us');
		var btnContactUs:ButtonBase = new ButtonBase();
		//this.addChild(b);
		btnContactUs.x = 340;
		btnContactUs.y = 450;
		//btnContact.setBg(0x00FF00);
		btnContactUs.setLabel('Contact Us');
		//
		this.addChild(btnHome);
		this.addChild(btnPortfolio);
		this.addChild(btnAboutUs);
		this.addChild(btnContactUs);
	}
	
	private function makeItColor(g:Graphics,color:Int):Void
	{
		g.beginFill(color);
		g.drawRect(0, 0, 400, 400);
		g.endFill();
	}
	
	public function log(message:String):Void
	{
		Lib.trace(message);
	}
}