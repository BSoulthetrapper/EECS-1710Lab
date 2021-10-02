int WIDTH = 1500;
int HEIGHT = 800;
int lastTime=0;
int setTimer = 5;
int Poo_x = 0;
int Poo_y = 0;

PImage imagePoo = new PImage();
PImage imageWorm = new PImage();
PImage imagePopup = new PImage();
PImage imageApple = new PImage();
PImage imageDeathworm = new PImage();
PImage  BGimage = new PImage() ;


int x,y;

boolean isBothered = false;
int botheredMarkTime = 0;
int botheredTimeout = 3000; // Processing measures time in milliseconds
float botheredSpread = 5;



void setup() 
{
  size(1500,800,P2D); 
  frameRate(60);
  x = WIDTH/2;
  y = HEIGHT/3;
  imagePoo = loadImage("poo.png");
  imageWorm = loadImage("worm 1.png");
  imagePopup = loadImage("popup worm.png");
  imageApple = loadImage("apple.png");
  imageDeathworm = loadImage("deathworm.png");
  BGimage = loadImage("bg image.jpeg");

 

}

void draw() 
{
 
  
  boolean is_refresh = false;
   
  int passedTime = millis() - lastTime;
  if(passedTime > setTimer)
  {
     lastTime =  millis();
     Poo_y -=20;    
     is_refresh = true;
  }
  
  if(is_refresh)
  {
    image(BGimage,0,0,WIDTH,HEIGHT);
    image(imagePoo,Poo_x,Poo_y, 100, 100);  
  }
  image(imagePopup, 500,450);
  image(imagePopup, 100, 400);
  image(imageWorm ,x,y, 150, 300); 
  image(imageApple,100, 100, 100, 100);
  image(imageApple, 400, 700, 100, 100);
  image(imageDeathworm, random(x), random(y), 300, 600);
       
  createFont("Arial",10,true); 
  fill(random(255), random(255), random(255));
  text("move with directional keys",30,40);   
} 


void keyPressed() 
{
  if (key == CODED) 
  {
    if (keyCode == LEFT)
    {
      x-=30;    if(x<0) x=0;
    }
    else if (keyCode == RIGHT) 
    {
       x+=30;   
    }
    else if (keyCode == UP) 
    {
      y-=30;    if(y<0) y=0;
    }
    else if (keyCode == DOWN) 
    {
       y+=30;        
    }
  }
  else if (keyCode ==' ' ) 
  {
    Poo_x = x;
    Poo_y = y;
  } 
 
}
