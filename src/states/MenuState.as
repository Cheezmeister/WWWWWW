package src.states
{
  import org.flixel.*;

  public class MenuState extends FlxState
  {
    public var titleText:FlxText;
    private const instructionText:String = 

"Stuff. Lorem ipsum dolor sit amet adipiscing cosectur blah blah blah " +
"can't read my, can't read my, no he can't read my poker face" +

                "";

    //Called when Menustate is reset or created, such as at the start of the game
    //or when returning to the menu with FlxG.switchState(new MenuState());
    override public function create():void
    {
      titleText = new FlxText(0,FlxG.height / 10,FlxG.width,"Preparation...")
          .setFormat(null,12,0xffffff,"center",0);

      var instructions:FlxText = new FlxText(0, FlxG.height / 5, FlxG.width, instructionText)
          .setFormat(null, 8, 0x005588, "left", 0);

      add(titleText);
      add(instructions);
    }
    
    //called every frame
    override public function update():void
    {
      super.update(); //this does the basics of a state - updates everything that's added
      
      handleInput();
    }
    private function handleInput():void
    {
      var thestate:PlayState = new PlayState(); // do stuff
      if (FlxG.keys.SPACE)
        FlxG.switchState(thestate);
    }
  }
}
