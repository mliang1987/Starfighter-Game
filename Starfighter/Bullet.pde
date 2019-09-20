class Bullet {
  float x;
  float y;
  PVector speed;
  int life;

  public Bullet(PVector shipSpeed) {
    this.x = x_view +(width/2);
    this.y = y_view +(height/2);
    speed = new PVector(shipSpeed.x, shipSpeed.y);
    speed.setMag( shipSpeed.mag()+20);
    life = 0;
  }

  void show() {
    x = x+speed.x;
    y = y+speed.y;
    fill(255, 255, 0);
    ellipse(x-x_view,y-y_view, 10, 10);
    life++;
  }
}
