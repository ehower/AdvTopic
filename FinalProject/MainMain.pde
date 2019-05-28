color col = color(216);
int state;
int tempX, tempY, limiter, radiusT, buttonW, buttonH, buttonOffX, buttonOffY;
boolean grew = false;

void settings()
{
    fullScreen(); 
}
void setup() {  // setup() runs once
  frameRate(60);
  //rendering images, needs to be 1 more than boxes loop, factors in the menu itself
  state = 0;
  tempX = width/2;
  tempY = height/2;
  radiusT = 0;
  limiter = 100;
  buttonW = width/4;
  buttonH = height/4;
  buttonOffX = (tempX-buttonW)/2;
  buttonOffY = (tempY-buttonH)/2;
  ellipseMode(CENTER);
}

Circle c = new Circle(radiusT, tempX, tempY);
//height width are keywords, mouseX, mouseY
void draw() 
{  // draw() loops forever, until stopped
  background(col);
  //tester sample code - Logic behind the growing circle
    c.wallDetection();
    c.show();
    radiusT = c.getRadius();
    if(!c.maxRadius(radiusT) && !grew)
  {
    c.grow();
  }
   else
     grew = true;
     
  if(grew && !c.minRadius(radiusT))
  {
    c.shrink();
  }
    if(state == 0)
    {
    
    //size of text smh
    noFill();
    rectMode(CORNER);  // Set rectMode to CENTER
    fill(100);  // Set fill to gray
    //-buttonOffY
    //-buttonOffX
    rect(tempX-buttonOffX, tempY-buttonOffY+height/3, buttonW, buttonH);  // Draw gray rect using CENTER mode    
    
    textSize(64);
    textAlign(CENTER, CENTER);
    fill(0, 102, 153, 51);
    //String, X,Y 
    //text(s, 10, 10, 70, 80);
    text("This is what it looks like with much more! I have never seen a man who was able to best me in a battle!", 0, 0, width, height);
    //color to fill it with
    //can use Hex or the Visual value components
  //ebic circle working
  //stroke(255);
  //ellipse(tempX, tempY, radiusT, radiusT);
    }
}

void mousePressed() 
{
  if (mouseX < tempX-buttonOffX + buttonW && mouseX > tempX-buttonOffX)
  {
    if (mouseY < tempY-buttonOffY + height/3 + buttonH && mouseY > tempY-buttonOffY + height/3)
      state = 1;
  }
}

//kicks out of the program
boolean escapePressed() 
{
  if (keyCode == ESC) 
  {
    return true;
  } 
  return false;
}
