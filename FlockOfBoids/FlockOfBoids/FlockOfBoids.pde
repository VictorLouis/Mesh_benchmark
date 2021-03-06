/**
 * Flock of Boids
 * by Jean Pierre Charalambos.
 * 
 * This example displays the famous artificial life program "Boids", developed by
 * Craig Reynolds in 1986 [1] and then adapted to Processing by Matt Wetmore in
 * 2010 (https://www.openprocessing.org/sketch/6910#), in 'third person' eye mode.
 * Boids under the mouse will be colored blue. If you click on a boid it will be
 * selected as the scene avatar for the eye to follow it.
 * 
 * 1. Reynolds, C. W. Flocks, Herds and Schools: A Distributed Behavioral Model. 87.
 * http://www.cs.toronto.edu/~dt/siggraph97-course/cwr87/
 * 2. Check also this nice presentation about the paper:
 * https://pdfs.semanticscholar.org/73b1/5c60672971c44ef6304a39af19dc963cd0af.pdf
 * 3. Google for more...
 *
 * Press ' ' to switch between the different eye modes.
 * Press 'a' to toggle (start/stop) animation.
 * Press 'p' to print the current frame rate.
 * Press 'm' to change the boid visual mode.
 * Press 'v' to toggle boids' wall skipping.
 * Press 's' to call scene.fitBallInterpolation().
 */

import frames.input.*;
import frames.input.event.*;
import frames.primitives.*;
import frames.core.*;
import frames.processing.*;

Scene scene;
int flockWidth = 1280;
int flockHeight = 720;
int flockDepth = 600;
boolean avoidWalls = true;

int vRepresent = -1;
int renderMode = 0;

//Representation:
//-1: vertex-vertex
//1: face-vertex

//Render Mode:
//0: inmmediate
//1: retained

// visual modes
// 0. Faces and edges
// 1. Wireframe (only edges)
// 2. Only faces
// 3. Only points
int mode;

int initBoidNum = 10; // amount of boids to start the program with
ArrayList<Boid> flock;
Node avatar;
boolean animate = true;

void setup() {
  size(1000, 800, P3D);
  scene = new Scene(this);
  scene.setBoundingBox(new Vector(0, 0, 0), new Vector(flockWidth, flockHeight, flockDepth));
  scene.setAnchor(scene.center());
  Eye eye = new Eye(scene);
  scene.setEye(eye);
  scene.setFieldOfView(PI / 3);
  //interactivity defaults to the eye
  scene.setDefaultGrabber(eye);
  scene.fitBall();
  // create and fill the list of boids
  flock = new ArrayList();
  /*
  for (int i = 0; i < initBoidNum; i++)
    flock.add(new Boid(new Vector(flockWidth / 2, flockHeight / 2, flockDepth / 2)));*/
  //System.out.println("Mesh mode: " + (vRepresent == -1 ? "Face Vertex" : "Vertex Vertex") + ". Rendering mode: " + (renderMode == 1 ? "retained" : "immediate") + ". FPS: " + frameRate);
  createFlock(vRepresent);
}

void draw() {
  background(color(0,0,76));
  
  ambientLight(128, 128, 128);
  directionalLight(255, 255, 255, 0, 1, -100);
  walls();
  // Calls Node.visit() on all scene nodes.
  scene.traverse();
  pushStyle();
  scene.beginScreenCoordinates();
  fill(250);  
  text("Mesh mode: " + (vRepresent == -1 ? "Vertex Vertex" : "Face Vertex") + ". Rendering mode: " + (renderMode == 1 ? "retained" : "immediate") + ". FPS: " + frameRate, 10 ,10);
  scene.endScreenCoordinates();
  popStyle();
}

void walls() {
  pushStyle();
  noFill();
  stroke(0, 255, 255);

  line(0, 0, 0, 0, flockHeight, 0);
  line(0, 0, flockDepth, 0, flockHeight, flockDepth);
  line(0, 0, 0, flockWidth, 0, 0);
  line(0, 0, flockDepth, flockWidth, 0, flockDepth);

  line(flockWidth, 0, 0, flockWidth, flockHeight, 0);
  line(flockWidth, 0, flockDepth, flockWidth, flockHeight, flockDepth);
  line(0, flockHeight, 0, flockWidth, flockHeight, 0);
  line(0, flockHeight, flockDepth, flockWidth, flockHeight, flockDepth);

  line(0, 0, 0, 0, 0, flockDepth);
  line(0, flockHeight, 0, 0, flockHeight, flockDepth);
  line(flockWidth, 0, 0, flockWidth, 0, flockDepth);
  line(flockWidth, flockHeight, 0, flockWidth, flockHeight, flockDepth);
  popStyle();
}

void keyPressed() {
  switch (key) {
  case 'a':
    animate = !animate;
    break;
  case 's':
    if (scene.eye().reference() == null)
      scene.fitBallInterpolation();
    break;
  case 'p':
    println("Frame rate: " + frameRate);
    break;
  case 'v':
    avoidWalls = !avoidWalls;
    break;
  case 'm':
    mode = mode < 3 ? mode+1 : 0;
    break;
  case 'r':
    vRepresent = (-1) * vRepresent;
    break;   
   case 'f':
    renderMode = (renderMode == 1 ? 0 : 1);
    break;
  case ' ':
    if (scene.eye().reference() != null) {
      scene.lookAt(scene.center());
      scene.fitBallInterpolation();
      scene.eye().setReference(null);
    } else if (avatar != null) {
      scene.eye().setReference(avatar);
      scene.interpolateTo(avatar);
    }
    break;
  }
}

void createFlock(int rep){
    if(renderMode == 0)
    {//immediate
        for (int i = 0; i < initBoidNum; i++)
        {
            flock.add(new Boid(new Vector(flockWidth / 2, flockHeight / 2, flockDepth / 2), rep, 0));
        }
    }
    else
    {//retained
        for (int i = 0; i < initBoidNum; i++)
        {          
            flock.add(new Boid(new Vector(flockWidth / 2, flockHeight / 2, flockDepth / 2), rep, 1));
        }  
      }
}
