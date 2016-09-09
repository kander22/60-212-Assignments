class Line {
  int x1 = int(random(width));
  int y1 = int(random(height));
  int x2 = int(random(width));
  int y2 = int(random(height));

  Line() {
  }

  int getXcoord1() {
    int tempX = x1;
    return tempX;
  }

  int getYcoord1() {
    int tempY = y1;
    return tempY;
  }

  int getXcoord2() {
    int tempX = x2;
    return tempX;
  }

  int getYcoord2() {
    int tempY = y2;
    return tempY;
  }

  void drawLine() {
    line(x1, y1, x2, y2);
  }
}
//end of class Line
//start of intersection program
Line[] lines = new Line[12];


void setup() {
  background(220);
  size(720, 480);
}

void draw() {
}

void mousePressed() {
  background(220);
  stroke(25, 25, 60);
  strokeWeight(2);
  for (int i = 0; i < lines.length; i++) {
    lines[i] = new Line();
  }
  for (int i = 0; i < lines.length; i++) {
    lines[i].drawLine();
  }
  for (int i = 0; i < lines.length; i++) {

    int x1 = lines[i].getXcoord1();
    int y1 = lines[i].getYcoord1();
    int x2 = lines[i].getXcoord2();
    int y2 = lines[i].getYcoord2();

    for (int j = 0; j < lines.length; j++) {

      int x3 = lines[j].getXcoord1();
      int y3 = lines[j].getYcoord1();
      int x4 = lines[j].getXcoord2();
      int y4 = lines[j].getYcoord2();

      float denom = (y4 - y3)*(x2 - x1) - (x4 - x3)*(y2 - y1);
      float uAnum = (x4 - x3)*(y1 - y3) - (y4 - y3)*(x1 - x3);
      float uBnum = (x2 - x1)*(y1 - y3) - (y2 - y1)*(x1 - x3);

      if (denom != 0) {
        float uA = uAnum/denom;
        float uB = uBnum/denom;
        if ((0 <= uB) && (1 >= uB) && (0 <= uA) && (1 >= uA)) {
          float xIntersection = (x1 + uA*(x2 - x1));
          float yIntersection = (y1 + uA*(y2 - y1));
          noStroke();
          fill(100, 100, 255, 200);
          ellipse(xIntersection, yIntersection, 10, 10);
          fill(90, 90, 240, 100);
          ellipse(xIntersection, yIntersection, 17, 17);
        }
      }
    }
  }
}