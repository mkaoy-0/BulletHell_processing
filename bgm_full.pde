import ddf.minim.*;
Minim minim;
AudioPlayer bgm, bgm2, bgm3;
PFont font, font2;
void setup()
{
  size(1000, 800);
  minim=new Minim(this);
  bgm=minim.loadFile("kagurauta.mp3");
  bgm2=minim.loadFile("kazekiri.mp3");
  bgm3=minim.loadFile("Starting_Point.mp3");
  font=loadFont("MongolianBaiti-48.vlw");
  font2=createFont("MS Mincho",30); 
  smooth();
  for(int i=0; i<62; i++){ Kakudo[i]=0; Kyori[i]=0; begin[i]=i*(28);}
  for(int i=0; i<8; i++){ Yukiss_x[i]=random(100,900); Yukiss_y[i]=random(980,990);
    Yukiss_Hankei[i]=random(20,60); Yukiss_speed[i]=random(6,8);
  }
  for(int i=0; i<15; i++){
    fadeXL[i]=(int)random(30,100); fadeXR[i]=(int)random(900,970); fadeY[i]=(int)random(20,790);
    fadeXsp[i]=random(5,8); fadeYsp[i]=random(-2,2); fadeXf[i]=(int)random(550,900);
    status[i]=0; stF[i]=255;
  }
  for(int i=0; i<820; i++){ Kakudo_Uzumaki[i]=0; Kyori_Uzumaki[i]=0; begin_Uzumaki[i]=i*1;}
  for(int i=0; i<5; i++){tamax[i]=(int)random(1000); tamay[i]=(int)random(800,850); tamasp[i]=(int)random(3,7);}
  for(int i=0; i<40; i++){
    Yuki_x[i]=random(900); Yuki_y[i]=random(-300,-70);
    Yuki_Hankei[i]=random(8,65); Yuki_speed[i]=random(2,6);
  }
  for(int i=0; i<6; i++){
    yukifX[i]=(int)random(30,1000-30); yukifY[i]=(int)random(-150,-60); yukifr[i]=(int)random(30,70);
    yukifsp[i]=random(2,9); yukifend[i]=(int)random(300,800); yukiF[i]=255;
  }
  for(int i=0; i<100; i++){ Bangle[i]=0; Bkyori[i]=0; Bbegin[i]=i*8.0; BHoui[i]=(int)random(72); }
  for(int i=0; i<50; i++){ Fleft[i]=(int)random(30,80); Fright[i]=(int)random(920,970);
     Fsidey[i]=(int)random(20,790); Fsider[i]=(int)random(30,60); Fsidestatus[i]=0; Fsidef[i]=255;
  }
  for(int i=0; i<500; i++){ Uzukaku[i]=0; Uzukyori[i]=0; Uzubeg[i]=i*0.1; } 
}
int kyoku=0;
int bpm=0, bpm2=0, bpm3=0;
int ms;
int base_time=0;
int bgm_start=0;
int hit=0, T=0, tika=61, zanki=5;
float myx=500, myy=500;
int mx=-20, my=-20, myKaitenn=0, zankiKaitenn=0;
int wakux0=500, wakuy0=200, wakux=150, wakuy=250, wakux1=375, wakuy1=45, wakux2=150, wakuy2=5;
int wakuhaba=0, wakutakasa=400;
int wakutx=500, wakuty=400, wakuangle=0, wakuangle2=0, wakuangle3=0;
int Firer, Firer1, Firer2, Firer3;
int Firer_2, Firer1_2, Firer2_2, Firer3_2;
int Waysp;
float[] Kakudo=new float[62]; //100は弾の総数 (Circle)
float[] Kyori=new float[62];
float[] begin=new float[62];  //発射状態に入るまで
int Yumi1_sp=0, Yumi1_houi=1;
int Rensax=0, Rensay=0, Rensax1=1000, Rensay1=800;
int Rensar, Rensar1, Rensar2;
float[] Yukiss_x=new float[8];
float[] Yukiss_y=new float[8];
float[] Yukiss_Hankei=new float[8];
float[] Yukiss_speed=new float[8];
float ougir=0, ougir_1=0, ougir_2=0, ougir_3=0;
float ougir1=280, ougir1_1=280, ougir1_2=280, ougir1_3=280;
int[] fadeXL=new int[15];
int[] fadeXR=new int[15];
int[] fadeY=new int[15];
float fadeXsp[]=new float[15];
float fadeYsp[]=new float[15];
int fadeXf[]=new int[15];
int[] status=new int[15];
int[] stF=new int[15];
int fadet=0;
int tamaty=60, tamaK=0;
float[] Kakudo_Uzumaki=new float[820];
float[] Kyori_Uzumaki=new float[820];
float[] begin_Uzumaki=new float[820];
int ENr=200;
float EBr=0, EBr1=0, EBr2=0, EBr3=0;
float ENkaitenn=0, ENty=1100;
int R2x=-100, R2y=800, R2x1=800, R2y1=850, R2x2=500, R2y2=850;
int R2r=0, R2r1=0, R2r2=0;
int[] tamax=new int[5];
int[] tamay=new int[5];
int[] tamasp=new int[5];
float[] Yuki_x=new float[40];
float[] Yuki_y=new float[40];
float[] Yuki_Hankei=new float[40];
float[] Yuki_speed=new float[40];
int en=0;
int[] yukifX=new int[10];
int[] yukifY=new int[10];
int[] yukifr=new int[10];
float[] yukifsp=new float[10];
int[] yukifend=new int[10];
int[] yukiF=new int[10];
float[] Bangle=new float[150];
float[] Bkyori=new float[150];
float[] Bbegin=new float[150];
int[] BHoui=new int[150];
int r5Lr, r5Lr1, r5Lr2, r5Lr3, r5Lr4, r5Lr5, r5Lr6, r5Rr, r5Rr1, r5Rr2, r5Rr3, r5Rr4, r5Rr5, r5Rr6;
int r5Lx=0, r5Ly=800, r5Rx=1000, r5Ry=800;
int wakutakasa0=0;
int[] Fleft=new int[50];
int[] Fright=new int[50];
int[] Fsidey=new int[50];
int[] Fsider=new int[50];
int[] Fsidestatus=new int[50];
int[] Fsidef=new int[50];
int Fsidet=0, Fs=0;
int yup=0, ydown=0;
float[] Uzukaku=new float[500];
float[] Uzukyori=new float[500];
float[] Uzubeg=new float[500];
void draw()
{ 
  if(kyoku==1){
    frameRate(63);
    if(bgm_start==1){ ms=millis()-base_time; bgm.play(); }
    if(bgm_start==0){ bgm.play(0); bgm.pause(); restart(); }  //bgm,リセット
    //println(ms);
    if (bgm_start==1 && ms>=1000 && frameCount%(63*60/140.0)==0){
      bpm++;
      println(bpm);
      if(bpm==148) { bpm=150;}
      if(ms>75100 && ms<75400) {bpm=174;}
      if(ms>96900 && ms<97100) {bpm=224;}
      if(ms>124500 && ms<124800){bpm=288;}
    }
  }
  if(kyoku==2){
    frameRate(60);
    if(bgm_start==1){ ms=millis()-base_time; bgm2.play(); }
    if(bgm_start==0){ bgm2.play(0); bgm2.pause(); restart(); }  //bgm,リセット
    //println(ms);
    if (bgm_start==1 && ms>=300 && frameCount%(60*60/150.0)==0){
      bpm2++;
      println(bpm2);
    }
  }
  if(kyoku==3){
    frameRate(69);
    if(bgm_start==1){ ms=millis()-base_time; bgm3.play(); }
    if(bgm_start==0){ bgm3.play(0); bgm3.pause(); restart(); }  //bgm,リセット
    //println(ms);
    if (bgm_start==1 && ms>=3000 && frameCount%(69*60/138.0)==0){
      bpm3++;
      println(bpm3);
      if(ms>=19900 && ms<=10200){ bpm3=16; }
      if(ms>=17200 && ms<=17500){ bpm3=33; }
    }
  }

  background(0);
  if(bgm_start==0){ fill(255); //スタート画面↓
    textAlign(CENTER,CENTER);
    textFont(font2); text("十字キーで操作",500,100);
    textFont(font); textSize(35); text("-CLICK TO START-",500,180); 
    pushMatrix(); translate(165,500); rotate(radians(45)); stroke(255,200,200);
    if(mouseX>50 && mouseX<280 && mouseY>300 && mouseY<700){ fill(255,200,200); }else{ noFill(); }
    Me(-50,-50,100); popMatrix();
    pushMatrix(); translate(500,500); rotate(radians(45)); stroke(200,200,255);
    if(mouseX>380 && mouseX<620 && mouseY>300 && mouseY<700){ fill(200,200,255); }else{ noFill(); }
    Me(-50,-50,100); popMatrix();
    pushMatrix(); translate(835,500); rotate(radians(45)); stroke(255,255,200);
    if(mouseX>720 && mouseX<950 && mouseY>300 && mouseY<700){ fill(255,255,200); }else{ noFill(); }
    Me(-50,-50,100); popMatrix();
  } //↑スタート
  noStroke(); //残基表示↓
  if(kyoku==1){ fill(255,200,200); }if(kyoku==2){ fill(200,200,255); }if(kyoku==3){ fill(255,255,200); }
  for(int i=0; i<zanki; i++){
    pushMatrix();
    translate(i*60+50,50); rotate(radians(zankiKaitenn));
    if(bgm_start==1){ rect(-13,-13,26,26); }
    popMatrix();
  }
  zankiKaitenn+=1; //↑残基
  noFill();  //枠↓
  stroke(255);
  if(bgm_start==1 && bpm<126 && kyoku==1) {rect(wakux0, wakuy0, wakuhaba, wakutakasa);}  
  if (bgm_start==1 && bpm<1 && kyoku==1){ //枠①
    wakux0-=25; wakuhaba+=50;
    if (wakux0<100){ wakux0=100; wakuhaba=800; }
  }
  if(bpm>62 && bpm<126){ //枠②
    wakux0+=10; wakuy0+=2; wakuhaba-=20; wakutakasa-=4;
    if(wakux0>350){
      wakux0=350; wakuy0=250; wakuhaba=300; wakutakasa=300;
    }
  }
  if(bpm>=126 && bpm<199){ //枠③
    if(wakuangle<180){
      translate(wakutx,wakuty);
      rotate(wakuangle*PI/180.0);
      rect(-wakuhaba/2,-wakutakasa/2, wakuhaba, wakutakasa);
      wakutx-=10;
      if(wakutx<225){wakutx=225;}
      wakuangle+=10;
    } else{
        rect(wakux,wakuy,wakuhaba,wakutakasa);
        wakux-=6; wakuy-=15; wakuhaba-=3; wakutakasa+=30;
        if(wakuy<50){wakux=70; wakuy=50; wakuhaba=250; wakutakasa=700;}
    }
  }
  if(bpm>=199 && bpm<222){ //枠④
    wakux+=3; wakuy+=9; wakuhaba+=17; wakutakasa-=17;
    if(wakux>150){wakux=150; wakuy=290; wakuhaba=700; wakutakasa=250;}
    rect(wakux,wakuy,wakuhaba,wakutakasa);
  }
  if(bpm>=222 && bpm<285){ //枠⑤
    pushMatrix();
    translate(wakux+wakuhaba/2,wakuy+wakutakasa/2);
    rotate(wakuangle2*PI/180.0);
    if(wakuangle2<270){ wakuangle2+=6; }
    rect(-(wakuhaba/2),-(wakutakasa/2),wakuhaba,wakutakasa);
    if(keyPressed){
      if(keyCode==RIGHT){ myy+=5; }
      if(keyCode==LEFT){myy-=5; }
      if(keyCode==UP){ myx+=5; }
      if(keyCode==DOWN){ myx-=5; }
    }
    pushMatrix();
    translate(myx-(wakux+wakuhaba/2),myy-(wakuy+wakutakasa/2));
    if(myx+40-(wakux+wakuhaba/2)>-(wakuhaba/2)+wakuhaba){ myx=-(wakuhaba/2)+wakuhaba-40+(wakux+wakuhaba/2); }
    if(myx-40-(wakux+wakuhaba/2)<-(wakuhaba/2)){ myx=-(wakuhaba/2)+40+(wakux+wakuhaba/2); }
    if(myy-40-(wakuy+wakutakasa/2)<-(wakutakasa/2)){ myy=-(wakutakasa/2)+40+(wakuy+wakutakasa/2); }
    if(myy+40-(wakuy+wakutakasa/2)>-(wakutakasa/2)+wakutakasa){ myy=-(wakutakasa/2)+wakutakasa-40+(wakuy+wakutakasa/2); }
    rotate(radians(myKaitenn));
    if(tika/10 %2==0 && zanki>=0){ Me(mx,my,40); }
    if(hit>0){ T++;
      if(T<100){ myKaitenn=0; mx+=8; my+=8; }
      else{ hit=0; T=0; mx=-20; my=-20; zanki--; }
    }
    if(T==0){
      if(tika<=60){ tika++; }
    }
    if(T>0){ tika=0; }
    myKaitenn+=3;
    popMatrix();
    popMatrix();
  }
  if(bpm>=285 && bpm<318){ //枠⑥
    rect(wakux1,wakuy1,wakutakasa,wakuhaba);
    wakux1-=10; wakuy1+=14; wakutakasa+=20; wakuhaba-=14;
    if(wakux1<150){ wakux1=150; wakuy1=355; wakutakasa=700; wakuhaba=395; }
  }
  if(bpm>=318 && bpm<350){ //枠⑦
    pushMatrix();
    translate(500,400);
    rotate(wakuangle3*PI/180.0);
    if(wakuangle3<180){ wakuangle3+=4; }
    rect(-(wakutakasa/2),0,wakutakasa,wakuhaba);
    pushMatrix();
    translate(myx-500,myy-400);
    if(myx+40-500>-(wakutakasa/2)+wakutakasa){ myx=-(wakutakasa/2)+wakutakasa-40+500; }
    if(myx-40-500<-(wakutakasa/2)){ myx=-(wakutakasa/2)+40+500; }
    if(myy-40-400<0){ myy=0+40+400; }
    if(myy+40-400>0+wakuhaba){ myy=0+wakuhaba-40+400; }
    rotate(radians(myKaitenn));
    if(tika/10 %2==0 && zanki>=0){ Me(mx,my,40); }
    if(hit>0){ T++;
      if(T<100){ myKaitenn=0; mx+=8; my+=8; }
      else{ hit=0; T=0; mx=-20; my=-20; zanki--; }
    }
    if(T==0){
      if(tika<=60){ tika++; }
    }
    if(T>0){ tika=0; }
    myKaitenn+=3;
    popMatrix();
    popMatrix();
  }
  if(bpm>=350 && bpm<412){  //枠⑧、⑨
    rect(wakux2,wakuy2,wakutakasa,wakuhaba);
    wakux2-=4; wakuy2+=2; wakutakasa+=7; wakuhaba+=11;
    if(wakux2<50){ wakux2=50; wakuy2=50; wakutakasa=900; wakuhaba=700; }
  }
  if(bpm>=412){ 
    rect(wakux2,wakuy2,wakutakasa,wakuhaba);
    wakux2+=15; wakuy2+=10; wakutakasa-=30; wakuhaba-=20; 
    if(wakux2>350){ wakux2=350; wakuy2=250; wakutakasa=300; wakuhaba=300; }
  }
//↓自機  
  if((bgm_start==1 && bpm<222) || bpm>=285){
    if(keyPressed){
      if(keyCode==RIGHT){
        if(bpm>=318 && bpm<350){ myx-=5; }
        else{ myx+=5; }
      }if(keyCode==LEFT){
        if(bpm>=318 && bpm<350){ myx+=5; }
        else{ myx-=5; }
      }if(keyCode==UP){ 
        if(bpm>=318 && bpm<350){ myy+=5; }
        else{ myy-=5; }
      }if(keyCode==DOWN){ 
        if(bpm>=318 && bpm<350){ myy-=5; }
        else{ myy+=5; }
      }
    }
  }
  if((bgm_start==1 && bpm<222) || (bpm>=285 && bpm<318) || bpm>=350){
    pushMatrix();
    if(bpm>=126 && wakuangle<180){
      translate(myx-wakutx,myy-wakuty);
    }else{   
      translate(myx,myy);
    }
    if(bgm_start==1 && kyoku==3){
      if(myx+40>wakux0+wakuhaba){ myx=wakux0+wakuhaba-40; }
      if(myx-40<wakux0){ myx=wakux0+40; }
      if(myy-40<500){ myy=500+40; }
      if(myy+40>500+wakutakasa0){ myy=500+wakutakasa0-40; }
    }
    if(kyoku!=3 && bgm_start==1 && bpm<126){
      if(myx+40>wakux0+wakuhaba){ myx=wakux0+wakuhaba-40; }
      if(myx-40<wakux0){ myx=wakux0+40; }
      if(myy-40<wakuy0){ myy=wakuy0+40; }
      if(myy+40>wakuy0+wakutakasa){ myy=wakuy0+wakutakasa-40; }
    }
    if(bpm>=126 && bpm<=285){
      if(wakuangle<180){
        if(myx+40-wakutx>-(wakuhaba/2)+wakuhaba){ myx=-(wakuhaba/2)+wakuhaba-40+wakutx; }
        if(myx-40-wakutx<-(wakuhaba/2)){ myx=-(wakuhaba/2)+40+wakutx; }
        if(myy-40-wakuty<-(wakutakasa/2)){ myy=-(wakutakasa/2)+40+wakuty; }
        if(myy+40-wakuty>-(wakutakasa/2)+wakutakasa){ myy=-(wakutakasa/2)+wakutakasa-40+wakuty; }
      }else{
        if(myx+40>wakux+wakuhaba){ myx=wakux+wakuhaba-40; }
        if(myx-40<wakux){ myx=wakux+40; }
        if(myy-40<wakuy){ myy=wakuy+40; }
        if(myy+40>wakuy+wakutakasa){ myy=wakuy+wakutakasa-40; }
      }
    }
    if(bpm>=285 && bpm<318){
      if(myx+40>wakux1+wakutakasa){ myx=wakux1+wakutakasa-40; }
      if(myx-40<wakux1){ myx=wakux1+40; }
      if(myy-40<wakuy1){ myy=wakuy1+40; }
      if(myy+40>wakuy1+wakuhaba){ myy=wakuy1+wakuhaba-40; }
    }
    if(bpm>=350){
      if(myx+40>wakux2+wakutakasa){ myx=wakux2+wakutakasa-40; }
      if(myx-40<wakux2){ myx=wakux2+40; }
      if(myy-40<wakuy2){ myy=wakuy2+40; }
      if(myy+40>wakuy2+wakuhaba){ myy=wakuy2+wakuhaba-40; }
    }
    rotate(radians(myKaitenn));
    if(tika/10 %2==0 && zanki>=0){ Me(mx,my,40); }
    if(hit>0){ T++;
      if(T<100){ myKaitenn=0; mx+=8; my+=8; }
      else{ hit=0; T=0; mx=-20; my=-20; zanki--; }
    }
    if(T==0){
      if(tika<=60){ tika++; }
    }
    if(T>0){ tika=0; }
    myKaitenn+=3;
    popMatrix();
  }
  //↑自機
//↓① 
  fill(255);
  stroke(255);
  if (bpm<=64 && kyoku==1) {
    if ((bpm/8)%2!=0){ Firer+=8;
      Fire(-15,-15,15); Fire(width+15,-15,15); Fire(-15,height+15,15); Fire(width+15,height+15,15);
    }else{ Firer+=7;
       Fire(500,-20,15); Fire(500,height+20,15); Fire(-20,400,15); Fire(width+20,400,15);
    } if(bpm>=32){
        Waysp+=15;
        if((bpm/4)%2==0){ Way3(500,-30,0); }
        else{ Way2(500,-30,0); }
    }
    if(bpm%4==0){ Waysp=0; }
    if(bpm%8==0){ Firer=0; }
  }  //↑①  
 //↓②
  if(bpm>64 && bpm<126){ Firer+=5;
    if(Firer>140)  {Firer1+=5;}
    if(Firer1>140) {Firer2+=5;}
    if(Firer2>140) {Firer3+=5;}
    Fire_2(700,-10,30,700,200,100,900,600);
    if(bpm<120){
      if((bpm)%8==0) {Firer=-3;}
      if((bpm-1)%8==0) {Firer1=-3;}
      if((bpm-2)%8==0) {Firer2=-3;}
      if((bpm-3)%8==0) {Firer3=-3;}
    }if(bpm>68){ Firer_2+=5;
        if(Firer_2>140)  {Firer1_2+=5;}
        if(Firer1_2>140) {Firer2_2+=5;}
        if(Firer2_2>140) {Firer3_2+=5;}
        Fire_2_2(400,-10,1000,500,600,700,200,400);
        if(bpm<124){
          if((bpm-4)%8==0) {Firer_2=-3;}
          if((bpm-5)%8==0) {Firer1_2=-3;}
          if((bpm-6)%8==0) {Firer2_2=-3;}
          if((bpm-7)%8==0) {Firer3_2=-3;}
        }
    } 
  }   //↑②
  if(bpm>=128){ //③↓
    Circle(700,400);
    if(bpm>161 && bpm<174){ Waysp+=30;
      if(bpm%4==2){ Way3(700,400,90);}
      else if(bpm%4==0){Way2(700,400,90);}
      if(bpm%2!=0){Waysp=0;}
    } if(bpm>173 && bpm<177){Yumi1(1000,400,90,15,67.5,40);}
  } //③↑
  if(bpm>=200 && bpm<225){ //④↓
    Yukiss();
    if(bpm>=209){ Rensa();}
  } //④↑
  if(bpm>=224 && bpm<288){ //⑤↓
    if(bpm<=254){ fill(255);
      if(ougir1>=1192){ ougir=0; ougir1=280; }
      if(ougir1_1>=1194){ ougir_1=0; ougir1_1=280; }
      if(ougir1_2>=1196){ ougir_2=0; ougir1_2=280; }
      if(ougir1_3>=1198){ ougir_3=0; ougir1_3=280; }
    } Ougi(-50,500,PI/2); Ougi(1050,300,3*PI/2);
    if(bpm>=254){ noStroke();Fade();
      if(bpm%8==6 && bpm<280){
        for(int i=0; i<15; i++){
        fadeXL[i]=(int)random(30,100); fadeXR[i]=(int)random(900,970); fadeY[i]=(int)random(20,790);
        fadeXsp[i]=random(5,8); fadeYsp[i]=random(-2,2); fadeXf[i]=(int)random(550,900);
        status[i]=0; stF[i]=255; fadet=0;
       }
      }
    }   
    if(bpm>=255){ Firer+=5; fill(255);
      if(Firer>140)  {Firer1+=5;}
      if(Firer1>140) {Firer2+=5;}
      if(Firer2>140) {Firer3+=5;}
      Fire_2(700,-10,30,700,200,100,900,600);
      if(bpm<280){
        if((bpm)%8==7) {Firer=-3;}
        if((bpm-1)%8==7) {Firer1=-3;}
        if((bpm-2)%8==7) {Firer2=-3;}
        if((bpm-3)%8==7) {Firer3=-3;}
      }
    }
  } //↑⑤
  if(bpm>=287 && bpm<319){ //↓⑥
    pushMatrix(); translate(500,tamaty); rotate(-radians(tamaK)); tamaK+=3; tamaty+=8;   
    if(tamaty>100){ tamaty=100; }  if(bpm>=317){ tamaty-=9; }
    rect(-40,-40,80,80); popMatrix();
    if(bpm>=288){ Uzumaki(500,100,0); }
    if(bpm>=299){ Firer+=5; fill(255);
      if(Firer>135)  {Firer1+=5;}
      if(Firer1>135) {Firer2+=5;}
      if(Firer2>135) {Firer3+=5;}
      Fire_2(200,-15,500,30,800,30,800,50);
      if(bpm==299) {Firer=-3; Firer1=-3; Firer2=-3;}
    }
  } //⑥↑
  if(bpm>=320 && bpm<360){ //↓⑦
    ellipse(500,ENty,100,100);
    pushMatrix();
    translate(500,ENty); rotate(radians(ENkaitenn));
    ENkaitenn+=0.7; EN();
    if(bpm<348){ ENty-=8; 
      if(ENty<800){ ENty=800; }
    }
    if(bpm>=348){ ENty+=8; }
    popMatrix();    
    ENBeam();
    Rensa_2();
    if(bpm>=330){ Firer+=5; fill(255);
      if(Firer>135)  {Firer1+=5;}
      if(Firer1>135) {Firer2+=5;}
      if(Firer2>135) {Firer3+=5;}
      Fire_2(800,700,150,730,500,650,800,30);
      if(bpm==330) {Firer=-3; Firer1=-3; Firer2=-3;}
    }
  }
  if(bpm>=332 && bpm<360){ TamaUP(); }  //↑⑦
  if(bpm>351){ //↓⑧
    for(int i=0; i<40; i++){ noFill();
      circle(Yuki_x[i],Yuki_y[i],Yuki_Hankei[i]); Yuki_y[i]+=Yuki_speed[i];
      if(tika==61 && dist(myx,myy,Yuki_x[i],Yuki_y[i])<=Yuki_Hankei[i]/2){ hit++; }
      if(Yuki_y[i]>height+100 && bpm<400){
        Yuki_x[i]=random(900); Yuki_y[i]=random(-300,-70);
        Yuki_Hankei[i]=random(8,65); Yuki_speed[i]=random(2,6);
      }
    }
    if(bpm>=380 && bpm<414){
        fill(255); Firer+=9;
        Fire_last(500, -15); Fire_last(500, height+15); Fire_last(-15, 400); Fire_last(width+15, 400);
        if((bpm%8)==7){ Firer=0; }
    }
  } //↑⑧
  if(bpm>=413){ //↓⑨
    fill(255); Firer+=5;
    if(Firer>140)  {Firer1+=5;}
    if(Firer1>140) {Firer2+=5;}
    if(Firer2>140) {Firer3+=5;}
    Fire_2(700,-10,30,700,200,100,900,600);
    if(bpm<432){
      if((bpm)%8==0) {Firer=-3;}
      if((bpm-1)%8==0) {Firer1=-3;}
      if((bpm-2)%8==0) {Firer2=-3;}
      if((bpm-3)%8==0) {Firer3=-3;}
    }
    if(bpm>=413){
      Firer_2+=5;
      if(Firer_2>140)  {Firer1_2+=5;}
      if(Firer1_2>140) {Firer2_2+=5;}
      if(Firer2_2>140) {Firer3_2+=5;}
      Fire_2_2(400,-10,1000,500,600,700,200,400);
      if(bpm<432){
        if((bpm-4)%8==0) {Firer_2=-3;}
        if((bpm-5)%8==0) {Firer1_2=-3;}
        if((bpm-6)%8==0) {Firer2_2=-3;}
        if((bpm-7)%8==0) {Firer3_2=-3;}
      }
    } 
  }
// ２曲目
  noFill(); stroke(255);  //枠↓
  if(bgm_start==1 && kyoku==2){ rect(wakux0,wakuy0,wakuhaba,wakutakasa);
    wakux0-=30; wakuhaba+=60;
    if(wakux0<200){ wakux0=200; wakuhaba=600; }
  }  //↑
  fill(255); stroke(255);  //　↓弾幕
  if(bgm_start==1 && bpm2<40 && kyoku==2){ Firer+=5; 
    if(Firer>140)  {Firer1+=5;}
    if(Firer1>140) {Firer2+=5;}
    if(Firer2>140) {Firer3+=5;}
    Fire_2(200,-10,500,700,900,100,250,550);
    if(bpm2<32){
      if((bpm2)%8==0) {Firer=-3;}
      if((bpm2-1)%8==0) {Firer1=-3;}
      if((bpm2-2)%8==0) {Firer2=-3;}
      if((bpm2-3)%8==0) {Firer3=-3;}
    }if(bpm2>4){ Firer_2+=5;
        if(Firer_2>140)  {Firer1_2+=5;}
        if(Firer1_2>140) {Firer2_2+=5;}
        if(Firer2_2>140) {Firer3_2+=5;}
        Fire_2_2(200,810,400,700,600,600,800,500);
        if(bpm2<36){
          if((bpm2-4)%8==0) {Firer_2=-3;}
          if((bpm2-5)%8==0) {Firer1_2=-3;}
          if((bpm2-6)%8==0) {Firer2_2=-3;}
          if((bpm2-7)%8==0) {Firer3_2=-3;}
        }
    } 
  }
  if(bpm2>=29 && bpm2<=32){ Yumi1(500,0,0,30,45,35); }
  if(bpm2>32){
    Circle2(700,150); Circle2(300,650);
  }
  if(bpm2>=57 && bpm2<100){ Uzumaki(500,50,1); 
    if(en>0){
      Tamafade();
      fill(255); ellipse(500,50,en,en); 
    }
    if(bpm2<=92){ en+=8;
      if(en>100){ en=100; }
    }
    if(bpm2==90){ Firer=-3; }
    if(bpm2>92){ en-=10; }
  }
  if(bpm2>=93 && bpm2<110){ Firer+=5;
    Fire(500,50,30);
  }
  if(bpm2>=96 && bpm2<128){ Baramaki(200,100); Baramaki(800,100); }
  if(bpm2>=111 && bpm2<128){ Rensa5L(); }
  if(bpm2>=119 && bpm2<128){ Rensa5R(); }
  
//3曲目
  noFill(); stroke(255);
  if(bgm_start==1 && kyoku==3){ rect(wakux0,500,wakuhaba,wakutakasa0);
    wakux0-=16; wakuhaba+=32; wakutakasa0+=10;
    if(wakux0<100){ wakux0=100; wakuhaba=800; wakutakasa0=250; }
  }
  fill(255); stroke(255);
  if(kyoku==3 && bgm_start==1 && bpm3>=1 && bpm3<45){ Firer+=5;
    if(Firer>140)  {Firer1+=5;} if(Firer1>140) {Firer2+=5;} if(Firer2>140) {Firer3+=5;}
    Fire_2(200,-10,400,0,600,0,800,0);
    if(bpm3<28){
      if((bpm3)%8==0) {Firer=-3;} if((bpm3-1)%8==0) {Firer1=-3;}
      if((bpm3-2)%8==0) {Firer2=-3;} if((bpm3-3)%8==0) {Firer3=-3;}
    }if(bpm3>4){ Firer_2+=5;
        if(Firer_2>140)  {Firer1_2+=5;} if(Firer1_2>140) {Firer2_2+=5;} if(Firer2_2>140) {Firer3_2+=5;}
        Fire_2_2(750,250,550,250,350,250,150,250);
        if(bpm3<32){
          if((bpm3-4)%8==0) {Firer_2=-3;} if((bpm3-5)%8==0) {Firer1_2=-3;}
          if((bpm3-6)%8==0) {Firer2_2=-3;} if((bpm3-7)%8==0) {Firer3_2=-3;}
        }
    } 
  }
  if(bpm3>16 && bpm3<29){
    if(frameCount%(69*60/138.0)>=1 && frameCount%(69*60/138.0)<=2){ fill(255,200); rect(0,0,1000,800); }
  }
  if(bpm3>32 && bpm3<64){  fill(255); Waysp+=33;
    if(bpm3%4==2){ Way3(500,-20,0); } if(bpm3%4==0){ Way2(500,-20,0); }
    if(bpm3%2==1){ Waysp=0; }
    Tamafade();
    noStroke(); Fside(); Fs++;
    if(Fs%115==0 && bpm3<=60){
      for(int i=0; i<50; i++){
        Fleft[i]=(int)random(30,80); Fright[i]=(int)random(920,970);
        Fsidey[i]=(int)random(20,790); Fsider[i]=(int)random(30,60);
        Fsidestatus[i]=0; Fsidef[i]=255; Fsidet=0;        
      }
    }
    if(Fs%115>=0 && Fs%115<=5){ fill(255,200); rect(0,0,1000,800); }
  }
  if(bpm3>60 && bpm3<88){ fill(255); stroke(255);
    for(int i=-10; i<=0; i++){ rect(200,i*300+ydown,305,10); 
      if(tika==61 && myx>200 && myx<505 && myy>i*300+ydown && myy<i*300+ydown+10){ hit++; }
    }
    for(int i=4; i<=14; i++){ rect(495,i*300+yup,305,10); 
      if(tika==61 && myx>495 && myx<795 && myy>i*300+yup && myy<i*300+yup+10){ hit++; }
    }
    ydown+=5; yup-=5;
  }
  if(bpm3>79 && bpm3<87){ Yumi1(500,0,0,30,45,30); }
  if(bpm3>=87 && bpm3<=91){ Yumi1(500,0,0,30,45,45); }
  if(bpm3>90){ Uzu3(500,50); }
  
  if(zanki<0){ //ゲームオーバー↓
    resetMatrix();
    fill(0,180); rect(-1,-1,1001,801);
    fill(255); textSize(30); textAlign(CENTER,CENTER);
    text("GAME OVER",500,400);
    if((frameCount/30)%2!=0){ textSize(28); text("-click to restart-",500,480); }
  } //↑ゲームオーバー 
  if(zanki>=0 && (bpm>=440 || bpm2>=130 || bpm3>=99)){ // ↓クリア
    resetMatrix();
    fill(0,180); rect(-1,-1,1001,801);
    fill(255); textSize(30); textAlign(CENTER,CENTER);
    text("CLEAR",500,400);
    if((frameCount/30)%2!=0){ textSize(28); text("-click to restart-",500,480); }
  }  //↑クリア
}
void mousePressed()
{
  //println(ms);
  if(bgm_start==0){
    if(mouseX>50 && mouseX<280 && mouseY>300 && mouseY<700){ kyoku=1; bgm_start=1; }
    if(mouseX>380 && mouseX<620 && mouseY>300 && mouseY<700){ kyoku=2; bgm_start=1; }
    if(mouseX>720 && mouseX<950 && mouseY>300 && mouseY<700){ kyoku=3; bgm_start=1; }
  }
  else{ bgm_start=0; }
  base_time=millis();
  println(bgm_start);
}
void stop()
{
  bgm.close();
  bgm2.close();
  bgm3.close();
  minim.stop();
  super.stop();
}
void Fire(int cx, int cy, int r)  //drawの中にr+=10を入れるのを忘れずに
{
  for (float angle=0; angle<360; angle+=10){
    float rad=2*PI*angle/360.0;
    float dx=Firer*cos(rad); float dy=Firer*-sin(rad);
    ellipse(cx+dx, cy+dy, r,r);
    if(tika==61 && dist(myx,myy,cx+dx,cy+dy)<=7){ hit++; }
  }
}
void Fire_last(int cx, int cy)  //drawの中にr+=10を入れるのを忘れずに
{
  for (float angle=0; angle<360; angle+=30){
    float rad=2*PI*angle/360.0;
    float dx=Firer*cos(rad); float dy=Firer*-sin(rad);
    ellipse(cx+dx, cy+dy, 30, 30);
    if(tika==61 && dist(myx,myy,cx+dx,cy+dy)<=15){ hit++; }
  }
}
void Way3(int cx, int cy, int r)
{
  for(int i=0; i<3; i++){
    float Kakudo=radians(45*i+45+r);
    float x=cos(Kakudo)*Waysp+cx; float y=sin(Kakudo)*Waysp+cy;
    ellipse(x,y,24,24);
    if(tika==61 && dist(myx,myy,x,y)<=12){ hit++; }
  }
}
void Way2(int cx, int cy, int r)
{
  for(int i=0; i<2; i++){
    float Kakudo=radians(60*i+60+r);
    float x=cos(Kakudo)*Waysp+cx; float y=sin(Kakudo)*Waysp+cy;
    ellipse(x,y,24,24);
    if(tika==61 && dist(myx,myy,x,y)<=12){ hit++; }
  }
}
void Fire_2(int cx,int cy,int cx1,int cy1,int cx2,int cy2,int cx3,int cy3)  //drawの中にr+=10を入れるのを忘れずに
{
  for(float angle=0; angle<360; angle+=10){
    float rad=2*PI*angle/360.0;
    float dx=Firer*cos(rad);
    float dy=Firer*-sin(rad);
    ellipse(cx+dx,cy+dy,10,10);
    if(bpm>222 && bpm<285){
      if(tika==61 && dist(myx-(wakux+wakuhaba/2),myy-(wakuy+wakutakasa/2),cx+dx,cy+dy)<=5){ hit++; }
    }else if(bpm>=329 && bpm<360){
      if(tika==61 && dist(myx-500,myy-400,cx+dx,cy+dy)<=5){ hit++; }
    }else{
      if(tika==61 && dist(myx,myy,cx+dx,cy+dy)<=5){ hit++; }
    }
    if(Firer>140){
      float dx1=Firer1*cos(rad);
      float dy1=Firer1*-sin(rad);
      ellipse(cx1+dx1,cy1+dy1,10,10);
      if(bpm>222 && bpm<285){
        if(tika==61 && dist(myx-(wakux+wakuhaba/2),myy-(wakuy+wakutakasa/2),cx+dx,cy+dy)<=5){ hit++; }
      }else{
        if(tika==61 && dist(myx,myy,cx+dx,cy+dy)<=5){ hit++; }
      }
    }
    if(Firer1>140){
      float dx2=Firer2*cos(rad);
      float dy2=Firer2*-sin(rad);
      ellipse(cx2+dx2,cy2+dy2,10,10);
      if(bpm>222 && bpm<285){
        if(tika==61 && dist(myx-(wakux+wakuhaba/2),myy-(wakuy+wakutakasa/2),cx+dx,cy+dy)<=5){ hit++; }
      }else{
        if(tika==61 && dist(myx,myy,cx+dx,cy+dy)<=5){ hit++; }
      }
    }
    if(Firer2>140){
      float dx3=Firer3*cos(rad);
      float dy3=Firer3*-sin(rad);
      ellipse(cx3+dx3,cy3+dy3,10,10);
      if(bpm>222 && bpm<285){
        if(tika==61 && dist(myx-(wakux+wakuhaba/2),myy-(wakuy+wakutakasa/2),cx+dx,cy+dy)<=5){ hit++; }
      }else{
        if(tika==61 && dist(myx,myy,cx+dx,cy+dy)<=5){ hit++; }
      }
    }   
  }
}
void Fire_2_2(int cx,int cy,int cx1,int cy1,int cx2,int cy2,int cx3,int cy3)  //drawの中にr+=10を入れるのを忘れずに
{
  for(float angle=0; angle<360; angle+=10){
    float rad=2*PI*angle/360.0;
    float dx=Firer_2*cos(rad);
    float dy=Firer_2*-sin(rad);
    ellipse(cx+dx,cy+dy,10,10);
    if(tika==61 && dist(myx,myy,cx+dx,cy+dy)<=5){ hit++; }
    if(Firer_2>140){
      float dx1=Firer1_2*cos(rad);
      float dy1=Firer1_2*-sin(rad);
      ellipse(cx1+dx1,cy1+dy1,10,10);
      if(tika==61 && dist(myx,myy,cx1+dx1,cy1+dy1)<=5){ hit++; }
    }
    if(Firer1_2>140){
      float dx2=Firer2_2*cos(rad);
      float dy2=Firer2_2*-sin(rad);
      ellipse(cx2+dx2,cy2+dy2,10,10);
      if(tika==61 && dist(myx,myy,cx2+dx2,cy2+dy2)<=5){ hit++; }
    }
    if(Firer2_2>140){
      float dx3=Firer3_2*cos(rad);
      float dy3=Firer3_2*-sin(rad);
      ellipse(cx3+dx3,cy3+dy3,10,10);
      if(tika==61 && dist(myx,myy,cx3+dx3,cy3+dy3)<=5){ hit++; }
    }   
  }
}
void Circle(int cx, int cy)
{
  for(int i=0; i<62; i++){
    if(begin[i]<0){
      Kakudo[i]+=0.01; Kyori[i]+=2.5;
      for(int j=0; j<17; j++){
        float Kakudo2=Kakudo[i]+(PI/(16/2.0))*j;
        float x=cos(Kakudo2)*Kyori[i]+cx;
        float y=sin(Kakudo2)*Kyori[i]+cy;
        ellipse(x,y,20,20);
        if(tika==61 && dist(myx,myy,x,y)<=10){ hit++; }
      }
    }else{ begin[i]-=1; Kakudo[i]=(int)(i%180.0)/180.0*PI; }
  } 
}
void Circle2(int cx, int cy)
{
  for(int i=0; i<24; i++){
    if(begin[i]<0){ 
      Kakudo[i]+=0.006; Kyori[i]+=2.5/2.0;
      for(int j=0; j<9; j++){
        float Kakudo2=Kakudo[i]+(PI/(6/2.0))*j;
        float x=cos(Kakudo2)*Kyori[i]+cx;
        float y=sin(Kakudo2)*Kyori[i]+cy;
        ellipse(x,y,15,15);
        if(tika==61 && dist(myx,myy,x,y)<=15/2.0){ hit++; }
      }
    }else{ begin[i]-=1; Kakudo[i]=(int)(i%180.0)/180.0*PI; }
  } 
}
void Yumi1(int x, int y, int r, float kankaku, float siten, int sp) //r=0で下向き
{
  Yumi1_sp+=sp;
  float Kakudo=radians(kankaku*(Yumi1_houi-1)+siten+r);
  float yx=cos(Kakudo)*Yumi1_sp+x; float yy=sin(Kakudo)*Yumi1_sp+y;
  if(tika==61 && dist(myx,myy,yx,yy)<=6){ hit++; }  
  pushMatrix();  translate(yx,yy);  rotate(Kakudo);  rect(-45,-5,70,10);  popMatrix();
  if(yx>width+15 || yx<-15 || yy>height+15){
    Yumi1_sp=0; Yumi1_houi++;
    if(Yumi1_houi>4){ Yumi1_houi=1; }
  }
}
void Rensa()
{
  if(Rensax<300){ ellipse(Rensax,Rensay,30,30); }
  Rensax+=6; Rensay+=6;
  if(Rensax>300){ Rensax=300; Rensay=300; 
    if(Rensar<200 && Rensar>=0){ Rensar+=4;
      for(float angle0=45; angle0<360; angle0+=90){
        float rad0=2*PI*angle0/360.0;
        float dx0=Rensar*cos(rad0); float dy0=Rensar*-sin(rad0);
        if(Rensax1==1000){ ellipse(Rensax+dx0,Rensay+dy0,20,20); }
        else{ ellipse(Rensax1+dx0,Rensay1+dy0,20,20); }
      } if(Rensar>=200){ Rensar=-1;}  
    }
  }if(Rensar==-1){ 
    if(Rensax1>700){ Rensar1+=7;}
    else{ Rensar2+=7; }
    for(float angle=0; angle<360; angle+=20){
      float rad=2*PI*angle/360.0;
      float dx, dy;
      if(Rensax1>700){dx=Rensar1*cos(rad); dy=Rensar1*-sin(rad);
        ellipse(Rensax+200*cos(2*PI*45/360.0)+dx,Rensay+200*-sin(2*PI*45/360.0)+dy,10,10);
        ellipse(Rensax+200*cos(2*PI*135/360.0)+dx,Rensay+200*-sin(2*PI*135/360.0)+dy,10,10);
        ellipse(Rensax+200*cos(2*PI*225/360.0)+dx,Rensay+200*-sin(2*PI*225/360.0)+dy,10,10);
        ellipse(Rensax+200*cos(2*PI*315/360.0)+dx,Rensay+200*-sin(2*PI*315/360.0)+dy,10,10);     
        if(tika==61 && bpm<222){
          if(dist(myx,myy,Rensax+200*cos(2*PI*45/360.0)+dx,Rensay+200*-sin(2*PI*45/360.0)+dy)<=5 || dist(myx,myy,Rensax+200*cos(2*PI*135/360.0)+dx,Rensay+200*-sin(2*PI*135/360.0)+dy)<=5
              || dist(myx,myy,Rensax+200*cos(2*PI*225/360.0)+dx,Rensay+200*-sin(2*PI*225/360.0)+dy)<=5 || dist(myx,myy,Rensax+200*cos(2*PI*315/360.0)+dx,Rensay+200*-sin(2*PI*315/360.0)+dy)<=5)
            { hit++; }
        }
      }
      else{dx=Rensar2*cos(rad); dy=Rensar2*-sin(rad);
        ellipse(Rensax1+200*cos(2*PI*45/360.0)+dx,Rensay1+200*-sin(2*PI*45/360.0)+dy,10,10);
        ellipse(Rensax1+200*cos(2*PI*135/360.0)+dx,Rensay1+200*-sin(2*PI*135/360.0)+dy,10,10);
        ellipse(Rensax1+200*cos(2*PI*225/360.0)+dx,Rensay1+200*-sin(2*PI*225/360.0)+dy,10,10);
        ellipse(Rensax1+200*cos(2*PI*315/360.0)+dx,Rensay1+200*-sin(2*PI*315/360.0)+dy,10,10);     
        if(tika==61 && bpm<222){
          if(dist(myx,myy,Rensax1+200*cos(2*PI*45/360.0)+dx,Rensay1+200*-sin(2*PI*45/360.0)+dy)<=5 || dist(myx,myy,Rensax1+200*cos(2*PI*135/360.0)+dx,Rensay1+200*-sin(2*PI*135/360.0)+dy)<=5
              || dist(myx,myy,Rensax1+200*cos(2*PI*225/360.0)+dx,Rensay1+200*-sin(2*PI*225/360.0)+dy)<=5 || dist(myx,myy,Rensax1+200*cos(2*PI*315/360.0)+dx,Rensay1+200*-sin(2*PI*315/360.0)+dy)<=5)
            { hit++; }
        }
     }
    }
  }
  if(Rensar1>750){
    if(Rensax1>700){ ellipse(Rensax1,Rensay1,30,30); }
    Rensax1-=6; Rensay1-=6;
    if(Rensax1<700){ Rensax1=700; Rensay1=500; }
    if(Rensax1==706){ Rensar=0; }
  }
}
void Yukiss()
{
  for(int i=0; i<8; i++){
    circle(Yukiss_x[i],Yukiss_y[i],Yukiss_Hankei[i]);   
    if(bpm<222 && tika==61 && dist(myx,myy,Yukiss_x[i],Yukiss_y[i])<=Yukiss_Hankei[i]/2){ hit++; }
    Yukiss_y[i]-=Yukiss_speed[i];
    if(Yukiss_y[i]<-700){
      Yukiss_x[i]=random(100,900); Yukiss_y[i]=random(980,990);
      Yukiss_Hankei[i]=random(20,60); Yukiss_speed[i]=random(6,8);
    }
  }
}
void Ougi(int cx, int cy, float M)
{
  if(ougir>=0){ ougir+=6; }
  else{ ougir1+=2.4; }
  if(ougir>=280){ ougir=-1; }
  if(ougir_1>=0 && ougir1>290){ ougir_1+=6; }
  if(ougir_1==-1){ougir1_1+=2.4; }
  if(ougir_1>=280){ ougir_1=-1; }
  if(ougir_2>=0 && ougir1_1>290){ ougir_2+=6; }
  if(ougir_2==-1){ougir1_2+=2.4; }
  if(ougir_2>=280){ ougir_2=-1; }
  if(ougir_3>=0 && ougir1_2>290){ ougir_3+=6; }
  if(ougir_3==-1){ougir1_3+=2.4; }
  if(ougir_3>=280){ ougir_3=-1; }
  float dx, dy;
  for(float A=60-10; A<=120-10; A+=10){  
    float rad=2*PI*A/360.0 +PI +M;
    if(ougir<280 && ougir>=0){dx=ougir*cos(rad); dy=ougir*-sin(rad);}
    else{dx=ougir1*cos(rad); dy=ougir1*-sin(rad);}
    ellipse(cx+dx,cy+dy,30,30);
    if(tika==61 && dist(myx-(wakux+wakuhaba/2),myy-(wakuy+wakutakasa/2),cx+dx,cy+dy)<=15){ hit++; }
  }if(ougir1>290){
    for(float A=60-4; A<=120-4; A+=10){
      float rad=2*PI*A/360.0 +PI +M;
      if(ougir_1<280 && ougir_1>=0){dx=ougir_1*cos(rad); dy=ougir_1*-sin(rad);}
      else{dx=ougir1_1*cos(rad); dy=ougir1_1*-sin(rad);}
      ellipse(cx+dx,cy+dy,30,30);
      if(tika==61 && dist(myx-(wakux+wakuhaba/2),myy-(wakuy+wakutakasa/2),cx+dx,cy+dy)<=15){ hit++; }
    }
  }if(ougir1_1>290){
    for(float A=60+3; A<=120+3; A+=10){
      float rad=2*PI*A/360.0 +PI +M;
      if(ougir_2<280 && ougir_2>=0){dx=ougir_2*cos(rad); dy=ougir_2*-sin(rad);}
      else{dx=ougir1_2*cos(rad); dy=ougir1_2*-sin(rad);}
      ellipse(cx+dx,cy+dy,30,30);
      if(tika==61 && dist(myx-(wakux+wakuhaba/2),myy-(wakuy+wakutakasa/2),cx+dx,cy+dy)<=15){ hit++; }
    }
  }if(ougir1_2>290){
    for(float A=60+9; A<=120+9; A+=10){
      float rad=2*PI*A/360.0 +PI +M;
      if(ougir_3<280 && ougir_3>=0){dx=ougir_3*cos(rad); dy=ougir_3*-sin(rad);}
      else{dx=ougir1_3*cos(rad); dy=ougir1_3*-sin(rad);}
      ellipse(cx+dx,cy+dy,30,30);
      if(tika==61 && dist(myx-(wakux+wakuhaba/2),myy-(wakuy+wakutakasa/2),cx+dx,cy+dy)<=15){ hit++; }
    }
  }
}
void Fade()
{
  fadet+=45;
  for(int i=0; i<15; i++){
    if(status[i]==0){ fill(0); }
    else{ fill(255,stF[i]); }
    ellipse(fadeXL[i],fadeY[i],30,30); ellipse(fadeXR[i],fadeY[i],30,30);
    if(tika==61 && bpm<285 && (dist(myx-(wakux+wakuhaba/2),myy-(wakuy+wakutakasa/2),fadeXL[i],fadeY[i])<=15 || dist(myx-(wakux+wakuhaba/2),myy-(wakuy+wakutakasa/2),fadeXR[i],fadeY[i])<=15)){ hit++; }
    if(fadet>fadeY[i]){ status[i]++; }
    if(fadet>950){
      fadeXL[i]+=fadeXsp[i]; fadeXR[i]-=fadeXsp[i]; fadeY[i]+=fadeYsp[i];
      if(stF[i]>=0){
        if(fadeXL[i]>fadeXf[i]){ fadeXL[i]=fadeXf[i]; stF[i]-=15; }
        if(fadeXR[i]<(1000-fadeXf[i])){ fadeXR[i]=1000-fadeXf[i]; stF[i]-=15; }
      }
    }
  }
}
void Uzumaki(int cx , int cy , int H ) //Mukiは0なら下向きに発射
{
  float Houi=0, dHoui=0;
  for(int i=0; i<820; i++){
    if(begin_Uzumaki[i]<0){
      Kyori_Uzumaki[i]+=8.5; //弾のスピード
      float Kakudo_Uzumaki2=radians(5* Houi); 
      float x=cos(Kakudo_Uzumaki2)*Kyori_Uzumaki[i]+cx; float y=sin(Kakudo_Uzumaki2)*Kyori_Uzumaki[i]+cy;
      ellipse(x,y,15,15);
      if(tika==61 && dist(myx,myy,x,y)<=15/2.0){ hit++; }
      if(H==1){ Houi+=1.5; }else if(H==0){ Houi+=dHoui; }
      if(Houi<30 || Houi>68){ dHoui=1.5; }
      if(Houi>30){ dHoui-=0.1;
        if(dHoui<0.32){ dHoui=0.32; }
      }if(Houi>60){ dHoui+=0.15;}
      if(Houi>72){ Houi=0; }
    }else{
      begin_Uzumaki[i]-=1;  Kakudo_Uzumaki[i]=(int)(i%180.0)/180.0*PI;
    }
  } 
}
void EN()
{
  for(int i=0; i<13; i++){
    float x=ENr*cos(radians(30*i)), y=ENr*sin(radians(30*i));
    ellipse(x,y,25,25);
  }
  for(int i=0; i<18; i++){
    float x=(ENr-80)*cos(radians(20*i)), y=(ENr-80)*sin(radians(20*i));
    ellipse(x,y,25,25);
  }
}
void ENBeam()
{
  if(EBr>=0){ EBr+=9.5; EBr1+=9; EBr2+=8.5; EBr3+=8; }
  if(EBr3>780 && bpm<352){ EBr=0; EBr1=0; EBr2=0; EBr3=0; }
  for(float angle=30; angle<=150; angle+=30){
    float rad=2*PI*angle/360.0;
    float dx=EBr*cos(rad), dy=EBr*-sin(rad);
    ellipse(500+dx,800+dy,30,30);
    if(tika==61 && bpm<350 && dist(myx-500,myy-400,500+dx,800+dy)<=15){ hit++; }
    float dx1=EBr1*cos(rad), dy1=EBr1*-sin(rad);
    ellipse(500+dx1,800+dy1,30,30);
    if(tika==61 && bpm<350 && dist(myx-500,myy-400,500+dx1,800+dy1)<=15){ hit++; }
    float dx2=EBr2*cos(rad), dy2=EBr2*-sin(rad);
    ellipse(500+dx2,800+dy2,30,30);
    if(tika==61 && bpm<350 && dist(myx-500,myy-400,500+dx2,800+dy2)<=15){ hit++; }
    float dx3=EBr3*cos(rad), dy3=EBr3*-sin(rad);
    ellipse(500+dx3,800+dy3,30,30);
    if(tika==61 && bpm<350 && dist(myx-500,myy-400,500+dx3,800+dy3)<=15){ hit++; }
  }
}
void Rensa_2()
{
  if(R2x<300){ ellipse(R2x,R2y,30,30); }
  R2x+=6; R2y-=6;
  if(R2x>300){ R2x=300; R2y=400; R2r+=4; }  
  if(R2x1>500){  ellipse(R2x1,R2y1,30,30); }
  if(R2r>200){ R2x1-=6; R2y1-=6; }
  if(R2x1<500){ R2x1=500; R2y1=550; R2r1+=4;} 
  if(R2x2<800){ ellipse(R2x2,R2y2,30,30);}
  if(R2r1>200) { R2x2+=6; R2y2-=6; }
  if(R2x2>800){ R2x2=800; R2y2=550; R2r2+=4;} 
  for(float angle0=30; angle0<=360; angle0+=30){
    float rad0=2*PI*angle0/360.0;
    float dx0=R2r*cos(rad0), dy0=R2r*-sin(rad0);
    ellipse(R2x+dx0,R2y+dy0,20,20); 
    float dx1=R2r1*cos(rad0), dy1=R2r1*-sin(rad0);
    ellipse(R2x1+dx1,R2y1+dy1,20,20); 
    float dx2=R2r2*cos(rad0), dy2=R2r2*-sin(rad0);
    ellipse(R2x2+dx2,R2y2+dy2,20,20); 
    if(tika==61 && (dist(myx-500,myy-400,R2x+dx0,R2y+dy0)<=10 || dist(myx-500,myy-400,R2x1+dx1,R2y1+dy1)<=10 || dist(myx-500,myy-400,R2x2+dx2,R2y2+dy2)<=10)){ hit++; }
  }
}
void TamaUP()
{
  for(int i=0; i<5; i++){
    ellipse(tamax[i],tamay[i],60,60); tamay[i]-=tamasp[i];
    if(tika==61 && bpm<350 && dist(myx-500,myy-400,tamax[i],tamay[i])<=30){ hit++; }
    if(tamay[i]<-100 && bpm<352){
      tamax[i]=(int)random(1000); tamay[i]=(int)random(800,850); tamasp[i]=(int)random(3,7);
    }
  }
}
void Tamafade()
{
  for(int i=0; i<6; i++){
    noStroke(); fill(255,yukiF[i]);
    ellipse(yukifX[i],yukifY[i],yukifr[i],yukifr[i]);
    if(tika==61 && dist(myx,myy,yukifX[i],yukifY[i])<=yukifr[i]/2.0){ hit++; }
    yukifY[i]+=yukifsp[i];
    if(yukifY[i]>yukifend[i]){ yukifY[i]=yukifend[i]; yukiF[i]-=10; }
    if(yukiF[i]<-30){
      yukifX[i]=(int)random(30,1000-30);
      yukifY[i]=(int)random(-100,-30);
      yukifr[i]=(int)random(30,70);
      yukifsp[i]=random(2,5);
      yukifend[i]=(int)random(400,800);
      yukiF[i]=255;
    }
  }
}
void Baramaki(int cx, int cy)
{
  for(int i=0; i<100; i++){
    if(Bbegin[i]<0){
      Bkyori[i]+=3.0;
      float Bkakudo=radians(5*BHoui[i]);
      float x=cos(Bkakudo)*Bkyori[i]+cx;
      float y=sin(Bkakudo)*Bkyori[i]+cy;
      pushMatrix();
      translate(x,y);
      rotate(Bkakudo);
      rect(-15,-5,30,10);
      popMatrix();
      if(dist(myx,myy,x,y)<=6 && tika==61){ hit++; }
    }else{ Bbegin[i]-=1; Bangle[i]=(int)(i%180.0)/180.0*PI; }
  }
}
void Rensa5R()
{ if(r5Rx>700){ ellipse(r5Rx,r5Ry,30,30); }
  r5Rx-=14; r5Ry-=9;
  if(r5Rx<700){ r5Rx=700; r5Ry=600;
    if(r5Rr<200 && r5Rr>=0){ r5Rr+=7;
      for(float angle0=0; angle0<360; angle0+=72){
        float rad0=2*PI*angle0/360.0, dx0=r5Rr*cos(rad0), dy0=r5Rr*-sin(rad0);
        ellipse(r5Rx+dx0,r5Ry+dy0,25,25);
      } if(r5Rr>=200){ r5Rr=-1; }
    }
  } if(r5Rr==-1){ r5Rr2+=6;
      if(r5Rr2>30){ r5Rr3+=6; } if(r5Rr3>30){ r5Rr4+=6; } if(r5Rr4>30){ r5Rr5+=6; } if(r5Rr5>30){ r5Rr6+=6; }
      for(float angle=0; angle<360; angle+=30){
        float rad=2*PI*angle/360.0; float dx,dy, dx3,dy3, dx4,dy4, dx5,dy5, dx6,dy6;
        dx=r5Rr2*cos(rad); dy=r5Rr2*-sin(rad); dx3=r5Rr3*cos(rad); dy3=r5Rr3*-sin(rad);
        dx4=r5Rr4*cos(rad); dy4=r5Rr4*-sin(rad); dx5=r5Rr5*cos(rad); dy5=r5Rr5*-sin(rad); dx6=r5Rr6*cos(rad); dy6=r5Rr6*-sin(rad);
        ellipse(r5Rx+200+dx,r5Ry+dy,15,15);
        ellipse(r5Rx+200*cos(2*PI*72/360.0)+dx3,r5Ry+200*-sin(2*PI*72/360.0)+dy3,15,15);
        ellipse(r5Rx+200*cos(2*PI*144/360.0)+dx4,r5Ry+200*-sin(2*PI*144/360.0)+dy4,15,15);   
        ellipse(r5Rx+200*cos(2*PI*216/360.0)+dx5,r5Ry+200*-sin(2*PI*216/360.0)+dy5,15,15);
        ellipse(r5Rx+200*cos(2*PI*288/360.0)+dx6,r5Ry+200*-sin(2*PI*288/360.0)+dy6,15,15); 
        if(tika==61){
          if(dist(myx,myy,r5Rx+200+dx,r5Ry+dy)<=7.5 || dist(myx,myy,r5Rx+200*cos(2*PI*72/360.0)+dx3,r5Ry+200*-sin(2*PI*72/360.0)+dy3)<=7.5 
              || dist(myx,myy,r5Rx+200*cos(2*PI*144/360.0)+dx4,r5Ry+200*-sin(2*PI*144/360.0)+dy4)<=7.5 ||dist(myx,myy,r5Rx+200*cos(2*PI*216/360.0)+dx5,r5Ry+200*-sin(2*PI*216/360.0)+dy5)<=7.5 
                ||dist(myx,myy,r5Rx+200*cos(2*PI*288/360.0)+dx6,r5Ry+200*-sin(2*PI*288/360.0)+dy6)<=7.5 ){ hit++; }
        }
      }  
  }
}
void Rensa5L()
{
  if(r5Lx<300){ ellipse(r5Lx,r5Ly,30,30); }
  r5Lx+=14; r5Ly-=9;
  if(r5Lx>300){ r5Lx=300; r5Ly=600;
    if(r5Lr<200 && r5Lr>=0){ r5Lr+=7;
      for(float angle0=0; angle0<360; angle0+=72){
        float rad0=2*PI*angle0/360.0, dx0=r5Lr*cos(rad0), dy0=r5Lr*-sin(rad0);
        ellipse(r5Lx+dx0,r5Ly+dy0,25,25);
      } if(r5Lr>=200){ r5Lr=-1; }
    }
  }if(r5Lr==-1){ r5Lr2+=6;
    if(r5Lr2>30){ r5Lr3+=6; } if(r5Lr3>30){ r5Lr4+=6; }
    if(r5Lr4>30){ r5Lr5+=6; } if(r5Lr5>30){ r5Lr6+=6; }
    for(float angle=0; angle<360; angle+=30){
      float rad=2*PI*angle/360.0; float dx,dy, dx3,dy3, dx4,dy4, dx5,dy5, dx6,dy6;
      dx=r5Lr2*cos(rad); dy=r5Lr2*-sin(rad); dx3=r5Lr3*cos(rad); dy3=r5Lr3*-sin(rad);
      dx4=r5Lr4*cos(rad); dy4=r5Lr4*-sin(rad); dx5=r5Lr5*cos(rad); dy5=r5Lr5*-sin(rad); dx6=r5Lr6*cos(rad); dy6=r5Lr6*-sin(rad);
      ellipse(r5Lx+200+dx,r5Ly+dy,15,15);
      ellipse(r5Lx+200*cos(2*PI*72/360.0)+dx3,r5Ly+200*-sin(2*PI*72/360.0)+dy3,15,15);
      ellipse(r5Lx+200*cos(2*PI*144/360.0)+dx4,r5Ly+200*-sin(2*PI*144/360.0)+dy4,15,15);   
      ellipse(r5Lx+200*cos(2*PI*216/360.0)+dx5,r5Ly+200*-sin(2*PI*216/360.0)+dy5,15,15);
      ellipse(r5Lx+200*cos(2*PI*288/360.0)+dx6,r5Ly+200*-sin(2*PI*288/360.0)+dy6,15,15); 
      if(tika==61){
          if(dist(myx,myy,r5Lx+200+dx,r5Ly+dy)<=7.5 || dist(myx,myy,r5Lx+200*cos(2*PI*72/360.0)+dx3,r5Ly+200*-sin(2*PI*72/360.0)+dy3)<=7.5 
              || dist(myx,myy,r5Lx+200*cos(2*PI*144/360.0)+dx4,r5Ly+200*-sin(2*PI*144/360.0)+dy4)<=7.5 ||dist(myx,myy,r5Lx+200*cos(2*PI*216/360.0)+dx5,r5Ly+200*-sin(2*PI*216/360.0)+dy5)<=7.5 
                ||dist(myx,myy,r5Lx+200*cos(2*PI*288/360.0)+dx6,r5Ly+200*-sin(2*PI*288/360.0)+dy6)<=7.5 ){ hit++; }
        }
    }
  }
}
void Fside()
{
  Fsidet+=60;
  for(int i=0; i<50; i++){
    if(Fsidestatus[i]==0){ noStroke(); fill(0,150); }else{ fill(255,Fsidef[i]); }
    ellipse(Fleft[i],Fsidey[i],Fsider[i],Fsider[i]); ellipse(Fright[i],Fsidey[i],Fsider[i],Fsider[i]); 
    if(Fsidet>Fsidey[i]){ Fsidestatus[i]++; Fsidef[i]-=2; }
  }
}
void Uzu3(int cx, int cy)
{
  float Houi=0;
  for(int i=0; i<500; i++){
    if(Uzubeg[i]<0){  Uzukyori[i]+=8.5; //弾のスピード
      float Kakudo_Uzumaki2=radians(5* Houi); 
      float x=cos(Kakudo_Uzumaki2)*Uzukyori[i]+cx, y=sin(Kakudo_Uzumaki2)*Uzukyori[i]+cy;
      ellipse(x,y,15,15); Houi+=3;
      if(tika==61 && dist(myx,myy,x,y)<=15/2.0){ hit++; }
    }else{ Uzubeg[i]-=1; Uzukaku[i]=(int)(i%180.0)/180.0*PI; }
  }
} 
void Me(int x, int y, int c)
{
  if(kyoku==1){ stroke(255,200,200); fill(255,200,200); }
  if(kyoku==2){ stroke(200,200,255); fill(200,200,255); }
  if(kyoku==3){ stroke(255,255,200); fill(255,255,200); }
  rect(x, y, c/2-3, c/2-3);
  rect(x, (-y)-(c/2-3), c/2-3, c/2-3);
  rect((-x)-(c/2-3), y, c/2-3, c/2-3);
  rect(-x-(c/2-3), -y-(c/2-3), c/2-3, c/2-3);
}
void restart()
{
  for(int i=0; i<62; i++){ Kakudo[i]=0; Kyori[i]=0; begin[i]=i*(28);}
  for(int i=0; i<8; i++){ Yukiss_x[i]=random(100,900); Yukiss_y[i]=random(980,990);
    Yukiss_Hankei[i]=random(20,60); Yukiss_speed[i]=random(6,8);
  }
  for(int i=0; i<15; i++){
    fadeXL[i]=(int)random(30,100); fadeXR[i]=(int)random(900,970); fadeY[i]=(int)random(20,790);
    fadeXsp[i]=random(5,8); fadeYsp[i]=random(-2,2); fadeXf[i]=(int)random(550,900);
    status[i]=0; stF[i]=255;
  }
  for(int i=0; i<820; i++){ Kakudo_Uzumaki[i]=0; Kyori_Uzumaki[i]=0; begin_Uzumaki[i]=i*1;}
  for(int i=0; i<5; i++){tamax[i]=(int)random(1000); tamay[i]=(int)random(800,850); tamasp[i]=(int)random(3,7);}
  for(int i=0; i<40; i++){
    Yuki_x[i]=random(900); Yuki_y[i]=random(-300,-70);
    Yuki_Hankei[i]=random(8,65); Yuki_speed[i]=random(2,6);
  }
  for(int i=0; i<6; i++){
    yukifX[i]=(int)random(30,1000-30); yukifY[i]=(int)random(-150,-60); yukifr[i]=(int)random(30,70);
    yukifsp[i]=random(2,9); yukifend[i]=(int)random(300,800); yukiF[i]=255;
  }
  for(int i=0; i<100; i++){ Bangle[i]=0; Bkyori[i]=0; Bbegin[i]=i*8.0; BHoui[i]=(int)random(72); }
  for(int i=0; i<50; i++){ Fsidestatus[i]=0; Fsidef[i]=255;
     Fleft[i]=(int)random(30,80); Fright[i]=(int)random(920,970); Fsidey[i]=(int)random(20,790); Fsider[i]=(int)random(30,60);  
  }
  for(int i=0; i<500; i++){ Uzukaku[i]=0; Uzukyori[i]=0; Uzubeg[i]=i*0.1; }

  kyoku=0; bpm=0; bpm2=0; bpm3=0; base_time=0; ms=0; hit=0; T=0; tika=61; zanki=5;
  myx=500; myy=500; mx=-20; my=-20; myKaitenn=0; zankiKaitenn=0;
  wakux0=500; wakuy0=200; wakux=150; wakuy=250; wakux1=375; wakuy1=45; wakux2=150; wakuy2=5;
  wakuhaba=0; wakutakasa=400; wakutakasa0=0; wakutx=500; wakuty=400; wakuangle=0; wakuangle2=0; wakuangle3=0;
  Firer=0; Firer1=0; Firer2=0; Firer3=0; Firer_2=0; Firer1_2=0; Firer2_2=0; Firer3_2=0;
  Waysp=0; Yumi1_sp=0; Yumi1_houi=1;
  Rensax=0; Rensay=0; Rensax1=1000; Rensay1=800; Rensar=0; Rensar1=0; Rensar2=0;
  ougir=0; ougir_1=0; ougir_2=0; ougir_3=0; ougir1=280; ougir1_1=280; ougir1_2=280; ougir1_3=280;
  fadet=0; tamaty=60; tamaK=0; ENr=200; EBr=0; EBr1=0; EBr2=0; EBr3=0; ENkaitenn=0; ENty=1100;
  R2x=-100; R2y=800; R2x1=800; R2y1=850; R2x2=500; R2y2=850; R2r=0; R2r1=0;R2r2=0;
  en=0; r5Lx=0; r5Ly=800; r5Rx=1000; r5Ry=800;
  r5Lr=0; r5Lr1=0; r5Lr2=0; r5Lr3=0; r5Lr4=0; r5Lr5=0; r5Lr6=0; r5Rr=0; r5Rr1=0; r5Rr2=0; r5Rr3=0; r5Rr4=0; r5Rr5=0; r5Rr6=0;  
  Fsidet=0; Fs=0; yup=0; ydown=0;
}
