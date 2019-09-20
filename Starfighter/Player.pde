class Player {

  float x; // represents the center of the player
  float y; // represents the center of the player
  float angle;
  float size;
  PVector speed;
  PImage sprite;
  boolean keys[];

  public Player() {
    sprite = loadImage("frigate.png");
    this.x=width/2-12.5;
    this.y=height/2-17.5;
    this.size = 80;
    keys = new boolean[5];
    angle = HALF_PI;
    speed = new PVector(0, 1);
    angle = speed.heading();
  }

  void rotateClock() {
    speed.rotate(-QUARTER_PI/30);
    angle = speed.heading();
  }

  void rotateCounter() {
    speed.rotate(QUARTER_PI/30);
    angle = speed.heading();
  }

  void show() {
    x_view = x_view+speed.x;
    y_view = y_view+speed.y;
    x = x_view+width/2;
    y = y_view+height/2;
    if (x_view<0) {
      x_view = CELL_SIZE*MAP_SIZE;
    }
    if (x_view>CELL_SIZE*MAP_SIZE) {
      x_view = 0;
    }
    if (y_view<0) {
      y_view = CELL_SIZE*MAP_SIZE;
    }
    if (y_view>CELL_SIZE*MAP_SIZE) {
      y_view = 0;
    } 
    pushMatrix();
    translate(width/2, height/2);
    rotate(angle);
    rotate(HALF_PI);
    image(sprite, 0, 0, 160, 160);
    popMatrix();
  }

  void moveCar() {
    if (keys[0]==true && speed.mag()<=SPEED_LIMIT) {
      speed.setMag( speed.mag()+0.05);
    } 
    if (keys[1]==true && speed.mag()>0.05) {
      speed.setMag( speed.mag()-0.05);
    }
    if (keys[2]==true) {
      rotateClock();
    }
    if (keys[3]== true) {
      rotateCounter();
    }
  }

  void updateKeys(boolean[] k) {
    this.keys = k;
  }

  void shoot(){
      Bullet b = new Bullet(this.speed);
      gunfire.add(b);
    }

}
