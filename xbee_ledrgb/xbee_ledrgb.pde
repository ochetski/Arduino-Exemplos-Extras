
#include "SoftwareSerial.h"
#include "String.h"
#include "Streaming.h"

#define rxPin 2
#define txPin 3
#define ledPin 13
#define ledR 5
#define ledG 6
#define ledB 9

SoftwareSerial seriOne = SoftwareSerial(rxPin, txPin);

String cache = String();

byte pinState = 0;

void setup()
{
  pinMode(rxPin, INPUT);
  pinMode(txPin, OUTPUT);
  pinMode(ledPin, OUTPUT);
  pinMode(ledR, OUTPUT);
  pinMode(ledG, OUTPUT);
  pinMode(ledB, OUTPUT);
  analogWrite(ledR, 45);
  analogWrite(ledG, 25);
  analogWrite(ledB, 15);

  Serial.begin(19200);
  seriOne.begin(9600);
}

void loop()
{
  checkXbee();
}

void checkXbee(){
  char someChar = seriOne.read();
  if(someChar == '#'){
    cache = "";
  }
  cache.concat(someChar);
  if(someChar == '$' && cache.startsWith('#')){
    int rgb = 0;
    int RGB[15] = {};
    split2ints(RGB, ',', cache);
    ledRGB(RGB[0], RGB[1], RGB[2]);
    cache = "";
  }
}

void ledRGB(int R, int G, int B){
  R = constrain(R, 0, 255);
  G = constrain(G, 0, 255);
  B = constrain(B, 0, 255);
  analogWrite(ledR, R);
  analogWrite(ledG, G);
  analogWrite(ledB, B);
  Serial<<"rgb("<<R<<","<<G<<","<<B<<")"<<endl;
  seriOne.print("rgb(");
  seriOne.print(R);
  seriOne.print(",");
  seriOne.print(G);
  seriOne.print(",");
  seriOne.print(B);
  seriOne.println(")");
}

int str2int(String toInt){
  if(toInt.length() > 255)
    return 0;
  char tmp[255] = "";
  for(int i=1,j=0;i<toInt.length()-1;i++,j++){
    tmp[j] = toInt[i];
  }
  int final = atoi(tmp);
  return final;
}
int str2int(char toInt[4]){
  int final = atoi(toInt);
  return final;
}

void split2ints(int RGB[15], char spliter, String toSplit){
  if(toSplit.length() > 255)
    return;
  char buff[5] = "";
  for(int i=1,j=0,k=0;i<toSplit.length()-1;i++){
    buff[j] = toSplit[i];
    j++;
    if(toSplit[i] == spliter || i==toSplit.length()-2){
      buff[j] = '\0';
      RGB[k] = str2int(buff);
      k++;
      j=0;
    }
  }
}
