
/**
 * Includes
 */
#include "notes.h"
<<<<<<< HEAD
=======
#include "Streaming.h"
>>>>>>> 69d46f2d96acb24a0acadd6ba537abcb0923600a


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
<<<<<<< HEAD
  /**
=======
>>>>>>> 69d46f2d96acb24a0acadd6ba537abcb0923600a
  musMbNote[] = {
    NOTE_E5, NOTE_E5, NOTE_E5, NOTE_C5, NOTE_E5, NOTE_G5, NOTE_G4, 
    NOTE_C5, NOTE_G4, NOTE_E4, NOTE_A4, NOTE_B4, NOTE_AS4, NOTE_A4, NOTE_G4, NOTE_E5, NOTE_G5, NOTE_A5, NOTE_F5, NOTE_G5, NOTE_E5, NOTE_C5, NOTE_D5, NOTE_B4, 
    NOTE_C5, NOTE_G4, NOTE_E4, NOTE_A4, NOTE_B4, NOTE_AS4, NOTE_A4, NOTE_G4, NOTE_E5, NOTE_G5, NOTE_A5, NOTE_F5, NOTE_G5, NOTE_E5, NOTE_C5, NOTE_D5, NOTE_B4, 
    NOTE_G5, NOTE_FS5, NOTE_F5, NOTE_DS5, NOTE_E5, NOTE_GS4, NOTE_A4, NOTE_C5, NOTE_A4, NOTE_C5, NOTE_D5,
    NOTE_G5, NOTE_FS5, NOTE_F5, NOTE_DS5, NOTE_E5, NOTE_C6, NOTE_C6, NOTE_C6,
    NOTE_G5, NOTE_FS5, NOTE_F5, NOTE_DS5, NOTE_E5, NOTE_GS4, NOTE_A4, NOTE_C5, NOTE_A4, NOTE_C5, NOTE_D5,
    NOTE_DS5, NOTE_D5, NOTE_C5,
<<<<<<< HEAD
=======
    /*
    NOTE_C5, NOTE_C5, NOTE_C5, NOTE_C5, NOTE_D5, NOTE_E5, NOTE_C5, NOTE_A4, NOTE_G4,
    NOTE_C5, NOTE_C5, NOTE_C5, NOTE_C5, NOTE_D5, NOTE_E5,
    */
    
/*
-|  4|-cc-c-cd-ec------|-cc-c-cd-e------|-cc-c-cd-ec------|-ee-e-ce-g-------|
T|  3|------------ag---|----------------|------------ag---|------------g----|
A|  2|-----------------|----------------|-----------------|-----------------|
B|  
N|  
A|  4|-ec-------fff---|---aaa-gfe------|-ec-------fff---|----fff-edc-----|
B|  3|----gg-a--------|-b--------------|----gg-a--------|-b--------------|
B|  2|----------------|----------------|----------------|----------------|
*/
>>>>>>> 69d46f2d96acb24a0acadd6ba537abcb0923600a
  },
  musMbSize[] = {
    100, 100, 100, 100, 100, 100, 100, 
    100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 
    100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 
    100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100,
    100, 100, 100, 100, 100, 100, 100, 100,
    100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100,
    100, 100, 100,
<<<<<<< HEAD
=======
    /*
    100, 100, 150, 1, 100, 100, 100, 100, 100,
    100, 100, 100, 100, 100, 250,
    */
>>>>>>> 69d46f2d96acb24a0acadd6ba537abcb0923600a
  },
  musMbTime[] = {
    100, 200, 200, 100, 200, 400, 400, 
    300, 300, 300, 200, 200, 100, 200, 100, 200, 100, 200, 100, 200, 200, 100, 100, 300, 
    300, 300, 300, 200, 200, 100, 200, 100, 200, 100, 200, 100, 200, 200, 100, 100, 500, 
    100, 100, 100, 200, 200, 100, 100, 180, 100, 100, 300,
    100, 100, 100, 200, 230, 200, 100, 550,
    100, 100, 100, 200, 200, 100, 100, 200, 100, 100, 300,
    280, 280, 400,
<<<<<<< HEAD
  };
  /*/
  musMbNote[] = {
    NOTE_C5, NOTE_C5, NOTE_C5, NOTE_C5, NOTE_D5, NOTE_E5, NOTE_C5, NOTE_A4, NOTE_G4,
    NOTE_C5, NOTE_C5, NOTE_C5, NOTE_C5, NOTE_D5, NOTE_E5,
  //-  NOTE_D7, NOTE_E7, NOTE_D7, NOTE_E7, NOTE_D7, NOTE_E7, 
  },
  musMbSize[] = {
    100, 100, 200, 100, 100, 100, 100, 100, 100,
    100, 100, 100, 100, 100, 250,
  //-  30, 60, 30, 60, 30, 60, 
  },
  musMbTime[] = {
    110, 180, 350, 100, 200, 180, 180, 180, 330,
    //110, 180, 250, 150, 180, 250,
  //-  50, 200, 50, 200, 50, 200, 
  };
  //*/

/*
-|  4|-cc-c-cd-ec------|-cc-c-cd-e------|-cc-c-cd-ec------|-ee-e-ce-g-------|
T|  3|------------ag---|----------------|------------ag---|------------g----|
A|  2|-----------------|----------------|-----------------|-----------------|
B|  
N|  
A|  4|-ec-------fff---|---aaa-gfe------|-ec-------fff---|----fff-edc-----|
B|  3|----gg-a--------|-b--------------|----gg-a--------|-b--------------|
B|  2|----------------|----------------|----------------|----------------|
*/
=======
    /*
    110, 180, 250, 150, 200, 180, 180, 180, 330,
    110, 180, 250, 150, 180, 250,
    */
  };
>>>>>>> 69d46f2d96acb24a0acadd6ba537abcb0923600a

long
  tmNow,
  musTime = 0,
  musPos = 0;
  
float
<<<<<<< HEAD
  musSpeed = 1.3;
=======
  musSpeed = 1.4;
>>>>>>> 69d46f2d96acb24a0acadd6ba537abcb0923600a

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
<<<<<<< HEAD
        Serial.print("Time: ");
        Serial.print(musTime);
        Serial.print(" | Pos: ");
        Serial.print(musPos);
        Serial.print(" | ");
        Serial.print((sizeof(musMbTime)/sizeof(int)));
        Serial.println("");
=======
        Serial
          << "Time: "
          << musTime
          << " | Pos: "
          << musPos
          << " | "
          << (sizeof(musMbTime)/sizeof(int))
          << "\n";
>>>>>>> 69d46f2d96acb24a0acadd6ba537abcb0923600a
      }
      else if(musTime <= tmNow) // ja esta na hora?
      {
        musTime = musTime + (musMbTime[musPos] * musSpeed);
        tone(pinBuzzer, musMbNote[musPos], musMbSize[musPos] * musSpeed);
        musPos++;
<<<<<<< HEAD
        Serial.print("Time: ");
        Serial.print(musTime);
        Serial.print(" | Pos: ");
        Serial.print(musPos);
        Serial.print(" | ");
        Serial.print((sizeof(musMbTime)/sizeof(int)));
        Serial.println("");
=======
        Serial
          << "Time: "
          << musTime
          << " | Pos: "
          << musPos
          << " | "
          << (sizeof(musMbTime)/sizeof(int))
          << "\n";
>>>>>>> 69d46f2d96acb24a0acadd6ba537abcb0923600a
      }
    }
  }
  if(switchAction == LOW)
  {
      musTime = 0;
      musPos = 0;
  }

  // set output
<<<<<<< HEAD
}
=======
}
>>>>>>> 69d46f2d96acb24a0acadd6ba537abcb0923600a
