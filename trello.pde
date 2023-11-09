final int LIST_HEADER_HEIGHT = 48;
final int LIST_WIDTH = 272;
final int ITEM_BASE_HEIGHT = 36;
final int PADDING = 6;
final int SPACING = 12;

float scrollX = 0;
float scrollY = 0;

PVector mousePos;

Board board = new Board();

void setup() {
  //set window settings
  surface.setTitle("Trello");
  surface.setResizable(true);
  size(1200, 800);
}

void draw() {
  background(0);
  mousePos = getMousePosition();
  board.displayLists();
  scrollX += 0.005;
  //scrollY += 0.2;
}

PVector getMousePosition() {
  float listWidth = float(LIST_WIDTH); //convert LIST_WIDTH to float for easier calculations
  float x = mouseX / (listWidth + SPACING) + scrollX; //get value X normalised to the width of list (aswell as the spacing between)
  
  //checks if the mouse is within the spacings between lists
  boolean isWithinSpacing = (x % 1) < (SPACING / listWidth); 
  if (isWithinSpacing) { 
    x = -1; 
  }
  return new PVector(x, 0);
}
