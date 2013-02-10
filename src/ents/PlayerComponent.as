package src.ents
{
  import src.core.*;
  import org.flixel.*;

  /**
   * Parameters: walkAccel
   */
  public dynamic class PlayerComponent extends Component
  {
    public function PlayerComponent():void
    {
    }
    override public function initialize():void
    {

      this.entity.drag.x = -this.params.walkDrag;

      this.entity.makeGraphic(50, 100, 0xffff0000);

      FlxG.log("param.walkaccell=" + this.params.walkAccel);
    }
  }
}
