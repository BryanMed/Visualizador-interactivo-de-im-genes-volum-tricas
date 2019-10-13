void keyReleased() {
  if (key == '+') {
    zoomIn = false;
  }
  if (key == '-') {
    zoomOut = false;
  }
  if (key == 'w') {
    keyRotUp = false;
  }
  if (key == 's') {
    keyRotDown = false;
  }
  if (key == 'a') {
    keyRotLeft = false;
  }
  if (key == 'd') {
    keyRotRight = false;
  }
}
