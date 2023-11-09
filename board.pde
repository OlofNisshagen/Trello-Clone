class Board {
  ArrayList<List> lists = new ArrayList<>();
  
  Board() {
    for(int i = 0; i < 10; i++) {
      lists.add(new List("test"));  
    }  
  }
  
  void displayLists() {
    int totalListWidth = LIST_WIDTH + SPACING;
    int maxLists = (width / totalListWidth) + 2;
    int maxIndex = min(lists.size(), int(scrollX) + maxLists);
    
    noStroke();
    translate(SPACING - (scrollX % 1) * totalListWidth, SPACING - scrollY);
    for(int i = int(scrollX); i < maxIndex; i++) { 
      lists.get(i).displayList(i == int(mousePos.x));
      translate(totalListWidth, 0);
    }
  }
}
  
  
