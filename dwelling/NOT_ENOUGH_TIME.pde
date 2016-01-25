class Time
{

  float timeMove;
  int timeSpeed;
  float timeBounce;

  boolean timeUp=false;


  int expand;
  int expandOp;

  Time(float timeMove, float timeBounce, int timeSpeed)
  {
    this.timeMove=timeMove;
    this.timeSpeed=timeSpeed;
  }


  void update()
  {
    timeMove-=timeSpeed/2;
    if (timeBounce>height-70)
    {
      timeUp=true;
    }
    if (timeBounce<70)
    {
      timeUp=false;
    }
    if (timeUp==true)
    {
      timeBounce-=timeSpeed*2;
    }
    if (timeUp==false)
    {
      timeBounce+=timeSpeed*2;
    }
  }





  void render()
  {

    fill(51, 51, 255, 90);
    stroke(51, 51, 255, 95);
    strokeWeight(2);
    ellipse(timeMove, timeBounce, 40, 40);
    noFill();
    stroke(51, 51, 255, expandOp);
    //fill(51,51,255,expandOp);
    strokeWeight(5);
    ellipse(timeMove, timeBounce, expand, expand);
    expand++;
    expandOp-=1;
    if (expand>100)
    {
      expand=40;
      expandOp=100;
    }
  }
}

