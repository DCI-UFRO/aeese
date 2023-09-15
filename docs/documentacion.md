# Code in the Arduino

## Sensors

### Thrust Sensor

To implement the strain gauge, an external library is required. This library can be found in the [Arduino library](https://www.arduino.cc/reference/en/libraries/hx711-arduino-library/). The following code provides the necessary instructions in the Arduino language specifically for this sensor.

```arduino

#include "HX711.h"

// HX711 Amplificador
const int LOADCELL_DOUT_PIN = 1;
const int LOADCELL_SCK_PIN = 5;
HX711 scale;

double p;


//...
void setup() {
    Serial.begin(115200);  
    //...
    scale.begin(LOADCELL_DOUT_PIN, LOADCELL_SCK_PIN);
    scale.set_scale(417.6153340635268);
    scale.tare();
  
    pinMode(enA, OUTPUT);
    pinMode(in1, OUTPUT);
    pinMode(in2, OUTPUT);
    //...
}



void loop() {
  
    p=scale.get_units(30);
    //...
    Serial.println(p,4); 
    //...       
}


```


### Current Sensor

The subsequent code displays the essential instructions in the Arduino language specifically for this sensor.

```arduino
float sensibility=0.285;

void setup() {
  // put your setup code here, to run once:
    Serial.begin(115200);  
    /...
      
    pinMode(enA, OUTPUT);
    pinMode(in1, OUTPUT);
    pinMode(in2, OUTPUT);

}

float get_corriente(int n_muestras){
    float voltajeSensor;
    float corriente=0;
    for(int i=0;i<n_muestras;i++){
        voltajeSensor = analogRead(A0) * (5.00 / 1023.00);////Sensor Reading
        corriente=corriente+(voltajeSensor - 3.8331)/Sensibilidad; //get the current
    }
    corriente=corriente/n_muestras;
    return(corriente);
}


void loop() {
  

    c=get_corriente(20);
    //...
    Serial.println(c,4); 
    //...       
}

```

## Actuator

### Motor Driver
The following code provides the requisite instructions in the Arduino language specifically for the motor driver.



```arduino

int enA = 2;
int in1 = 4;
int in2 = 3;

void setup() {
    Serial.begin(115200);  
    //...
  
    pinMode(enA, OUTPUT);
    pinMode(in1, OUTPUT);
    pinMode(in2, OUTPUT);

}

void speedControl(int velocidad) {
  
  digitalWrite(in1, LOW);
  digitalWrite(in2, HIGH);
  analogWrite(enA, velocidad);
  delay(3500);
  //...
  analogWrite(enA,0);
  
}


void loop() {
  
//...
    double x1;
    if (Serial.available() > 0){
        float data = Serial.parseFloat();
        if (data>0){
            x1= int(data);
            speedControl(x1);
        }
        //...
   }
   /...
  }


```


## Complete Arduino Code

The comprehensive code integrates the sensors, actuator, and facilitates serial communication. You can download it [here](./code/Test_R_Motor.ino)