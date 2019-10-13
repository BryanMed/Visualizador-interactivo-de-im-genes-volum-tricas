//*********************************************************
//controles:
//w = rotar arriba
//s = rotar abajo
//a = rotar izquierda
//d = rotar derecha
//- = -zoom
//+ = +zoom
//i = abrir/ocultar menu de opciones
//flechas de direccion(<- , ->, ^, v) moverse dentro del menu y... 
//...modificar parametros
//ENTER para escoger opcion
//b para salir del menu de un volumen 
//*********************************************************


//libreria del kinect
import SimpleOpenNI.*;

import toxi.geom.*;
import toxi.geom.mesh.*;
import toxi.volume.*;
import toxi.math.noise.*;
import toxi.processing.*;

//librerias del control de xbox
//import net.java.games.input.*;
//import org.gamecontrolplus.*;
//import org.gamecontrolplus.gui.*;

import camera3D.Camera3D;
import java.util.List;

//ControlIO control;
//ControlDevice xbox;

SimpleOpenNI kinect;

float rotX, rotY, tranZ;

PShape PSGli;
PShape PSGry;
PShape PSSkl;

PShader colorShader;

TriangleMesh TMGli;
TriangleMesh TMGry;
TriangleMesh TMSkl;

//tamanio del volumen
int sizeX = 181;
int sizeY = 217;
int sizeZ = 181;
int separacion = 350;


float ISO_THRESHOLD = 0.1;
Vec3D size = new Vec3D(sizeX, sizeY, sizeZ);

IsoSurface surfaceGli; 
IsoSurface surfaceGry;
IsoSurface surfaceSkl;

Mesh3D meshGli;
Mesh3D meshGry;
Mesh3D meshSkl;

ToxiclibsSupport gfx;
Camera3D camera3D;

//
Scrollbar sVol0;
Scrollbar sVol1;
Scrollbar sVol2;

final int normalViewState = 0;
final int anaglyphViewState = 1;
final int hologramViewState = 2;
final int vol0State = 3;
final int vol1State = 4;
final int vol2State = 5;

int currentState = normalViewState;
int currentOptionVol0 = 0;
int currentOptionVol1 = 0;
int currentOptionVol2 = 0;

boolean normalView = true;
boolean anaglyphView = false;
boolean hologramView = false;
boolean vol0ViewMenu = false;
boolean vol1ViewMenu = false;
boolean vol2ViewMenu = false;

boolean vol0Visible = true;
boolean vol1Visible = true;
boolean vol2Visible = true;

boolean options = false;

int[] colorVol0= {255, 255, 255, 255};
int[] colorVol1 = {255, 120, 55, 255};
int[] colorVol2 = {255, 255, 150, 255};
int[] colorButton = {0, 255, 125, 255};

Boton normalViewButton;
Boton anaglyphViewButton;
Boton hologramViewButton;
Boton vol0OptionsButton;
Boton vol1OptionsButton;
Boton vol2OptionsButton;

PVector rot = new PVector();
float currZoom = 1.5;
float translateZ = 500;
boolean zoomIn = false;
boolean zoomOut = false;
boolean keyRotLeft = false;
boolean keyRotRight = false;
boolean keyRotUp = false;
boolean keyRotDown = false;

void setup() {
  size(800, 800, P3D);
  //fullScreen(P3D);
  textSize(20);
  normalViewButton = new Boton(50, 50, 30, 30, colorButton, normalViewState, "visualización normal");
  anaglyphViewButton = new Boton(100, 50, 30, 30, colorButton, anaglyphViewState, "visualización anaglifa");
  hologramViewButton = new Boton(150, 50, 30, 30, colorButton, hologramViewState, "visualización kinect");
  
  vol0OptionsButton = new Boton(250, 50, 30, 30, colorVol0, vol0State, "volumen 1");
  vol1OptionsButton = new Boton(300, 50, 30, 30, colorVol1, vol1State, "volumen 2");
  vol2OptionsButton = new Boton(350, 50, 30, 30, colorVol2, vol2State, "volumen 3");

  sVol0 = new Scrollbar(colorVol0);
  sVol1 = new Scrollbar(colorVol1);
  sVol2 = new Scrollbar(colorVol2);

  //control = ControlIO.getInstance(this);
   //xbox = control.getMatchedDevice("XboxController");
   //if (xbox == null) {
     //println("no esta conectado el control");
     //System.exit(-1);
   //}
  kinect = new SimpleOpenNI(this);

  if (kinect.isInit() == false) {
  println("no se pudo encontrar el kinect shiabo");
  }

  kinect.enableDepth();
  kinect.enableUser();


  cargarVolume();
  //colorShader = loadShader("pixelfrag.glsl", "pixelvert.glsl");

  camera3D = new Camera3D(this);
  camera3D.renderRegular();

  noStroke();
}
void draw() {
  background(0);
  //shader(colorShader);
  //  rotX  = map(xbox.getSlider("rotateX").getValue(), -1, 1, -1, 1);
  //  rotY = map(xbox.getSlider("rotateY").getValue(), 1, -1, -1, 1);
  // tranZ = map(xbox.getSlider("zoom").getValue(), 1, -1, -1, 1);


  if (normalView == true) {
    normalDraw();
  }
  if (anaglyphView == true) {
    anaglyphDraw();
  } 
  if (hologramView == true) {
    hologramDraw();
  }

  if (options) {

    if (normalView == true) {
      normalViewButton.isActive();
      anaglyphViewButton.isActive();
      hologramViewButton.isActive();
      vol0OptionsButton.isActive();
      vol1OptionsButton.isActive();
      vol2OptionsButton.isActive();

      normalViewButton.display();
      anaglyphViewButton.display();
      hologramViewButton.display();
      vol0OptionsButton.display();
      vol1OptionsButton.display();
      vol2OptionsButton.display();

      normalViewButton.displayRed();
      if (vol0ViewMenu) {
        sVol0.display(currentOptionVol0, vol0Visible);
      }
      if (vol1ViewMenu) {
        sVol1.display(currentOptionVol1, vol1Visible);
      } 
      if (vol2ViewMenu) {
        sVol2.display(currentOptionVol2, vol2Visible);
      }
    }
    if (anaglyphView == true) {

      normalViewButton.isActive();
      anaglyphViewButton.isActive();
      hologramViewButton.isActive();
      vol0OptionsButton.isActive();
      vol1OptionsButton.isActive();
      vol2OptionsButton.isActive();

      normalViewButton.display();
      anaglyphViewButton.display();
      hologramViewButton.display();
      vol0OptionsButton.display();
      vol1OptionsButton.display();
      vol2OptionsButton.display();

      anaglyphViewButton.displayRed();

      if (vol0ViewMenu) {
        sVol0.display(currentOptionVol0, vol0Visible);
      }
      if (vol1ViewMenu) {
        sVol1.display(currentOptionVol1, vol1Visible);
      } 
      if (vol2ViewMenu) {
        sVol2.display(currentOptionVol2, vol2Visible);
      }
    } 
    if (hologramView == true) {
      normalViewButton.isActive();
      anaglyphViewButton.isActive();
      hologramViewButton.isActive();
      vol0OptionsButton.isActive();
      vol1OptionsButton.isActive();
      vol2OptionsButton.isActive();

      normalViewButton.display();
      anaglyphViewButton.display();
      hologramViewButton.display();
      vol0OptionsButton.display();
      vol1OptionsButton.display();
      vol2OptionsButton.display();


      hologramViewButton.displayRed();
      if (vol0ViewMenu) {
        sVol0.display(currentOptionVol0, vol0Visible);
      }
      if (vol1ViewMenu) {
        sVol1.display(currentOptionVol1, vol1Visible);
      } 
      if (vol2ViewMenu) {
        sVol2.display(currentOptionVol2, vol2Visible);
      }
    }
  } else {

    if (normalView == true) {
      normalDraw();
    }
    if (anaglyphView == true) {
      anaglyphDraw();
    } 
    if (hologramView == true) {
      hologramDraw();
    }

    lights();
    fill(100, 250, 220);
    rectMode(CENTER);
    rect(60, 45, 80, 30, 7);
    textSize(16);
    fill(0);
    text("opciones", 25, 50);
  }

  rotaciones();
  /*println(currentState + " -> op0: " + currentOptionVol0 + ", op1: " + currentOptionVol1 +
   ", op2: " + currentOptionVol2 + "--- color vol0: " +  
   colorVol0[0] + ", " + colorVol0[1] + ", " + colorVol0[2] + ", " + colorVol0[3] + " - visible: " + vol0Visible);*/
}
