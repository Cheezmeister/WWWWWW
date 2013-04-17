package com.luchenlabs.w6.ents
{
  import org.flixel.*;
  import com.luchenlabs.w6.core.*;

  public class PlayerProcess extends Process
  {
    public function PlayerProcess()  
    {
      super(PlayerComponent);
    }
    protected override function operate(c:Component):void
    {
		FlxG.log("velocity " + c.entity.velocity.y + "\tacceleration " + c.entity.acceleration.y);
		 
      // Walk left/right
      c.entity.acceleration.x = (
        FlxG.keys.RIGHT ? c.params.walkAccel : 
        FlxG.keys.LEFT ? -c.params.walkAccel :
        0);

      // Jump (LOL)
      if (FlxG.keys.SPACE)
      {
        c.entity.velocity.y = -c.params.jumpVel;
		c.entity.y--;
      }

      // Fall/stand
      if (c.entity.isTouching(FlxObject.DOWN))
      {
        c.entity.acceleration.y = 0;
      }
      else 
      {
        c.entity.acceleration.y = c.params.gravity;
      }

    }
  }
}

