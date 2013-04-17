package com.luchenlabs.w6
{
	import org.flixel.system.FlxPreloader;
	import flash.display.StageQuality;

	public class Preloader extends FlxPreloader
	{
		public function Preloader()
		{
			className = "com.luchenlabs.w6.Main";
			//stage.quality = StageQuality.LOW;
			super();
		}
	}
}
