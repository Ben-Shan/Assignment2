class Skull
{
  float skullMove;
  int skullSpeed;
  int skullCol;
  

//  Skull()
//  {
//    // Constructor chaining. Call a constructor in the super class
//    super(width * 0.5f, height  * 0.5f, 50);     
//    println("In Ship DEfault Constructor");
//  }

  Skull(float skullMove,int skullCol,int skullSpeed)
  {
    //super(startX, startY, 50);
    this.skullMove = skullMove;
    this.skullCol = skullCol;
    this.skullSpeed = skullSpeed;

  }

  void update()
  {

      skullMove-=skullSpeed;

  }
  float skullRotate=0;
  int skullbounce=5;
  int skullbounce2=20;
  boolean skullIn=false;
  boolean skullIn2=true;
  void render()
  {
    fill(skullCol);
    ellipse(skullMove, height/2, 10, 10);
//skull rotation
    pushMatrix();
    translate(skullMove, height/2);
    rotate(radians(skullRotate));
    ellipse(skullbounce, skullbounce, 10, 10);
    ellipse(-skullbounce, -skullbounce, 10, 10);
    ellipse(skullbounce, -skullbounce, 10, 10);
    ellipse(-skullbounce, skullbounce, 10, 10);

    ellipse(skullbounce2, skullbounce2, 5, 5);
    ellipse(-skullbounce2, -skullbounce2, 5, 5);
    ellipse(skullbounce2, -skullbounce2, 5, 5);
    ellipse(-skullbounce2, skullbounce2, 5, 5);
    popMatrix();
    skullRotate+=1;
    //skull balls expandinf
    if (skullIn==false)
    {
      skullbounce++;
      if (skullbounce==20)
      {
        skullIn=true;
      }
    }
    if (skullIn==true)
    {
      skullbounce--;
      if (skullbounce==5)
      {
        skullIn=false;
      }
    }
    //----
    if (skullIn2==false)
    {
      skullbounce2++;
      if (skullbounce2==40)
      {
        skullIn2=true;
      }
    }
    if (skullIn2==true)
    {
      skullbounce2--;
      if (skullbounce2==5)
      {
        skullIn2=false;
      }
    }
  }
}

