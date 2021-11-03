PFont font;
PGraphics pg;
Particle[] particle;
int particleNum = 0;
    
void setup() {
    
    size(1300, 720);
    pg = createGraphics(width, height);
    font = createFont("Georgia", 200);
    pg.beginDraw();
    pg.background(random(255),random(255),random(255));
    pg.textFont(font);
    pg.textAlign(LEFT, TOP);
    pg.fill(0);
    pg.text("WHAT'S UP!", 0, 0);
    pg.endDraw();
    particle = new Particle[width/10 * height/10];
    for(int x=0; x<width; x += 10){
      for(int y=0; y<height; y += 10){
        if( pg.get(x, y) == color(0) ){
          particle[particleNum] = new Particle(x, y, 10, color(random(255),random(255),random(255)));
          particleNum ++;
        }
        
      }
    }
    
}

void draw(){
  background(255);
  for(int i=0; i<particleNum; i++){
    particle[i].display();
  }
}

class Particle{

  
  float x;
  float y;

  float maxSize;
  float size;
  
  color c;

  Particle(float x_, float y_, float size_, color c_){
    x = x_;
    y = y_;
    maxSize = size_;
 
    size = maxSize * random(0, 1);
    
    c = c_;
    
  }

  void display(){
    size += 0.1;
    if(size > maxSize) size = 0;
    fill(c);
    ellipse(x, y, size, size);
  }
}
