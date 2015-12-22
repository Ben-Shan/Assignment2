class WormMan
{

  boolean up=false;
  
  int BadheadSize=yAxis/12;
  int BadheadPosy=height*17/20;
  int BadheadPosx=width;

  int headTop=height*17/20+yAxis/30;
  int headBottom=height*17/20-yAxis/30;

  int BadbodySize=BadheadSize*2/3;
  int BadbodyPosx;
  int BadbodyPosy=BadheadPosy;

  int BadtailSize=BadheadSize*1/3;
  int BadtailPosx;
  int BadtailPosy=BadheadPosy;




  void update()
  {
    if (BadheadPosx>-10)
    {
      BadheadPosx-=.1;
    }

    BadbodyPosx=BadheadPosx+(xAxis/25);

    BadtailPosx=BadheadPosx+(xAxis/15);
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

