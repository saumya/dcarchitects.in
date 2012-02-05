package com.dzinersCombine.view;
import com.dzinersCombine.view.components.VCard;
import nme.display.Sprite;
import nme.text.Font;
import nme.text.TextFormat;
import nme.Assets;

/**
 * ...
 * @author saumya
 */

class AboutUsView extends Sprite
{
	private var font:Font;
	private var format:TextFormat;

	public function new() 
	{
		super();
		this.init();
	}
	
	private function init() 
	{	
		this.graphics.beginFill(0xFFFF00, 0.8);
		this.graphics.drawRect(0, 0, 700, 300);
		this.graphics.endFill();
		//
		var vRahul:VCard = new VCard();
		vRahul.setName('Rahul Talele');
		vRahul.setDesignation('Chief Architect');
		vRahul.x = 170;
		vRahul.y = 50;
		this.addChild(vRahul);
		var vSaumya:VCard = new VCard();
		vSaumya.setName('Saumya Ray');
		vSaumya.setDesignation('Asst. Architect');
		vSaumya.x = 170;
		vSaumya.y = 160;
		this.addChild(vSaumya);
		var vSeema:VCard = new VCard();
		vSeema.setName('Seema Talele');
		vSeema.setDesignation('Administration');
		vSeema.x = 380;
		vSeema.y = 50;
		this.addChild(vSeema);
		var vParag:VCard = new VCard();
		vParag.setName('Parag Talele');
		vParag.setDesignation('Execution Engineer');
		vParag.x = 380;
		vParag.y = 160;
		this.addChild(vParag);
	}
	
}