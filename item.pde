class Item {
  String name;
  int itemHeight;
  
  Item(String tempName) {
    name = tempName;
    itemHeight = calculateItemHeight();
  }
  
  void displayItem() {
    fill(255, 0, 0);
    rect(PADDING, LIST_HEADER_HEIGHT, LIST_WIDTH - 2 * PADDING, itemHeight, 10);
  }
  
  int calculateItemHeight() {
    return ITEM_BASE_HEIGHT;  
  }
}
