color col = color(216);
int state;
int tempX, tempY, limiter, radiusT, buttonW, buttonH, buttonOffX, buttonOffY, counter;
ArrayList<Circle> currentBubbles = new ArrayList<Circle>();

void settings()
{
    fullScreen(); 
}
void setup() {  // setup() runs once
  frameRate(60);
  counter = 0;
  //rendering images, needs to be 1 more than boxes loop, factors in the menu itself
  state = 0;
  tempX = width/2;
  tempY = height/2;
  radiusT = 0;
  buttonW = width/4;
  buttonH = height/4;
  buttonOffX = (tempX-buttonW)/2;
  buttonOffY = (tempY-buttonH)/2;
  ellipseMode(CENTER);
  
  for(int i = 0; i < 1; i++)
  {
    //int r, int xPos, int yPos
    currentBubbles.add(new Circle(0));
  }
  for(Circle c: currentBubbles)
  {
   c.wallDetection();
  }
}

//height width are keywords, mouseX, mouseY
void draw() 
{  // draw() loops forever, until stopped
  counter++;
  background(col);
  //tester sample code - Logic behind the growing circle
  
  //loop aroo
  if(state == 1 && counter <= 600)
  {
    if(counter % 10 == 0)
    {
      currentBubbles.add(new Circle(0));
      currentBubbles.get(currentBubbles.size()-1).wallDetection();
    }
    for(Circle c: currentBubbles)
    {
      c.show();
      radiusT = c.getRadius();
      if(!c.maxRadius(radiusT) && !c.getNotGrowing())
      {
        c.grow();
      }
       else
         c.setNotGrowing(true);
         
      if(c.getNotGrowing() && !c.minRadius(radiusT))
      {
        c.shrink();
      }
      if(c.getNotGrowing() && c.minRadius(radiusT))
      {
        c.setNotGrowing(false);
      }
    }
    for(Circle c: currentBubbles)
    {
      System.out.println("Obj: " + c.getRadius());
    }
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
  if(state == 0)
  {
    if (mouseX < tempX-buttonOffX + buttonW && mouseX > tempX-buttonOffX)
    {
      if (mouseY < tempY-buttonOffY + height/3 + buttonH && mouseY > tempY-buttonOffY + height/3)
        state = 1;
    }
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
