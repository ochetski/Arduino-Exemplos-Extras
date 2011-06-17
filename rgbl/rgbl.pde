
#include "Streaming.h";

// define variaveis
int
  pinLedR = 11,
  pinLedG = 10,
  pinLedB = 9,
  pinPotR = A0,
  pinPotG = A1,
  pinPotB = A2;


void setup()
{
  // inicia transmissao de dados
  Serial.begin(9600);

  // define pinos dos leds
  pinMode(pinLedR, OUTPUT);
  pinMode(pinLedG, OUTPUT);
  pinMode(pinLedB, OUTPUT);

  // define pinos para leitura dos potenciometros
  pinMode(pinPotR, INPUT);
  pinMode(pinPotG, INPUT);
  pinMode(pinPotB, INPUT);
}

void loop()
{
  // le dados dos potenciometros e transforma a escala de 0-1023 para 0-225
  analogWrite(pinLedR, map(analogRead(pinPotR), 0, 1023, 0, 255));
  analogWrite(pinLedG, map(analogRead(pinPotG), 0, 1023, 0, 255));
  analogWrite(pinLedB, map(analogRead(pinPotB), 0, 1023, 0, 255));


  // exibe resultado como RGB(153, 50, 0);
  Serial
  << "RGB("
  << map(analogRead(pinPotR), 0, 1023, 0, 255) << ", "
  << map(analogRead(pinPotG), 0, 1023, 0, 255) << ", "
  << map(analogRead(pinPotB), 0, 1023, 0, 255) << ");";
}
