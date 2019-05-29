color col = color(216);
int state;
double circleClicks, totalClicks, totalCircles;
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
    totalCircles++;
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

  if(state == 2)
  {
     fill(0, 102, 153, 51);
     //Shows the amount of circles hit in comparison to the total amount of on-screen circles
     text("Circles Hit: " + circleClicks + "/" + (totalCircles - 1) + " (HITS/TARGETS)", 0, 0, width, height/3);
     //Shows the amount of circles the user clicked in comparison to how many on-screen circles there were
     text("Accuracy: " + circleClicks + "/" + (totalClicks - 1) + " (HITS/CLICKS)", 0, height/3, width, height/3);
     //Calculates user efficiency by taking the average of the above two calculations
     text("Efficiency: " + (int)((((circleClicks/totalCircles) + (circleClicks/totalClicks))/2.0) * 100) + "% (Average of Above Statistics)", 0, height - (height/3), width, height/3);
     
  }
  
  //loop aroo
  if(state == 1 && counter <= 2000)
  {
    if(counter % 10 == 0)
    {
      currentBubbles.add(new Circle(0));
      currentBubbles.get(currentBubbles.size()-1).wallDetection();
      totalCircles++;
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
    
    if(counter == 2000)
      state = 2;
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
  text("Mouse Accuracy Test", 0, 0, width, height);
  
  fill(65, 105, 225);
  text("Start", tempX-buttonOffX, tempY-buttonOffY+ height/3, buttonW, buttonH);
  
  fill(0, 102, 153, 51);
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
  
  if(state == 1)
  {
    double closeDist = 1400;
    int index = 0;
    for(Circle c: currentBubbles)
    {
      //Checks if the user's mouse is within the boundaries of the circle
      if(dist(mouseX, mouseY, c.getX(), c.getY()) < closeDist && dist(mouseX, mouseY, c.getX(), c.getY()) < c.getRadius()/2)
      {
        //finds the circle index with the closest distance to the user mouse (in case the user clicks two overlapping circles)
        closeDist = dist(mouseX, mouseY, c.getX(), c.getY());
        index = currentBubbles.indexOf(c);
      }
    }
    
    if(closeDist == 1400)
      totalClicks++;
    else
      {
        circleClicks++;
        totalClicks++;
        currentBubbles.remove(index);
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
