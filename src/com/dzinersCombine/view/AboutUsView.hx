package com.dzinersCombine.view;
import com.dzinersCombine.view.components.VCard;
import nme.display.Sprite;

/**
 * ...
 * @author saumya
 */

class AboutUsView extends Sprite
{

	public function new() 
	{
		super();
		this.init();
	}
	
	private function init() 
	{
		this.graphics.beginFill(0xFFFFFF, 0.5);
		this.graphics.drawRect(0, 0, 700, 300);
		this.graphics.endFill();
		//
		var vRahul:VCard = new VCard();
		vRahul.setName('Rahul M Talele');
		vRahul.setDesignation('Architect');
		vRahul.x = 170;
		vRahul.y = 50;
		this.addChild(vRahul);
		var vSaumya:VCard = new VCard();
		vSaumya.setName('Saumya Ray');
		vSaumya.setDesignation('Architect');
		vSaumya.x = 170;
		vSaumya.y = 160;
		this.addChild(vSaumya);
		var vSeema:VCard = new VCard();
		vSeema.setName('Seema R Talele');
		vSeema.setDesignation('3D visualiser');
		vSeema.x = 380;
		vSeema.y = 50;
		this.addChild(vSeema);
		var vParag:VCard = new VCard();
		vParag.setName('Parag M Talele');
		vParag.setDesignation('Excution Engineer');
		vParag.x = 380;
		vParag.y = 160;
		this.addChild(vParag);
	}
	
}