class Circle
{
 int radius, x, y, maxRadius = 200;
 boolean notGrowing;

//checks the x and y values of the circle, if the circle is touching a screen border it is relocated
 public void wallDetection()
   {
   //runs the while loop if any coordinates are within the screen boundaries
     while(x < maxRadius/2 || y + maxRadius/2 > height || x + maxRadius/2 > width || y < maxRadius/2)
    {
      if(x + maxRadius/2 > width || x < maxRadius/2)
      {
        x = (int)(Math.random() * width);
      }
        
      if(y + maxRadius/2 > height || y < maxRadius/2)
      {
        y = (int) (Math.random() * height);
        
      }
      
    }
   }

 Circle(int r)
  {
    radius = r;
    x = 0;
    y = 0;
    this.notGrowing = false;
  }
  
  Circle(int xPos, int yPos, int r)
  {
    radius = r;
    x = xPos;
    y = yPos;
    this.notGrowing = false;
  }  
   
  public boolean maxRadius(int r)
  {
    return (r >= maxRadius);
  }
  
  public boolean minRadius(int r)
  {
    return (r <= 0);    
  }
  
  void show()
  {
    ellipse(x,y,radius, radius);
  }
  
  void grow()
  {
    radius += 1;
  }
  
  void shrink()
  {
    radius -= 1;
  }
  
  //getters and setters
  
  public int getRadius()
  {
    return radius;
  }
  
  public void setRadius(int r)
  {
    radius = r;
  }
  
  public int getMaxRadius()
  {
    return maxRadius;
  }
    public int getX()
  {
    return x;
  }
  
  public int getY()
  {
    return y;
  }
  
  public void setX(int n)
  {
    x = n;
  }
  
  public void setY(int n)
  {
    y = n;
  }
  
  public void setNotGrowing(boolean b)
  {
    this.notGrowing = b;
  }
 
  public boolean getNotGrowing()
  {
    return this.notGrowing;
  }
  
}
