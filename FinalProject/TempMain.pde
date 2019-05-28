/*color colour = color(216);
int state;
int tempX = 100, tempY = 100, limiter, radiusT = 100;
Circle c = new Circle(radiusT, tempX, tempY);
Circle c2 = new Circle(radiusT, tempX, tempY);
boolean grew = false;

public void settings()
{
  fullScreen();
}
void setup()
{
  frameRate(60);
  
}

void draw()
{
  background(colour);

  c.wallDetection();
  c2.wallDetection();
  c.show();
  c2.show();
  radiusT = c.getRadius();
  System.out.println(circleCollision(c, c2));
  
  if(!c.maxRadius(radiusT) && !grew)
  {
    c.grow();
    c2.grow();
  }
   else
     grew = true;
     
  if(grew && !c.minRadius(radiusT))
  {
    c.shrink();
    c2.shrink();
  }

  
  
}

boolean escapePressed()
{
  return (keyCode == ESC);
}

boolean circleCollision(Circle c1, Circle c2)
  {
      return (dist(c1.getX(), c1.getY(), c2.getX(), c2.getY()) < c1.getMaxRadius()); 
  }*/
