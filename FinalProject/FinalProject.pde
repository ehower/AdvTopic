class Circle
{
  
  int radius, x, y, maxRadius = 200;

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
 
  
  Circle(int r, int xPos, int yPos)
  {
    radius = r;
    x = xPos;
    y = yPos;
  }
 
  
  
  public int getRadius()
  {
    return radius;
  }
  
  public void setRadius(int r)
  {
    radius = r;
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
  
  
  public boolean maxRadius(int r)
  {
    return (r > 200);
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
  
  void circleCollision(Circle c1, Circle c2)
  {
      
  }
}
