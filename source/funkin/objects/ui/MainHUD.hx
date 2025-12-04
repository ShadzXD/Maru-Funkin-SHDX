package funkin.objects.ui;
import funkin.objects.funkui.FunkBar;

class MainHUD extends FlxSpriteGroup
{
    private var iconGroup:SpriteGroup;
	public var iconP1:HealthIcon;
	public var iconP2:HealthIcon;
	public var healthBar:FunkBar;
    public var scoreTxt:FlxFunkText;
	var watermark:FunkinSprite;
    public var useHealth:Bool = true;
    public function beatHit(){}
    public function updateScoreText(score:Int,misses:Int, rating:String,  acc:Float){}
}