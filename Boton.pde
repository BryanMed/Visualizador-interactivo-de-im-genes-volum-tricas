class Boton {
  float posX, posY;
  int sizeX, sizeY;
  int[] colorActive;
  int id;
  boolean over = false;
  boolean selected = false;
  String name;


  Boton(float posX_, float posY_, int sizeX_, int sizeY_, int[] colorActive_, int id_, String name_) {
    posX = posX_;
    posY = posY_;
    sizeX = sizeX_;
    sizeY = sizeY_;
    colorActive = colorActive_;
    id = id_;
    name = name_;
  }

  void display() {
    lights();
    rectMode(CENTER);
    if (over == true) {
      fill(255);
      text(name, 30, posY - 30);  
      fill(colorActive[0], colorActive[1], colorActive[2], colorActive[3]); 
      rect(posX, posY, sizeX + 10, sizeY + 10, 7);
    } else {
      fill(colorActive[0] - 25, colorActive[1] - 25, colorActive[2] - 25); 
      rect(posX, posY, sizeX, sizeY, 7);
    }
  }

  void displayRed() {
    fill(255, 0, 0);
    rect(posX, posY, sizeX + 10, sizeY + 10, 7);
  }

  void isActive() {
    if (id == currentState) {
      over = true;
    } else {
      over = false;
    }
  }
}
