#include <EngduinoAccelerometer.h> 
#include <Wire.h>
#include <EngduinoLEDs.h> 
#include <EngduinoSD.h>
#include <EngduinoLEDs.h>
#include <EngduinoButton.h>

int counter = 0;
float x0, y0, z0, a0, a, ap, x, y, z;
unsigned long time = 0;

int sign(float x)
{
  	if(x >= 0) return 1;
  	if(x < 0) return -1;
}


void initialize_sd() //modified version of Engduino SD card reader example code
{
	if(!EngduinoSD.begin("logger.txt", FILE_WRITE))  
	{
		EngduinoLEDs.setAll(RED);
		Serial.println("SD Card failed, or not present!");
		while(1){;};
	}
	Serial.println("SD Card initialized.");
	
	EngduinoSD.writeln("time \t count");
}

void save_to_file(int a, unsigned long t) //modified version of Engduino SD card reader example code
{
	String sv = String(t) + "\t" + String(a);
	if(EngduinoSD.writeln(sv))
	{
		Serial.println("Write done!");
		EngduinoLEDs.setLED(0,GREEN);
	}
	else
	{
		Serial.println("Write error!");
		EngduinoLEDs.setLED(0, RED);
	}
}

void initialize_acc()
{
	float acc[3]; 
	EngduinoAccelerometer.xyz(acc); 
	
	x0 = acc[0]; 
	y0 = acc[1]; 
	z0 = acc[2]; 
        a0 = x0*x0 + y0*y0 + z0*z0;
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
        if(abs(x) > 2 || abs(y) > 2 || abs(z) > 2) return 0; //Accelerometer often shows strange values - that _if_ statement reduces noise
	
	//Checking acceleration value in the vertical direction - solution of equation 
	//sqrt((ap)^2 + (aq)^2 + (ar)^2) + sqrt((x-ap)^2 + (y-aq)^2 + (z-ar)^2) = sqrt(x^2 + y^2 +z^2) for a
	//where p=x0,q=y0,r=z0 are initial values of acceleration in x,y,z axis 

	return x*x0 + y*y0 + z*z0; 
}

void getCurrentAcc()
{
        float acc[3]; 
        EngduinoAccelerometer.xyz(acc); 
        
        x = acc[0]; 
        y = acc[1]; 
        z = acc[2]; 
}

void loop() 
{ 
	time = millis() * 1000.0; 
	
	EngduinoLEDs.setAll(OFF);
        getCurrentAcc();
	
        ap = a;
	a = f(x,y,z);  
	
	if(sign(a-1) != sign(ap-1)) //checks if vector of vertical acceleration changed it's direction 
        {
                counter++;
		save_to_file(counter, time);
	}
	
	showMe(counter, 45);
	
	delay(50);
} 
