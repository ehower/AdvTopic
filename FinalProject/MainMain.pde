color col = color(216);
int state;
double circleClicks, totalClicks, totalCircles;
int tempX, tempY, limiter, radiusT, buttonW, buttonH, buttonOffX, buttonOffY, counter, circleCounter, removalIndex;
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
    //creates a new circle, then counts the circle towards the total
    currentBubbles.add(new Circle(0));
    totalCircles++;
  }
  for(Circle c: currentBubbles)
  {
    //makes sure no circles are touching the outer edge
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
  
  //loops as long as the timer is still running and the game is at the proper stage
  if(state == 1 && counter <= 2000)
  {
    if(counter % 35 == 0)
    {
      //a new circle is added based on the amount of frames (with counter % 35, a new circle is added around every half-second)
      currentBubbles.add(new Circle(0));
      //certifies that the new circle is not touching the edge of the screen, keeps track of total circles
      currentBubbles.get(currentBubbles.size()-1).wallDetection();
      totalCircles++;
    }
    circleCounter = 0;
    removalIndex = -1;
    for(Circle c: currentBubbles)
    {
      //displays each circle on the screen
      c.show();
      //sets the local radius variable equal to the radius of circle c
      radiusT = c.getRadius();
      
      //increases the size of the circle as long as it has not yet hit the max size
      if(!c.maxRadius(radiusT) && !c.getNotGrowing())
      {
        c.grow();
      }
      //prevents the circle from repeatedly growing
       else
         c.setNotGrowing(true);
       
      //decreases the size of the circle until it is nonexistant
      if(c.getNotGrowing() && !c.minRadius(radiusT))
      {
        c.shrink();
      }
      //removes the circle from the arraylist of circles
      if(c.getNotGrowing() && c.minRadius(radiusT))
      {
        removalIndex = circleCounter;
      }
      circleCounter++;
    }
    if(removalIndex > -1)
       currentBubbles.remove(removalIndex);
    
    //moves the game into its third state when the timer runs out
    if(counter == 2000)
      state = 2;
  }
  
  

  
  if(state == 0)
  {
  
  //size of text 
  noFill();
  rectMode(CORNER);  // Set rectMode to CORNER
  fill(100);  // Set fill to gray
  //-buttonOffY
  //-buttonOffX
  rect(tempX-buttonOffX, tempY-buttonOffY+height/3, buttonW, buttonH);  // Draw gray rect using CORNER mode    
  
  textSize(64);
  textAlign(CENTER, CENTER);
  fill(0, 102, 153, 51);
  //String, X,Y 
  //text(s, 10, 10, 70, 80);
  text("Mouse Accuracy Test", 0, 0, width, height);
  
  //changes fill to dark blue in order to make start text readable
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

//does an action when the mouse is pressed
void mousePressed() 
{
  //checks to see if the user clicks the start button
  if(state == 0)
  {
    if (mouseX < tempX-buttonOffX + buttonW && mouseX > tempX-buttonOffX)
    {
      if (mouseY < tempY-buttonOffY + height/3 + buttonH && mouseY > tempY-buttonOffY + height/3)
        state = 1;
    }
  }
  
  //allows the user to click circles during state 1
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
      totalClicks++;//counts the user's click despite them missing
    else
      {
        circleClicks++;
        totalClicks++;
        currentBubbles.remove(index);//removes the circle that the user pressed from the arraylist
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
