class Characters
{
  private PImage _img;
  private PImage _img2;
  private String _name;
  private int _x;
  private int _y;
  private int _w;
  private int _h;
  private boolean _isActive;

Characters (PImage img, PImage img2, String name, int x, int y, int w, int h, boolean isActive)
{
  _img = img;
  _img2 = img2;
  _name = name;
  _x = x; 
  _y = y; 
  _w = w;
  _h = h;
  _isActive = isActive;
}

public void  Draw1()
{
  image(_img,_x,_y);
  _img.resize(_w,_h);
  player.play();
}

public void  Draw2()
{
  image(_img2,_x,_y);
  _img2.resize(_w,_h);
  player.pause();
}

public void Active()
{
  if (_isActive)
  {
    Draw1();
  }
  if(dist(
  }

public void Draw()
{
  if (_isActive)
  {
    Draw2();
  }
}