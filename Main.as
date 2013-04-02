package
{
  import org.flixel.*;
  import src.states.*;

  import src.core.*;
  import src.ents.*;

  
  [SWF(width="1280", height="480", backgroundColor="#000000")]
  [Frame(factoryClass="Preloader")]

  public class Main extends FlxGame
  {
    public function Main()
    {
      // 320x240 virtual resolution, zoomed to x2 pixels - menustate is the default state
      super(1280,480,PlayState,1);
      
      //set this to true if you want it to be built with the con
      forceDebugger = true;
      FlxG.debug = true;
      FlxG.setDebuggerLayout(FlxG.DEBUGGER_BIG);
      
      //30 simulated frames per second. request the same from flash for rendering.
      FlxG.framerate = 30; 
      FlxG.flashFramerate = 30;
      
      //background colour AARRGGBB format - 0x means "hexadeximal"
      FlxG.bgColor = 0xffaaccaa;
    }
  }
}
