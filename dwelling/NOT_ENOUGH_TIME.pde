class Time
{

  float timeMove;
  int timeSpeed;
  float timeBounce;

  int expand;
  int expandOp;

  Time(float timeMove, float timeBounce, int timeSpeed)
  {
    this.timeMove=timeMove;
    this.timeSpeed=timeSpeed;
  }

  void update()
  {
    timeMove-=timeSpeed;
    if (timeBounce>20)
    {
      timeBounce+=timeSpeed/2;
    }
    if (timeBounce<20)
    {
      timeBounce-=timeSpeed/2;
    }
  }

  void render()
  {

    noFill();
    stroke(51, 51, 255);
    strokeWeight(5);
    ellipse(timeMove, height/2, 40, 40);
    stroke(51, 51, 255, expandOp);
    ellipse(timeMove,height/2, expand, expand);
    expand++;
    expandOp-=5;
    if (expandOp==0)
    {
      expand=40;
      expandOp=100;
    }
  }
}

