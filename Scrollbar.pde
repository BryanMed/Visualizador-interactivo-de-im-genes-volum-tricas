
class Scrollbar {
  int sWidth = 255;
  int sHeight = 20;
  float posX = 30, posY = 100;
  int[] colorVol;
  boolean over = false;

  Scrollbar(int[] colorVol_) {
    colorVol = colorVol_;
  }

  void display(int currentOption, boolean isVolVisible) {
    textSize(16);
    lights();
    rectMode(CORNER);
    strokeWeight(5);
    stroke(colorVol[0], colorVol[1], colorVol[2]);
    noFill();
    rect(posX - 15, posY - 20, 400, posY + 90);
    noStroke();
    switch(currentOption) {
    case 0: 
      fill(255, 0, 0);
      text("Rojo", posX + 260, posY + 5);
      rect(posX, posY, 255, 4, 7);
      rect(posX, posY - 10, colorVol[0], sHeight, 7);

      fill(0, 100, 0);
      text("Verde", posX + 260, posY + 35);
      rect(posX, posY + 30, 255, 4, 7);
      rect(posX, posY + 20, colorVol[1], sHeight, 7);

      fill(0, 0, 100);
      text("Azul", posX + 260, posY + 65);
      rect(posX, posY + 60, 255, 4, 7);
      rect(posX, posY + 50, colorVol[2], sHeight, 7);

      fill(100);
      text("Opacidad", posX + 260, posY + 95);
      rect(posX, posY + 90, 255, 4, 7);
      rect(posX, posY + 80, colorVol[3], sHeight, 7);

      if (isVolVisible) {
        fill(0, 255, 255);
        rect(posX, posY + 120, 40, 40, 7);
        text("Volumen visible", posX + 50, posY + 145);
      } else {
        fill(0, 100, 100);
        rect(posX, posY + 120, 40, 40, 7);
        text("Volumen no visible", posX + 50, posY + 145);
      }
      break;

    case 1: 
      fill(100, 0, 0);
      text("Rojo", posX + 260, posY + 5);
      rect(posX, posY, 255, 4, 7);
      rect(posX, posY - 10, colorVol[0], sHeight, 7);

      fill(0, 255, 0);
      text("Verde", posX + 260, posY + 35);
      rect(posX, posY + 30, 255, 4, 7);
      rect(posX, posY + 20, colorVol[1], sHeight, 7);

      fill(0, 0, 100);
      text("Azul", posX + 260, posY + 65);
      rect(posX, posY + 60, 255, 4, 7);
      rect(posX, posY + 50, colorVol[2], sHeight, 7);

      fill(100);
      text("Opacidad", posX + 260, posY + 95);
      rect(posX, posY + 90, 255, 4, 7);
      rect(posX, posY + 80, colorVol[3], sHeight, 7);

      if (isVolVisible) {
        fill(0, 255, 255);
        rect(posX, posY + 120, 40, 40, 7);
        text("Volumen visible", posX + 50, posY + 145);
      } else {
        fill(0, 100, 100);
        rect(posX, posY + 120, 40, 40, 7);
        text("Volumen no visible", posX + 50, posY + 145);
      }
      break;

    case 2: 
      fill(100, 0, 0);
      text("Rojo", posX + 260, posY + 5);
      rect(posX, posY, 255, 4, 7);
      rect(posX, posY - 10, colorVol[0], sHeight, 7);

      fill(0, 100, 0);
      text("Verde", posX + 260, posY + 35);
      rect(posX, posY + 30, 255, 4, 7);
      rect(posX, posY + 20, colorVol[1], sHeight, 7);

      fill(0, 0, 255);
      text("Azul", posX + 260, posY + 65);
      rect(posX, posY + 60, 255, 4, 7);
      rect(posX, posY + 50, colorVol[2], sHeight, 7);

      fill(100);
      text("Opacidad", posX + 260, posY + 95);
      rect(posX, posY + 90, 255, 4, 7);
      rect(posX, posY + 80, colorVol[3], sHeight, 7);

      if (isVolVisible) {
        fill(0, 255, 255);
        rect(posX, posY + 120, 40, 40, 7);
        text("Volumen visible", posX + 50, posY + 145);
      } else {
        fill(0, 100, 100);
        rect(posX, posY + 120, 40, 40, 7);
        text("Volumen no visible", posX + 50, posY + 145);
      }
      break;

    case 3: 
      fill(100, 0, 0);
      text("Rojo", posX + 260, posY + 5);
      rect(posX, posY, 255, 4, 7);
      rect(posX, posY - 10, colorVol[0], sHeight, 7);

      fill(0, 100, 0);
      text("Verde", posX + 260, posY + 35);
      rect(posX, posY + 30, 255, 4, 7);
      rect(posX, posY + 20, colorVol[1], sHeight, 7);

      fill(0, 0, 100);
      text("Azul", posX + 260, posY + 65);
      rect(posX, posY + 60, 255, 4, 7);
      rect(posX, posY + 50, colorVol[2], sHeight, 7);

      fill(255);
      text("Opacidad", posX + 260, posY + 95);
      rect(posX, posY + 90, 255, 4, 7);
      rect(posX, posY + 80, colorVol[3], sHeight, 7);

      if (isVolVisible) {
        fill(0, 255, 255);
        rect(posX, posY + 120, 40, 40, 7);
        text("Volumen visible", posX + 50, posY + 145);
      } else {
        fill(0, 100, 100);
        rect(posX, posY + 120, 40, 40, 7);
        text("Volumen no visible", posX + 50, posY + 145);
      }
      break;

    case 4: 
      fill(100, 0, 0);
      text("Rojo", posX + 260, posY + 5);
      rect(posX, posY, 255, 4, 7);
      rect(posX, posY - 10, colorVol[0], sHeight, 7);

      fill(0, 100, 0);
      text("Verde", posX + 260, posY + 35);
      rect(posX, posY + 30, 255, 4, 7);
      rect(posX, posY + 20, colorVol[1], sHeight, 7);

      fill(0, 0, 100);
      text("Azul", posX + 260, posY + 65);
      rect(posX, posY + 60, 255, 4, 7);
      rect(posX, posY + 50, colorVol[2], sHeight, 7);

      fill(100);
      text("Opacidad", posX + 260, posY + 95);
      rect(posX, posY + 90, 255, 4, 7);
      rect(posX, posY + 80, colorVol[3], sHeight, 7);

      if (isVolVisible) {
        fill(0, 255, 0);
        rect(posX, posY + 120, 40, 40, 7);
        text("Volumen visible", posX + 50, posY + 145);
      } else {
        fill(0, 100, 0);
        rect(posX, posY + 120, 40, 40, 7);
        text("Volumen no visible", posX + 50, posY + 145);
      }
      break;
    }
  }
}
