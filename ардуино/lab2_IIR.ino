double aIIR[6]={-0.0140, 0.0382, -0.0307, -0.0106, 0.0277, -0.0117};
double bIIR[6]={0, 4.4667, -8.1240, 7.5078, -3.5219, 0.6704};
int LastSignal[6] = {0, 0, 0, 0, 0, 0};
double LastY[6]= {0, 0, 0, 0, 0, 0};
double s;
unsigned long t1;
unsigned long t2;
int Fs=0;
int i=0;
int j=0;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
  //Serial.println(999);
  IIR_First_N(aIIR, bIIR, LastY, LastSignal);
  t2=millis();
  t1=t2;
}


void loop() {
  // put your main code here, to run repeatedly:
  while(millis()-t2<10000){
    for(i=0; i<5;i++){
      LastSignal[i]=LastSignal[i+1];
    }
    while(millis()-t1<1){

    }
    LastSignal[5]=analogRead(A0);
    t1=millis();
    s=0;
    for(j=0;j<6;j++){
      s+=aIIR[j]*LastSignal[5-j];
      if(j>0){
        s+=bIIR[j]*LastY[5-j+1];
      }     
    }
    Serial.println(s);
    //Fs++;
    for(i=0; i<5;i++){
      LastY[i]=LastY[i+1];
    }
    LastY[5]=s;
  }
  //Serial.println(Fs);
}

void IIR_First_N(double aIIR[], double bIIR[], double LastY[], int LastSignal[]){
  unsigned long t=millis();
  for(i=0; i<6; i++){
    while(millis()-t<1){

    }
    LastSignal[i]=analogRead(A0);
    t=millis();
    s=0;
    for(j=0;j<=i;j++){
      s+=aIIR[j]*LastSignal[i-j];
      if(j>0){
        s+=bIIR[j]*LastY[i-j];
      }     
    }
    Serial.println(s);
    LastY[i]=s;
  }
}


