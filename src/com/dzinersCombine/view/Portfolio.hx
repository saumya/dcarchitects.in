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
	private var civilNodes:Fast;
	private var interiorNodes:Fast;
	private var civilImagePaths:Array<String>;
	private var interiorImagePaths:Array<String>;
	//
	private var isCivilOnDisplay:Bool;
	private var isInteriorOnDisplay:Bool;
	

	public function new() 
	{
		super();
		this.init();
	}
	
	private function init() 
	{
		
		this.graphics.beginFill(0x777777,1.0);
		this.graphics.drawRect(0, 0, 700, 300);
		this.graphics.endFill();
		this.graphics.beginFill(0xAAAAAA,1.0);
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
		this.leftArrow = new Sprite();
		this.rightArrow = new Sprite();
		this.addChild(this.leftArrow);
		this.addChild(this.rightArrow);
		this.leftArrow.addChild(arrow1);
		this.rightArrow.addChild(arrow2);
		this.leftArrow.x = 0;
		this.leftArrow.y = 120;
		this.rightArrow.x = 636;
		this.rightArrow.y = 120;
		//this.leftArrow.width = this.rightArrow.width = 20;
		//this.leftArrow.height = this.rightArrow.height = 20;
		this.leftArrow.addEventListener(MouseEvent.CLICK, onBack);
		this.rightArrow.addEventListener(MouseEvent.CLICK, onNext);
		//
		this.imageHolder = new ImageHolderWithBorder();
		this.addChild(this.imageHolder);
		this.imageHolder.x = 150;
		this.imageHolder.y = 10;
		//create the loader
		//this.imageLoader = new Loader();
		//this.imageHolder.addChild(this.imageLoader);
		//this.imageLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onImageLoadComplete);
		this.imageIndex = 0;
		//get the data
		this.parseData();
		//load XML
		//this.loadGalleryConfig();
	}
	/*
	private function onImageLoadComplete(e:Event):Void 
	{
		//this.imageHolder.addChild(l);
		this.logger.text = 'onImageLoadComplete';
	}
	*/
	private function parseData() 
	{
		var s = Assets.getText('assets/slideShow.xml');
		var x:Xml = Xml.parse(s).firstElement();
		var xFast:Fast = new Fast(x);
		//this.logger.text = (xFast.node.portfolio.innerHTML);
		//this.logger.text = (xFast.innerHTML);
		var portfolioNodes =xFast.node.portfolio ;
		//var portfolioNodes =xFast.node.portfolio.node.interior ;
		
		this.interiorNodes = xFast.node.portfolio.node.interior;
		this.civilNodes = xFast.node.portfolio.node.civil;
		//
		//this.logger.text = portfolioNodes.nodes.img.length+' :: ';
		//Getting the paths
		//var paths:Array<String> = new Array<String>();
		//this.allImagePaths = new Array<String>();
		this.civilImagePaths = new Array<String>();
		this.interiorImagePaths = new Array<String>();
		//parsing civil data
		for (dataNode in this.civilNodes.nodes.img)
		//for (dataNode in this.interiorNodes.nodes.img)
		{
			//this.logger.text += dataNode.att.path;
			this.civilImagePaths.push(dataNode.att.path);
			//this.logger.text += this.allImagePaths.toString();
		}
		//parsing interior data
		for (dataNode in this.interiorNodes.nodes.img)
		{
			this.interiorImagePaths.push(dataNode.att.path);
			//this.logger.text += this.allImagePaths.toString();
		}
		//render the first image
		//this.startRenderingImages();
		this.isCivilOnDisplay = false;
		this.isInteriorOnDisplay = false;
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
		//this.logger.text = this.imageHolder.numChildren + '';
		//this.imageHolder.removeChildAt(0);
		var n = this.imageHolder.numChildren-1;
		if (n>0)
		{
			for (i in 0 ... n )
			{
				this.imageHolder.removeChildAt(i);
			}
		}
		//this.imageHolder.removeChildAt(1);
		//var b = new Bitmap(Assets.getBitmapData(this.allImagePaths[this.imageIndex]));
		//var b:Bitmap = new Bitmap();
			if (this.isCivilOnDisplay)
			{
				//this.loadImageInContainer(this.civilImagePaths[this.imageIndex]);
				this.imageHolder.removeChildAt(0);
				var b:Bitmap = new Bitmap(Assets.getBitmapData(this.civilImagePaths[this.imageIndex]));
				this.imageHolder.addChild(b);
			}else if (this.isInteriorOnDisplay)
			{
				this.imageHolder.removeChildAt(0);
				var b:Bitmap = new Bitmap(Assets.getBitmapData(this.interiorImagePaths[this.imageIndex]));
				this.imageHolder.addChild(b);
			}
		//this.imageHolder.addChild(b);
		//var u:URLRequest = new URLRequest(imagePath);
		//this.imageLoader.load(u);
	}
	
	private function onNext(e:MouseEvent):Void 
	{
		//this.logger.text = 'next : This is the last image.';
		if (this.isCivilOnDisplay)
		{
			//this.loadImageInContainer(this.civilImagePaths[this.imageIndex]);
			if (this.imageIndex>=(this.civilImagePaths.length-1))
			{
				//DO Nothing
			}else {
				this.imageIndex++;
				//this.logger.text = 'next : ' + this.allImagePaths[this.imageIndex];
				//this.loadImageInContainer(this.allImagePaths[this.imageIndex]);
				this.loadImageInContainer(this.civilImagePaths[this.imageIndex]);
			}
		}else if (this.isInteriorOnDisplay)
		{
			//this.loadImageInContainer(this.interiorImagePaths[this.imageIndex]);
			if (this.imageIndex>=(this.interiorImagePaths.length-1))
			{
				//DO Nothing
			}else {
				this.imageIndex++;
				//this.logger.text = 'next : ' + this.allImagePaths[this.imageIndex];
				//this.loadImageInContainer(this.allImagePaths[this.imageIndex]);
				this.loadImageInContainer(this.interiorImagePaths[this.imageIndex]);
			}
		}
	}
	
	private function onBack(e:MouseEvent):Void 
	{
		//this.logger.text = 'back : Nothing to do. This is the first image.';
		/*
		if (this.imageIndex<=0)
		{
			//DO Nothing
		}else {
			this.imageIndex--;
			//this.logger.text = 'back : ' + this.allImagePaths[this.imageIndex];
			if (this.isCivilOnDisplay)
			{
				this.loadImageInContainer(this.civilImagePaths[this.imageIndex]);
			}else if (this.isInteriorOnDisplay)
			{
				this.loadImageInContainer(this.interiorImagePaths[this.imageIndex]);
			}
		}
		*/
		if (this.isCivilOnDisplay)
		{
			//this.loadImageInContainer(this.civilImagePaths[this.imageIndex]);
			if (this.imageIndex<1)
			{
				//DO Nothing
			}else {
				this.imageIndex--;
				//this.logger.text = 'next : ' + this.allImagePaths[this.imageIndex];
				//this.loadImageInContainer(this.allImagePaths[this.imageIndex]);
				this.loadImageInContainer(this.civilImagePaths[this.imageIndex]);
			}
		}else if (this.isInteriorOnDisplay)
		{
			//this.loadImageInContainer(this.interiorImagePaths[this.imageIndex]);
			if (this.imageIndex<1)
			{
				//DO Nothing
			}else {
				this.imageIndex--;
				//this.logger.text = 'next : ' + this.allImagePaths[this.imageIndex];
				//this.loadImageInContainer(this.allImagePaths[this.imageIndex]);
				this.loadImageInContainer(this.interiorImagePaths[this.imageIndex]);
			}
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
	
	public function startRenderingCivilPortfolio():Void
	{
		this.clearPortfolio();
		//
		this.imageIndex = 0;
		var b = new Bitmap(Assets.getBitmapData(this.civilImagePaths[this.imageIndex]));
		this.imageHolder.addChild(b);
		//
		this.isCivilOnDisplay = true;
		this.isInteriorOnDisplay = false;
	}
	public function startRenderingInteriorPortfolio():Void
	{
		this.clearPortfolio();
		//
		this.imageIndex = 0;
		var b = new Bitmap(Assets.getBitmapData(this.interiorImagePaths[this.imageIndex]));
		this.imageHolder.addChild(b);
		//
		this.isCivilOnDisplay = false;
		this.isInteriorOnDisplay = true;
	}
	private function clearPortfolio():Void
	{
		var n = this.imageHolder.numChildren;
		if (n>0)
		{
			for (i in 0 ... n )
			{
				this.imageHolder.removeChildAt(i);
			}
		}
	}
}