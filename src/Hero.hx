class Hero extends Entity {
  public function new(xo: Int, yo: Int, lib: SpriteLib) {
    super(xo, yo, lib);
    sprite.play(sLib.heroIdleRight);
    dx = 0.0625;
  }
}