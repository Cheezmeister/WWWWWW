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
      titleText = new FlxText(0, 0, FlxG.width, title)
        .setFormat(null, 8, 0xffffffff, "center", 0);
      add(titleText);


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

      var temp:Entity = new Entity()
        .withComponent(new PlayerComponent()
          .withParams({
            walkAccel : 20,
            walkDrag : 2,
            jumpVel : 80
          }))
        .withComponent(new SolidComponent());
      temp.makeGraphic(FlxG.width / 4, 40, 0xff998822);
      temp.x = FlxG.width / 2;
      temp.y = FlxG.height / 2;
      temp.acceleration.y = 40;
      add(temp);

      var player:Entity = new Entity()
        .withComponent(new PlayerComponent()
          .withParams({
            name : "Bob",
            walkAccel : 40,
            walkDrag : 0.2,
            jumpVel : 10
          }
        )
      );
      player.x = 40;
      player.y = 40;
      player.acceleration.y = 4;
      add(player);


      // Add processes
      componentEntitySystem.addProcess(new PlayerProcess());
//      componentEntitySystem.addProcess(new SolidProcess());

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


//    private function handleInput():void
//    {
//      if (FlxG.mouse.justPressed())
//      {
//        sp = new FlxPoint(FlxG.mouse.screenX, FlxG.mouse.screenY);
//      }
//      if (FlxG.mouse.justReleased())
//      {
//        if (sp.x - FlxG.mouse.screenX > 40 &&
//            sp.y - FlxG.mouse.screenY > 40)
//          addBar(sp, FlxG.mouse);
//      }
//    }
//    private function addBar(sp:FlxPoint, ep:Mouse):void
//    {
//      var bar:FlxSprite = new FlxSprite(
//        min(sp.x, ep.screenX),
//        min(sp.y, ep.screenY)
//        );
//      bar.solid = true;
//      bar.acceleration.y = 80;
//      bar.angularVelocity = 20;
//      bar.makeGraphic(40, 10, 0xffaaeedd);
//      add(bar); 
//    }

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
