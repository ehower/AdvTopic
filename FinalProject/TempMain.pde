color colour = color(216);
int state;
int tempX = 100, tempY = 100, limiter, radiusT = 100;
Circle c = new Circle(radiusT, tempX, tempX);
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
  c.show();
  radiusT = c.getRadius();
  
  if(!c.maxRadius(radiusT) && !grew) 
    c.grow();
   else
     grew = true;
     
  if(grew && !c.minRadius(radiusT))
    c.shrink();
    
  c.show();

  
  
}

boolean escapePressed()
{
  return (keyCode == ESC);
}
