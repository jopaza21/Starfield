parent [] bol;
square [] rect;
tringle [] tri;
float r, TargetID;
boolean hasTarget = false;
boolean gotInit = false;
int level = 1;
int rand;
int num;
boolean boll = false, rec = false, tre = false;
void setup() {
  background(0);
  size(1200, 800);
}
void draw() {
  background(0);
  if (level == 1) { 
    level1();
  }
  if (level == 2) { 
    level2();
  }
}
void init(int ball, int square, int triangle) {
  bol = new parent[ball];
  rect = new square[square];
  tri = new tringle[triangle];
  for(int i = 0; i < bol.length; i++) { r = (float)(Math.random()*2*Math.PI); bol[i] = new parent(r); }
  for(int i = 0; i < rect.length; i++) { r = (float)(Math.random()*2*Math.PI); rect[i] = new square(r); }
  for(int i = 0; i < tri.length; i++) { r = (float)(Math.random()*2*Math.PI); tri[i] = new tringle(r); }
}
void interfc() {
  fill(50);
  rectMode(CENTER);
  rect(1100,400,150,750);
  fill(255);
  textSize(17.5);
  text("TARGET", 1070, 60);
}
void level1() {
  interfc();
  if(gotInit == false) {
    init(10,0,0);
    gotInit = true;
  }
  if(hasTarget == false) {
    num = (int)(Math.random()*bol.length);
    TargetID = bol[num].myID;
    hasTarget = true;
  }
  if(hasTarget == true) {
    fill(bol[num].myColor);
    ellipse(1100,110,60,60);
  }
  for (int i = 0; i < bol.length; i++) {
    bol[i].checker();
    bol[i].move();
    bol[i].show();
  }
}
void level2() {
  interfc();
  if(gotInit == false) {
    init(3,4,0);
    gotInit = true;
  }
  if (hasTarget == false) {
    rand = (int)(Math.random()*2);
    if (rand == 0) { 
      num = (int)(Math.random()*bol.length);
      TargetID = bol[num].myID;
      boll = true;
    }
    if (rand == 1) { 
      num = (int)(Math.random()*rect.length);
      TargetID = rect[num].myID;
      rec = true;
    }
    hasTarget = true;
  }
  if(boll == true) {
    fill(bol[num].myColor);
    ellipse(1100,75,30,30);
  }
  if(rec == true) {
    fill(rect[num].myColor);
    ellipse(1100,76,30,30);
  }
  for (int i = 0; i < bol.length; i++) {
    bol[i].checker();
    bol[i].move();
    bol[i].show();
  }
  for (int i = 0; i < rect.length; i++) {
    rect[i].checker();
    rect[i].move();
    rect[i].show();
  }
}

class parent {
  public float myX, myY, myRun, myRise, mySpeed, myID;
  public int myColor, mySize;
  parent(float rad) {
    myX = 600; 
    myY = 400;
    myRun = (float)Math.cos(rad); 
    myRise = (float)Math.sin(rad);
    mySpeed = (float)(Math.random()*4);
    myColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
    mySize = 30;
    myID = (float)(Math.random()*100000);
  }
  public void move() {
    if (myX < 0 || myX > 1000) {
      myRun = -myRun;
    }
    if (myY < 0 || myY > 800) {
      myRise = -myRise;
    }
    myX += myRun * mySpeed;
    myY += myRise * mySpeed;
  }
  public void checker() {
    if (mousePressed) {
      if (mouseX > myX - 15 && mouseX < myX + 15 && mouseY > myY - 15 && mouseY < myY + 15) {
        if (TargetID == myID) {
          gotInit = false;
          level++;
        }
      }
    }
  }
  public void show() {
    noStroke();
    fill(myColor);
    ellipse(myX, myY, mySize, mySize);
  }
}

class square extends parent {
  square(float rad) {
    super(rad);
    myX = 600; 
    myY = 400;
    myRun = (float)(Math.cos(rad)); 
    myRise = (float)(Math.sin(rad));
    mySpeed = 1;
    myColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
    mySize = 20;
    myID = (float)(Math.random()*100000);
  }
  public void show() {
    fill(myColor);
    rectMode(CENTER);
    rect(myX, myY, mySize, mySize);
  }
}

class tringle extends parent {
  tringle(float rad) {
    super(rad);
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
