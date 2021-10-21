int cx, cy;
float secondsRadius;
float minutesRadius;
float hoursRadius;
float clockDiameter;

void setup() {
size(640, 360);
background(0);

stroke(255); 

textSize(25);
text("Minkyu's clock", 10, 30);
fill(random(255), random(255), random(255));

int radius = min(width, height) / 2;
secondsRadius = radius * 0.7;
minutesRadius = radius * 0.6;
hoursRadius = radius * 0.5;
clockDiameter = radius * 1.8;

cx = width / 2;
cy = height / 2;

}

void draw() {

fill(random(255), random(255), random(255));
noStroke();
ellipse(cx, cy, clockDiameter, clockDiameter);

float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI;
float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;

stroke(255,0,0);
strokeWeight(1);
line(cx, cy, cx + cos(s) * secondsRadius, cy + sin(s) * secondsRadius);
stroke(0,255,0);
strokeWeight(2);
line(cx, cy, cx + cos(m) * minutesRadius, cy + sin(m) * minutesRadius);
strokeWeight(4);
stroke(0,0,255);
line(cx, cy, cx + cos(h) * hoursRadius, cy + sin(h) * hoursRadius);

strokeWeight(1);
stroke(255);
beginShape(POINTS);
for (int a = 0; a < 360; a+=6) {
float angle = radians(a);
float x = cx + cos(angle) * secondsRadius;
float y = cy + sin(angle) * secondsRadius;
vertex(x, y);
}
endShape();
}
