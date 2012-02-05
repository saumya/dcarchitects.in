package com.dzinersCombine.view;
import nme.display.Sprite;
import nme.text.Font;
import nme.text.TextField;
import nme.text.TextFieldType;
import nme.text.TextFormat;
import nme.Lib;
import nme.Assets;

/**
 * ...
 * @author saumya
 */

class ContactUs extends Sprite
{
	private var guestName:TextField;
	private var guestMail:TextField;
	private var guestMessage:TextField;
	private var submitBtn:ButtonBase;
	private var address:TextField;
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
		this.graphics.beginFill(0x000000,0.2);
		this.graphics.drawRect(0, 0, 700, 300);
		this.graphics.endFill();
		this.graphics.beginFill(0xFFFFFF);
		this.graphics.drawRect(10, 10, 680, 280);
		this.graphics.endFill();
		//
		//this.font = Assets.getFont ("assets/Matchbook.ttf");
		this.format = new TextFormat (20, 0x777777);
		this.format.leading = 20;
		/*
		  	textField.defaultTextFormat = format;
			textField.selectable = false;
			textField.embedFonts = true;
		*/
		//
		this.guestName = new TextField();
		this.guestName.width = 150;
		this.guestName.height = 20;
		this.guestName.border = true;
		this.guestName.type = TextFieldType.INPUT;
		this.guestName.x = 100;
		this.guestName.y = 50;
		this.guestName.text = 'name';
		this.addChild(this.guestName);
		this.guestMail = new TextField();
		this.guestMail.width = 150;
		this.guestMail.height = 20;
		this.guestMail.border = true;
		this.guestMail.type = TextFieldType.INPUT;
		this.guestMail.x = 100;
		this.guestMail.y = 80;
		this.guestMail.text = 'mailid@myMail.com';
		this.addChild(this.guestMail);
		this.guestMessage = new TextField();
		this.guestMessage.width = 150;
		this.guestMessage.height = 100;
		this.guestMessage.border = true;
		this.guestMessage.type = TextFieldType.INPUT;
		this.guestMessage.multiline = true;
		this.guestMessage.wordWrap = true;
		this.guestMessage.text = 'Hi, This is my message. \n I like your work and want to reach you for a project.';
		this.guestMessage.x = 100;
		this.guestMessage.y = 110;
		this.addChild(this.guestMessage);
		this.submitBtn = new ButtonBase();
		this.submitBtn.setLabel('Submit');
		this.submitBtn.setBg(0xCCCCCC);
		this.submitBtn.x = 100;
		this.submitBtn.y = 220;
		this.addChild(this.submitBtn);
		//
		this.address = new TextField();
		this.address.width = 400;
		this.address.height = 300;
		this.address.multiline = true;
		this.address.wordWrap = true;
		this.address.x = 300;
		this.address.y = 50;
		this.address.defaultTextFormat = this.format;
		//this.address.embedFonts = true;
		this.address.text = 'dziners combine architects, \n3,Samrudhi Apt., Plot no. 74, Sl no. 95, \nRight Bhusari Colony,\nOff Paud Road, Kothrud, \nPune, 411038';
		
		this.addChild(this.address);
		
	}
	
}