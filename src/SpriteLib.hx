import haxe.Json;

class SpriteLib {
  public var tileset: h2d.Tile;
  public var tileWidth: Int;
  public var tileHeight: Int;
  public var heroWalkRight: Array<h2d.Tile>;
  public var heroWalkLeft: Array<h2d.Tile>;
  public var heroIdleRight: Array<h2d.Tile>;
  public var heroIdleLeft: Array<h2d.Tile>;

  public function new() {
    tileset = hxd.Res.tileset.toTile();
    tileWidth = 8;
    tileHeight = 8;
		var tilesetData = Json.parse(hxd.Res.atlas.entry.getText());
    heroWalkRight = getAnimation(tilesetData.hero.walkRight );
    heroWalkLeft = getAnimation(tilesetData.hero.walkLeft );
    heroIdleRight = getAnimation(tilesetData.hero.idleRight );
    heroIdleLeft = getAnimation(tilesetData.hero.idleLeft );

    //Sprite data

  }

  public function getAnimation(data) {

		var sx: Int = data.x;
		var sy: Int = data.y;
		var sw: Int = data.w;
		var sh: Int = data.h;
    var frame: Int = data.frame;

		var animationArray = [for (i in 0...frame) tileset.sub(sx + i * sw, sy, sw, sh) ];

		return animationArray;
  }
  public function getAnimationFromLD(data, frame: Int) {

		var sx: Int = data.x;
		var sy: Int = data.y;
		var sw: Int = data.w;
		var sh: Int = data.h;

		var animationArray = [for (i in 0...frame) tileset.sub(sx + i * sw, sy, sw, sh) ];

		return animationArray;
  }
}
