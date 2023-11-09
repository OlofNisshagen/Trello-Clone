class List {
  String name;
  ArrayList<Item> items = new ArrayList<>();
  
  List(String tempName) {
    name = tempName;
    for(int i = 0; i < random(0, 4); i++) {
      items.add(new Item("test"));  
    }
  }
  
  void displayList(boolean hover) {
    fill(hover ? 220 : listColor);
    rect(0, 0, LIST_WIDTH, calculateListHeight(), 15);
    pushMatrix();
    for(Item i : items) {
      i.displayItem();
      translate(0, i.itemHeight + PADDING);
    }
    popMatrix();
  }
  
  int calculateListHeight() {
    int totalHeight = LIST_HEADER_HEIGHT * 2 + max(0, (items.size() - 1) * PADDING);
    for(Item i : items) totalHeight += i.itemHeight;
    return totalHeight;
  }
}
