package com.luchenlabs.w6.core
{
  import org.flixel.*;

  public class Process
  {
    private var _type:Class;

    public function Process(t:Class)
    {
      this._type = t;
    }

    // Could use some optimization, but eh.
    public function run(ents:Array):void
    {
      //FlxG.log("Proc::run - " + ents.length);
      //FlxG.log("outside loop");
      for (var i:Number = 0; i < ents.length; ++i)
      {
        //FlxG.log("iteration " + i);
        var ent:Entity = ents[i];
        var c:Component = ent.components[_type];
        //FlxG.log("ent=" + ent + ", c=" + c);
        if (c != null)
        {
          //FlxG.log("operate");
          operate(c);
        }
      }
    }

    // Abstract :/
    protected function operate(c:Component):void
    {
    }
  }
}
