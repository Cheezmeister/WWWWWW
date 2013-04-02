package src.states
{
  import org.flixel.*;
  import org.flixel.system.input.*;
  import src.core.*;
  import src.ents.*;

  public class PlayState extends FlxState
  {
    public var titleText:FlxText;
    public var title:String = "Game On!";

    private var letterDelay:Number = 0.5;
    private var totalTicks:Number = 0;
    /// Start Point
    private var sp:FlxPoint = null;

    private var componentEntitySystem:CESystem;

    override public function create():void
    {

      // Create CE
      componentEntitySystem = new CESystem();

      // Add ents
      var ground:Entity = new Entity()
        .withComponent(new SolidComponent());
      ground.makeGraphic(FlxG.width, 4, 0xff228822);
      ground.immovable = true;
      ground.x = 0;
      ground.y = FlxG.height - 4;
      add(ground);

//      var temp:Entity = new Entity()
//        .withComponent(new PlayerComponent()
//          .withParams({
//            walkAccel : 20,
//            walkDrag : 2,
//            jumpVel : 80
//          }))
//        .withComponent(new SolidComponent());
//      temp.x = FlxG.width / 2;
//      temp.y = FlxG.height / 2;
//      temp.acceleration.y = 40;
//      add(temp);
//      temp.makeGraphic(4, 4, 0xff998822);

      var player:Entity = new Entity()
        .withComponent(new PlayerComponent()
          .withParams({
            name : "Bob",
            walkAccel : 40,
            walkDrag : 0.2,
            jumpVel : 10,
            gravity : 40
          }
        )
      );
      player.x = FlxG.width / 2;
      player.y = 0;
      player.acceleration.y = 4;
      add(player);


      // Add processes
      componentEntitySystem.addProcess(new PlayerProcess());
      componentEntitySystem.addProcess(new SolidProcess());

    }

    override public function add(Object:FlxBasic):FlxBasic
    {
      var ent:Entity = Object as Entity;
      if (ent !== null)
      {
        componentEntitySystem.add(ent);
      }
      super.add(Object);

      return Object;
    }

    override public function remove(Object:FlxBasic, Splice:Boolean = false):FlxBasic
    {
      super.remove(Object);
      var ent:Entity = Object as Entity;
      if (ent !== null)
      {
        componentEntitySystem.remove(ent);
      }
      return Object;
    }

    override public function update():void
    {
      componentEntitySystem.update();
      super.update();
    }

    public static function min(x:Number, y:Number):Number
    {
      return x < y ? x : y;
    }
    public static function average(x:Number, y:Number):Number
    {
      return (x + y) * 0.5;
    }
  }
}
