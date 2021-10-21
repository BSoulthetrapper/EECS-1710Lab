color bgColor = color(255, 0, 255);
float circleSize = 200;



void setup() {
  size(800, 600, P2D); // P2D enables 2D GPU acceleration
  frameRate(60);
  background(bgColor);
  
}

void draw() {
  if (mousePressed) {
    fill(random(255), random(255), random(255));
    stroke(255, 0, 0);
    line(mouseX, mouseY, pmouseX, pmouseY);
    ellipse(mouseX, mouseY, 30, 30);
   
  }
}
