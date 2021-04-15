
import ldtk.Layer_IntGrid;
import h2d.Anim;

class Entity {
  public var cx: Int;
  public var cy: Int;
  var rx: Float;
  var ry: Float;
  var dx: Float;
  var dy: Float;
  public var xx: Int;
  public var yy: Int;
  public var sprite: h2d.Anim;
  var sLib: SpriteLib;
  var animationState: String;
  public var dir: Array<Int>;

  public function new(xo: Int, yo: Int, lib: SpriteLib) {
    cx = xo;
    cy = yo;
    rx = 0.0;
    ry = 0.0;
    dx = 0.0;
    dy = 0.0;
    xx = xo * 8;
    yy = xo * 8;
    dir = [0,0];
    sLib = lib;

    sprite = new h2d.Anim();
    sprite.x = xo * 8;
    sprite.y = yo * 8;

  }

  public function update(scene: Layer_IntGrid) {

    // Standard motion function

    if (rx > 1) {rx--; cx++;};
    if (rx < -1) {rx++; cx--;};
    if (ry > 1) {ry--; cy++;};
    if (ry < -1) {ry++; cy--;};

    rx += dx * dir[0];
    ry += dy * dir[1];

    
    xx = Std.int((cx + rx) * 8);
    yy = Std.int((cy + ry) * 8) + 8;
    sprite.y = yy;
    sprite.x = xx;

    

    // Reset direction
  }
  public function moveTo(direction) {
    dir = direction;

  }
}