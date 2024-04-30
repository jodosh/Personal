/*********
  Rui Santos
  Complete project details at https://RandomNerdTutorials.com/esp32-esp8266-input-data-html-form/
  
  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files.
  
  The above copyright notice and this permission notice shall be included in all
  copies or substantial portions of the Software.
*********/

#include <Arduino.h>
#ifdef ESP32
  #include <WiFi.h>
  #include <AsyncTCP.h>
  #include <SPIFFS.h>
#else
  #include <ESPAsyncTCP.h>
  #include <Hash.h>
  #include <FS.h>
#endif
#include <ESPAsyncWebServer.h>
#include <sstream>
#include <FastLED.h>
#define LED_PIN 13
#define NUM_LEDS 150
#define LED_PIN_LEFT 13
#define NUM_LEDS_LEFT 50

CRGB leds[NUM_LEDS];
CRGB leds_left[NUM_LEDS_LEFT];

AsyncWebServer server(80);

// REPLACE WITH YOUR NETWORK CREDENTIALS
const char* ssid = "$ENTERSSID";
const char* password = "$ENTERPASSWORD";

const char* PARAM_STRING = "inputString";
const char* PARAM_ON = "inputOn";
const char* PARAM_INT = "inputInt";
const char* PARAM_FLOAT = "inputFloat";

int r, g, b;

// HTML web page to handle 3 input fields (inputString, inputInt, inputFloat)
const char index_html[] PROGMEM = R"rawliteral(
<!DOCTYPE HTML><html><head>
  <title>ESP Input Form</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script>
    function submitMessage() {
      alert("Saved value to ESP SPIFFS");
      setTimeout(function(){ document.location.reload(false); }, 500);   
    }
  </script></head><body>
  <form action="/get" target="hidden-form">
    inputString (current value %inputString%): <input type="color" name="inputString" value="%inputString%">
    <input type="submit" value="Submit" onclick="submitMessage()">
  </form><br>
  <form action="/get" target="hidden-form">
  <input type="hidden" name="inputOn" value="ON">
  <button type="submit" onclick="submitMessage()">Turn LED On</button>
  </form>
  <form action="/get" target="hidden-form">
  <input type="hidden" name="inputOn" value="OFF">
  <button type="submit" onclick="submitMessage()">Turn LED Off</button>
  </form>
  <iframe style="display:none" name="hidden-form"></iframe>
</body></html>)rawliteral";

void notFound(AsyncWebServerRequest *request) {
  request->send(404, "text/plain", "Not found");
}

String readFile(fs::FS &fs, const char * path){
  Serial.printf("Reading file: %s\r\n", path);
  File file = fs.open(path, "r");
  if(!file || file.isDirectory()){
    Serial.println("- empty file or failed to open file");
    return String();
  }
  Serial.println("- read from file:");
  String fileContent;
  while(file.available()){
    fileContent+=String((char)file.read());
  }
  file.close();
  Serial.println(fileContent);
  return fileContent;
}

void writeFile(fs::FS &fs, const char * path, const char * message){
  Serial.printf("Writing file: %s\r\n", path);
  File file = fs.open(path, "w");
  if(!file){
    Serial.println("- failed to open file for writing");
    return;
  }
  if(file.print(message)){
    Serial.println("- file written");
  } else {
    Serial.println("- write failed");
  }
  file.close();
}

// Replaces placeholder with stored values
String processor(const String& var){
  //Serial.println(var);
  if(var == "inputString"){
    return readFile(SPIFFS, "/inputString.txt");
  }
  else if(var == "inputInt"){
    return readFile(SPIFFS, "/inputInt.txt");
  }
  else if(var == "inputFloat"){
    return readFile(SPIFFS, "/inputFloat.txt");
  }
  else if(var == "inputOn"){
    return readFile(SPIFFS, "/inputOn.txt");
  }
  return String();
}

void setup() {
  Serial.begin(115200);
  // Initialize SPIFFS
  #ifdef ESP32
    if(!SPIFFS.begin(true)){
      Serial.println("An Error has occurred while mounting SPIFFS");
      return;
    }
  #else
    if(!SPIFFS.begin()){
      Serial.println("An Error has occurred while mounting SPIFFS");
      return;
    }
  #endif

  WiFi.mode(WIFI_STA);
  WiFi.begin(ssid, password);
  if (WiFi.waitForConnectResult() != WL_CONNECTED) {
    Serial.println("WiFi Failed!");
    return;
  }
  Serial.println();
  Serial.print("IP Address: ");
  Serial.println(WiFi.localIP());

  // Send web page with input fields to client
  server.on("/", HTTP_GET, [](AsyncWebServerRequest *request){
    request->send_P(200, "text/html", index_html, processor);
  });

  // Send a GET request to <ESP_IP>/get?inputString=<inputMessage>
  server.on("/get", HTTP_GET, [] (AsyncWebServerRequest *request) {
    String inputMessage;
    std::string input_std;
    // GET inputString value on <ESP_IP>/get?inputString=<inputMessage>
    if (request->hasParam(PARAM_STRING)) {
      inputMessage = request->getParam(PARAM_STRING)->value();
      writeFile(SPIFFS, "/inputString.txt", inputMessage.c_str());
      input_std = inputMessage.c_str();
      std::string hexCode = input_std.erase(0,1);
      std::istringstream(hexCode.substr(0,2)) >> std::hex >> r;
      std::istringstream(hexCode.substr(2,2)) >> std::hex >> g;
      std::istringstream(hexCode.substr(4,2)) >> std::hex >> b;
      writeFile(SPIFFS, "/r.txt", std::to_string(r).c_str());
      writeFile(SPIFFS, "/g.txt", std::to_string(g).c_str());
      writeFile(SPIFFS, "/b.txt", std::to_string(b).c_str());
    }
    // GET inputInt value on <ESP_IP>/get?inputInt=<inputMessage>
    else if (request->hasParam(PARAM_INT)) {
      inputMessage = request->getParam(PARAM_INT)->value();
      writeFile(SPIFFS, "/inputInt.txt", inputMessage.c_str());
    }
    // GET inputFloat value on <ESP_IP>/get?inputFloat=<inputMessage>
    else if (request->hasParam(PARAM_FLOAT)) {
      inputMessage = request->getParam(PARAM_FLOAT)->value();
      writeFile(SPIFFS, "/inputFloat.txt", inputMessage.c_str());
    }
    else if (request->hasParam(PARAM_ON)) {
      inputMessage = request->getParam(PARAM_ON)->value();
      writeFile(SPIFFS, "/inputOn.txt", inputMessage.c_str());
    }
    else {
      inputMessage = "No message sent";
    }
    Serial.println(inputMessage);
    request->send(200, "text/text", inputMessage);
  });
  server.onNotFound(notFound);
  server.begin();

  FastLED.addLeds<WS2812B, LED_PIN, GRB>(leds, NUM_LEDS).setCorrection(TypicalLEDStrip);
  FastLED.addLeds<WS2812B, LED_PIN_LEFT, GRB>(leds_left, NUM_LEDS_LEFT).setCorrection(TypicalLEDStrip);
  FastLED.clear();

  pinMode(2, OUTPUT);
}

void loop() {
  // To access your stored values on inputString, inputInt, inputFloat
  String isOn = readFile(SPIFFS, "/inputOn.txt");
  if (isOn == "ON")
  {
    String yourInputString = readFile(SPIFFS, "/inputString.txt");
    r = atoi(readFile(SPIFFS, "/r.txt").c_str());
    g = atoi(readFile(SPIFFS, "/g.txt").c_str());
    b = atoi(readFile(SPIFFS, "/b.txt").c_str());
    Serial.print("*** Your inputString: ");
    Serial.println(yourInputString);
    if (yourInputString!="")
    {
      digitalWrite(2, HIGH);
      for(int i=0; i <= NUM_LEDS; i++)
      {
        leds[i].setRGB(r,g,b);
        if (i<NUM_LEDS_LEFT)
        {
          leds_left[i].setRGB(r,g,b);
        }
      }
      FastLED.show();
    }
  }
  else
  {
    digitalWrite(2, LOW);
    FastLED.clear();
    FastLED.show();
  }
  delay(5000);
}