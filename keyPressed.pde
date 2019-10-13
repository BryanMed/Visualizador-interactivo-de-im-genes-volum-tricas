void keyPressed() {
 if(key == '+'){
  zoomIn = true; 
 }
 if(key == '-'){
  zoomOut = true; 
 } 
 if(key == 'w'){
  keyRotUp = true; 
 }
 if(key == 's'){
  keyRotDown = true; 
 }
 if(key == 'a'){
  keyRotLeft = true; 
 }
 if(key == 'd'){
  keyRotRight = true; 
 }
  
  
  /*if (key == '-') {
    translateZ -= 5;
  }
  if (key == '+') {
    translateZ += 5;
  }
*/
  if (key == 'i') {
    options =! options;
  }

  if (options) {
    switch(currentState) {

      //caso para la vista normal
    case normalViewState:
      //si se selecciona esta opcion, las vistas de anaglifo
      //y holograma se desactivan
      if (keyCode == ENTER) {
        camera3D.renderRegular();
        normalView = true;
        anaglyphView = false;
        hologramView = false;
      }
      break;

      //caso para la vista anaglifa
    case anaglyphViewState:
      if (keyCode == ENTER) {
        camera3D.renderDefaultAnaglyph().setDivergence(0.2);
        camera3D.renderDuboisRedCyanAnaglyph().setDivergence(0.2);
        normalView = false;
        anaglyphView = true;
        hologramView = false;
      }
      break;

      //caso para la vista holografica
    case hologramViewState:
      if (keyCode == ENTER) {
        //camera3D.renderRegular();
        normalView = false;
        anaglyphView = false;
        hologramView = true;
      }
      break;

    case vol0State:
      if (keyCode == ENTER) {
        vol0ViewMenu = true; 
        vol1ViewMenu = false;
        vol2ViewMenu = false;
      }
      if (key == 'b') {
        vol0ViewMenu = false;
      }
      break;

    case vol1State:
      if (keyCode == ENTER) {
        vol0ViewMenu = false; 
        vol1ViewMenu = true;
        vol2ViewMenu = false;
      }
      if (key == 'b') {
        vol1ViewMenu = false;
      }
      break;

    case vol2State:
      if (keyCode == ENTER) {
        vol0ViewMenu = false; 
        vol1ViewMenu = false;
        vol2ViewMenu = true;
      }
      if (key == 'b') {
        vol2ViewMenu = false;
      }

      break;
    }

    if (vol0ViewMenu) {
      if (currentOptionVol0 == 4) {
        if (keyCode == ENTER) {
          vol0Visible =! vol0Visible;
        }
      }
    }

    if (vol1ViewMenu) {
      if (currentOptionVol1 == 4) {
        if (keyCode == ENTER) {
          vol1Visible =! vol1Visible;
        }
      }
    }

    if (vol2ViewMenu) {
      if (currentOptionVol2 == 4) {
        if (keyCode == ENTER) {
          vol2Visible =! vol2Visible;
        }
      }
    }


    if (keyCode == LEFT) {
      if (vol0ViewMenu) {
        if (currentOptionVol0 < 4) {
          colorVol0[currentOptionVol0] -= 5;
          if (colorVol0[currentOptionVol0] < 0) {
            colorVol0[currentOptionVol0] = 0;
          }
        }
      } else 
      if (vol1ViewMenu) {
        if (currentOptionVol1 < 4) {
          colorVol1[currentOptionVol1] -= 5;
          if (colorVol1[currentOptionVol1] < 0) {
            colorVol1[currentOptionVol1] = 0;
          }
        }
      } else
        if (vol2ViewMenu) {
          if (currentOptionVol2 < 4) {
            colorVol2[currentOptionVol2] -= 5;
            if (colorVol2[currentOptionVol2] < 0) {
              colorVol2[currentOptionVol2] = 0;
            }
          }
        } else {
          currentState -= 1;
          if (currentState < normalViewState) {
            currentState = vol2State;
          }
        }
    }
    if (keyCode == RIGHT) {
      if (vol0ViewMenu) {
        if (currentOptionVol0 < 4) {
          colorVol0[currentOptionVol0] += 5;
          if (colorVol0[currentOptionVol0] > 255) {
            colorVol0[currentOptionVol0] = 255;
          }
        }
      } else
        if (vol1ViewMenu) {
          if (currentOptionVol1 < 4) {
            colorVol1[currentOptionVol1] += 5;
            if (colorVol1[currentOptionVol1] > 255) {
              colorVol1[currentOptionVol1] = 255;
            }
          }
        } else
          if (vol2ViewMenu) {
            if (currentOptionVol2 < 4) {
              colorVol2[currentOptionVol2] += 5;
              if (colorVol2[currentOptionVol2] > 255) {
                colorVol2[currentOptionVol2] = 255;
              }
            }
          } else { 
            currentState += 1;
            if (currentState > vol2State) {
              currentState = normalViewState;
            }
          }
    }

    if (keyCode == UP) {
      if (vol0ViewMenu) {
        currentOptionVol0 -= 1;
        if (currentOptionVol0 < 0) {
          currentOptionVol0 = 0;
        }
      } else 
      if (vol1ViewMenu) {
        currentOptionVol1 -= 1;
        if (currentOptionVol1 < 0) {
          currentOptionVol1 = 0;
        }
      } else
        if (vol2ViewMenu) {
          currentOptionVol2 -= 1;
          if (currentOptionVol2 < 0) {
            currentOptionVol2 = 0;
          }
        } else {
          currentOptionVol0 = 0;
          currentOptionVol1 = 0;
          currentOptionVol2 = 0;
        }
    }

    if (keyCode == DOWN) {

      if (vol0ViewMenu) {
        currentOptionVol0 += 1;
        currentOptionVol1 = 0;
        currentOptionVol2 = 0;
        if (currentOptionVol0 > 4) {
          currentOptionVol0 = 4;
        }
      } else 
      if (vol1ViewMenu) {
        currentOptionVol0 = 0;
        currentOptionVol1 += 1;
        currentOptionVol2 = 0;
        if (currentOptionVol1 > 4) {
          currentOptionVol1 = 4;
        }
      } else
        if (vol2ViewMenu) {
          currentOptionVol0 = 0;
          currentOptionVol1 = 0;
          currentOptionVol2 += 1;       
          if (currentOptionVol2 > 4) {
            currentOptionVol2 = 4;
          }
        } else {
          currentOptionVol0 = 0;
          currentOptionVol1 = 0;
          currentOptionVol2 = 0;
        }
    }
  }
}
