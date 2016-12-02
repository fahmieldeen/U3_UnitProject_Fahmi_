class Characters
{
  private PImage _img;
  private String _name;
  private int _x;
  private int _y;
  private int _w;
  private int _h;

Characters (PImage img, String name, int x, int y, int w, int h)
{
  _img = img;
  _name = name;
  _x = x; 
  _y = y; 
  _w = w;
  _h = h;
}

public void Draw()
{
  image(_img, _x, _y);
  _img.resize(_w, _h);
}

public void Collision()
{
  if (x < _x && x > _x +_w && y < _y && y > _y + _h) 
  {
    
  }

}