package src.ents
{
  import org.flixel.*;
  import src.core.*;
        
  public class EntFactory
  {
    public function makeBullet(x:Number, y:Number):Entity
    {
      var ret:Entity = new Entity()
          .withComponent(DamageComponent());
    }
  }
}

