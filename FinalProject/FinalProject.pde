class Circle
{
 int radius, x, y, maxRadius = 200;
 boolean notGrowing;

 public void wallDetection()
   {
     while(x < maxRadius || y + maxRadius > height || x + maxRadius > width || y < maxRadius)
    {
      if(x + maxRadius > width || x < maxRadius)
      {
        x = (int)(Math.random() * width);
      }
        
      if(y + maxRadius > height || y < maxRadius)
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
