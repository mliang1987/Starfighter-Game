Map themap;
float x_view;
float y_view;
final float SPEED_LIMIT = 30;
final int CELL_SIZE = 200;
final int MAP_SIZE = 100;
Player starFighter;
boolean[] keys;
ArrayList<Bullet> gunfire;
ArrayList<Asteroid> obstacles;

void setup() {
  fullScreen();
      
  background(0, 0, 0);
  keys = new boolean[5];
  frameRate(60);
  themap = new Map();
  starFighter = new Player();
  imageMode(CENTER);
  gunfire = new ArrayList<Bullet>();
  obstacles = new ArrayList<Asteroid>();
  addAsteroid(400);
  
}

void draw() {
  background(0);
  themap.show();
  starFighter.moveCar();
  starFighter.show();
  showAsteroids();
  showBullets();
}

void showAsteroids() {
  for (Asteroid a : obstacles) {
    a.show();
  }
}

void showBullets() {
  for (Bullet b : gunfire) {
    b.show();
  }
}

void addAsteroid(int num) {
  for (int i = 0; i<num; i++) {
    obstacles.add( new Asteroid(  random(0, CELL_SIZE*MAP_SIZE), random(0, CELL_SIZE*MAP_SIZE)));
  }
}

void cleanUpBullets() {
  ArrayList<Bullet> toRemove = new ArrayList<Bullet>();
  for (Bullet b : gunfire) {
    if (b.life>=1000) {
      toRemove.add(b);
    }
  }
  gunfire.remove(toRemove);
}

void keyPressed() {
  if (keyCode==UP) {
    keys[0] = true;
  }
  if (keyCode==DOWN) {
    keys[1] = true;
  }
  if (keyCode==LEFT) {
    keys[2] = true;
  }
  if (keyCode==RIGHT) {
    keys[3] = true;
  }
  if (key == ' ') {
    keys[4] = true;
    starFighter.shoot();
  }
  starFighter.updateKeys(keys);
}

void keyReleased() {
  if (keyCode==UP) 
    keys[0] = false;
  if (keyCode==DOWN) 
    keys[1] = false;
  if (keyCode==LEFT) 
    keys[2] = false;
  if (keyCode==RIGHT) 
    keys[3] = false;
  if (key == ' ') 
    keys[4] = false;
  starFighter.updateKeys(keys);
}
