package com.luchenlabs.w6.states
{
  import org.flixel.*;
  import org.flixel.system.input.*;
  import com.luchenlabs.w6.core.*;
  import com.luchenlabs.w6.ents.*;

  public class PlayState extends FlxState
  {
    public var titleText:FlxText;
    public var title:String = "Game On!";

    private var letterDelay:Number = 0.5;
    private var totalTicks:Number = 0;
    /// Start Point
    private var sp:FlxPoint = null;

    private var componentEntitySystem:CESystem;
    private var player : *;

    override public function create():void
    {

      // Create CE
      componentEntitySystem = new CESystem();

      // Add ents
      var map:FlxTilemap = new FlxTilemap();
      map.loadMap(
        "0,0,0,0,0,0,0,0\n" +
        "0,0,0,0,0,0,0,0\n" +
        "0,0,0,0,0,0,0,0\n" +
        "0,0,1,0,0,0,1,0\n" +
        "0,0,0,0,0,1,0,0\n" +
        "0,0,0,0,1,0,0,0",

        Assets.imgTest, 80, 80, FlxTilemap.OFF, 0, 0, 1);

      add(map);
	  FlxG.log("Added Map");

      var ground:FlxSprite = new FlxSprite();
      ground.makeGraphic(FlxG.width, 4, 0xff228822);
      ground.immovable = true;
      ground.x = 0;
      ground.y = FlxG.height - 4;
      add(ground);

      this.player = new Entity()
        .withComponent(new PlayerComponent()
          .withParams({
            name : "Bob",
            walkAccel : 360,
            walkDrag : 200,
            jumpVel : 400,
            gravity : 800
          }
        )
      );
      player.x = FlxG.width / 2;
      player.y = FlxG.height / 2;
      add(player);

      FlxG.log("Added Player");


      // Add processes
      componentEntitySystem.addProcess(new PlayerProcess());

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
      FlxG.collide(player, this);
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
