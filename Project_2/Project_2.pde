Ball ball;
Paddle paddle;

boolean [] keys = new boolean[128];
boolean gameStart = false;
boolean gameFihished = false;

String message ;

void setup(){
  size(600, 400);
  smooth();
 
  paddle = new Paddle();
  ball = new Ball();
  
  message = "!Bouncing Ball!";
}
  
void draw(){
   background(0);
   textSize(32);
   text(message, width/2-textWidth(message)/2, 50);
   

   paddle.display();
   paddle.move();
   

   if(gameStart){
      ball.display();
      ball.move();

      if(paddle.intersect(ball)){
        ball.yspeed *= -1;
      }
    }
}

void keyPressed(){
  keys[keyCode] = true;
  if (keys[32]){
    gameStart = true; 
    message = "Game Start";
  }
}

void keyReleased(){
  keys[keyCode] = false;
}


//Paddle Class
class Paddle{
  PVector pos, vel, acc;
  Paddle() {
     pos = new PVector(width/2, height -12);
     vel = new PVector (9, 0);
     
  }
  
  void display(){
     fill(255);
     noStroke();
     rectMode(CENTER);
     rect(pos.x, pos.y, 100, 10);
  }
  
  void move(){
    //vel = vel.add(acc);
    if (pos.x <= 50){
        pos.x = 50; 
     }
     if(pos.x >= width - 50){
        pos.x = width - 50; 
     }
     //
     if(keys[LEFT])
       pos.x -= vel.x;
     if(keys[RIGHT])
       pos.x += vel.x;
     
  }
  

  boolean intersect(Ball b){
    float p1 = pos.x - 50;
    float p2 = pos.x + 50; 
    if (b.y + b.radius >= pos.y){
      if(b.x >= p1 && b.x <= p2){
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
  
}


class Ball{
  float x, y, xspeed, yspeed, radius;
  
  Ball(){
    x = 0;
    y = height - 1;
    xspeed = 5;
    yspeed = -5;
    radius = 5;
  }
  
  void move(){
    x += xspeed;
    y += yspeed;
    if(x > width || x < 0){
      xspeed *= -1;
    }
    if(y < 0){
      yspeed *= -1;
    }
    if(y > height){
      gameStart = false;
 
      setup();
      message = "Game Over";
    }
  }
  
  void display(){
    stroke(0);
    fill(255);
    ellipse(x, y, radius*2, radius*2);
  }
  
}
