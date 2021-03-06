#include <EngduinoAccelerometer.h> 
#include <Wire.h>
#include <EngduinoLEDs.h> 
#include <EngduinoSD.h>
#include <EngduinoLEDs.h>
#include <EngduinoButton.h>

int counter = 0;
float x0, y0, z0, a0, a, ap, x, y, z;
float eps = 0.08;

int sign(float x)
{
  if(x >= 0) return 1;
  if(x < 0) return -1;
}


void initialize_sd()
{
	if(!EngduinoSD.begin("logger.txt", FILE_WRITE))  
	{
		EngduinoLEDs.setAll(RED);
		Serial.println("SD Card failed, or not present!");
		while(1){;};
	}
	Serial.println("SD Card initialized.");
	
	EngduinoSD.writeln("count");
}

void save_to_file(int a)
{
	String sv = String(a);
	if(EngduinoSD.writeln(sv))
	{
		Serial.println("Write done!");
		EngduinoLEDs.setLED(counter,GREEN);
	}
	else
	{
		Serial.println("Write error!");
		EngduinoLEDs.setLED(counter, RED);
	}
}

void initialize_acc()
{
	float accelerations[3]; 
	EngduinoAccelerometer.xyz(accelerations); 
	
	x0 = accelerations[0]; 
	y0 = accelerations[1]; 
	z0 = accelerations[2]; 
        a0 = x0*x0 + y0*y0 + z0*z0;
        Serial.print("A0 = ");
        Serial.println(a0);
}

void setup()
{
	EngduinoAccelerometer.begin(); 
	EngduinoLEDs.begin();
	EngduinoButton.begin();
	Serial.begin(9600);
	
	EngduinoButton.waitUntilPressed();
	
	initialize_sd();
	initialize_acc();
}

void showMe(float value, float maxx)
{
	for(int i=1; i<value/maxx*15; i++)
                 if(i <= 15)
 			EngduinoLEDs.setLED(i, YELLOW, 2);
}

float f(float x, float y, float z)
{
        if(abs(x) > 2 || abs(y) > 2 || abs(z) > 2) return 0;
	return x*x0 + y*y0 + z*z0;
        //return (x-x0)*(x-x0) + (y-y0)*(y-y0) + (z-z0)*(z-z0);
}

void getCurrentAcc()
{
        float accelerations[3]; 
        EngduinoAccelerometer.xyz(accelerations); 
        
        x = accelerations[0]; 
        y = accelerations[1]; 
        z = accelerations[2]; 
}

void loop() 
{ 
	//EngduinoLEDs.setAll(OFF);
        getCurrentAcc();
	
        ap = a;
	a = f(x,y,z);  
	Serial.println(a);
	
	if(sign(a-a0) != sign(ap-a0) && abs(a-ap) > eps)
        {
                counter++;
		save_to_file(counter);
	}
	
	//showMe(counter, 45);
	
	delay(50);
} 
