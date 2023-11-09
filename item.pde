class Item {
  String name;
  int itemHeight;
  
  Item(String tempName) {
    name = tempName;
    itemHeight = calculateItemHeight();
  }
  
  void displayItem() {
    stroke(200);
    strokeWeight(1);
    fill(itemColor);
    rect(PADDING, LIST_HEADER_HEIGHT, LIST_WIDTH - 2 * PADDING, itemHeight, 10);
  }
  
  int calculateItemHeight() {
    return ITEM_BASE_HEIGHT;  
  }
}
