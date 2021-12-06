int totalPts = 500;
float steps = totalPts + 6;


void setup() {
size(640, 360, P2D);
stroke(30, 144, 255);
frameRate(2);
}
void draw() {
background(0);
float sand= 50;
float sand2= 30;
float sand3= 10;
for (int i = 1; i < steps; i++) {
point( (width/steps) * i, (height/2) + random(-sand, sand) );
point( (width/steps) * i, (height/2) + random(-sand2, sand2) );
point( (width/steps) * i, (height/3) + random(-sand3, sand3) );
sand += random(-5, 5);
stroke(0, 255, 255);
sand2 += random(-2, 2);
sand3 += random(-7, 7);
}
}
