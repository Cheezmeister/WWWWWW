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
//      FlxG.mouse.show();
//      titleText = new FlxText(0, 0, FlxG.width, title)
//        .setFormat(null, 8, 0xffffffff, "center", 0);
//      add(titleText);


      componentEntitySystem = new CESystem();

      

      //  .withComponent(new SolidComponent())
      //  .withComponent(new PlayerComponent().withParams({
      //    walkAccel : 50,
      //    jumpVel : 80,
      //    //walkDrag : 80,
      //    gravity : 50
      //  }));

      var player:Entity = new Entity()
        .withComponent(new SolidComponent())
        .withComponent(new PlayerComponent().withParams({
          walkAccel : 50,
          jumpVel : 80,
          //walkDrag : 80,
          gravity : 50
        }));
      player.x = FlxG.width / 2;
      player.y = FlxG.height / 2;
      player.makeGraphic(32,100, 0xff00ffff);
      FlxG.log("adding Player");
      add(player); // 8D


      //floor = new FlxTileblock(0, FlxG.height - 4, FlxG.width, 4);
      //floor.makeGraphic(FlxG.width, 4, 0xff689c16);

      var ground:Entity = new Entity()
        .withComponent(new SolidComponent());

      ground.makeGraphic(FlxG.width, 4, 0xff228822);
      ground.immovable = true;
      ground.x = 0;
      ground.y = FlxG.height - 4;
      FlxG.log("adding Ground");
      add(ground);

      componentEntitySystem.addProcess(new PlayerProcess());
      componentEntitySystem.addProcess(new SolidProcess());

    }

    override public function add(Object:FlxBasic):FlxBasic
    {
      super.add(Object);

      var ent:Entity = Object as Entity;
      if (ent !== null)
      {
        componentEntitySystem.add(ent);
      }
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


    private function handleInput():void
    {
      if (FlxG.mouse.justPressed())
      {
        sp = new FlxPoint(FlxG.mouse.screenX, FlxG.mouse.screenY);
      }
      if (FlxG.mouse.justReleased())
      {
        if (sp.x - FlxG.mouse.screenX > 40 &&
            sp.y - FlxG.mouse.screenY > 40)
          addBar(sp, FlxG.mouse);
      }
    }
    private function addBar(sp:FlxPoint, ep:Mouse):void
    {
      var bar:FlxSprite = new FlxSprite(
        min(sp.x, ep.screenX),
        min(sp.y, ep.screenY)
        );
      bar.solid = true;
      bar.acceleration.y = 80;
      bar.angularVelocity = 20;
      bar.makeGraphic(40, 10, 0xffaaeedd);
      add(bar); 
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
