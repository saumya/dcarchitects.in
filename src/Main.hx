package ;

import com.dzinersCombine.view.ApplicationContainer;
import nme.display.StageAlign;
import nme.display.StageScaleMode;
import nme.Lib;

/**
 * Application entry point
 * 
 * @author saumya
 */

class Main 
{	
	static public function main() 
	{
		var stage = Lib.current.stage;
		stage.scaleMode = StageScaleMode.NO_SCALE;
		stage.align = StageAlign.TOP_LEFT;
		// entry point
		stage.addChild(new ApplicationContainer());
	}
}