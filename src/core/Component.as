package src.core
{
  import org.flixel.*;

  public dynamic class Component
  {
    private var _ent:Entity;

    private var _params:Object;

    public function get params():Object
    { 
      return this._params; 
    }
    public function get entity():Entity
    { 
      return this._ent; 
    }

    public final function withParams(params:Object):Component
    {
      // FlxG.log("Component::params=" + params);
      setParams(params);
      return this;
    }

    public final function setParams(params:Object):void
    {
      // FlxG.log("now Component::params=" + params);
      this._params = params;
    }

    public final function withData(ent:Entity):Component
    {
      setData(ent);
      return this;
    }

    public final function setData(ent:Entity):void
    {
      this._ent = ent;
    }

    public function initialize():void
    {
      FlxG.log("Shouldn't see this!");
    }
  }
}
