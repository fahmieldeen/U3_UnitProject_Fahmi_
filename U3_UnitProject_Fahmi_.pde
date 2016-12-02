import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

import org.openkinect.processing.*; 
import org.openkinect.freenect.*;

Kinect kinect;
KinectTracker tracker;

Minim minim;
AudioPlayer player;  

int skip = 8;

float newPointx;
float newPointy;
int collisionx = 200 ;
int collisionx2 = 440 ;
int collisiony = 260;
int collisiony2 = 260;
PImage normalbrad;
PImage slappedbrad;
PImage bradbuttowski;

void setup() 
{
  size(640, 520);
  minim = new Minim(this);
  player = minim.loadFile("");
  kinect = new Kinect(this);
  tracker = new KinectTracker();
  kinect.initDepth();
  
}

void draw()
{
    background(255);
slappedbrad = loadImage("left brad.jpg");
normalbrad = loadImage("straight brad.jpg");
  // Run the tracking analysis
  tracker.track();
  // Show the image
  tracker.display();

  // Let's draw the raw location
  PVector v1 = tracker.getPos();
  fill(50, 100, 250, 200);
  noStroke();
  newPointx = map(v1.x, 0, 480, 0, width);
  newPointy = map(v1.y, 0, 260, 0, height);
  ellipse(newPointx, newPointy, 20, 20);

  // Let's draw the "lerped" location
  PVector v2 = tracker.getLerpedPos();
  fill(100, 250, 50, 200);
  noStroke();
  ellipse(v2.x, v2.y, 20, 20);
  ellipse(collisionx, collisiony, 200, 260);
  ellipse(collisionx2, collisiony2, 200, 260);
  
  if (dist(collisionx, collisiony, newPointx, newPointy) < 100)
  {
    background(255);
    image(slappedbrad, 0, 0);
    
  }
  else
  if  (dist(collisionx, collisiony, newPointx, newPointy) > 100)
  {
    background(255);
    image(normalbrad, 0, 0);
    
  }
}