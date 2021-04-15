import ldtk.Layer_IntGrid;
import h2d.Anim;
import h2d.Object;
import h2d.TileGroup;
import hxd.App;
import hxd.Key;
import hxd.Timer;



class Game extends hxd.App {

	var tf: h2d.Text;
  var world: MyWorld;
  var myScene: h2d.TileGroup;
  var hero: Hero;
  var spriteLib: SpriteLib;
  var scale: Float;

  var collisionGrid: Layer_IntGrid;

  override function init() {

    scale = 4.0;
    spriteLib = new SpriteLib();


    // Init eh world
    // Read project JSON
    world = new MyWorld();


    // Get level data
    var level = world.all_levels.Level1;
    var level2 = world.all_levels.Level2;

    myScene = new TileGroup(spriteLib.tileset);

    // Get level background image
    //if( level.hasBgImage() ) {
    //  var background = level.getBgBitmap();
    //  myScene.addChild( background );
    //}

    // Render an auto-layer 
    var l1 = new h2d.Object(s2d);
    var layerOne = level.l_Tiles.render();
    var layerTwo = level.l_Decors.render();
    var objectLayer = level.l_Entities;

    var intLayer = level.l_IntGrid;
    collisionGrid = intLayer;
    trace (intLayer.getInt(0,4));

    // First Layer
    l1.x = level.worldX * scale;
    l1.y = level.worldY * scale;
    l1.scaleX = scale;
    l1.scaleY = scale;

    // object Layer
    for (t in objectLayer.all_Torch) {
      var torch = new Anim(spriteLib.getAnimationFromLD(t.defaultTileInfos, t.f_frame));
      torch.x = t.cx * 8;
      torch.y = t.cy * 8;
      layerOne.addChild(torch);



    }

    // Lyaer two
    l1.addChild( layerOne );
    l1.addChild( layerTwo );

    hero = new Hero(objectLayer.all_Hero[0].cx, objectLayer.all_Hero[0].cy, spriteLib);
    layerOne.addChild(hero.sprite);

    // Render an auto-layer 
    //Level two
    var l2 = new h2d.Object(s2d);
    var layerOne2 = level2.l_Tiles.render();
    var layerTwo2 = level2.l_Decors.render();
    l2.x = level2.worldX * scale;
    l2.y = level2.worldY * scale;
    l2.scaleX = scale;
    l2.scaleY = scale;
    l2.addChild( layerOne2 );
    l2.addChild( layerTwo2 );


    
    // test debug
    tf = new h2d.Text(hxd.res.DefaultFont.get(), s2d);
		tf.scaleX = 4.0;
		tf.scaleY = 4.0;
		tf.text = "Hello";
    
	}
  override function update(dt:Float) {
    inputsManager();

    hero.update(collisionGrid);
    s2d.camera.x = hero.xx * scale;
    s2d.camera.y = hero.yy * scale;
    
    // Adjust display tile to screen size
    
    tf.text = Std.string(Std.int(Timer.fps()));
  }

  function inputsManager() {
    var dir=[0,0];
    if (Key.isDown(Key.RIGHT)) {
      dir[0] = 1;
    }
    else if (Key.isDown(Key.LEFT)) {

      dir[0] = -1;
    }

    if (Key.isDown(Key.UP)) {
      dir[1] = -1;

    }
    else if (Key.isDown(Key.DOWN)) {
      dir[1] = 1;

    }
    hero.dir = dir;

    
  }

  static function main() {
    hxd.Res.initEmbed();
    new Game();
  }
}
