void anaglyphDraw() {

  background(0);
  noLights();
  fill(255);
  text("frame rate: " + frameRate, width-200, height-50);

  pushMatrix();  
  translate(width/2, height/2, 200 + rot.z);
  rotateX( rot.x);
  rotateY(-HALF_PI + rot.y);
  rotateZ(-HALF_PI);
  
  
  //scale(currZoom);

  ambientLight(48, 48, 48);
  lightSpecular(255, 255, 255);
  directionalLight(255, 255, 255, -1, 0, 0);
  directionalLight(255, 255, 255, 1, 0, 0);
  specular(255, 255, 255);
  shininess(0.1);
  noStroke();

  fill(colorVol0[0], colorVol0[1], colorVol0[2], colorVol0[3]);
  if (vol0Visible) {
    shape(PSGli, 0, 0);
  }
  fill(colorVol1[0], colorVol1[1], colorVol1[2], colorVol1[3]);
  if (vol1Visible) {
    shape(PSGry, 0, 0);
  }
  fill(colorVol2[0], colorVol2[1], colorVol2[2], colorVol2[3]);
  if (vol2Visible) {
    shape(PSSkl, 0, 0);
  }
  popMatrix();
}
