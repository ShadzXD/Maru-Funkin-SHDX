package funkin.objects.ui;
import funkin.objects.funkui.FunkBar;
import flixel.util.FlxStringUtil;

class MaruHUD extends MainHUD
{
    public function new()
    {
		  super();

      iconP1 = new HealthIcon(PlayState.instance.boyfriend.icon, true, true);
		  iconP2 = new HealthIcon(PlayState.instance.dad.icon, false, true);

      healthBar = new FunkBar(0, !getPref('downscroll') ? FlxG.height * 0.9 : FlxG.height * 0.1, SkinUtil.getAssetKey("healthBar"));
		  healthBar.screenCenter(X);
		  add(healthBar);

      iconGroup = new SpriteGroup();
      iconGroup.update(0.0); // Move the icons to the healthbar
      healthBar.drawComplex(PlayState.instance.camGame);
		  add(iconGroup);
		  iconGroup.add(iconP1); iconGroup.add(iconP2);

		  scoreTxt = new FlxFunkText(0, healthBar.y + 30, "", FlxPoint.weak(FlxG.width, 20));
		  scoreTxt.size = 20;
		  scoreTxt.style = TextStyle.OUTLINE(2, 6, FlxColor.BLACK);
		  scoreTxt.alignment = "center";
		  add(scoreTxt);

    }

    override public function beatHit()
    {
        iconP1.bumpIcon();
        iconP2.bumpIcon();
    }

    override function updateScoreText(score:Int,  misses:Int, rating:String, acc:Float)
    {
		  scoreTxt.text = 'Score: ${FlxStringUtil.formatMoney(score, false, true)} / Accuracy: $acc% [$rating] / Misses: $misses';
    }
}