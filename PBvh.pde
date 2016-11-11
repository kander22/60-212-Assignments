import java.util.List;
float vert0x, vert0y, vert0z, vert1x, vert1y, vert1z, vert2x, vert2y, vert2z, vert3x, vert3y, vert3z, vert4x, vert4y, vert4z;
float vert1xa, vert1ya, vert1za, vert2xa, vert2ya, vert2za, vert3xa, vert3ya, vert3za, vert4xa, vert4ya, vert4za;
float v0x, v0y, v0z, v1x, v1y, v1z, v2x, v2y, v2z, v3x, v3y, v3z, v4x, v4y, v4z;
float v1xa, v1ya, v1za, v2xa, v2ya, v2za, v3xa, v3ya, v3za, v4xa, v4ya, v4za;
class PBvh
{

  BvhParser parser;  

  PBvh(String[] data) {
    parser = new BvhParser();
    parser.init();
    parser.parse( data );
  }

  void update( int ms ) {
    parser.moveMsTo( ms );//30-sec loop 
    parser.update();
  }

  //------------------------------------------------
  // Alternate method of drawing, added by Golan
  void drawBones() {
    stroke(255); 
    strokeWeight(2);


    List<BvhBone> theBvhBones = parser.getBones();
    int nBones = theBvhBones.size();       // How many bones are there?
    for (int i=0; i<nBones; i++) {         // Loop over all the bones
      BvhBone aBone = theBvhBones.get(i);  // Get the i'th bone

      PVector boneCoord0 = aBone.absPos;   // Get its start point
      float x0 = boneCoord0.x;             // Get the (x,y,z) values 
      float y0 = boneCoord0.y;             // of its start point
      float z0 = boneCoord0.z;
      String boneName = aBone.getName();

      if (aBone.hasChildren()) {           

        // If this bone has children, 
        // draw a line from this bone to each of its children
        List<BvhBone> childBvhBones = aBone.getChildren(); 
        int nChildren = childBvhBones.size();

        for (int j=0; j<nChildren; j++) {
          BvhBone aChildBone = childBvhBones.get(j); 
          PVector boneCoord1 = aChildBone.absPos;

          float x1 = boneCoord1.x;
          float y1 = boneCoord1.y;
          float z1 = boneCoord1.z;
          float dx = x1 - x0; 
          float dy = y1 - y0; 
          float dz = z1 - z0; 
          float dh = dist(x0, y0, z0, x1, y1, z1); // r
          float cx = (x0+x1)/2.0; 
          float cy = (y0+y1)/2.0; 
          float cz = (z0+z1)/2.0; 
          float theta = atan2(dx, dz); 
          float phi = acos(dy/dh); 
          if (boneName.equals("LeftShoulder")) {
            vert1x = x0;
            vert1y = y0;
            vert1z = z0;
          }
          if (boneName.equals("LeftArm")) {
            vert2x = x0;
            vert2y = y0 + 5;
            vert2z = z0;
            vert4x = x0;
            vert4y = y0 - 5;
            vert4z = z0;
          }
          if (boneName.equals("LeftForeArm")) {
            vert3x = x0;
            vert3y = y0;
            vert3z = z0;
          }

          if (boneName.equals("RightShoulder")) {
            vert1xa = x0;
            vert1ya = y0;
            vert1za = z0;
          }
          if (boneName.equals("RightArm")) {
            vert2xa = x0;
            vert2ya = y0 + 5;
            vert2za = z0;
            vert4xa = x0;
            vert4ya = y0 - 5;
            vert4za = z0;
          }
          if (boneName.equals("RightForeArm")) {
            vert3xa = x0;
            vert3ya = y0;
            vert3za = z0;
          }

          stroke(0, 200, 0);
          if (boneName.equals("LeftUpLeg")) {
            v1x = x0;
            v1y = y0;
            v1z = z0;
          }

          if (boneName.equals("LeftLeg")) {
            v2x = x0;
            v2y = y0 + 10;
            v2z = z0;
            v4x = x0;
            v4y = y0 - 10;
            v4z = z0;
          }

          if (boneName.equals("LeftFoot")) {
            v3x = x0;
            v3y = y0;
            v3z = z0;
          }
          
                    stroke(0, 200, 0);
          if (boneName.equals("RightUpLeg")) {
            v1xa = x0;
            v1ya = y0;
            v1za = z0;
          }

          if (boneName.equals("RightLeg")) {
            v2xa = x0;
            v2ya = y0 + 10;
            v2za = z0;
            v4xa = x0;
            v4ya = y0;
            v4za = z0;
          }

          if (boneName.equals("RightFoot")) {
            v3xa = x0;
            v3ya = y0;
            v3za = z0;
          }


          if (boneName.equals("Neck")) {
            vert0x = x0;
            vert0y = y0;
            vert0z = z0;
            noStroke();
            fill(10, 120, 10);
            pushMatrix();
            translate(x0, y0, z0);
            sphere(5);
            popMatrix();
          }
          if (boneName.equals("Hips")) {
            v0x = x0;
            v0y = y0;
            v0z = z0;
            noStroke();
            fill(10, 120, 10);
            pushMatrix();
            translate(x0, y0, z0);
            sphere(15);
            popMatrix();
          }
          if (boneName.equals("Neck")) {
            noStroke();
            fill(10, 120, 10);
            PVector boneOrientation = new PVector(dx, dy, dz);
            pushMatrix();
            translate (cx, cy, cz);
            rotateY(theta);
            rotateX(HALF_PI + phi); 
            drawCylinder(15, 5, dh);
            popMatrix();
          }
          if (boneName.equals("Neck") || boneName.equals("Spine") || boneName.equals("Hips")) {
            noStroke();
            fill(10, 120, 10);
            PVector boneOrientation = new PVector(dx, dy, dz);
            pushMatrix();
            translate (cx, cy, cz);
            rotateY(theta);
            rotateX(HALF_PI + phi); 
            drawCylinder(15, 12, dh);
            popMatrix();
          }
        }
      } else {
        // Otherwise, if this bone has no children (it's a terminus)
        // then draw it differently. 

        PVector boneCoord1 = aBone.absEndPos;  // Get its start point
        float x1 = boneCoord1.x;
        float y1 = boneCoord1.y;
        float z1 = boneCoord1.z;
        float dx = x1 - x0; 
        float dy = y1 - y0; 
        float dz = z1 - z0; 
        float dh = dist(x0, y0, z0, x1, y1, z1); // r
        float cx = (x0+x1)/2.0; 
        float cy = (y0+y1)/2.0; 
        float cz = (z0+z1)/2.0; 
        float theta = atan2(dx, dz); 
        float phi = acos(dy/dh); 

        if (boneName.equals("Head")) { 
          fill(255, 0, 0);
          PVector boneOrientation = new PVector(dx, dy, dz);
          pushMatrix();
          translate (cx, cy, cz);
          rotateY(theta);
          rotateX(HALF_PI + phi); 
          drawCorn(0, 0, 20);
          popMatrix();
        }
        stroke(0, 160, 0);
      }
    }
    fill(10, 120, 10);
    drawLeftLeaf();
    drawRightLeaf();
    drawLeftLeg();
    drawRightLeg();
  }
}

//draw different elements of corn
void drawLeftLeaf() {
  beginShape();
  curveVertex(vert0x, vert0y, vert0z);
  curveVertex(vert1x, vert1y, vert1z);
  curveVertex(vert2x, vert2y, vert2z);
  curveVertex(vert3x, vert3y, vert3z);
  curveVertex(vert4x, vert4y, vert4z);
  curveVertex(vert1x, vert1y, vert1z);
  curveVertex(vert0x, vert0y, vert0z);
  endShape();
}

void drawRightLeaf() {
  beginShape();
  curveVertex(vert0x, vert0y, vert0z);
  curveVertex(vert1xa, vert1ya, vert1za);
  curveVertex(vert2xa, vert2ya, vert2za);
  curveVertex(vert3xa, vert3ya, vert3za);
  curveVertex(vert4xa, vert4ya, vert4za);
  curveVertex(vert1xa, vert1ya, vert1za);
  curveVertex(vert0x, vert0y, vert0z);
  endShape();
}

void drawLeftLeg() {
  beginShape();
  curveVertex(v0x, v0y, v0z);
  curveVertex(v1x, v1y, v1z);
  curveVertex(v2x, v2y, v2z);
  curveVertex(v3x + 80, v3y - 95, v3z   - 450);
  curveVertex(v4x, v4y, v4z);
  curveVertex(v1x, v1y, v1z);
  curveVertex(v0x, v0y, v0z);
  endShape();
}

void drawRightLeg() {
  beginShape();
  curveVertex(v0x, v0y, v0z);
  curveVertex(v1xa, v1ya, v1za);
  curveVertex(v2xa, v2ya, v2za);
  curveVertex(v3xa + 30, v3ya - 95, v3za - 450);
  curveVertex(v4xa, v4ya, v4za);
  curveVertex(v1xa, v1ya, v1za);
  curveVertex(v0x, v0y, v0z);
  endShape();
}

void drawCorn(float xCoord, float yCoord, float zCoord) {
  pushMatrix();
  rotateX(PI);
  int total = 15;
  PVector[][] globe;
  globe = new PVector[total + 1][total + 1];
  float xr = 15;
  float yr = 15;
  float zr = 60;
  for ( int i = 0; i < total + 1; i++) {
    float lat = map(i, 0, total, 0, PI/1.45);
    for (int  j = 0; j < total + 1; j++) {
      float lon = map(j, 0, total, 0, TWO_PI); //recall how the triangles wrap around the sphere
      float x = xr * sin(lat) *cos(lon);
      float y = yr * sin(lat) * sin(lon);
      float z = zr * cos(lat);
      globe[i][j] = new PVector(x, y, z);
    }
  }

  for ( int i = 0; i < total; i++) {
    beginShape(TRIANGLE_STRIP);
    for (int  j = 0; j < total + 1; j++) {
      PVector v1 = globe[i][j];
      noStroke();
      fill(255, 255, 0);
      vertex(xCoord + v1.x, yCoord + v1.y, zCoord + v1.z);
      PVector v2 = globe[i+1][j];
      vertex(xCoord + v2.x, yCoord + v2.y, zCoord + v2.z);
    }
    endShape(CLOSE);
  }
  popMatrix();
}

//draws the cylinder element used to make a lot of the 

void drawCylinder(int sides, float r, float h)
{
  beginShape(QUAD_STRIP); 
  int cylinderResolution = 12; 
  for (int c=0; c<=sides; c++) {
    float ang = map(c, 0, sides, 0, TWO_PI); 
    float ex = r * cos(ang); 
    float ey = r * sin(ang);
    float ez0 = 0- h/2;
    float ez1 =    h/2;
    vertex(ex, ey, ez0); 
    vertex(ex, ey, ez1);
  }
  endShape();
}