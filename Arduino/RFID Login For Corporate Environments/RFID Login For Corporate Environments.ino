#include <LedControl.h>
#include <SPI.h>
#include <MFRC522.h>
#include "binary.h"
#include "Keyboard.h"
#define SS_PIN 10
#define RST_PIN 9

//Setup the pins
LedControl lc=LedControl(12,13,11,1);
MFRC522 mfrc522(SS_PIN,RST_PIN);

//Configure callable images for the display
byte hf[8]= {B00111100,B01000010,B10100101,B10000001,B10100101,B10011001,B01000010,B00111100};
byte sf[8]= {B00111100,B01000010,B10100101,B10000001,B10011001,B10100101,B01000010,B00111100};
byte x[8]=  {B10000001,B01000010,B00100100,B00011000,B00011000,B00100100,B01000010,B10000001};
byte tk[8]= {B00000000,B00000001,B00000010,B00000100,B10001000,B01010000,B00100000,B00000000};
byte wa[8]= {B01111110,B01000010,B00111100,B00011000,B00011000,B00100100,B01011010,B01111110};
byte A[8] = {B00000000,B00111100,B01100110,B01100110,B01111110,B01100110,B01100110,B01100110};
byte B[8] = {B01111000,B01001000,B01001000,B01110000,B01001000,B01000100,B01000100,B01111100};
byte C[8] = {B00000000,B00011110,B00100000,B01000000,B01000000,B01000000,B00100000,B00011110};
byte D[8] = {B00000000,B00111000,B00100100,B00100010,B00100010,B00100100,B00111000,B00000000};
byte E[8] = {B00000000,B00111100,B00100000,B00111000,B00100000,B00100000,B00111100,B00000000};
byte F[8] = {B00000000,B00111100,B00100000,B00111000,B00100000,B00100000,B00100000,B00000000};
byte G[8] = {B00000000,B00111110,B00100000,B00100000,B00101110,B00100010,B00111110,B00000000};
byte H[8] = {B00000000,B00100100,B00100100,B00111100,B00100100,B00100100,B00100100,B00000000};
byte I[8] = {B00000000,B00111000,B00010000,B00010000,B00010000,B00010000,B00111000,B00000000};
byte J[8] = {B00000000,B00011100,B00001000,B00001000,B00001000,B00101000,B00111000,B00000000};
byte K[8] = {B00000000,B00100100,B00101000,B00110000,B00101000,B00100100,B00100100,B00000000};
byte L[8] = {B00000000,B00100000,B00100000,B00100000,B00100000,B00100000,B00111100,B00000000};
byte M[8] = {B00000000,B00000000,B01000100,B10101010,B10010010,B10000010,B10000010,B00000000};
byte N[8] = {B00000000,B00100010,B00110010,B00101010,B00100110,B00100010,B00000000,B00000000};
byte O[8] = {B00000000,B00111100,B01000010,B01000010,B01000010,B01000010,B00111100,B00000000};
byte P[8] = {B00000000,B00111000,B00100100,B00100100,B00111000,B00100000,B00100000,B00000000};
byte Q[8] = {B00000000,B00111100,B01000010,B01000010,B01000010,B01000110,B00111110,B00000001};
byte R[8] = {B00000000,B00111000,B00100100,B00100100,B00111000,B00100100,B00100100,B00000000};
byte S[8] = {B00000000,B00111100,B00100000,B00111100,B00000100,B00000100,B00111100,B00000000};
byte T[8] = {B00000000,B01111100,B00010000,B00010000,B00010000,B00010000,B00010000,B00000000};
byte U[8] = {B00000000,B01000010,B01000010,B01000010,B01000010,B00100100,B00011000,B00000000};
byte V[8] = {B00000000,B00100010,B00100010,B00100010,B00010100,B00010100,B00001000,B00000000};
byte W[8] = {B00000000,B10000010,B10010010,B01010100,B01010100,B00101000,B00000000,B00000000};
byte X[8] = {B00000000,B01000010,B00100100,B00011000,B00011000,B00100100,B01000010,B00000000};
byte Y[8] = {B00000000,B01000100,B00101000,B00010000,B00010000,B00010000,B00010000,B00000000};
byte Z[8] = {B00000000,B00111100,B00000100,B00001000,B00010000,B00100000,B00111100,B00000000};

//Setup
void setup() {
 Serial.begin(9600);
 SPI.begin();
 mfrc522.PCD_Init();
 lc.shutdown(0,false);
lc.setIntensity(0,8);
lc.clearDisplay(0);  
Keyboard.begin();
}


void loop(){
  
 //Look for new cards
 if ( ! mfrc522.PICC_IsNewCardPresent() ){
 return;
 }
 if ( ! mfrc522.PICC_ReadCardSerial() ) {
 return;
 } // If a card is detected, execute the following:
 
// Print the card's ID
String content= "";
 byte letter;
 for( byte i = 0; i < mfrc522.uid.size; i++ ){
 content.concat(String(mfrc522.uid.uidByte[i], HEX));
 if( i < mfrc522.uid.size-1 ) content+="-";
 }
 content.toUpperCase();
 Serial.println(content);

//Check card against Content ID
if(content == "CARD ID"){ //ENTER THE ID OF THE CARD YOU WISH TO USE.
Serial.println("Unlocking");
delay(300);
Keyboard.releaseAll();   
lc.clearDisplay(0);   
lc.setRow(0,0,hf[0]);
lc.setRow(0,1,hf[1]);
lc.setRow(0,2,hf[2]);
lc.setRow(0,3,hf[3]);
lc.setRow(0,4,hf[4]);
lc.setRow(0,5,hf[5]);
lc.setRow(0,6,hf[6]);
lc.setRow(0,7,hf[7]);
delay(200);
Keyboard.press(KEY_LEFT_CTRL);
Keyboard.press(KEY_LEFT_ALT);
Keyboard.press(KEY_DELETE);
delay(250);
Keyboard.releaseAll();
delay(250);
Keyboard.print("PASSWORD"); //Enter your password here.
delay(500);
Keyboard.write(KEY_RETURN); 
lc.clearDisplay(0);  
lc.setRow(0,0,tk[0]);
lc.setRow(0,1,tk[1]);
lc.setRow(0,2,tk[2]);
lc.setRow(0,3,tk[3]);
lc.setRow(0,4,tk[4]);
lc.setRow(0,5,tk[5]);
lc.setRow(0,6,tk[6]);
lc.setRow(0,7,tk[7]); 
delay(1000);
lc.clearDisplay(0); 
}

//Bellow is provissions for a second card, this one will enter both a user name and password. 
//Use this to have one card for cold log in and one card for lock/unlock

else if(content == "CARD ID"){ 
Serial.println("Unlocking Token");
lc.clearDisplay(0);   
Keyboard.releaseAll(); 
lc.setRow(0,0,hf[0]);
lc.setRow(0,1,hf[1]);
lc.setRow(0,2,hf[2]);
lc.setRow(0,3,hf[3]);
lc.setRow(0,4,hf[4]);
lc.setRow(0,5,hf[5]);
lc.setRow(0,6,hf[6]);
lc.setRow(0,7,hf[7]);
delay(250);
Keyboard.press(KEY_LEFT_CTRL);
Keyboard.press(KEY_LEFT_ALT);
Keyboard.press(KEY_DELETE);  
delay(250);
Keyboard.releaseAll();
delay(500);
Keyboard.write(KEY_RETURN); 
delay(250);
Keyboard.releaseAll();
delay(250);
Keyboard.print("USER");
delay(250);
Keyboard.press(KEY_TAB);
delay(250);
Keyboard.releaseAll();
delay(250);
Keyboard.print("PASSWORD");
delay(500);
Keyboard.write(KEY_RETURN); 
lc.clearDisplay(0);  
lc.setRow(0,0,tk[0]);
lc.setRow(0,1,tk[1]);
lc.setRow(0,2,tk[2]);
lc.setRow(0,3,tk[3]);
lc.setRow(0,4,tk[4]);
lc.setRow(0,5,tk[5]);
lc.setRow(0,6,tk[6]);
lc.setRow(0,7,tk[7]); 
delay(1000);
lc.clearDisplay(0); 
}


else

//DENIED
{         
Serial.println("Access Denied");
lc.clearDisplay(0); 
lc.setRow(0,0,sf[0]);
lc.setRow(0,1,sf[1]);
lc.setRow(0,2,sf[2]);
lc.setRow(0,3,sf[3]);
lc.setRow(0,4,sf[4]);
lc.setRow(0,5,sf[5]);
lc.setRow(0,6,sf[6]);
lc.setRow(0,7,sf[7]);
delay(1000);
lc.clearDisplay(0); 
lc.setRow(0,0,x[0]);
lc.setRow(0,1,x[1]);
lc.setRow(0,2,x[2]);
lc.setRow(0,3,x[3]);
lc.setRow(0,4,x[4]);
lc.setRow(0,5,x[5]);
lc.setRow(0,6,x[6]);
lc.setRow(0,7,x[7]); 
delay(3000);
lc.clearDisplay(0);   
}
}
