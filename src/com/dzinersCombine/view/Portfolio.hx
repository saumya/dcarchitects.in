package com.dzinersCombine.view;
import com.dzinersCombine.view.components.ImageHolderWithBorder;
import nme.Assets;
import nme.display.Bitmap;
import nme.display.BitmapData;
import nme.display.Sprite;
import nme.Lib;
import nme.net.URLLoader;
import nme.net.URLRequest;
import nme.net.URLLoaderDataFormat;
import nme.events.Event;
import nme.events.MouseEvent;
import nme.text.TextField;

/**
 * ...
 * @author saumya
 */

class Portfolio extends Sprite
{
	private var logger:TextField;
	private var leftArrow:Sprite;
	private var rightArrow:Sprite;
	private var imageHolder:ImageHolderWithBorder;

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
		this.graphics.beginFill(0xFFFFFF,0.5);
		this.graphics.drawRect(10, 10, 680, 280);
		this.graphics.endFill();
		//
		this.logger = new TextField();
		this.logger.width = 500;
		this.logger.height = 100;
		this.addChild(this.logger);
		//make the back-next buttons
		var bd:BitmapData = Assets.getBitmapData('assets/arrow.png');
		var arrow1:Bitmap = new Bitmap(bd);
		var arrow2:Bitmap = new Bitmap(bd);
		arrow2.scaleX = -1;
		this.leftArrow = new Sprite();
		this.rightArrow = new Sprite();
		this.addChild(this.leftArrow);
		this.addChild(this.rightArrow);
		this.leftArrow.addChild(arrow1);
		this.rightArrow.addChild(arrow2);
		this.leftArrow.x = 10;
		this.leftArrow.y = 120;
		this.rightArrow.x = 690;
		this.rightArrow.y = 120;
		this.leftArrow.addEventListener(MouseEvent.CLICK, onBack);
		this.rightArrow.addEventListener(MouseEvent.CLICK, onNext);
		//
		this.imageHolder = new ImageHolderWithBorder();
		this.addChild(this.imageHolder);
		this.imageHolder.x = 150;
		this.imageHolder.y = 10;
		//load XML
		this.loadGalleryConfig();
	}
	
	private function onNext(e:MouseEvent):Void 
	{
		this.logger.text = 'next';
	}
	
	private function onBack(e:MouseEvent):Void 
	{
		this.logger.text = 'back';
	}
	
	private function loadGalleryConfig() 
	{
		var u:URLRequest = new URLRequest('slideShow.xml');
		var ul:URLLoader = new URLLoader();
		ul.addEventListener(Event.COMPLETE, onDataLoaded);
		ul.load(u);
	}
	
	private function onDataLoaded(e:Event):Void 
	{
		this.logger.text = 'XML is loaded!';
	}
	
}