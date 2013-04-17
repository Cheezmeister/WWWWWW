package com.luchenlabs.w6.ents
{
  import com.luchenlabs.w6.core.*;
  import org.flixel.*;

  public dynamic class SolidComponent extends Component
  {
    public function SolidComponent():void
    {
    }
    override public function initialize():void
    {
      this.entity.solid = true;
    }
  }
}
