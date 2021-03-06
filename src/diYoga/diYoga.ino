/*
[{"id":"4f7a7d17.b08584","type":"bean","name":"Bean","uuid":"","connectiontype":"constant","connectiontimeout":"0"},{"id":"834c1bf7.2d02c8","type":"bean serial","name":"","bean":"4f7a7d17.b08584","newline":"\\n","bin":"false","out":"char","addchar":true,"x":282,"y":359,"z":"211a65a2.143ae2","wires":[["cb59342c.7358d"]]}]
*/
int batteryLevel = 0;
int batteryVoltage = 0;
int temperature = 0;
int analogPin0 = 0;
int analogPinValue0 = 0;
int analogPin1 = 1;
int analogPinValue1 = 0;

void setup(){
  Serial.begin();
}

void loop(){
  batteryLevel = Bean.getBatteryLevel();
  batteryVoltage = Bean.getBatteryVoltage();
  temperature = Bean.getTemperature();
  analogPinValue0 = analogRead(analogPin0);
  analogPinValue1 = analogRead(analogPin1);
  Serial.print(batteryLevel);
  Serial.print(",");
  Serial.print(batteryVoltage);
  Serial.print(",");
  Serial.print(temperature);
  Serial.print(",");
  Serial.print(analogPinValue0);
  Serial.print(",");
  Serial.print(analogPinValue1);
  Serial.print("\n");
  Bean.sleep(10000);
}

