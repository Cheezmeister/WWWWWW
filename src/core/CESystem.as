package src.core
{
  import org.flixel.*;

  public class CESystem
  {
    private var _ents:Array;
    //private var _components:Object;
    private var _procs:Array;

    public function CESystem()
    {
      _ents = new Array();
      _procs = new Array();
    }

    public function remove(ent:Entity):void
    {
      var i:Number = _ents.indexOf(ent);
      if (i === -1) return;

      _ents.splice(i, 1);
    }

    public function addProcess(proc:Process):void
    {
      //FlxG.log("pushing proc");
      _procs.push(proc);
      //FlxG.log("pushed proc");
    }

    public function add(ent:Entity):void
    {
      FlxG.log("pushing ent");
      _ents.push(ent);
      for (var key:String in ent.components)
      {
        FlxG.log("initing");
        var c:Component = ent.components[key];
        FlxG.log("c=" + c);
        c.initialize();
        FlxG.log("inited");
      }
      FlxG.log("pushed ent");
    }

    public function update():void
    {
      for (var i:Number = 0; i < _procs.length; ++i)
      {
      //  FlxG.log("process " + i + "updating");
        var p:Process = _procs[i];
        p.run(_ents);
      }
    }
  }
}
