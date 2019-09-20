class Asteroid {

  float x;
  float y;
  PVector speed;
  int life;
  float size;
  float angle;

  public Asteroid(float x, float y) {
    this.x = x;
    this.y = y;
    speed = new PVector( random(-3, 3), random(-3, 3));
    life = 1;
    size = life;
    angle = 0;
  }

  void move() {
    if (speed.mag()<=10) {
      speed.setMag(size);
    }
    x = x+speed.x;
    y = y+speed.y;
    angle = angle+0.05;
    if (x<-2*width)
      x = CELL_SIZE*MAP_SIZE+2*width;
    if (x>CELL_SIZE*MAP_SIZE+2*width)
      x = -2*width;
    if (y<-2*height)
      y = CELL_SIZE*MAP_SIZE+2*height;
    if (y>CELL_SIZE*MAP_SIZE+2*height)
      y = -2*height;
  }

  void show() {
    move();
    if (isVisible()) {
      pushMatrix();
      translate(x-x_view, y-y_view);
      rotate(angle);
      fill(255);
      noStroke();
      rectMode(CENTER);
      rect(0, 0, size, size);
      popMatrix();
      pushMatrix();
      translate(x-x_view, y-y_view);
      rotate(angle+QUARTER_PI);
      fill(255);
      noStroke();
      rectMode(CENTER);
      rect(0, 0, size, size);
      popMatrix();
    }
    size+=0.1;
  }


  boolean isVisible() {
    return (x > -size +x_view && x<width+x_view+size && y > -size +y_view && y<height+y_view+size);
  }
}
