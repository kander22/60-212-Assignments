import rita.*;
import java.util.*;

RiMarkov results;
String newHor[];
String signs[];
String symbols[];
float quadX[];
float quadY[];
float edgeX[];
float edgeY[];
float sign_number;

int num_sentences = 5;
PFont ArialUni;
float boxWidth;
float boxHeight;

void setup() {
  size(600, 600);
  boxWidth = width/4;
  boxHeight= height/3;

  String horSentences = RiTa.loadString("horoscopes.txt", this);
  signs = new String[12];
  quadX = new float[12];
  quadY = new float[12];
  signs[0] = "Aries";
  signs[1] = "Taurus";
  signs[2] = "Gemini";
  signs[3] = "Cancer";
  signs[4] = "Leo";
  signs[5] = "Virgo";
  signs[6] = "Libra";
  signs[7] = "Scorpio";
  signs[8] = "Sagittarius";
  signs[9] = "Capricorn";
  signs[10] = "Aquarius";
  signs[11] = "Pisces";

  symbols = new String[12];
  symbols[0] = "\u2648";
  symbols[1] = "\u2649";
  symbols[2] = "\u264A";
  symbols[3] = "\u264B";
  symbols[4] = "\u264C";
  symbols[5] = "\u264D";
  symbols[6] = "\u264E";
  symbols[7] = "\u264F";
  symbols[8] = "\u2650";
  symbols[9] = "\u2651";
  symbols[10] = "\u2652";
  symbols[11] = "\u2653";

  for (int sign = 0; sign < 12; sign++) {
    results = new RiMarkov(4, true, false);
    results.loadText(horSentences);
    newHor = results.generateSentences(num_sentences);
    for (int i = 0; i < num_sentences; i++) {
      for (int signCheck = 0; signCheck < 12; signCheck++) {
        newHor[i] = newHor[i].replace(signs[signCheck], signs[sign]);
      }
    }
  }
  ArialUni = createFont("Arial Unicode.ttf", 100);
  textFont(ArialUni);
  textAlign(CENTER);
  fill(0);

  for (int i = 0; i < 12; i ++) {
    quadX[i] = boxWidth*(i%4) + boxWidth/2;
  }
  for (int i = 0; i < 12; i++) {
    quadY[i] = boxHeight*(i%3) + boxHeight/2;
  }
  edgeX = new float[5];
  for (int i = 0; i < 5; i++) {
    edgeX[i] = boxWidth*(i%4);
  }
  for (int i = 0; i < 4; i++) {
    edgeY[i] = boxHeight*(i%3);
  }
}

void draw() {
  background(0, 0, 51);
  fill(255);
  drawSymbols();
  checkEdges();
  print(sign_number);
}

void drawSymbols() {
  for (int i = 0; i < 4; i++) {
    text(symbols[i], quadX[i], quadY[0]);
  }
  for (int i = 4; i < 8; i++) {
    text(symbols[i], quadX[i], quadY[1]);
  }
  for (int i = 8; i < 12; i++) {
    text(symbols[i], quadX[i], quadY[2]);
  }
}

void checkEdges() {
  if (mouseX >= edgeX[0] && mouseX < edgeX[1]) {
    if (mouseY >= edgeY[0] && mouseY < edgeY[1]) {
      sign_number = 0;
    }
    if (mouseY >= edgeY[1] && mouseY < edgeY[2]) {
      sign_number = 1;
    }
    if (mouseY >= edgeY[3] && mouseY < edgeY[4]) {
      sign_number = 2;
    } else {
      sign_number = 3;
    }
  }
  
  if (mouseX >= edgeX[1] && mouseX < edgeX[2]) {
    if (mouseY >= edgeY[0] && mouseY < edgeY[1]) {
      sign_number = 4;
    }
    if (mouseY >= edgeY[1] && mouseY < edgeY[2]) {
      sign_number = 5;
    }
    if (mouseY >= edgeY[3] && mouseY < edgeY[4]) {
      sign_number = 6;
    } else {
      sign_number = 7;
    }
  }
  
  if (mouseX >= edgeX[2] && mouseX < edgeX[3]) {
    if (mouseY >= edgeY[0] && mouseY < edgeY[1]) {
      sign_number = 8;
    }
    if (mouseY >= edgeY[1] && mouseY < edgeY[2]) {
      sign_number = 9;
    }
    if (mouseY >= edgeY[3] && mouseY < edgeY[4]) {
      sign_number = 10;
    } else {
      sign_number = 11;
    }
  }
}