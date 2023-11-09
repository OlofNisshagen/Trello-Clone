class Bar {
  boolean state, direction;
  PVector position, initSize;
  PVector size = new PVector(0, 0);
  int closedSize;
  color col;
  
  Bar(boolean tempState, boolean tempDirection, PVector tempPosition, PVector tempInitSize, int tempClosedSize, color tempCol) {
    state = tempState;
    direction = tempDirection;
    position = tempPosition;
    initSize = tempInitSize;
    closedSize = tempClosedSize;
    col = tempCol;
    updateSize();
  }
  
  void updateSize() {
    size.set(
      (direction ? width : (state ? initSize.x : closedSize)),
      (!direction ? height : (state ? initSize.y : closedSize))
    ); 
  }
  
  void displayBar() {
    updateSize();
    fill(col);
    rect(position.x, position.y, size.x, size.y);
  }
}
