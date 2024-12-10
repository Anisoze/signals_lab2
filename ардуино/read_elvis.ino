void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
}

int s;
unsigned long t=0;
void loop() {
  // put your main code here, to run repeatedly:
  while(millis()<10000){
    s=analogRead(A0);
    Serial.println(s);
  }
  
}
