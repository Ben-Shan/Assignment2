import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;


AudioPlayer player;
Minim minim;//audio context



void setup()
{
  size(xAxis, yAxis);

  minim = new Minim(this);
  player = minim.loadFile("Gamemusic.mp3", 2048);
}


int xAxis=1000;
int yAxis=xAxis/2;

boolean up=true;
boolean jump=true;


int headSize=yAxis/12;
int headPos=height*16/20;

int bodySize=headSize*2/3;
int bodyPosx=width/2-(xAxis/30);
int bodyPosy=headPos+(xAxis/100);

int tailSize=headSize*1/3;
int tailPosx=bodyPosx-(xAxis/45);
int tailPosy=headPos+(xAxis/60);

void drawWorm()
{


  fill(255);
  noStroke();
  rect(width/2, headPos, headSize, headSize, 5); //5 at end makes corners curved
  rect(bodyPosx, bodyPosy, bodySize, bodySize, 2);
  rect(tailPosx, tailPosy, tailSize, tailSize, 1);
}
void drawText()
{
  PFont font;
  font=createFont("Ailerons.ttf", 32);

  textSize(32);
  textAlign(CENTER);
  noStroke();
  textFont(font);
  smooth();

  fill(255);
  text("Press spacebar to alter gravity", width/2, height/4);
}

int which=0;
boolean fade;
int textOp=200;
int CMOp=0;
int MOp=0;
void draw()
{
  frameRate(60);
  if (player.isPlaying()==false)
  {
    player.rewind();
    player.play();
  }
  background(0);


  if (keyPressed)
  {
    if (key == ENTER)
    {
      which=1;
    }
  }

  if (which==0)
  {
    PFont font;
    font=createFont("Ailerons.ttf", 32);

    PImage bg;
    bg = loadImage("GameMenuSize.jpg");

    background(bg);
    
    
    textAlign(CENTER);
    noStroke();
    textFont(font);
    smooth();
    textSize(72);
    fill(100, 0, 0);
    text("-dwelling-", width/2, height*49/50);

    if (CMOp==0)
    {
      MOp+=2;
      if (MOp==200)
      {
        CMOp=1;
      }
    } else if (CMOp==1)
    {
      MOp-=2;
      if (MOp==0)
      {
        CMOp=0;
      }
    }

    fill(0, MOp);
    rect(0, 0, width*9/30, height);
    rect(width*41/60, 0, width*9/30, height);
    rect(0,height-height/8,width,height);



    textSize(32);
    textAlign(CENTER);
    noStroke();
    textFont(font);
    smooth();
    float Op=random(0, 255)-100;
    fill(255, Op);
    text("Press Enter to start:", width/2, height/4);


    //    float SpotFade=20;
    //    noStroke();
    //    for (int i=0; i<width/2; i+=15)
    //    {
    //
    //      fill(255, SpotFade);
    //      ellipseMode(CENTER);
    //      ellipse(width/2, height*3/4, i, height/5);
    //    }
    //    rectMode(CENTER);
    //    float SOpB=random(0, 1);
    //    int SOp=200;
    //    if (SOpB==0)
    //    {
    //      SOp=0;
    //    } else if (SOpB==1)
    //    {
    //      SOp=200;
    //    }
    //    fill(0, SOp);
    //    rect(width/2, height*3/4, width/2, height/5);
    //
    //    fill(250);
    //
    //    rectMode(CENTER);
    //    rect(width/2, height*2/3, headSize*3, headSize*3, 10);
    //
    //    fill(0);
    //    smooth();
    //    noStroke();
    //    ellipse(width*19/40, height*25/40, width/60, width/60);
    //    arc(width*21/40, height*25/40, width/60, width/60, 0, PI+HALF_PI, CHORD);
    //    fill(255);
    //    noStroke();
    //    arc(width*19/40, height*25/40, width/56, width/56, PI, PI+HALF_PI, CHORD);
  }



  if (which==1)
  {
    noStroke();
    fill(50, 0, 0);
    rectMode(CORNER);
    rect(0, 0, width, yAxis/12);
    rect(0, height-(yAxis/12), width, yAxis/10);

    //drawText(); //Messes with the jumping :(
    drawWorm();



    if (jump==false&&headPos>height*2/20)
    {
      headPos-=5;
    }
    if (jump==true&&headPos<height*16/20)
    {
      headPos+=5;
    }

    if (up==true)
    {
      for (int i=0; i<5; i++)
      {
        tailPosx+=2;
      }
      up=false;
    }
    if (up==false)
    {
      for (int i=0; i<5; i++)
      {
        tailPosx-=2;
      }
      up=true;
    }
  }
}

void keyPressed()
{
  if (key==' ')
  {
    jump=!jump;
  }
}

