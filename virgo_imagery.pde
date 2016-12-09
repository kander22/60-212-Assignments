int[] coords = {width/2, height/2};
PImage back;
JSONArray json;

void setup() {
  size(400, 400);
  background(255);
  smooth();
  save("background.png");
}

void draw() {
  back = loadImage("background.png");
  background(255);
  noFill();
  stroke(0);
  beginShape();
  curveVertex(width/2, height/2);
  fill(255, 0, 0);
  noStroke();
  for (int i = 0; i < coords.length; i +=2) {
    curveVertex(coords[i], coords[i + 1]);
  }
  noFill();
  stroke(0);
  curveVertex(mouseX, mouseY);
  curveVertex(mouseX, mouseY);
  endShape();
}

void mousePressed(){
  save("background.png");
  coords = append(coords, mouseX);
  coords = append(coords, mouseY);
}

void keyPressed(){
  json = new JSONArray();
  int counter = 0;
  for (int i = 0; i < coords.length; i +=2) {
    JSONObject entry = new JSONObject();
    entry.setInt("id", counter);
    entry.setString("x", str(coords[i]));
    entry.setString("y", str(coords[i + 1]));
    json.setJSONObject(counter, entry);
    counter += 1;
  }
  saveJSONArray(json, "data/cancer.json");
}
  