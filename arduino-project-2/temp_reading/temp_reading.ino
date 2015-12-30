#include <EngduinoSD.h>
#include <EngduinoButton.h>

// Read content in file from SD Card
//
// In this sketch, content of the file stored on SD Card 
// is read and send to the serial terminal.
//

int s = 0;
String x;

void setup()
{
  EngduinoButton.begin();
  // Press button to start.
  EngduinoButton.waitUntilPressed();
  Serial.begin(9600);

  // See if the card is present and can be initialized:
  if(!EngduinoSD.begin())  
  {
    Serial.println("SD Card failed, or not present!");
    Serial.println("Sketch will terminates here...");
    while(1){;}; // Do not do anything more
  }
  Serial.println("SD Card initialized.");
}

void loop() 
{  
  // Open the file for reading:
  EngduinoSD.open("logger.txt", FILE_READ);
  
  // Read from the file until there's nothing else in it:
  while(EngduinoSD.available()) 
  {
    s = EngduinoSD.read();
    //s += "aaa";
    s += 1;
    Serial.write(s);
    delay(1);
  }
  
  // Close the file:
  EngduinoSD.close();
  EngduinoButton.waitUntilPressed();
  
  if(!EngduinoSD.begin("logger.txt", FILE_WRITE))  
  {
    Serial.println("SD Card failed, or not present!");
    Serial.println("Sketch will terminates here...");
    while(1){;}; // don't do anything more
  }
  
  String dataString = "aaa"; 
  
  if(EngduinoSD.writeln(dataString))
  {
    Serial.println("Write done!");
    //EngduinoLEDs.setAll(GREEN);
    }
  else
  {
    Serial.println("Write error!");
    //EngduinoLEDs.setAll(RED);
  }
  
  EngduinoSD.close();
  // Press button to read the file again.
  EngduinoButton.waitUntilPressed();
  
  // Add empty line.
  Serial.println("\n"); 
}
