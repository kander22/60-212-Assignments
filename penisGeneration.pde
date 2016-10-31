PShape d;
PShape b;
PShape h;
float theta;
float theta2;
float x;
float y;
float xHold;
float yHold;
float offSetX;
float offSetY;
float scale;
float yScale;
float len;
float isFlipped;
float translation;
float headWidth;
float headHeight;
float girth = random(3, 7);
color d1;
color d2;
int page_num = 0;

void setup() {
  background(255);
  size(550, 550);
  frameRate(30);
}

void draw() {
  background(255);
  stroke(0, 200);
  isFlipped = random(1, 3);
  yScale = random(15, 35);
  len = random(20, 200);
  scale = random(1, 1.2);
  float col = random(1, 4);
  if (col < 2) {
    setColorsPinks();
  }
  if (col >=2 && col < 3) {
    setColorsBrowns();
  } else {
    setColorsTans();
  }
  //background(100);
  translation = random(30, 50);
  translate(width/2, height/2);
  float angle = random(-PI/2, PI/2);
  rotate(angle);
  translate(-width/2, -height/2);
  if (isFlipped <= 2) {
    translate(width/2, height/2);
    scale(-1, 1);
    translate(-width/2, -height/2);
  }
  drawDick(d1);
  translate(width/2, height/2);
  scale(-scale, scale);
  translate(translation, 0);
  translate(-width/2, -height/2);

  drawDick(d2);

  translate(-translation/2, 5);
  drawHead(d2);
  for (int j = 0; j < random(2, 3); j++) {
    stroke(0);
    drawVeins();
  }
  if(page_num < 30){
    saveFrame("image-" + str(page_num) +".png");
  }
  page_num += 1;
}

void setColorsPinks() {
  d1 = color(random(240, 255), random(210, 225), random(160, 180), 220);
  d2 = color(random(240, 255), random(210, 225), random(160, 180));
  //head = color(random(240, 255), random(210, 225), random(160, 180));
}

void setColorsBrowns() {
  d1 = color(random(75, 85), random(40, 47), random(0, 30), 220);
  d2 = color(random(75, 85), random(40, 47), random(0, 30));
  //head = color(random(75, 85), random(40, 47), random(0, 30));
}

void setColorsTans() {
  d1 = color(random(195, 205), random(150, 160), random(110, 115), 220);
  d2 = color(random(195, 205), random(150, 160), random(110, 115));
  //head = color(random(195, 105), random(150, 160), random(110, 115));
}

void drawDick(color c) {
  stroke(0, 200);
  d = createShape();
  d.beginShape();
  d.strokeWeight(2.5);
  d.fill(c);
  x = width/2;
  y = height/2;

  d.vertex(x, y);
  x = x - girth;
  y = y + len;
  d.vertex(x, y);
  xHold = x + 20*cos(-PI/2) + girth/2;
  yHold = y + 17;
  for (int i = 0; i < 100; i++) {
    theta = map(i, 0, 99, -PI/2, PI);
    x = xHold + 30*cos(theta);
    y = yHold + yScale*sin(theta)*1.25;
    d.vertex(x, y);
  }
  x = x - girth;
  y = height/2;
  d.vertex(x, y);
  d.endShape();
  shape(d);
}

void drawHead(color c) {
  stroke(0, 200);
  headHeight = random(35, 50);
  h = createShape();
  h.beginShape();
  h.fill(c);
  h.strokeWeight(2);
  h.vertex(width/2, height/2);
  h.vertex(width/2 - 20, height/2);
  for (int i = 0; i < 100; i++) {
    theta = map(i, 0, 99, 52*PI/50, 98*PI/50);
    x = width/2 + 27*cos(theta);
    y = height/2 + headHeight*sin(theta);
    h.vertex(x, y);
  }
  h.vertex(width/2 + 20, height/2);
  h.vertex(width/2, height/2);
  h.endShape();

  shape(h);
  stroke(0);
  float ay = height/2 + headHeight*sin(3*PI/2);
  float divLen = random(10, 20);
  stroke(0, 100);
  line(width/2, ay, width/2, ay + divLen);
}

void drawVeins() {
  stroke(0);
  strokeWeight(2);
  float ax = random(width/2 - 5, width/2 + 10);
  float ay = random(height/2, height/2 + len);
  line(ax, ay, ax, ay + random(10, (height/2 + len - ay)));
}