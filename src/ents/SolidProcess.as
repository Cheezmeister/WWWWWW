package src.ents
{
  import src.core.*;
  import org.flixel.*;

  public class SolidProcess extends Process
  {
    private var _type:Class;

    public function SolidProcess()
    {
      super(SolidComponent);
    }

    override public function run(ents:Array):void
    {
      for (var i:Number = 0; i + 1 < ents.length; ++i)
      for (var j:Number = 0; j + 1 < ents.length; ++j)
      {
        if (i === j) continue;

        var ent1:Entity = ents[i];
        var ent2:Entity = ents[j];

        var touched:Boolean = FlxObject.separate(ent1, ent2);
      }
    }
  }
}
