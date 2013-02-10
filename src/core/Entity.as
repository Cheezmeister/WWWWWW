package src.core
{
  import org.flixel.*;

  public class Entity extends FlxSprite
  {
    private var _components:Object;
    public function get components():Object
    {
      return this._components;
    }

    public function Entity()
    {
      this._components = {};
    }
    public function withComponent(c:Component):Entity
    {
      addComponent(c);
      return this;
    }
    private function addComponent(c:Component):void
    {
      var type:String = Object(c).constructor.toString();
      FlxG.log("type=" + type);
      this._components[type] = c; 
      c.setData(this);
      FlxG.log("now type=" + _components[type]);
    }
  }
}
