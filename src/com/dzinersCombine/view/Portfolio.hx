package com.dzinersCombine.view;
import com.dzinersCombine.view.components.ImageHolderWithBorder;
import haxe.xml.Fast;
import nme.Assets;
import nme.display.Bitmap;
import nme.display.BitmapData;
import nme.display.Loader;
import nme.display.Sprite;
import nme.Lib;
import nme.net.URLLoader;
import nme.net.URLRequest;
import nme.net.URLLoaderDataFormat;
import nme.events.Event;
import nme.events.MouseEvent;
import nme.events.ProgressEvent;
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
	private var imageLoader:Loader;
	private var imageIndex:Int;
	//
	private var allImagePaths:Array<String>;
	

	public function new() 
	{
		super();
		this.init();
	}
	
	private function init() 
	{
		this.graphics.beginFill(0x000000,1.0);
		this.graphics.drawRect(0, 0, 700, 300);
		this.graphics.endFill();
		this.graphics.beginFill(0xFFFFFF,1.0);
		this.graphics.drawRect(10, 10, 680, 280);
		this.graphics.endFill();
		//
		this.logger = new TextField();
		this.logger.width = 500;
		this.logger.height = 200;
		this.logger.x = 20;
		this.logger.y = 20;
		//this.addChild(this.logger);
		//make the back-next buttons
		var back:BitmapData = Assets.getBitmapData('assets/aBack.png');
		var next:BitmapData = Assets.getBitmapData('assets/aNext.png');
		var arrow1:Bitmap = new Bitmap(back);
		var arrow2:Bitmap = new Bitmap(next);
		arrow2.scaleX = 1;
		this.leftArrow = new Sprite();
		this.rightArrow = new Sprite();
		this.addChild(this.leftArrow);
		this.addChild(this.rightArrow);
		this.leftArrow.addChild(arrow1);
		this.rightArrow.addChild(arrow2);
		this.leftArrow.x = 10;
		this.leftArrow.y = 120;
		this.rightArrow.x = 640;
		this.rightArrow.y = 120;
		this.leftArrow.width = this.rightArrow.width = 50;
		this.leftArrow.height = this.rightArrow.height = 50;
		this.leftArrow.addEventListener(MouseEvent.CLICK, onBack);
		this.rightArrow.addEventListener(MouseEvent.CLICK, onNext);
		//
		this.imageHolder = new ImageHolderWithBorder();
		this.addChild(this.imageHolder);
		this.imageHolder.x = 150;
		this.imageHolder.y = 10;
		//create the loader
		this.imageLoader = new Loader();
		//this.imageHolder.addChild(this.imageLoader);
		this.imageLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onImageLoadComplete);
		this.imageIndex = 0;
		//get the data
		this.parseData();
		//load XML
		//this.loadGalleryConfig();
	}
	
	private function onImageLoadComplete(e:Event):Void 
	{
		//this.imageHolder.addChild(l);
		this.logger.text = 'onImageLoadComplete';
	}
	
	private function parseData() 
	{
		var s = Assets.getText('assets/slideShow.xml');
		var x:Xml = Xml.parse(s).firstElement();
		var xFast:Fast = new Fast(x);
		//this.logger.text = (xFast.node.portfolio.innerHTML);
		//this.logger.text = (xFast.innerHTML);
		var portfolioNodes = xFast.node.portfolio;
		this.logger.text = portfolioNodes.nodes.img.length+' :: ';
		//Getting the paths
		//var paths:Array<String> = new Array<String>();
		this.allImagePaths = new Array<String>();
		for (dataNode in portfolioNodes.nodes.img)
		{
			//this.logger.text += dataNode.att.path;
			this.allImagePaths.push(dataNode.att.path);
			this.logger.text += this.allImagePaths.toString();
		}
		//render the first image
		this.startRenderingImages();
	}
	
	private function startRenderingImages() 
	{
		/*
		var s = new Bitmap(Assets.getBitmapData('assets/1.jpg'));
		this.imageHolder.addChild(s);
		*/
		/*
		var u:String = this.allImagePaths[0];
		this.logger.text = u;
		var p:String = this.allImagePaths[0];
		var u:URLRequest = new URLRequest(p);
		var l:Loader = new Loader();
		l.load(u);
		this.addChild(l);
		*/
		//Working for flash
		/*
		var firstImagePath:String = this.allImagePaths[this.imageIndex];
		this.loadImageInContainer(firstImagePath);
		*/
		this.logger.text = this.allImagePaths[this.imageIndex];
		var b = new Bitmap(Assets.getBitmapData(this.allImagePaths[this.imageIndex]));
		this.imageHolder.addChild(b);
	}
	
	private function loadImageInContainer(imagePath:String):Void
	{
		//this.logger.text = 'loadImageInContainer : imagePath=' + imagePath;
		this.logger.text = this.imageHolder.numChildren + '';
		this.imageHolder.removeChildAt(0);
		//this.imageHolder.removeChildAt(1);
		var b = new Bitmap(Assets.getBitmapData(this.allImagePaths[this.imageIndex]));
		this.imageHolder.addChild(b);
		//var u:URLRequest = new URLRequest(imagePath);
		//this.imageLoader.load(u);
	}
	
	private function onNext(e:MouseEvent):Void 
	{
		//this.logger.text = 'next : This is the last image.';
		
		if (this.imageIndex>=(this.allImagePaths.length-1))
		{
			//DO Nothing
		}else {
			this.imageIndex++;
			//this.logger.text = 'next : ' + this.allImagePaths[this.imageIndex];
			this.loadImageInContainer(this.allImagePaths[this.imageIndex]);
		}
		
	}
	
	private function onBack(e:MouseEvent):Void 
	{
		//this.logger.text = 'back : Nothing to do. This is the first image.';
		
		if (this.imageIndex<=0)
		{
			//DO Nothing
		}else {
			this.imageIndex--;
			//this.logger.text = 'back : ' + this.allImagePaths[this.imageIndex];
			this.loadImageInContainer(this.allImagePaths[this.imageIndex]);
		}
		
	}
	/*
	private function loadGalleryConfig() 
	{
		var u:URLRequest = new URLRequest('../../../assets/slideShow.xml');
		var ul:URLLoader = new URLLoader();
		ul.dataFormat = URLLoaderDataFormat.TEXT;
		ul.addEventListener(Event.COMPLETE, onDataLoaded);
		ul.load(u);
	}
	private function onDataLoaded(e:Event):Void 
	{
		this.logger.text = 'XML is loaded! : ' + (e.target).data;
		var x = (e.target).data;
		this.logger.text = x.toString();
	}
	*/
	
}