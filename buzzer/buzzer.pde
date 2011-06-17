
/**
 * Includes
 */
#include "notes.h"

<<<<<<< HEAD
=======

>>>>>>> 69d46f2d96acb24a0acadd6ba537abcb0923600a
/**
 * Definitions
 */
boolean
  switchOutputAllow = true;

<<<<<<< HEAD

=======
>>>>>>> 69d46f2d96acb24a0acadd6ba537abcb0923600a
int
  switchAction = LOW,
  valueButtonSwitch = LOW,
  buzz_len = 200,
  buzz_delay_ratio = 100;

// pin definitions
const int
  switchPin = 2,        // button
  pin_buzzer = 8,       // pino do buzzer
  switchOutputLed = 13; // motor on/off led

/**
 * Setup
 */
void setup() {
  Serial.begin(9600);
  pinMode(switchPin, INPUT);
  pinMode(switchOutputLed, OUTPUT);

  // buzzer
  //pinMode(pin_buzzer, OUTPUT);

  // led smd desligado
  digitalWrite(switchOutputLed, LOW);
}

void loop() {
  // read what is needed
  valueButtonSwitch = digitalRead(switchPin);
  ///////////////////////////////////////
  // check if button was pressed
  if(valueButtonSwitch == LOW && switchOutputAllow == true)
  {
      switchOutputAllow = false;
      if(switchAction == LOW)
      {
          switchAction = HIGH;
      }
      else
      {
          switchAction = LOW;
      }
  }
  // check if button was released
  if(valueButtonSwitch == HIGH && switchOutputAllow == false)
  {
      switchOutputAllow = true;
  }
  digitalWrite(switchOutputLed, switchAction);
  if(switchAction == HIGH)
  {
    tone(pin_buzzer, NOTE_E5, 100);
    delay(100);
    tone(pin_buzzer, NOTE_E5, 100);
    delay(200);
    tone(pin_buzzer, NOTE_E5, 100);
    delay(200);
    tone(pin_buzzer, NOTE_C5, 100);
    delay(100);
    tone(pin_buzzer, NOTE_E5, 100);
    delay(200);
    tone(pin_buzzer, NOTE_G5, 100);
    delay(400);
    tone(pin_buzzer, NOTE_G4, 100);
    delay(400);
    /////////////////////////////
    for(int i=0;i<2;i++)
    {
      tone(pin_buzzer, NOTE_C5, 100);
      delay(300);
      tone(pin_buzzer, NOTE_G4, 100);
      delay(300);
      tone(pin_buzzer, NOTE_E4, 100);
      delay(300);
      tone(pin_buzzer, NOTE_A4, 100);
      delay(200);
      tone(pin_buzzer, NOTE_B4, 100);
      delay(200);
      tone(pin_buzzer, NOTE_AS4, 100);
      delay(100);
      tone(pin_buzzer, NOTE_A4, 100);
      delay(200);
      tone(pin_buzzer, NOTE_G4, 100);
      delay(100);
      tone(pin_buzzer, NOTE_E5, 100);
      delay(200);
      tone(pin_buzzer, NOTE_G5, 100);
      delay(100);
      tone(pin_buzzer, NOTE_A5, 100);
      delay(200);
      tone(pin_buzzer, NOTE_F5, 100);
      delay(100);
      tone(pin_buzzer, NOTE_G5, 100);
      delay(200);
      tone(pin_buzzer, NOTE_E5, 100);
      delay(200);
      tone(pin_buzzer, NOTE_C5, 100);
      delay(100);
      tone(pin_buzzer, NOTE_D5, 100);
      delay(100);
      tone(pin_buzzer, NOTE_B4, 100);
      delay(350);
    }
    /////////////////////////////
    delay(250);
    tone(pin_buzzer, NOTE_G5, 100);
    delay(100);
    tone(pin_buzzer, NOTE_FS5, 100);
    delay(100);
    tone(pin_buzzer, NOTE_F5, 100);
    delay(100);
    tone(pin_buzzer, NOTE_DS5, 100);
    delay(200);
    tone(pin_buzzer, NOTE_E5, 100);
    delay(200);
    tone(pin_buzzer, NOTE_GS4, 100);
    delay(100);
    tone(pin_buzzer, NOTE_A4, 100);
    delay(100);
    tone(pin_buzzer, NOTE_C5, 100);
    delay(200);
    tone(pin_buzzer, NOTE_A4, 100);
    delay(100);
    tone(pin_buzzer, NOTE_C5, 100);
    delay(100);
    tone(pin_buzzer, NOTE_D5, 100);
    delay(300);
    tone(pin_buzzer, NOTE_G5, 100);
    delay(100);
    tone(pin_buzzer, NOTE_FS5, 100);
    delay(100);
    tone(pin_buzzer, NOTE_F5, 100);
    delay(100);
    tone(pin_buzzer, NOTE_DS5, 100);
    delay(200);
    tone(pin_buzzer, NOTE_E5, 100);
    delay(230);
    tone(pin_buzzer, NOTE_C6, 100);
    delay(200);
    tone(pin_buzzer, NOTE_C6, 100);
    delay(100);
    tone(pin_buzzer, NOTE_C6, 100);
    delay(500);
    tone(pin_buzzer, NOTE_G5, 100);
    delay(100);
    tone(pin_buzzer, NOTE_FS5, 100);
    delay(100);
    tone(pin_buzzer, NOTE_F5, 100);
    delay(100);
    tone(pin_buzzer, NOTE_DS5, 100);
    delay(200);
    tone(pin_buzzer, NOTE_E5, 100);
    delay(200);
    tone(pin_buzzer, NOTE_GS4, 100);
    delay(100);
    tone(pin_buzzer, NOTE_A4, 100);
    delay(100);
    tone(pin_buzzer, NOTE_C5, 100);
    delay(200);
    tone(pin_buzzer, NOTE_A4, 100);
    delay(100);
    tone(pin_buzzer, NOTE_C5, 100);
    delay(100);
    tone(pin_buzzer, NOTE_D5, 100);
    delay(400);
    tone(pin_buzzer, NOTE_DS5, 100);
    delay(280);
    tone(pin_buzzer, NOTE_D5, 100);
    delay(280);
    tone(pin_buzzer, NOTE_C5, 100);
    delay(400);
    switchAction = LOW;
  }

  ///////////////////////////////////////
  // set output
  Serial.print("Status: ");
  Serial.print((switchAction == HIGH ? "ON " : "OFF"));
  Serial.print(" | Button: ");
  Serial.println("");
<<<<<<< HEAD
}
=======
}
>>>>>>> 69d46f2d96acb24a0acadd6ba537abcb0923600a
