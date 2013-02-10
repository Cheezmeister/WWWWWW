package src.ents
{
        import org.flixel.*;
        
        public class ShooterMatic extends FlxSprite
        {
                public function ShooterMatic(x, y)
                {
                        super(x, y);
			makeGraphic(20, 10, 0xffaaeecc);
                }
                override public function update():void
                {
			super.update();
                        angularDrag = 180;
                        drag.x = 120;
                        drag.y = 120;
			handleInput();
                }
		private function handleInput():void
		{
                        var shipAcc:Number = 80;
                        this.acceleration.x = 0;
                        this.acceleration.y = 0;
			if (FlxG.keys.DOWN)
			{
				this.acceleration.x = shipAcc * Math.cos(this.angle * Math.PI / 180);
				this.acceleration.y = shipAcc * Math.sin(this.angle * Math.PI / 180);
			}
			else if (FlxG.keys.UP)
			{
				this.acceleration.x = -shipAcc * Math.cos(this.angle * Math.PI / 180);
				this.acceleration.y = -shipAcc * Math.sin(this.angle * Math.PI / 180);
			}

			this.angularAcceleration = 0;
			if (FlxG.keys.LEFT)
				this.angularAcceleration = -180;
			else if (FlxG.keys.RIGHT)
				this.angularAcceleration = 180;


                        if (FlxG.keys.SPACE)
                        {
                                shoot();
                        }

		}
		private function shoot():void
		{
			var angle:Number = this.angle;
                        var bulletVel:Number = 50;
			var bullet:FlxSprite = new Bullet(
                                this.getMidpoint().x, 
                                this.getMidpoint().y
                                );
			bullet.makeGraphic(2, 2, 0xffee2222);
			bullet.velocity.x = Math.cos(angle * Math.PI / 180) * bulletVel;
			bullet.velocity.y = Math.sin(angle * Math.PI / 180) * bulletVel;
			//  parent.add(bullet);
		}
        }
}
