import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;


AudioPlayer player;
AudioPlayer player1;
Minim minim;


ArrayList<WormMan> wormMans = new ArrayList<WormMan>();
ArrayList<Skull> skulls = new ArrayList<Skull>();
ArrayList<Time> times = new ArrayList<Time>();
ArrayList<Skull_bar> skull_bars = new ArrayList<Skull_bar>();

/*Memories can be good things, but also be bad, use them as a pick up, when feeling sad. But memories, if left, to fester and stew can lead to depression, 
 cause problems for you. Memories can be useful, can help you to grow, but there's one other thing that's important to know. Memories are memories, things
 of the past, memories weren't ment as things that will last, don't dwell on a memory, you must set it free, or soon you will realise, soon you will see.
 A memory held onto can ruin your life, a memory not memory causes all kinds of strife. Heed to my warning, avoid this hell, 
 live life to the full and don't let yourself DWELL */


//--------------------galaxy-----------------------------
int quantity = 150;
float [] xPosition = new float[quantity];
float [] yPosition = new float[quantity];
int [] BlockSize = new int[quantity];
int [] direction = new int[quantity];
int minBlock = 1;
int maxBlock = 5;
//--------------------galaxy-----------------------------


int Wormspeed=5;
int randWorm;
boolean wormSpawn=false;
boolean wormSpawn2=false;

int randSkull;
boolean skullSpawn=false;
boolean skullActivated=false;
int skullCounter=0;


int randTime;
boolean timeSpawn=false;

boolean pause=false;
boolean instructionsUsed=false;

int score=0;
void setup()
{

  size(xAxis, yAxis);

  minim = new Minim(this);
  player = minim.loadFile("Gamemusic.mp3", 1048); //inputs audio 


  minim = new Minim(this);
  player1 = minim.loadFile("skullSound.wav", 4096);
  player.setGain(0.0);
  player1.setGain(10.0);

  Skull skull = new Skull(width, 255, 2);
  skulls.add(skull);
  //--------------------galaxy-----------------------------
  for (int i = 0; i < quantity; i++) 
  {
    BlockSize[i] = round(random(minBlock, maxBlock));
    yPosition[i] = random(0, width);
    xPosition[i] = random(0, height);
    direction[i] = round(random(0, 1));
  }
  //--------------------galaxy-----------------------------
}


int xAxis=1000;
int yAxis=xAxis/2;

boolean up=true;
boolean jump=true;
boolean dead=false;
boolean FEAR=false;
boolean OW=false;
boolean ANGER=false;
boolean SAD=false;
boolean FATIGUE=false;

int life=200;

int headSize=yAxis/12;
int headPos=height*16/20;

int wormColour=255;
boolean wormRage=false;
int wormOp=255;



void drawWorm()
{



  if (wormRage==false)
  {
    noStroke();
  }

  if (wormRage==true)
  {
    stroke(round(random(0, 255)), 0, 0);

    strokeWeight(4);
  }

  fill(wormColour, wormOp);
  rectMode(CENTER);
  rect(width/2, headPos, headSize, headSize, 5); //5 at end makes corners curved
}


int which=1;
boolean fade;
int textOp=200;
int CMOp=0;
int MOp=0;
int timePos=round(random(20, height-20));
void draw()
{

  //------------------------------------------------Worm Generating-------------------------------------------------------
  randWorm=round(random(1, 60 )); // RANDOM WORM
  if (randWorm==1)
  {
    wormSpawn=true;
  }
  if (randWorm!=1)
  {
    wormSpawn=false;
  }

  if (wormSpawn==true)
  {
    WormMan wormMan = new WormMan(yAxis/12, height*17/20, width, Wormspeed); //loads worm in from class, ground
    wormMans.add(wormMan);
  }

  if (randWorm==2)
  {
    wormSpawn2=true;
  }
  if (randWorm!=2)
  {
    wormSpawn2=false;
  }

  if (wormSpawn2==true)
  {
    WormMan wormMan = new WormMan(yAxis/12, height*3/20, width, Wormspeed ); //loads worm in from class, roof
    wormMans.add(wormMan);
  }

  //------------------------------------------------Skull Generating-------------------------------------------------------
  randSkull=round(random(1, 1000 )); // RANDOM SKULL
  if (randSkull==999)
  {
    skullSpawn=true;
  }
  if (randSkull!=999)
  {
    skullSpawn=false;
  }


  if (skullSpawn==true)
  {
    Skull skull = new Skull(width, 255, 2); //loads skull in from class
    skulls.add(skull);
  }




  //------------------------------------------------Add Time Generating-------------------------------------------------------  
  randTime=round(random(1, 600 )); // RANDOM TimeBall
  if (randTime==99)
  {
    timeSpawn=true;
  }
  if (randTime!=99)
  {
    timeSpawn=false;
  }


  if (timeSpawn==true)
  {
    Time time = new Time(width, timePos, 2); //loads health in from class
    times.add(time);
  }



  frameRate(60);
  if (player.isPlaying()==false)
  {
    player.rewind();
    player.play();
  }
  background(0);


  if (keyPressed)
  {
    if (key == ENTER&&instructionsUsed==true) //when on instruction screen and enter is pressed, go to game
    {
      which=2;
      pause=false;
    }
    if (key == ENTER&&instructionsUsed==false)// when on intro screen and enter is pressed, go to instructions
    {
      which=4;
    }
    if (key == ENTER&&dead==true&&which==3)
    {
      //setup();
      dead=false;
      which=2;
      life=200;
      skullCounter=0;
      score=0;
    }
  }

  if (which==1)//intro screen
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

    if (CMOp==0) //Opacity of darkness 
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
    float Op=random(0, 255)-100; //enter flicker
    fill(255, Op);
    text("Press Enter to start:", width/2, height/4);
  }

  if (which==4)//instructions screen
  {
    Instructions(); //calls Instructions
    pause=true;
  }

  if (which==2&&loadComplete==true)
  {
    background(0, 0, 0);

    noStroke();


    //--------------------galaxy-----------------------------
    for (int i = 0; i < xPosition.length; i++) 

    {
      //fill(round(random(0, 80)), 0, 0);
      fill(round(random(0, 180)));
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
      //--------------------galaxy-----------------------------
      //fill(80, 0, 0);
      fill(80);
      rectMode(CORNER);
      rect(0, 0, width, yAxis/12);
      rect(0, height-(yAxis/12), width, yAxis/10);
    }


//main game code
    drawWorm(); 


    int ground=height*17/20;
    int roof=height*3/20;
    if (ANGER==true)
    {
      ground=height*16/20;
      roof=height*4/20;
    }
    if (SAD==true)
    {
      ground=height*18/20;
      roof=height*5/40;
    }
    if (SAD==false&&ANGER==false)
    {

      ground=height*17/20;
      roof=height*3/20;
    }


    if (jump==false&&headPos>roof)
    {
      headPos-=15;
    }
    if (jump==true&&headPos<ground)
    {
      headPos+=15;
    }

    if (pause==false)
    {
      for (int i = wormMans.size () - 1; i >= 0; i --)
      {
        WormMan go =wormMans.get(i);
        go.update();
        go.render();
      }

      if (skullActivated==false)
      {
        for (int i = skulls.size () - 1; i >= 0; i --)
        {
          Skull go =skulls.get(i);
          go.update();
          go.render();
        }
      }

      for (int i = times.size () - 1; i >= 0; i --)
      {
        Time go =times.get(i);
        go.update();
        go.render();
      }
    }

    if (FEAR==true)
    {
      fill(0, 160);
      noStroke();
      rect(0, 0, width, height);
    }
  }


  checkDetect();
  if (which==2)
  {
    checkLife();
    if (skullActivated==true)
    {
      checkActivateSkull();
    }

    skullText();
    if (dead==true)
    {
      pause=true;
      which=3;
    }
  }
}//------END OF DRAW
void keyPressed()
{
  if (key==' ') //jumping animation
  {
    jump=!jump;
  }
  if (key=='p')
  {
    pause=!pause;
  }
}

int WormHitbox=30;
void checkDetect() //hit dectection
{
  if (loadComplete==true)
  {
    for (int i = wormMans.size () - 1; i >= 0; i --)
    {


      WormMan go =wormMans.get(i);
      
      if (go.BadheadPosx<=-10)
      {
        wormMans.remove(i);// removes worms as they leave screen
      }
      if (headPos>height*16/20-WormHitbox&&go.BadheadPosx<width/2+WormHitbox&&go.BadheadPosx>width/2-WormHitbox&&go.BadheadPosy>height/2)
      {

        println("WORKING BOTTOM");
        wormMans.remove(i); //removed when hit worm
        life-=20;
        if (life==0||life<0)//if out of health, die!
        {
          dead=true;
        }
      }
      if (headPos<height*3/20+WormHitbox&&go.BadheadPosx<width/2+WormHitbox&&go.BadheadPosx>width/2-WormHitbox&&go.BadheadPosy<height/2)
      {
        println("WORKING TOP");
        wormMans.remove(i);//removed when hit worm
        life-=20;
        if (life==0||life<0)//dying yep
        {
          dead=true;
        }
      }
    }

    for (int i = skulls.size () - 1; i >= 0; i --) //skull array
    {
      Skull go =skulls.get(i);
      if (headPos<height/2+30&&headPos>height/2-30&&go.skullMove<width/2+30&&go.skullMove>width/2-30)
      {
        println("SKULL ACTIVATED!!");
        skullActivated=true;
        skullCounter++;
        skulls.remove(i);//skulls removed when caught
        skullEffect();
      }
    }


    for (int i = times.size () - 1; i >= 0; i --)//health array
    {
      Time go =times.get(i);
      if (go.timeMove<width/2+WormHitbox&&go.timeMove>width/2-WormHitbox&&go.timeBounce>headPos&&go.timeBounce<headPos+headSize )
      {
        //println("time collected");
        println("health collected");
        times.remove(i);//ball removed when picked up
        if (life<200)
        {
          life+=10;
        }
      }
    }
    fill(255);



    int m=0;
    m=millis();
    int mD=m/1000;//only shows seconds, not milis
    if (dead==false)
    {
      score=mD*skullCounter;//score = time*skulls collected
    }
    if (which==2)//main game text
    {
      textSize(24);
      text("life:"+life, width*19/20, height*39/40);
      text("Time Survived: "+mD, width*2/20, height*39/40);
      text("Skulls Collected: "+skullCounter, width*2/20, height*2/40);

      text("Score: "+score, width*18/20, height*2/40);
    }
    if (which==3)//dead screen
    {
      EndScreen();
    }
  }
}
void checkLife()
{
  //strokeWeight(5);
  //stroke(0,100,0);
  if (life<100&&dead==false)
  {
    stroke(0, 0, 0,round(random(0, 255)));
    strokeWeight(5);
  }
  fill(85, 255, 0);
  rectMode(CENTER);
  rect(width/2, height*19/20, life, 10);
}
int skullDelay=0;
int skullTextFade=0;
int skullTextFade1=250;
void checkActivateSkull()
{
  if (player1.isPlaying()==false)//skull sound
  {
    player1.rewind();
    player1.play();
  }


  if (skullDelay==500)//skull activation time
  {
    skullActivated=false;      //resets all variables possibly changed during skulls after skull
    skullDelay=0;
    println("Skulls have returned");
    skullTextFade=250;
    skullTextFade1=250;

    Wormspeed=5;
    headSize=yAxis/12;
    WormHitbox=30;
    wormRage=false;
    wormOp=255;
    FEAR=false;
    OW=false;
    FATIGUE=false;
    ANGER=false;
    SAD=false;
    skullType=0;
  }
  skullDelay++;
}
void skullText()//text for all skulls, required for text to stay on screen and fade
{
  if (skullTextFade!=0)
  {
    textAlign(CENTER);
    fill(255, skullTextFade);
    textSize(32);
    text("The Skulls have returned", width/2, height/2);
    skullTextFade--;
  }

  if (OW==true&&skullTextFade1!=0)
  {
    textAlign(CENTER);
    fill(255, skullTextFade1);
    textSize(45);
    text("OVERWHELMED!", width/2, height/2);
    skullTextFade1--;
  }
  if (FEAR==true&&skullTextFade1!=0)
  {
    textAlign(CENTER);
    fill(255, skullTextFade1);
    textSize(45);
    text("FEAR!", width/2, height/2);
    skullTextFade1--;
  }
  if (FATIGUE==true&&skullTextFade1!=0)
  {
    textAlign(CENTER);
    fill(255, skullTextFade1);
    textSize(45);
    text("FATIGUE!", width/2, height/2);
    skullTextFade1--;
  }
  if (ANGER==true&&skullTextFade1!=0)
  {
    textAlign(CENTER);
    fill(255, skullTextFade1);
    textSize(45);
    text("ANGER!", width/2, height/2);
    skullTextFade1--;
  }
  if (SAD==true&&skullTextFade1!=0)
  {
    textAlign(CENTER);
    fill(255, skullTextFade1);
    textSize(45);
    text("SADNESS!", width/2, height/2);
    skullTextFade1--;
  }
}
int skullType;
void skullEffect()//for the effects of skulls, changes game elements
{


  skullType=round(random(1, 5));
  //skullType=3;

  if (skullType==2)
  {
    println("Overwhelmed!");
    OW=true;
    Wormspeed=10;
  }

  if (skullType==1)
  {
    println("FATIGUE!!"); 
    FATIGUE=true;
    Wormspeed=2;
  }

  if (skullType==3)
  {
    println("ANGER!"); 
    ANGER=true;
    headSize=yAxis/12*2;
    WormHitbox=55;
    wormRage=true;
  }

  if (skullType==4)
  {
    println("FEAR!"); 
    FEAR=true;
  }
  if (skullType==5)
  {
    println("SAD!");
    headSize=yAxis/24*1;
    WormHitbox=25;
    SAD=true;
    wormOp=200;
  }
}

void EndScreen()//dead screen 
{
  PImage bgE;

  bgE = loadImage("GameDeadMenu.png");
  background(bgE);

  if (CMOp==0)//end screen fading
  {
    MOp+=2;
  }
  if (MOp>=255)
  {
    CMOp=1;
  }

  if (CMOp==1)
  {
    MOp-=2;
    if (MOp<=0)
    {
      CMOp=0;
    }
  }

  fill(0, MOp);
  rect(width/2, height/2, width, height);

  fill(MOp);
  textAlign(CENTER);
  textSize(50);
  text("Your survival score:", width/2, height*1/3);
  text(score, width/2, height*4/9);
}
int instructionTimer=20;
int loadOp=255;
int EOp=0;
boolean loadComplete=false;
int starwars=-10;
int starwarsfade=255;
int starwarswhich=round(random(0, 2));

void Instructions()//instructions page code
{

  //different tips, scroll down screen fading as they go, in order, starting at random tip and looping
  fill(255, starwarsfade);
  if (starwarswhich==0)
  {
    text("Skulls alter your memory, mostly for bad.\nHowever they also act as score multipliers so dont miss them!", width/2, starwars);
  }
  if (starwarswhich==1)
  {
    text("Health orbs, when collected, add additional life.\nHowever they only count for half of what a worm will take away!", width/2, starwars);
  }
  if (starwarswhich==2)
  {
    text("Worms are easy to avoid and inflict small damage.\n But in a group can be deadly!", width/2, starwars);
  }
  if (starwarswhich==3)
  {
    text("Worms tails wont cause damage.\nUse this to your advantage!", width/2, starwars);
  }

  starwars++;
  if (starwars>height*3/10)
  {
    starwarsfade--;
  }
  if (starwarsfade==0&&starwarswhich==0)
  {
    starwarswhich=1;
    starwarsfade=255;
    starwars=0;
  }
  if (starwarsfade==0&&starwarswhich==1)
  {
    starwarswhich=2;
    starwarsfade=255;
    starwars=0;
  }
  if (starwarsfade==0&&starwarswhich==2)
  {
    starwarswhich=3;
    starwarsfade=255;
    starwars=0;
  }
  if (starwarsfade==0&&starwarswhich==3)
  {
    starwarswhich=0;
    starwarsfade=255;
    starwars=0;
  }

  if (EOp==160)//stops enter being pressed before ready
  {

    instructionsUsed=true;
  }
  if (EOp<255)//fades load bar
  {
    instructionTimer--;
  }
  int loadingBar=-instructionTimer*5;

  println(instructionTimer);
  if (loadingBar>width)
  {
    loadOp-=4;
    EOp++;
    loadComplete=true;
  }

  fill(255, loadOp);
  rect(0, height*19/20, loadingBar, height);
  if (loadComplete==true)//fades in continue text when bar is full
  {
    textAlign(CENTER);
    fill(255, EOp);
    text("Enter to Continue:", width/2, height*19/20); 
  }

  fill(0);
  rect(0, 0, width, height*4/40);
  fill(255);
  text("Tips:", width/2, height*3/40);
}

