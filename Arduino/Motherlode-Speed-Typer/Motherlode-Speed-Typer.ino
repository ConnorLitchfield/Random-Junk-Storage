#include "Keyboard.h"
int piezoPin = 12;

long randNumber;

void setup() {
  Keyboard.begin();
  Serial.begin(9600);
  delay(10000);
}

void loop() {
  delay(30);
  Keyboard.print("motherlode"); 
   delay(30);
  Keyboard.write(KEY_RETURN); 
}
