/**
 * This example makes a binary chronomether that is able to count 2 minutes,
 * it do restarts then the arduino restarts.
 *
 * Needed:
 * 10 leds
 * 10 resistors (220~330 Ohm)
 * 21 cables/jumpers
 **/

#include "Streaming.h"

const int
  pinOne[] = {12, 11, 10, 9},
  pinFive[] = {8},
  pinTen[] = {7, 6},
  pinTirty[] = {5, 4, 3},
  delayer = 1000;

int
  seconds = 0,
  maxSecs = 119;

long
  now,
  last;

void setup()
{
  Serial.begin(9600);
  
  for(int i = 0; i < (sizeof(pinOne)/sizeof(int)); i++)
  {
    pinMode(pinOne[i], OUTPUT);
    digitalWrite(pinOne[i], LOW);
  }
  for(int i = 0; i < (sizeof(pinFive)/sizeof(int)); i++)
  {
    pinMode(pinFive[i], OUTPUT);
    digitalWrite(pinFive[i], LOW);
  }
  for(int i = 0; i < (sizeof(pinTen)/sizeof(int)); i++)
  {
    pinMode(pinTen[i], OUTPUT);
    digitalWrite(pinTen[i], LOW);
  }
  for(int i = 0; i < (sizeof(pinTirty)/sizeof(int)); i++)
  {
    pinMode(pinTirty[i], OUTPUT);
    digitalWrite(pinTirty[i], LOW);
  }
  
  pinMode(2, INPUT);
  
  now = millis();
  last = now;
}

void loop()
{
  // check seconds
  now = millis();
  if(seconds < maxSecs)
  {
    if((last + delayer) <= now)
    {
      seconds++;
      last += delayer;
      Serial << "Secs: " << seconds << " || 5? " << ceil(seconds / 5) << "\n";
    }
    // check leds
    // 1 sec leds
    for(int i = 0; i < (sizeof(pinOne)/sizeof(int)); i++)
    {
      if(i < seconds % 5)
      {
        digitalWrite(pinOne[i], HIGH);
      }
      else
      {
        digitalWrite(pinOne[i], LOW);
      }
    }
    // 5 sec leds
    for(int i = 0; i < (sizeof(pinFive)/sizeof(int)); i++)
    {
      if(i < ceil((seconds % 10) / 5))
      {
        digitalWrite(pinFive[i], HIGH);
      }
      else
      {
        digitalWrite(pinFive[i], LOW);
      }
    }
    // 10 sec leds
    for(int i = 0; i < (sizeof(pinTen)/sizeof(int)); i++)
    {
      if(i < ceil((seconds % 30) / 10))
      {
        digitalWrite(pinTen[i], HIGH);
      }
      else
      {
        digitalWrite(pinTen[i], LOW);
      }
    }
    // 30 sec leds
    for(int i = 0; i < (sizeof(pinTirty)/sizeof(int)); i++)
    {
      if(i < ceil(seconds / 30))
      {
        digitalWrite(pinTirty[i], HIGH);
      }
      else
      {
        digitalWrite(pinTirty[i], LOW);
      }
    }
  }
  else
  {
    // any kind of alert pins 13 and 2 still unused.
  }
}
