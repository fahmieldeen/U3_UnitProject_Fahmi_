class Characters
{
  private PImage _img;
  private PImage _img2;
  private int _x;
  private int _y;
  private int _w;
  private int _h;

  Characters (PImage img, PImage img2, int x, int y, int w, int h)
  {
    _img = img;
    _img2 = img2;
    _x = x; 
    _y = y; 
    _w = w;
    _h = h;
  }

  public void  Draw1()
  {
    image(_img, _x, _y);
    _img.resize(_w, _h);
    player.play();
  }

  public void  Draw2()
  {
    image(_img2, _x, _y);
    _img2.resize(_w, _h);
    player.pause();
  }
}