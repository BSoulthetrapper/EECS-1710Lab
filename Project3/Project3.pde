PImage img;
PImage imgCopy;
int p = 1; 

void setup() {
  img = loadImage("human.jpeg");
  imgCopy = createImage(img.width, img.height, RGB);
  surface.setResizable(true);
  surface.setSize(img.width*2, img.height);
  textSize(50);
 
}

void draw(){
  image(img,img.width,0);
  image(imgCopy, 0, 0);
  
  img.loadPixels();
  imgCopy.loadPixels();
  text("press direction keys to see the difference",1000, 100);
  for(int k = 0; k < img.width; k += p){
    for(int j = 0; j < img.height; j += p){
      color c = img.get(k, j);
      fill(c);
      noStroke();
      rect(k,j,p,p);
    }
   }
    
    img.updatePixels();
    imgCopy.updatePixels();
}

void keyPressed(){
  if(key == CODED) {
    if(keyCode == UP){
      p += 1;
      if (p >= 20) { 
        p = 20;
      }
    } else if (keyCode == DOWN){
      p -= 1;
      if (p<=1) {
        p = 1;
      }
    }
    
  }
}
 
