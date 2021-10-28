dots [] dot;
float r;
int counter;
void setup() {
  size(1200,800);
  dot = new dots[25];
  init();
}
void draw() {
  for(int i = 0; i < dot.length; i++){
    dot[i].move();
    dot[i].show();
  }
  counter++;
  if(counter > 40){
    init();
    counter = 0;
  }
}
void mousePressed() {
  init();
}
void init() {
  for(int i = 0; i < dot.length; i++){
    r = (float)(Math.random()*300);
    dot[i] = new dots(r);
  }
}
class dots {
  float myX, myY, myRun, myRise, mySpeed, mySize;
  int myColor;
  dots(float rad) {
    myX = mouseX; myY = mouseY;
    myRun = (float)(Math.cos(rad)); myRise = (float)(Math.sin(rad));
    mySpeed = (float)(Math.random()*5);
    myColor = color((float)(Math.random()*255), (float)(Math.random()*255), (float)(Math.random()*255));
    mySize = 5;
  }
  void move() {
    myX += myRun * mySpeed;
    myY += myRise * mySpeed;
    mySize += .25;
  }
  void show() {
    noStroke();
    fill(myColor);
    ellipse(myX, myY, mySize, mySize);
  }
}
