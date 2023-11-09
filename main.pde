final int LIST_HEADER_HEIGHT = 48;
final int LIST_WIDTH = 272;
final int ITEM_BASE_HEIGHT = 36;
final int PADDING = 6;
final int SPACING = 12;

final color barColorA = color(0, 101, 160);
final color barColorB = color(0, 92, 145);
final color barBorderColorA = color(41, 126, 176);
final color barBorderColorB = color(41, 142, 201);
final color listColor = color(241, 242, 244);
final color itemColor = color(255, 255, 255);
final color backgroundColor = color(0, 121, 191);

float scrollX = 0;
float scrollY = 0;

PVector mousePos;

Board board;

Bar contentBar, sideBar, topBar;


void setup() {
  //set window settings
  surface.setTitle("Trello");
  surface.setResizable(true);
  size(1200, 800);
  
  board = new Board();
}

void draw() {
  mousePos = getMousePosition();
  
  background(backgroundColor);
  board.displayLists();
  board.bars();
  
  //scrollX += 0.005;
}

PVector getMousePosition() {
  float listWidth = float(LIST_WIDTH); //convert LIST_WIDTH to float for easier calculations
  float x = (mouseX - (sideBar.state ? sideBar.size.x : PADDING + SPACING)) / (listWidth + SPACING) + scrollX; //get value X normalised to the width of list (aswell as the spacing between)
  
  //checks if the mouse is within the spacings between lists
  boolean isWithinSpacing = (x % 1) < (SPACING / listWidth); 
  if (isWithinSpacing) { 
    x = -1; 
  }
  return new PVector(x, 0);
}
