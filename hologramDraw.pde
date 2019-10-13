void hologramDraw() {  


  background(0);
  noLights();
  fill(255);
  text("frame rate: " + frameRate, width-200, height-50);
  //stroke(255);
  kinect.update();

  IntVector userList = new IntVector();

  kinect.getUsers(userList);

  if (userList.size() > 0) {
    int userId = userList.get(0);
    if (kinect.isTrackingSkeleton(userId)) {
      PVector rightHand = new PVector();
      float confidence = kinect.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_HEAD, rightHand);
      PVector convertedRightHand = new PVector();
      kinect.convertRealWorldToProjective(rightHand, convertedRightHand);

      float ejeZ = map(convertedRightHand.z, 700, 3500, 800, 50);
      float ejeY = map(convertedRightHand.y, -150, 400, -QUARTER_PI, QUARTER_PI);
      float ejeX = map(convertedRightHand.x, 0, 600, -HALF_PI*0.6, HALF_PI*0.6);

      float ejeZRoom = map(convertedRightHand.z, 700, 3500, 300, 0);
      float ejeXRoom = map(convertedRightHand.x, -150, 400, height*0.4, height*0.6);
      float ejeYRoom = map(convertedRightHand.y, 0, 600, height*0.4, height*0.6);

      float sizeR = ejeZRoom;

      float x = map(ejeXRoom, 0, width, 0, width);
      float y = map(ejeYRoom, 0, height, height, 0);

      //fill(70, 0, 0);

      //fill(70);
      //rect(x, y, sizeR*4, sizeR*2);
      //rect(x, y, sizeR*2, sizeR*2);
      //left side


      beginShape();
      //fill(125, 0, 0);
      fill(255);
      vertex(0, 0);
      //fill(125, 0, 0);
      fill(255);
      vertex(0, height);
      //fill(80, 0, 0);
      fill(0);
      vertex(x - sizeR, y + sizeR);
      //fill(80, 0, 0);
      fill(0);
      vertex(x - sizeR, y - sizeR);
      endShape();

      //right side
      beginShape();
      //fill(125, 0, 0);
      fill(255);
      vertex(width, 0);
      //fill(125, 0, 0);
      fill(255);
      vertex(width, height);
      //fill(80, 0, 0);
      fill(0);
      vertex(x + sizeR, y + sizeR);
      //fill(80, 0, 0);
      fill(0);
      vertex(x + sizeR, y - sizeR);
      endShape();


      //upper side
      beginShape();
      //fill(125, 0, 0);
      fill(255);
      vertex(0, 0);
      //fill(125, 0, 0);
      fill(255);
      vertex(width, 0);
      //fill(80, 0, 0);
      fill(0);
      vertex(x + sizeR, y - sizeR);
      //fill(80, 0, 0);
      fill(0);
      vertex(x - sizeR, y - sizeR);
      endShape();


      //down side
      fill(255);
      beginShape();
      //fill(125, 0, 0);
      fill(255);
      vertex(0, height);
      //fill(125, 0, 0);
      fill(255);
      vertex(width, height);
      //fill(80, 0, 0);
      fill(0);
      vertex(x + sizeR, y + sizeR);
      //fill(80, 0, 0);
      fill(0);
      vertex(x - sizeR, y + sizeR);
      endShape();

      pushMatrix();  
      translate(width/2, height/2, ejeZ);
      //rotateX(ejeY);
      //rotateY(ejeX);
      //rotateZ();
      
      
      rotateX(ejeY);
      rotateY(-HALF_PI - ejeX);
      rotateZ(-HALF_PI);
      // scale(currZoom);

      ambientLight(48, 48, 48);
      lightSpecular(255, 255, 255);
      // directionalLight(255, 255, 255, 0, 0, 1);
      // directionalLight(255, 255, 255, 0, 0, -1);
      directionalLight(255, 255, 255, 0, -1, 0);
      directionalLight(255, 255, 255, 0, 1, 0);
      // directionalLight(255, 255, 255, -1, 0, 0);
      // directionalLight(255, 255, 255, 1, 0, 0);
      specular(255, 255, 255);
      shininess(1);
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
    noStroke();

    text("frame rate: " + frameRate, width-200, height-50);
  }

  //text("buscando usuario ", width/2, height/2);
  /*

   
   //esto es para hacer la visualizacion con una piramide, la cual forma un holograma
   //utilizando cuatro distintos puntos de vista de la superficie
   
   background(0);
   noLights();
   fill(255);
   
   text("frame rate: " + frameRate, width-200, height-50);
   
   ambientLight(48, 48, 48);
   lightSpecular(255, 255, 255);
   directionalLight(255, 255, 255, 0, 0, 1);
   specular(255, 255, 255);
   shininess(16.0);
   noStroke();
   
   pushMatrix();
   rectMode(CENTER);
   noFill();
   strokeWeight(5);
   stroke(255, 0, 0);
   translate(width/2, height/2);
   rect(0, 0, 150, 150);
   noStroke();
   popMatrix();
   
   //up
   pushMatrix();
   translate(width/2, height/2 + separacion);
   rotateX(rot.x);
   rotateY(rot.y);
   scale(currZoom);
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
   
   //right
   pushMatrix();
   translate(width/2 + separacion, height/2);
   rotateX(rot.x);
   rotateY(rot.y);
   scale(currZoom);
   rotate(radians(90));
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
   
   //down
   pushMatrix();
   translate(width/2, height/2 - separacion);
   rotateX(rot.x);
   rotateY(rot.y);
   scale(currZoom);
   rotate(radians(180));
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
   
   //left
   pushMatrix();
   translate(width/2 - separacion, height/2);  
   rotateX(rot.x);
   rotateY(rot.y);
   scale(currZoom);
   rotate(radians(-90));
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
   */
}

void onNewUser(SimpleOpenNI curContext, int userId) {
  println("onNewUser - userId: " + userId);
  println("\tstart tracking skeleton");
  curContext.startTrackingSkeleton(userId);
}

void onLostUser(SimpleOpenNI curContext, int userId)
{
  println("onLostUser - userId: " + userId);
  background(255, 0, 255);
}

void onVisibleUser(SimpleOpenNI curContext, int userId)
{
  //println("onVisibleUser - userId: " + userId);
}
