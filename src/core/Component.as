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
      setParams(params);
      return this;
    }

    public final function setParams(params:Object):void
    {
      this._params = initParams();
      for (var key:String in params)
      {
        this._params[key] = params[key];
      }
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

    protected function initParams():Object
    {
      FlxG.log("Shouldn't see this!");
      return {};
    }

    public function toString():String
    {
      var p:String = '(';

      for (var key:String in params)
      {
        p += key + ':' + params[key]
      }
      p += ')';

      return p;
    }
  }
}
