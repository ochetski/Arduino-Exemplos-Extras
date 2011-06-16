
boolean
  switchOutputAllow = true;

int
  switchAction = LOW,
  valueButtonSwitch = LOW,
  valueButtonTurn = 0;

const int
  turnPin = A0,         // 
  switchPin = 2,        // button
  motor1Pin1 = 3,       // motor 1 direction 1
  motor1Pin2 = 4,       // motor 1 direction 2
  motor1Enga = 6,       // motor 1 on/off
  motor2Pin1 = 9,       // motor 2 direction 1
  motor2Pin2 = 10,      // motor 2 direction 2
  motor2Enga = 12,      // motor 2 on/off
  switchOutputLed = 13; // motor on/off led

void setup() {
  Serial.begin(9600);
  pinMode(turnPin, INPUT);
  pinMode(switchPin, INPUT);
  pinMode(motor1Pin1, OUTPUT);
  pinMode(motor1Pin2, OUTPUT);
  pinMode(motor1Enga, OUTPUT);
  pinMode(motor2Pin1, OUTPUT);
  pinMode(motor2Pin2, OUTPUT);
  pinMode(motor2Enga, OUTPUT);
  pinMode(switchOutputLed, OUTPUT);

  // rodar motor 1 em sentido horario
  digitalWrite(motor1Pin1, LOW);
  digitalWrite(motor1Pin2, HIGH);
  digitalWrite(motor1Enga, LOW);

  // rodar motor 2 em sentido anti-horario
  digitalWrite(motor2Pin1, HIGH);
  digitalWrite(motor2Pin2, LOW);
  digitalWrite(motor2Enga, LOW);

  // led smd desligado
  digitalWrite(switchOutputLed, LOW);
}

void loop() {
  // read what is needed
  valueButtonSwitch = digitalRead(switchPin);
  valueButtonTurn = map(analogRead(turnPin), 0, 1023, 0, 255);
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
  // set values from switch
  digitalWrite(motor1Enga, switchAction);
  digitalWrite(motor2Enga, switchAction);
  digitalWrite(switchOutputLed, switchAction);
  ///////////////////////////////////////
  // check position of turn button to set motor rotation
  if(valueButtonTurn > 170)
  {
    digitalWrite(motor1Pin1, LOW);
    digitalWrite(motor1Pin2, HIGH);
    digitalWrite(motor2Pin1, LOW);
    digitalWrite(motor2Pin2, HIGH);
  }
  else if(valueButtonTurn < 85)
  {
    digitalWrite(motor1Pin1, HIGH);
    digitalWrite(motor1Pin2, LOW);
    digitalWrite(motor2Pin1, HIGH);
    digitalWrite(motor2Pin2, LOW);
  }
  else
  {
    //digitalWrite(motor1Enga, LOW);
    //digitalWrite(motor2Enga, LOW);
    
    digitalWrite(motor1Pin1, LOW);
    digitalWrite(motor1Pin2, HIGH);
    digitalWrite(motor2Pin1, HIGH);
    digitalWrite(motor2Pin2, LOW);
  }
  ///////////////////////////////////////
  // set output
  Serial.print("Status: ");
  Serial.print((switchAction == 1 ? "ON " : "OFF"));
  Serial.print(" | Turn: ");
  Serial.print(valueButtonTurn);
  Serial.print("\n");
}
