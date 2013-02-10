package
{
	import org.flixel.system.FlxPreloader;
	import flash.display.StageQuality;

	public class Preloader extends FlxPreloader
	{
		public function Preloader()
		{
			className = "Main";
			//stage.quality = StageQuality.LOW;
			super();
		}
	}
}
