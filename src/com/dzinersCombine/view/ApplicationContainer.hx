package com.dzinersCombine.view;

import com.dzinersCombine.controller.ApplicationController;
import com.dzinersCombine.view.components.VCard;
import nme.display.Graphics;
import nme.display.Sprite;
import nme.events.Event;
import nme.events.MouseEvent;
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
	//menu
	private var activeButton:ButtonBase;
	//
	private var aboutUs:AboutUsView;
	private var contactUs:ContactUs;
	private var portfolio:Portfolio;

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
		btnHome.addEventListener(MouseEvent.CLICK, onUserSelect);
		btnPortfolio.addEventListener(MouseEvent.CLICK, onUserSelect);
		btnAboutUs.addEventListener(MouseEvent.CLICK, onUserSelect);
		btnContactUs.addEventListener(MouseEvent.CLICK, onUserSelect);
		//
		this.addChild(btnHome);
		this.addChild(btnPortfolio);
		this.addChild(btnAboutUs);
		this.addChild(btnContactUs);
		//
		this.renderAboutUs();
		this.renderContactUs();
		this.renderPortfolio();
	}
	
	private function onUserSelect(e:MouseEvent):Void 
	{
		if (this.activeButton!=null)
		{
			this.activeButton.setBg(0xFF0000);//TODO: make a reset() method on button class
		}
		//
		var b:ButtonBase = e.target;
		b.setBg(0xFFFFFF);
		this.activeButton = b;
		//
		switch(b.getName())
		{
			case 'About Us' :
				this.aboutUs.visible = true;
				this.contactUs.visible = false;
				this.portfolio.visible = false;
			case 'Contact Us' :
				this.aboutUs.visible = false;
				this.contactUs.visible = true;
				this.portfolio.visible = false;
			case 'Portfolio' :
				this.aboutUs.visible = false;
				this.contactUs.visible = false;
				this.portfolio.visible = true;
			default :
				this.aboutUs.visible = false;
				this.contactUs.visible = false;
				this.portfolio.visible = false;
		}
	}
	
	private function renderAboutUs():Void
	{
		this.aboutUs = new AboutUsView();
		this.aboutUs.x = 50;
		this.aboutUs.y = 50;
		this.aboutUs.visible = false;
		this.addChild(this.aboutUs);
	}
	
	private function renderContactUs():Void
	{
		this.contactUs = new ContactUs();
		this.contactUs.x = 50;
		this.contactUs.y = 50;
		this.contactUs.visible = false;
		this.addChild(this.contactUs);
	}
	
	private function renderPortfolio():Void
	{
		this.portfolio = new Portfolio();
		this.portfolio.x = 50;
		this.portfolio.y = 50;
		this.portfolio.visible = false;
		this.addChild(this.portfolio);
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