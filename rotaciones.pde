
void rotaciones() {
  if (zoomIn) {
    // currZoom += 0.1;
    //en realidad es traslacion je
    rot.z += 5;
  }
  if (zoomOut) {
    //currZoom -= 0.1;
    rot.z -= 5;
  }
  if (keyRotUp) {
    rot.x += 0.1;
  }
  if (keyRotDown) {
    rot.x -= 0.1;
  }
  if (keyRotLeft) {
    rot.y -= 0.1;
  }
  if (keyRotRight) {
    rot.y += 0.1;
  }


  if (mousePressed) {
    if (mouseButton == LEFT) {
      rot.x += -(mouseY - pmouseY)*0.05;
      rot.y += (mouseX - pmouseX)*0.05;
    }
  }
  
    if (rotX > 0.3 || rotX < -0.3 || rotY < -0.3 || rotY > 0.3) {
    rot.x += rotY*0.1;
    rot.y += rotX*0.1;
  }

  if (tranZ > 0.3 || tranZ < -0.3) {
    rot.z += tranZ*5;
  }
  
  
}
