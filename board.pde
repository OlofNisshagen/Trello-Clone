class Board {
  ArrayList<List> lists = new ArrayList<>();
  
  Board() {
    topBar     = new Bar(true, true,  new PVector(0, 0),             new PVector(0, LIST_HEADER_HEIGHT)                  , PADDING + SPACING, barColorA);
    sideBar    = new Bar(false, false, new PVector(0, topBar.size.y), new PVector(LIST_WIDTH + PADDING, 0 - topBar.size.y), PADDING + SPACING, barColorA);
    contentBar = new Bar(true, true,  new PVector(0, topBar.size.y), new PVector(0, LIST_HEADER_HEIGHT + PADDING)        , PADDING + SPACING, barColorB);
    
    for(int i = 0; i < 10; i++) {
      lists.add(new List("test"));  
    }  
  }
  
  void displayLists() {
    int totalListWidth = LIST_WIDTH + SPACING;
    int maxLists = (width - int(sideBar.size.x)) / totalListWidth + 2;
    int maxIndex = min(lists.size(), int(scrollX) + maxLists);
    
    float transX = SPACING - (scrollX % 1) * totalListWidth + (sideBar.state ? sideBar.size.x : (PADDING + SPACING));
    float transY = SPACING - scrollY + contentBar.size.y + topBar.size.y;
    
    translate(transX, transY);
    noStroke();
    
    for(int i = int(scrollX); i < maxIndex; i++) { 
      lists.get(i).displayList(i == int(mousePos.x));
      translate(totalListWidth, 0);
    }
  }
  
  void bars() {
    noStroke();
    resetMatrix();
    contentBar.displayBar();
    sideBar.displayBar();
    topBar.displayBar();
    
    
    stroke(barBorderColorA);
    line(0, topBar.size.y, width, topBar.size.y);
    line(sideBar.size.x, topBar.size.y, sideBar.size.x, topBar.size.y + contentBar.size.y);
    
    stroke(barBorderColorB);
    line(sideBar.size.x, topBar.size.y + contentBar.size.y, sideBar.size.x, height);
    
  }
}
  
  
