package src.ents
{
  import src.core.*;
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

      this.entity.drag.x = -this.params.walkDrag;

      this.entity.makeGraphic(50, 100, 0xffff0000);

      FlxG.log("param.walkaccell=" + this.params.walkAccel);
      FlxG.log("param.walkDrag=" + this.params.walkDrag);
      FlxG.log("param.jumpVel=" + this.params.jumpVel);
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
