PImage nuclear;
PImage missile;
PImage running;
float x;
float y;
float speedX = 10;

void setup() {
  nuclear = loadImage("nuclear.jpg");
  size(800, 600, P2D);
  frameRate(10);
  missile = loadImage("missile.png");
  running = loadImage("running.jpeg");
  x = width/2;
  y = height/2;
  imageMode(CENTER);
  textSize(100);
 fill(random(255), random(255), random(255));
}

void draw() {
  
 size(width, height);
 
 image(nuclear, x, y, width, height);
 image(running, random(x),random(y), 50, 50);
  x += speedX;
  if (x > width || x < 0) {
    speedX *= -1;
  }
  image(missile, x, y, 100, 50);
  text("CHAOS", random(x), random(y));
}
