var lines = [];

function setup() {
  createCanvas(720, 480);
  background(0);
}

function draw() {}

function mousePressed() {
  background(10, 5, 0);
  stroke(50, 50, 15);
  strokeWeight(2);
  for (var i = 0; i < 12; i++) {
    lines[i] = new Line();
  }
  for (var i = 0; i < lines.length; i++) {
    lines[i].displayLine();
  }
  for (var i = 0; i < lines.length; i++) {
    var x1 = lines[i].getXcoord1();
    var y1 = lines[i].getYcoord1();
    var x2 = lines[i].getXcoord2();
    var y2 = lines[i].getYcoord2();

    for (var j = 0; j < lines.length; j++) {
      var x3 = lines[j].getXcoord1();
      var y3 = lines[j].getYcoord1();
      var x4 = lines[j].getXcoord2();
      var y4 = lines[j].getYcoord2();

      var denom = (y4 - y3) * (x2 - x1) - (x4 - x3) * (y2 - y1);
      var uAnum = (x4 - x3) * (y1 - y3) - (y4 - y3) * (x1 - x3);
      var uBnum = (x2 - x1) * (y1 - y3) - (y2 - y1) * (x1 - x3);

      if (denom > 0 || denom < 0) {
        var uA = uAnum / denom;
        var uB = uBnum / denom;
        if ((0 <= uB) && (1 >= uB) && (0 <= uA) && (1 >= uA)) {
          var xIntersection = (x1 + uA * (x2 - x1));
          var yIntersection = (y1 + uA * (y2 - y1));
          noStroke();
          var inner = color(200,100,50,200)
          var halo = color(180, 180, 50, 100)
          fill(inner);
          ellipse(xIntersection, yIntersection, 10, 10);
          fill(halo);
          ellipse(xIntersection, yIntersection, 17, 17);
        }

      }
    }
  }
}





  function Line() {
    this.x1 = random(width);
    this.y1 = random(height);
    this.x2 = random(width);
    this.y2 = random(height);
    
    this.displayLine = function() {
      line(this.x1, this.y1, this.x2, this.y2);
    }

    this.getXcoord1 = function() {
      this.tempX = this.x1;
      return this.tempX;
    }

    this.getYcoord1 = function() {
      this.tempY = this.y1;
      return this.tempY;
    }

    this.getXcoord2 = function() {
      this.tempX = this.x2;
      return this.tempX;
    }

    this.getYcoord2 = function() {
      this.tempY = this.y2;
      return this.tempY;
    }
  }