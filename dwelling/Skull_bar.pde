class Skull_bar //un used
{
  float Iconx=-100;
  float Icony=height*2/3;
  

  Skull_bar(float Iconx, float Icony)
  {
    this.Iconx=Iconx;
    this.Icony=Icony;
  }

  void update()
  {
    IconAnimation();
  }

  float IconRotate=0;

  void render()
  {
    fill(255);
    ellipse(Iconx, Icony, height/3, height/3);

//      pushMatrix();
//    rect(20, 20, 20, 50);
//    rect(-20, 20, 20, 50);
//    rect(-20, -20, 20, 50);
//    rect(20, -20, 20, 50);
//    translate(Iconx, Icony);
//    rotate(radians(IconRotate));
//    popMatrix();
//    IconRotate++;
  }
  //int frameCounting=frameCount;
  void IconAnimation()
  {
    
    if (Iconx<200)
    {
      Iconx+=5;
    }
    if (Iconx>200&&frameCount==120)
    {
      Icony--;
    }
  }
}
