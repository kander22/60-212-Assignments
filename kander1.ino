#include "Adafruit_Thermal.h"
#include "SoftwareSerial.h"

#define TX_PIN 6 // Arduino transmit  YELLOW WIRE  labeled RX on printer
#define RX_PIN 5 // Arduino receive   GREEN WIRE   labeled TX on printer

SoftwareSerial mySerial(RX_PIN, TX_PIN); // Declare SoftwareSerial obj first
Adafruit_Thermal printer(&mySerial);     // Pass addr to printer constructor
// Then see setup() function regarding serial & printer begin() calls.


int inputPin = 2;
int ledPin = 13;
int val = 0;

// -----------------------------------------------------------------------
void setup() {

  mySerial.begin(19200);  // Initialize SoftwareSerial
  printer.begin();        // Init printer (same regardless of serial type)

  /*
    // The following calls are in setup(), but don't *need* to be.
    printer.inverseOff();
    printer.doubleHeightOff();
    printer.justify('L');
    printer.boldOff();
    printer.underlineOff();
    printer.setSize('S');
  */

  pinMode(inputPin, INPUT);
  pinMode(ledPin, OUTPUT);


  String testStr = "";
    randomSeed(analogRead(0));
    for (int i = 0; i < 32; i++) {
      char myRandomChar = (char) (random('a', 'z'));
      testStr += myRandomChar;
    }
    //Serial.println(testStr); 
    printer.println(testStr); //(F("Katie!!!"));
    printer.feed(2);
    printer.sleep();      // Tell printer to sleep
    delay(2000L);         // Sleep for 3 seconds
    printer.wake();       // MUST wake() before printing again, even if reset
    printer.setDefault(); // Restore printer to defaults
}

void loop() {
  delay(2); 
  
  val = digitalRead(inputPin); // read input value
  if (val == HIGH) { // check if the input is HIGH
    digitalWrite(ledPin, LOW); // turn LED OFF
  
  } else {
    digitalWrite(ledPin, HIGH); // turn LED ON

    
  }
}
