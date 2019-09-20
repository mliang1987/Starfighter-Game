class Cell {

  int x = 0;
  int y = 0;
  PVector[] stars;
  PVector[] starColors;

  public Cell(int x, int y) {
    this.x=x;
    this.y=y;
    stars = new PVector[ (int) random(10, 20) ];
    starColors = new PVector[ stars.length ];
    for (int i = 0; i<stars.length; i++) {
      stars[i] = new PVector( random(0, CELL_SIZE), random(0, CELL_SIZE));
      starColors[i] = new PVector( (int) random(100,255),(int) random(100,255),(int) random(100,255));
    }
  }

  void show(float xshow, float yshow) {
    for (int i = 0; i<stars.length; i++) {
      fill( starColors[i].x, starColors[i].y, starColors[i].z);
      int starSize = (int) random(1, 6);
      ellipse(xshow+stars[i].x, yshow+stars[i].y, starSize, starSize);
    }
  }
}
