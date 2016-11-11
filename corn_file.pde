// Renders a BVH file with Processing v3.2.1
// Note: mouseX controls the camera.

PBvh corn1;
PBvh corn2;
PImage gothic;
/*
import peasy.*;
 import peasy.org.apache.commons.math.*;
 import peasy.org.apache.commons.math.geometry.*;
 PeasyCam cam;*/

//------------------------------------------------
void setup() {
  size(500, 800, P3D );
  gothic = loadImage("american-gothic.jpg");
  //cam = new PeasyCam(this, 1500);
  // Load a BVH file recorded with a Kinect v2, made in Brekel Pro Body v2.
  corn1 = new PBvh(loadStrings("kander2.bvh"));
  corn2 = new PBvh(loadStrings("kander4.bvh"));
}

//------------------------------------------------
void draw() {
  background(0);
  lights();
  setMyCamera();        // Position the camera. See code below.
  //drawMyGround();
  updateAndDrawBody();  // Update and render the BVH file. See code below.
}


//------------------------------------------------
void updateAndDrawBody() {
  pushMatrix(); 
  translate(width/3, height/2, 0); // position the body in space
  scale(-1, -1, 1); // correct for the coordinate system orientation
  corn1.update(millis()); // update the BVH playback
  corn1.drawBones();      // a different way to draw the BVH file
  popMatrix();

  pushMatrix(); 
  translate(3.5*width/4, height/2, 0); // position the body in space
  scale(-1, -1, 1); // correct for the coordinate system orientation
  corn2.update(millis()); // update the BVH playback
  corn2.drawBones();      // a different way to draw the BVH file
  popMatrix();
}

void drawMyGround() {
  // Draw a grid in the center of the ground 
  pushMatrix(); 
  translate(width/2, height/2, 0); // position the body in space
  scale(-1, -1, 1);

  stroke(100);
  strokeWeight(1); 

  float gridSize = 400; 
  int nGridDivisions = 10; 

  for (int col=0; col<=nGridDivisions; col++) {
    float x = map(col, 0, nGridDivisions, -gridSize, gridSize);
    line (x, 0, -gridSize, x, 0, gridSize);
  }
  for (int row=0; row<=nGridDivisions; row++) {
    float z = map(row, 0, nGridDivisions, -gridSize, gridSize); 
    line (-gridSize, 0, z, gridSize, 0, z);
  }

  popMatrix();
}

void setMyCamera() {

  // Adjust the position of the camera
  float eyeX = width/2;          // x-coordinate for the eye
  float eyeY = height/3;   // y-coordinate for the eye
  float eyeZ = 350;             // z-coordinate for the eye
  float centerX = width/2.0f;   // x-coordinate for the center of the scene
  float centerY = height/2.0f;  // y-coordinate for the center of the scene
  float centerZ = -400;         // z-coordinate for the center of the scene
  float upX = 0;                // usually 0.0, 1.0, or -1.0
  float upY = 1;                // usually 0.0, 1.0, or -1.0
  float upZ = 0;                // usually 0.0, 1.0, or -1.0

  camera(eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ);
}