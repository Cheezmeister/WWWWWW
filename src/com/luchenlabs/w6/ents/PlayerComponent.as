package com.luchenlabs.w6.ents
{
  import com.luchenlabs.w6.core.*;
  import org.flixel.*;

  /**
   * Parameters: 
   *   walkAccel
   *   jumpVel
   *   walkDrag
   */
  public dynamic class PlayerComponent extends Component
  {
    public function PlayerComponent():void
    {
      initParams();
    }
    public override function initialize():void
    {
      this.entity.drag.x = this.params.walkDrag;
      this.entity.acceleration.y = this.params.gravity;
      this.entity.makeGraphic(5, 10, 0x88ff0000);
    }
    override protected function initParams():Object
    {
      return {
        name : "Player",
        walkAccel : 0,
        jumpVel : 0,
        walkDrag : 0,
        gravity : 100
      };
    }
  }
}
