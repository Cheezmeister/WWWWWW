package src.ents
{
  import src.core.*;
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
