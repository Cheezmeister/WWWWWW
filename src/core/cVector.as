package core
{
        import org.flixel.FlxPoint;
        public class cVector extends FlxPoint
        {
                override public function Vector(x:Number, y:Number):void
                {
                        super(x, y);
                }
                public function plus(rhs:cVector):cVector
                {
                        cVector v = new cVector(x, y);
                        v.x += rhs.x;
                        v.y += rhs.y;
                        return v;
                }
                public function plusEquals(rhs:cVector):void
                {
                        this.x += rhs.x;
                        this.y += rhs.y;
                }

        }
}
