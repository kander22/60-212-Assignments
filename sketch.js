var balls = [];
var spring = .03
var friction = -0.8
var gravity = 0.01 //set gravity to 0 to avoid annoying problem where balls get stuck on bottom of page


function setup() {
  createCanvas(500, 500);
  background(55);
  for (var i = 0; i < 12; i++) {   //create all 132 of the time balls
    balls[i] = new TimeBalls(.4, .4, 0, i, balls);
  }
  for (var i = 12; i < 72; i++) {
    balls[i] = new TimeBalls(.2, .2, 1, i, balls);
  }
  for (var i = 72; i < 132; i++) {
    balls[i] = new TimeBalls(2.5, 2.5, 2, i, balls);
  }

}

function draw() {
  background(55);
  var h = hour() % 12; //only perform functions on the time balls that should be displayed based on current time
  var m = minute();
  var s = second();
  for (var i = 72; i < (s + 72); i++) {
    balls[i].displayTimeBalls();
    balls[i].moveTimeBalls();
    balls[i].collide();
    balls[i].checkCollisionsWalls();
  }
  for (var i = 12; i < (12 + m); i++) {
    balls[i].displayTimeBalls();
    balls[i].moveTimeBalls();
    balls[i].collide();
    balls[i].checkCollisionsWalls();
  }
  for (var i = 0; i < h; i++) {
    balls[i].displayTimeBalls();
    balls[i].moveTimeBalls();
    balls[i].collide();
    balls[i].checkCollisionsWalls();
  }
}

function TimeBalls(xSpeedIn, ySpeedIn, typeIn, idIn, otherBallsIn) {
  this.h = hour() % 12;
  this.m = minute();
  this.s = second();
  this.xspeed = xSpeedIn;
  this.yspeed = ySpeedIn;
  this.type = typeIn; //the type variable allows the ball to know whether is is an hr (0), min (1), or sec(2)
  this.xPos;
  this.yPos;
  this.radius;
  this.id = idIn; //these next two variables are used to compare the array against itself for collisions
  this.otherBalls = otherBallsIn;
  this.checkLimit; //if we don't make sure we only check against balls engaged in displaying current time, balls will bounce of 
                    //of other balls that shouldn't be there
  this.ballColor;

  if (this.type === 0) { //hour type
    this.diameter = 70;
    this.radius = this.diameter / 2
    this.xPos = random(this.radius * 2, width / 3);
    this.yPos = 50;
    this.checkStart = 0;
    this.checkLimit = this.h;
    this.ballColor = color(255, random(115, 160), 255, 220)
  }

  if (this.type == 1) { //minute type
    this.diameter = 30;
    this.radius = this.diameter / 2
    this.xPos = random(width);
    this.yPos = random(height)
    this.checkStart = 12;
    this.checkLimit = 12 + minute();
    this.ballColor = color(160, random(115, 140), random(90, 140), 200)
  }

  if (this.type == 2) { //second type
    this.diameter = 15;
    this.radius = this.diameter / 2
    this.xPos = random(width);
    this.yPos = random(height);
    this.checkStart = 72;
    this.checkLimit = 72 + second();
    this.ballColor = color(random(150), 200, 250, 160)
  }

  this.displayTimeBalls = function() {
    noStroke();
    fill(this.ballColor);
    ellipse(this.xPos, this.yPos, this.diameter, this.diameter);
    //this.yPos = this.yPos + this.yspeed;
  }

  this.moveTimeBalls = function() {
    this.yspeed += gravity
    this.xPos = this.xPos + this.xspeed;
    this.yPos = this.yPos + this.yspeed;
  }

  this.checkCollisionsWalls = function() {
    if (((this.yPos - this.radius) < 0) || ((this.yPos + this.radius) > (height))) {
      this.yspeed = -this.yspeed
    }
    if (((this.xPos - this.radius) < 0) || ((this.xPos + this.radius) > width)) {
      this.xspeed = -this.xspeed
    }
  }

  this.collide = function() { //collision physics adapted from code by Dan Schiffman: 
                              //https://github.com/processing/processing-docs/blob/master/content/examples_p5/Topics/Motion/BouncyBubbles/BouncyBubbles.js
    for (var i = this.id + 1; i < this.checkLimit; i++) {
      var dx = this.otherBalls[i].xPos - this.xPos;
      var dy = this.otherBalls[i].yPos - this.yPos;
      var distance = sqrt(dx * dx + dy * dy);
      var minDist = this.otherBalls[i].radius + this.radius
      if (distance < minDist) {
        var angle = atan2(dy, dx);
        var targetX = this.xPos + cos(angle) * minDist; //calculates angle at which ball should bounce off
        var targetY = this.yPos + sin(angle) * minDist;
        var ax = (targetX - this.otherBalls[i].xPos) * spring; //calculates acceleration
        var ay = (targetY - this.otherBalls[i].yPos) * spring;
        this.xspeed -= ax; //calculates new speed
        this.yspeed -= ay;
        this.otherBalls[i].xspeed += ax;
        this.otherBalls[i].yspped += -ay;
      }
    }
  }
}