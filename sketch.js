function setup() {
  createCanvas(600, 600);
  background(255);
}


function draw() {}

function mousePressed() {
  var angleSet = random(PI/2);
  var spaces = [];
  for (var i = 0; i < 15; i++) {
    spaces[i] = new whiteSpace();
  }
  background(240);
  var isSpace;
  var x = random(38, 41);
  while (x <= (width - 40)) {
    var y = random(38, 41);
    while (y < (width - 40)) {
      for (i = 0; i < 15; i++) {
        if (x > spaces[i].xbeg && x < spaces[i].xend && y > spaces[i].ybeg && y < spaces[i].yend) {
          isSpace = 1;
          break;
        } else {
          isSpace = 0 ;
        }
      }
      if (isSpace != 1) {
        displayLine(x, y, angleSet);
      } 
      y += random(10,13);
    }
    x += random(10,13);
  }
}

function displayLine(tempX, tempY, tempAngle) {
  var length = 22;
  var ax = tempX;
  var ay = tempY;
  var angle = randomGaussian(tempAngle, PI/5);
  var bx = ax + length * cos(angle);
  var by = ay + length * sin(angle);
  line(ax, ay, bx, by);
}

function whiteSpace() {
  this.xbeg = random(width);
  this.ybeg = random(height);
  this.xend = this.xbeg + randomGaussian(random(10, 55), 20);
  this.yend = this.ybeg + randomGaussian(random(10, 55), 17);
}