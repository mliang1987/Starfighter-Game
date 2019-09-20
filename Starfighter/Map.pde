class Map {
  Cell[][] theCells;

  public Map() {
    theCells = new Cell[MAP_SIZE][MAP_SIZE];
    int x = 0;
    while (x<theCells.length) {
      int y = 0;
      while (y<theCells.length) {
        theCells[x][y] = new Cell(x, y);
        y++;
      }
      x++;
    }
  }

  void show() {
    int x = (int) (x_view/CELL_SIZE);
    while ( x <= ((int) ((x_view+width)/CELL_SIZE))) {
      int y = (int) (y_view/CELL_SIZE);
      while (y <=( (int) ((y_view+height)/CELL_SIZE))) {
        int showX = x;
        int showY = y;
        if(showX < 0){
          showX+=MAP_SIZE; 
        }
        else if(showX>=MAP_SIZE){
          showX-=MAP_SIZE;
        }
        if(showY < 0){
          showY+=MAP_SIZE; 
        }
        else if(showY>=MAP_SIZE){
          showY-=MAP_SIZE;
        }
        theCells[showX][showY].show( x*CELL_SIZE-x_view,y*CELL_SIZE-y_view);
        y++;
      }
      x++;
    }
  }
}
