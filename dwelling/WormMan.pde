class WormMan 
{

  boolean up=true;

  int BadheadSize;
  int BadheadPosy;
  int BadheadPosx;

  int BadbodySize;
  int BadbodyPosx;
  int BadbodyPosy;
  int BadtailSize;
  int BadtailPosx;
  int BadtailPosy;

  int headTop= height*17/20+height/30;
  int headBottom= height*17/20-height/30;




  int Wormspeed;


  WormMan(int BadheadSize, int BadheadPosy, int BadheadPosx, int Wormspeed)
  {

    this.BadheadSize = BadheadSize;
    this.BadheadPosy = BadheadPosy;
    this.BadheadPosx = BadheadPosx;
    this.Wormspeed = Wormspeed;
    //this.headTop = headTop;
    //this.headBottom = headBottom;
    //    this.BadbodySize=BadbodySize;
    //    this.BadbodyPosx=BadbodyPosx;
    //    this.BadbodyPosy=BadbodyPosy;

    BadbodySize=BadheadSize*2/3;
    //int BadbodyPosx=BadheadPosx+(width/25);
    BadbodyPosx=BadheadPosx+(width/25);
    BadbodyPosy=BadheadPosy;

    BadtailSize=BadheadSize*1/3;
    //int BadtailPosx=BadheadPosx+(width/15);
    BadtailPosx=BadheadPosx+(width/15);
    BadtailPosy=BadheadPosy;
  }





  void update()
  {

    BadheadPosx-=Wormspeed;
    println(BadheadSize*2/3);
    println(BadtailPosx);
  }


  void render()
  {
    fill(100, 0, 0);
    noStroke();
    rectMode(CENTER);
    rect(BadheadPosx, BadheadPosy, BadheadSize, BadheadSize);



    rectMode(CORNER);
    rect(BadtailPosx, BadtailPosy, BadtailSize, BadtailSize);
    rect(BadbodyPosx, BadbodyPosy, BadbodySize, BadbodySize);

    //stroke(255);


    if (BadbodyPosy==headTop)
    {
      up=true;
    }
    if (BadbodyPosy==headBottom)
    {
      up=false;
    }
    if (up==true)
    {

      BadbodyPosy-=2;
      BadtailPosy+=1;
    }
    if (up==false)
    {

      BadbodyPosy+=2;
      BadtailPosy-=1;
    }
  }
}

