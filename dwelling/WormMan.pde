class WormMan
{

  boolean up=false;
  
  int BadheadSize;
  int BadheadPosy;
  int BadheadPosx;

  int headTop;
  int headBottom;

  int BadbodySize=BadheadSize*2/3;
  int BadbodyPosx=BadbodyPosx=BadheadPosx+(xAxis/25);
  int BadbodyPosy=BadheadPosy;

  int BadtailSize=BadheadSize*1/3;
  int BadtailPosx=BadtailPosx=BadheadPosx+(xAxis/15);
  int BadtailPosy=BadheadPosy;

  int Wormspeed;
  
    WormMan(int BadheadSize, int BadheadPosy, int BadheadPosx, int Wormspeed, int headTop, int headBottom)
  {

    this.BadheadSize = BadheadSize;
    this.BadheadPosy = BadheadPosy;
    this.BadheadPosx = BadheadPosx;
    this.Wormspeed = Wormspeed;
    this.headTop = headTop;
    this.headBottom = headBottom;
//    this.BadbodySize=BadbodySize;
//    this.BadbodyPosx=BadbodyPox;
//    this.BadbodyPosy=BadbodyPosy;

  }



  void update()
  {
    //if (BadheadPosx>-55)
    //{
      BadheadPosx-=Wormspeed;
    //}
//    if(BadheadPosx<-55)
//    {
//      BadheadPosx=width;
//    }

    //BadbodyPosx=BadheadPosx+(xAxis/25);

    //BadtailPosx=BadheadPosx+(xAxis/15);
  }

  void render()
  {
    fill(100, 0, 0);
    stroke(0);
    rectMode(CENTER);
    rect(BadtailPosx, BadtailPosy, BadtailSize, BadtailSize);
    rect(BadbodyPosx, BadbodyPosy, BadbodySize, BadbodySize);
    rect(BadheadPosx, BadheadPosy, BadheadSize, BadheadSize);
    stroke(255);


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

