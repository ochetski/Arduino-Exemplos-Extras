/**
 * Includes
 */
#include "notes.h"
#include "Streaming.h"

/**
 * Definitions
 */
boolean
  switchOutputAllow = true;

int
  switchAction = LOW,
  valueButtonSwitch;

const int
  pinSwitch = 2,     // botao
  pinBuzzer = 8,     // pino do buzzer
  pinOutputLed = 13,
  musMbNote[] = {
    NOTE_E5, NOTE_E5, NOTE_E5, NOTE_C5, NOTE_E5, NOTE_G5, NOTE_G4, 
    NOTE_C5, NOTE_G4, NOTE_E4, NOTE_A4, NOTE_B4, NOTE_AS4, NOTE_A4, NOTE_G4, NOTE_E5, NOTE_G5, NOTE_A5, NOTE_F5, NOTE_G5, NOTE_E5, NOTE_C5, NOTE_D5, NOTE_B4, 
    NOTE_C5, NOTE_G4, NOTE_E4, NOTE_A4, NOTE_B4, NOTE_AS4, NOTE_A4, NOTE_G4, NOTE_E5, NOTE_G5, NOTE_A5, NOTE_F5, NOTE_G5, NOTE_E5, NOTE_C5, NOTE_D5, NOTE_B4, 
    NOTE_G5, NOTE_FS5, NOTE_F5, NOTE_DS5, NOTE_E5, NOTE_GS4, NOTE_A4, NOTE_C5, NOTE_A4, NOTE_C5, NOTE_D5,
    NOTE_G5, NOTE_FS5, NOTE_F5, NOTE_DS5, NOTE_E5, NOTE_C6, NOTE_C6, NOTE_C6,
    NOTE_G5, NOTE_FS5, NOTE_F5, NOTE_DS5, NOTE_E5, NOTE_GS4, NOTE_A4, NOTE_C5, NOTE_A4, NOTE_C5, NOTE_D5,
    NOTE_DS5, NOTE_D5, NOTE_C5
  },
  musMbSize[] = {
    100, 100, 100, 100, 100, 100, 100, 
    100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 
    100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 
    100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100,
    100, 100, 100, 100, 100, 100, 100, 100,
    100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100,
    100, 100, 100
  },
  musMbTime[] = {
    100, 200, 200, 100, 200, 400, 400, 
    300, 300, 300, 200, 200, 100, 200, 100, 200, 100, 200, 100, 200, 200, 100, 100, 300, 
    300, 300, 300, 200, 200, 100, 200, 100, 200, 100, 200, 100, 200, 200, 100, 100, 500, 
    100, 100, 100, 200, 200, 100, 100, 180, 100, 100, 300,
    100, 100, 100, 200, 230, 200, 100, 550,
    100, 100, 100, 200, 200, 100, 100, 200, 100, 100, 300,
    280, 280, 400
  };

long
  tmNow,
  musTime = 0,
  musPos = 0;
  
float
  musSpeed = 1.3;


void setup()
{
  Serial.begin(9600);
  pinMode(pinSwitch, INPUT);
  pinMode(pinOutputLed, OUTPUT);

  // buzzer
  pinMode(pinBuzzer, OUTPUT);

  // led smd desligado
  digitalWrite(pinOutputLed, LOW);
}


void loop()
{
  tmNow = millis(); // so funciona se nao for colocado NENHUM delay no codigo
  valueButtonSwitch = digitalRead(pinSwitch); // read what is needed


  if(valueButtonSwitch == LOW && switchOutputAllow == true) // check if button was pressed
  {
      switchOutputAllow = false; // botao foi apertado e nao solto
      if(switchAction == LOW) // inverte o switch LOW-HIGH
        switchAction = HIGH;
      else
        switchAction = LOW;
  }
  if(valueButtonSwitch == HIGH && switchOutputAllow == false)// check if button was released
  {
      switchOutputAllow = true;
  }
  digitalWrite(pinOutputLed, switchAction); // botao apertado? liga o led


  if(switchAction == HIGH) // ainda ligado?
  {
    if(musPos >= (sizeof(musMbTime)/sizeof(int))) // acabaram as notas?
    {
      switchAction = LOW;
    }
    else
    {
      // toca proxima!
      if(musTime == 0) // comecou agora?
      {
        musTime = tmNow + (musMbTime[musPos] * musSpeed);
        tone(pinBuzzer, musMbNote[musPos], musMbSize[musPos] * musSpeed);
        musPos++;
        Serial
          << "Time: "
          << musTime
          << " | Pos: "
          << musPos
          << " | "
          << (sizeof(musMbTime)/sizeof(int))
          << "\n";
      }
      else if(musTime <= tmNow) // ja esta na hora?
      {
        musTime = musTime + (musMbTime[musPos] * musSpeed);
        tone(pinBuzzer, musMbNote[musPos], musMbSize[musPos] * musSpeed);
        musPos++;
        Serial
          << "Time: "
          << musTime
          << " | Pos: "
          << musPos
          << " | "
          << (sizeof(musMbTime)/sizeof(int))
          << "\n";
      }
    }
  }
  if(switchAction == LOW)
  {
      musTime = 0;
      musPos = 0;
  }
}
