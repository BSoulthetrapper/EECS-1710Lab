import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Minim minimLib;
AudioPlayer audio1;
AudioInput input;
FFT fft;


int circleX, circleY; 
int circleSize = 150; 

boolean overCircle = false; 
color bColor = color(random(255), random(255), random(255)); 
color circleColor = color(100, 100, 100);
color triangleColor = color(255);
boolean playing = false; 
String text = "";

void setup(){
  size(500,500);
  background(bColor);
  stroke(0);
  smooth();
  
  minimLib = new Minim(this);
  audio1 = minimLib.loadFile("pro.mp3");
  fft = new FFT(audio1.bufferSize(), audio1.sampleRate());

  circleX = width/2;
  circleY = height/2;
  ellipseMode(CENTER);

}

void draw(){
  background(bColor); 
  noStroke(); 

  update (mouseX, mouseY);

  if (overCircle) {
    cursor(HAND);
    circleColor=color(153,202,202);
  } else {
    cursor(ARROW);
    circleColor=color(102, 153, 255);
  }
  
  stroke(255);
  for(int i = 0; i < audio1.bufferSize() -1; i++) {
    line(i, 150 + audio1.left.get(i)*50, i+1, 150 + audio1.left.get(i*1)*50);
    line(i, 200 + audio1.right.get(i)*50, i+1, 200 + audio1.right.get(i*1)*50);
  }

  noStroke();
  fill(circleColor);
  ellipse(circleX, circleY, circleSize, circleSize);
  fill(triangleColor);
  triangle(210,200,210,300,310,250);
 
  textSize(32);
  fill(255);
  text(text, width/2-textWidth(text)/2, height-100);
}


void mousePressed() {
  if (overCircle) { 
    playing = !playing; 
    if(playing) {
      audio1.play(255); 
      triangleColor = color(204,51,153);
      text = "Playing...";
    } else {
      audio1.pause();
      triangleColor = color(255);
      text = "Paused";
    }
  }
}


void update(int x, int y) {
  if(overCircle(circleX, circleY, circleSize)) {
    overCircle = true;
  } else {
    overCircle = false;
  }
}

boolean overCircle(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if(sqrt(sq(disX) + sq(disY)) < diameter/2) {
    return true;
  } else {
    return false;
  }
      
}
