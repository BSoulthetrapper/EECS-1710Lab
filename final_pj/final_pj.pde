import xyscope.*;
XYscope xy;
import ddf.minim.*; 


int a = 40; 
int x = 30;
float angle = 0;
float radius = 100.0;
int segments = 20;
float latheAngle = 0;
float latheRadius = 100.0;
PVector vertices[], vertices2[];
boolean isHelix = false;
float helixOffset = 5.0;

void setup() {
  size(600, 600, P3D);
  frameRate(60);
  fill(random(255), random(255), random(255));
  textSize(50);

  xy = new XYscope(this);
}

void draw() {
  background(0);
  xy.clearWaves();
  
   text("click&move the mouse", x, 50); 
  x++;                
  if(x == width){ 
    x = 30;     
  }

  if (mousePressed) {
    a = floor(map(mouseX, 0, width, 1, 50));
    segments = floor(map(mouseY, 0, height, 1, 50));
  }

  pushMatrix();

  translate(width/2, height/2, -100);

  rotateX(frameCount*PI/150);
  rotateY(frameCount*PI/170);
  rotateZ(frameCount*PI/90);

  vertices = new PVector[a+1];
  vertices2 = new PVector[a+1];

  for (int i=0; i<=a; i++) {
    vertices[i] = new PVector();
    vertices2[i] = new PVector();
    vertices[i].x = latheRadius + sin(radians(angle))*radius;
    if (isHelix) {
      vertices[i].z = cos(radians(angle))*radius-(helixOffset* 
        segments)/2;
    } else {
      vertices[i].z = cos(radians(angle))*radius;
    }
    angle+=360.0/a;
  }
  latheAngle = 0;
  for (int i=0; i<=segments; i++) {
    xy.beginShape();

    for (int j=0; j<=a; j++) {
      if (i>0) {
        xy.vertex(vertices2[j].x, vertices2[j].y, vertices2[j].z);
      }
      vertices2[j].x = cos(radians(latheAngle))*vertices[j].x;
      vertices2[j].y = sin(radians(latheAngle))*vertices[j].x;
      vertices2[j].z = vertices[j].z;
      if (isHelix) {
        vertices[j].z+=helixOffset;
      } 
      xy.vertex(vertices2[j].x, vertices2[j].y, vertices2[j].z);
    }
    if (isHelix) {
      latheAngle+=720.0/segments;
    } else {
      latheAngle+=360.0/segments;
    }
    xy.endShape();
  }
  popMatrix();

  xy.buildWaves();
  xy.drawAll();
}
