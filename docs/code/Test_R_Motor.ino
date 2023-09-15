#include "HX711.h"

// Motor A connections
int enA = 2;
int in1 = 4;
int in2 = 3;
//float max = -30000;
float Sensibilidad=0.285;

// HX711 Amplificador
const int LOADCELL_DOUT_PIN = 1;
const int LOADCELL_SCK_PIN = 5;
HX711 scale;
//Variables
double c,p,j;
void setup() {
  // put your setup code here, to run once:
Serial.begin(115200);  
  Serial.setTimeout(0);
  scale.begin(LOADCELL_DOUT_PIN, LOADCELL_SCK_PIN);
  scale.set_scale(417.6153340635268);
  scale.tare();
  
  pinMode(enA, OUTPUT);
  pinMode(in1, OUTPUT);
  pinMode(in2, OUTPUT);

}
 float get_corriente(int n_muestras)
{
  float voltajeSensor;
  float corriente=0;
  for(int i=0;i<n_muestras;i++)
  {
    voltajeSensor = analogRead(A0) * (5.00 / 1023.00);////lectura del sensor
    corriente=corriente+(voltajeSensor - 3.8331)/Sensibilidad; //Ecuación  para obtener la corriente
  }
  corriente=corriente/n_muestras;
  return(corriente);
}


void speedControl(int velocidad) {
  
  digitalWrite(in1, LOW);
  digitalWrite(in2, HIGH);
  analogWrite(enA, velocidad);
  delay(3500);
  c=get_corriente(20);
  delay(600);
  p=scale.get_units(30);
  analogWrite(enA,0);
  //j=get_voltage(10000);
}

float get_voltage(int n_muestras)
{
  float voltage=0;
  
  for(int i=0;i<n_muestras;i++)
  {
    voltage =voltage+analogRead(A0) * (5.0 / 1023.0);    
  }
  voltage=voltage/n_muestras;
  return(voltage);
}

void loop() {
  
  double x1;
   
 if (Serial.available() > 0)
   {
      float data = Serial.parseFloat();
      if (data>0){
      x1= int(data);
      speedControl(x1);
      if(p>0.0){
      Serial.println(p,4); 
      Serial.println(c,4);
     // Serial.println(j,4);
      }
      else {
      Serial.println(0,4); 
      Serial.println(c,4);
        }
      }
   }
  }
