import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;


AudioPlayer player;
Minim minim;


ArrayList<WormMan> wormMans = new ArrayList<WormMan>();
ArrayList<Skull> skulls = new ArrayList<Skull>();

/*Memories can be good things, but also be bad, use them as a pick up, when feeling sad. But memories, if left, to fester and stew can lead to depression, 
 cause problems for you. Memories can be useful, can help you to grow, but there's one other thing that's important to know. Memories are memories, things
 of the past, memories weren't ment as things that will last, don't dwell on a memory, you must set it free, or soon you will realise, soon you will see.
 A memory held onto can ruin your life, a memory not memory causes all kinds of strife. Heed to my warning, avoid this hell, 
 live life to the full and don't let yourself DWELL */


//-------------------------------------------------
int quantity = 30;
float [] xPosition = new float[quantity];
float [] yPosition = new float[quantity];
int [] BlockSize = new int[quantity];
int [] direction = new int[quantity];
int minBlock = 5;
int maxBlock = 25;
//-------------------------------------------------

void setup()
{
  size(xAxis, yAxis);

  minim = new Minim(this);
  player = minim.loadFile("Gamemusic.mp3", 2048);

  WormMan wormMan = new WormMan(yAxis/12,height*17/20,width,5, height*17/20+yAxis/30, height*17/20-yAxis/30);
  wormMans.add(wormMan);

  Skull skull = new Skull(width,255,2);
  skulls.add(skull);
  //-------------------------------------------------
  for (int i = 0; i < quantity; i++) 
  {
    BlockSize[i] = round(random(minBlock, maxBlock));
    yPosition[i] = random(0, width);
    xPosition[i] = random(0, height);
    direction[i] = round(random(0, 1));
  }
  //-------------------------------------------------
}


int xAxis=1000;
int yAxis=xAxis/2;

boolean up=true;
boolean jump=true;
boolean dead=false;


int headSize=yAxis/12;
int headPos=height*16/20;


void drawWorm()
{


  fill(255);
  noStroke();
  rect(width/2, headPos, headSize, headSize, 5); //5 at end makes corners curved
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

int which=1;
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
      which=2;
    }
  }


  //  if (which==0)
  //  {
  //    int logofade;
  //    background(0);
  //    int i;
  //
  //      logofade=i;
  //      if(i==0)
  //
  //        which=1;
  //
  //     
  //    }
  //      ellipseMode(CENTER);
  //      fill(255);
  //      ellipse(width/2, height/2, 200, 200);
  //    
  //    PImage logo;
  //    imageMode(CENTER);
  //    logo=loadImage("logo.png");
  //    image(logo, width/2, height/2, 200, 200);
  //  }
  if (which==1)
  {
    PFont font;
    font=createFont("Ailerons.ttf", 32);

    PImage bg;
    if (xAxis==1000)
    {
      bg = loadImage("GameMenuSize.jpg");
      background(bg);
    }
    if (xAxis==2000)
    {
      bg = loadImage("GameMenu.jpg");
      background(bg);
    }



    textAlign(CENTER);
    noStroke();
    textFont(font);
    smooth();
    textSize(xAxis/14);
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
    rect(0, height-height/8, width, height);



    textSize(xAxis/30);
    textAlign(CENTER);
    noStroke();
    textFont(font);
    smooth();
    float Op=random(0, 255)-100;
    fill(255, Op);
    text("Press Enter to start:", width/2, height/4);
  }



  if (which==2)
  {
    background(0, 0, 0);

    noStroke();


    //-------------------------------------------------------------
    for (int i = 0; i < xPosition.length; i++) 

    {
      fill(round(random(0, 80)), 0, 0);
      rect(yPosition[i], xPosition[i], BlockSize[i], BlockSize[i]);

      if (direction[i] == 0) {
        yPosition[i] += map(BlockSize[i], minBlock, maxBlock, .1, .5);
      } else {
        yPosition[i] -= map(BlockSize[i], minBlock, maxBlock, .1, .5);
      }

      yPosition[i] += 3 + direction[i]; 

      if (yPosition[i] > width + BlockSize[i] || yPosition[i] < +BlockSize[i] || xPosition[i] > height + BlockSize[i])
      {
        xPosition[i] = random(0, height);
        yPosition[i] = +BlockSize[i];
      }
      //--------------------------------
      fill(80, 0, 0);
      rectMode(CORNER);
      rect(0, 0, width, yAxis/12);
      rect(0, height-(yAxis/12), width, yAxis/10);
    }


    drawWorm();
    //drawText(); //Messes with the jumping :(


    if (jump==false&&headPos>height*2/20)
    {
      headPos-=5;
    }
    if (jump==true&&headPos<height*16/20)
    {
      headPos+=5;
    }


    for (int i = wormMans.size () - 1; i >= 0; i --)
    {
      WormMan go =wormMans.get(i);
      go.update();
      go.render();
    }

    for (int i = skulls.size () - 1; i >= 0; i --)
    {
      Skull go =skulls.get(i);
      go.update();
      go.render();
    }

    //    if(headPos==BadheadPosx)
    //    {
    //      dead=true;
    //    }
  }
}

void keyPressed()
{
  if (key==' ')
  {
    jump=!jump;
  }
}

