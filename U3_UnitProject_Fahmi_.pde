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
Characters character;

Minim minim;
AudioPlayer player;  

int skip = 8;

float newPointx;
float newPointy;
int collisionx = 200 ;
int collisionx2 = 440 ;
int collisiony = 260;
int collisiony2 = 260;

int Screen = 0;

PImage normalbrad;
PImage slappedbrad;
PImage bradbuttowski;
PImage hand;

void setup() 
{
  size(640, 520);
  slappedbrad = loadImage("left brad.png");
 normalbrad = loadImage("straight brad.png");
 hand = loadImage("hand.png");
 slappedbrad.resize(600, 500);
 normalbrad.resize(600, 500);
 hand.resize(300, 300);
  minim = new Minim(this);
  player = minim.loadFile("Slap.mp3");
  kinect = new Kinect(this);
  tracker = new KinectTracker();
  kinect.initDepth();
  
}

void draw()
{
    background(255);
  // Run the tracking analysis
  tracker.track();
  // Show the image
  tracker.display();
  Pvector();
  collision();
}

void Pvector()
{
  // Let's draw the raw location
  PVector v1 = tracker.getPos();
  fill(50, 100, 250, 200);
  noStroke();
  newPointx = map(v1.x, 0, 320, 0, width);
  newPointy = map(v1.y, 0, 260, 0, height);
  ellipse(newPointx, newPointy, 20, 20);

  // Let's draw the "lerped" location
  PVector v2 = tracker.getLerpedPos();
  fill(100, 250, 50, 200);
  noStroke();
  newPointx = map(v2.x, 0, 320, 0, width);
  newPointy = map(v2.y, 0, 260, 0, height);
  ellipse(newPointx, newPointy, 20, 20);
  
  ellipse(collisionx, collisiony, 200, 260);
  ellipse(collisionx2, collisiony2, 200, 260);
  
  image(hand, v2.x, v2.y);
  imageMode(CENTER);
}

void collision()
{
 if (dist(collisionx, collisiony, newPointx, newPointy) < 100)
  {
    image(slappedbrad, width/2, height/2);
    player.play();
  }
  else
  if  (dist(collisionx, collisiony, newPointx, newPointy) > 100)
  {
    image(normalbrad, width/2, height/2);
    player.pause();
  }
}