package com.luchenlabs.w6.ents
{
  import com.luchenlabs.w6.core.*;
  import org.flixel.*;

  public class SolidProcess extends Process
  {
    private var _type:Class;

    public function SolidProcess()
    {
      super(SolidComponent);
    }

    override public function run(entities:Array):void
    {
//      for (var i:Number = 0; i < entities.length; ++i)
//      for (var j:Number = i; j < entities.length; ++j)
//      {
//        if (i === j) continue;
//
//        var ent1:Entity = entities[i];
//        var ent2:Entity = entities[j];
//
//        var touched:Boolean = FlxObject.separate(ent1, ent2);
//        if (touched) 
//        {
////          FlxG.log(i + " touched " + j + " :O " + ent1 + " / " + ent2);
//        }
//      }
      for (var i:Number = 0; i < entities.length; ++i)
	  {
		var ent:Entity = entities[i];
		
		if(ent.touching)
		{
		  FlxG.log("touching = " + ent.touching);
		}
		  
	  }
    }
  }
}
