double aFIR[26]={-0.0057, -0.0286, -0.0313, -0.0200, -0.0176, -0.0051, 0.0125, 0.0356, 0.0617, 0.0880, 0.1114, 0.1290, 0.1384, 0.1384, 0.1290, 0.1114, 0.0880, 0.0617, 0.0356, 0.0125, -0.0051, -0.0176, -0.0200, -0.0313, -0.0286, -0.0057};

int LastSignal[26] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
double s;
unsigned long t1;
unsigned long t2;
int Fs=0;
int i=0;
int j=0;


void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
  FIR_First_N(aFIR, LastSignal);
  t2=millis();
  t1=t2;
}


void loop() {
  // put your main code here, to run repeatedly:
  while(millis()-t2<10000){
    for(i=0; i<25;i++){
      LastSignal[i]=LastSignal[i+1];
    }
    while(millis()-t1<1){

    }
    LastSignal[25]=analogRead(A0);
    t1=millis();
    s=0;
    for(j=0;j<26;j++){
      s+=aFIR[j]*LastSignal[25-j];   
    }
    Serial.println(s);
    //Fs++;
  }
  //Serial.println(Fs);
}

void FIR_First_N(double aFIR[], int LastSignal[]){
  unsigned long t=millis();
  for(i=0; i<26; i++){
    while(millis()-t<1){

    }
    LastSignal[i]=analogRead(A0);
    t=millis();
    s=0;
    for(j=0;j<=i;j++){
      s+=aFIR[j]*LastSignal[i-j];   
    }
    Serial.println(s);
  }
}


