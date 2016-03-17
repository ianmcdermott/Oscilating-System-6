
import ddf.minim.*;
import ddf.minim.ugens.*;

Minim minim;
AudioOutput out;

Oscil      wave;
Frequency  currentFreq;



boolean debug = false;
int numPoints = 25;
PImage sprite;

boolean dPath = false;
Path path;
float noise = 0;
float noiseX= 0;
float noiseY= 110000;
boolean noiseOn = false;

VehicleSystem vs;

float offset = 0;
float offsetValue = .0100;

void setup() {


  ////////MINIM SETUP ////////
  minim = new Minim(this);
  out   = minim.getLineOut();

  currentFreq = Frequency.ofHertz( 432 );
  wave = new Oscil( currentFreq, 0.6f, Waves.SINE );

  wave.patch( out );

  // size(1500, 1200, P2D);
  fullScreen(0);
  smooth();
  // Call a function to generate new Path object
  //newPath();
  path = new Path();
  for (int i = 0; i <numPoints; i++) {
    randomPath();
  }
  // We are now making random vehicles and storing them in an ArrayList
  vs = new VehicleSystem();
  background(255);
  frameRate(60);
  sprite = loadImage("sprite.png");
}

void draw() {
  noCursor();
  fill(255, 255);
  //background(255);
  float oscillate = map(sin(offset), -1, 1, -9, 4);

  rect(0, 0, width, height);
  /* if (noiseOn = true) {
   noiseX = map(noise(noise), -1, 1, -2, 2);
   noiseY = map(noise(noise), -1, 1, -2, 2);
   path.updatePoints(noiseX, noiseY);
   } else { */
  noiseX = map(sin(noise), -1, 1, -1, 1);
  noiseY = map(cos(noise), -1, 1, -1, 1);
  offset+= offsetValue;
  path.updatePoints(noiseX, noiseY);

  if (dPath) path.display();


  fill(0);

  noise+= .1;

  vs.run(oscillate);
  println(offset);

}


void randomPath() {
  path.addPoint(random(50, width-50), random(50, height-50));
}



void keyPressed() {
  if (key == 'd') debug = !debug;
  if (key == 'p') dPath = !dPath;
  if (key == 'n') noiseOn = !noiseOn;
  if (key == 'w') offsetValue*=10;
  if (key == 'q') offsetValue/=10;
  
}
/*
void mousePressed() {
 vs.mouseVehicle(mouseX, mouseY);
 }*/