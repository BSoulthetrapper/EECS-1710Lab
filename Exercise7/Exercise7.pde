float angle = 0;

void setup(){
size(1000,1000,P2D);
frameRate(60);
background(255);
}

void draw(){
pushMatrix();
translate(width/2, height/2);
fill(random(255), random(255), random(255));
stroke(random(255));
rotate(angle);
float d=random(1,15);
ellipse(10+angle, 10, d+angle, d+angle);
angle+=0.3;
popMatrix();
if(angle>=1000) {
background(255);
angle=0;
}
println(angle);
}
