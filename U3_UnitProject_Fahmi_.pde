/*
Hi! This game is called "Slap Brad Buttowski!" You must slap him as many times as you can.
It itsn't really a game because there's no actual goal of the game, just slap him 
as many times as you want and your points will go up accordingly.
*/

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*; //minim for the slapping sound

import org.openkinect.processing.*;  //library for kinect
import org.openkinect.freenect.*;

Kinect kinect;
KinectTracker tracker;

Minim minim;
AudioPlayer player;  

int skip = 8;

float newPointx; //the average point tracker 
float newPointy;
int collisionx = 320; //for the collision circles 
int collisiony = 500;

int points = 0; //score counter 

PImage normalbrad;
PImage slappedbrad;
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
  textSize(28);
  fill(0, 50, 255);
  text("points: " + points, 8, 20); //displaying the 
}


void Pvector()
{
  // Let's draw the raw location
  PVector v1 = tracker.getPos();
  fill(50, 100, 250, 200);
  noStroke();
  newPointx = map(v1.x, 0, 320, 0, width);
  newPointy = map(v1.y, 0, 260, 0, height);
  ellipse(newPointx, newPointy, 20, 20); //average point tracker (circle) so that it collides

  // Let's draw the "lerped" location
  PVector v2 = tracker.getLerpedPos();
  fill(100, 250, 50, 200);
  noStroke();
  newPointx = map(v2.x, 0, 320, 0, width);
  newPointy = map(v2.y, 0, 260, 0, height);
  ellipse(newPointx, newPointy, 20, 20);

  ellipse(collisionx, collisiony, 300, 300);

{
  if (dist(collisionx, collisiony, newPointx, newPointy) < 100)
  {
    background(255);
    image(slappedbrad, width/2, height/2);
    image(hand, v2.x, v2.y); //draws the hand over the image rather than behind
    imageMode(CENTER); //places all the images into the centre
    player.play();
    points = points + 1;
  } else
    if  (dist(collisionx, collisiony, newPointx, newPointy) > 100)
    {
      background(255);
      image(normalbrad, width/2, height/2);
      image(hand, v2.x, v2.y);
      imageMode(CENTER);
      player.pause();
    }
}
}