import processing.video.*;
int cellSize = 15;
int cols, rows;
Capture video;
VideoDoodle videoDoodle;

float a = 0;
float b = 0;
int dir = 1;

void setup() {
size(1280, 720);

 cols = width / cellSize;
 rows = height / cellSize;
colorMode(RGB, 255, 255, 255, 100);
rectMode(CENTER);
  video = new Capture(this, width, height);
  videoDoodle = new VideoDoodle();
  video.start();  
  background(0);

}

void draw() { 
  if (video.available()) {
    video.read();
    video.loadPixels();
    background(0, 0, 0);
    cell();

  }

 if(mousePressed){
    videoDoodle.display();

  }

}

void cell() {

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      int x = i * cellSize;
      int y = j * cellSize;
      int loc = (video.width - x - 1) + y*video.width; 
      color c = video.pixels[loc];
      float sz = (brightness(c) / 255.0) * cellSize;
      fill(255);
      noStroke();
      textSize(16);
      fill(0);
      text("hello", x + cellSize/2, y + cellSize/2);
      fill(255);
      rect(x + cellSize/2, y + cellSize/2, sz, sz);
    }

  }

}

class VideoDoodle {
  float x;
  float y;
  VideoDoodle() {
    x = width/2;
    y = height/2;
  }

  void captureEvent(Capture video) {
    video.read();
  }

  void display() {
    float newx = constrain(x + random(-20, 20), 0, width-1);
    float newy = constrain(y + random(-20, 20), 0, height-1);
    int midx = int((newx + x)/2);
    int midy = int((newy + y)/2);
    color c = video.pixels[(width-1-midx) +( midy*video.width)];
    stroke(c);
    strokeWeight(4);
    line(x, y, newx, newy);
    x= newx;
    y = newy;
  }

}
