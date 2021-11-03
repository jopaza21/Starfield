parent [] bol1, bol2, bol3;
square [] rect1, rect2;
triangle [] tri1;
float r, TargetID;
boolean hasTarget = false;
int level = 1;
int rand;
void setup() {
  size(1200, 800);
  bol1 = new parent[20]; //level one balls
  bol2 = new parent[25]; //level two balls
  bol3 = new parent[30]; //level three balls
  rect1 = new square[10]; // level two squares
  rect2 = new square[15]; // level three squares
  tri1 = new triangle[10]; // level three triangles
  for (int i = 0; i < bol1.length; i++) {
    r = (float)(Math.random()*2*Math.PI);
    bol1[i] = new parent(r);
  }
  for (int i = 0; i < bol2.length; i++) {
    r = (float)(Math.random()*2*Math.PI);
    bol2[i] = new parent(r);
  }
  for (int i = 0; i < rect1.length; i++) {
    r = (float)(Math.random()*2*Math.PI);
    rect1[i] = new square(r);
  }
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
void level1() {
  if (hasTarget == false) {
    TargetID = bol1[(int)(Math.random()*bol1.length)].myID;
    hasTarget = true;
  }
  for (int i = 0; i < bol1.length; i++) {
    bol1[i].checker();
    bol1[i].move();
    bol1[i].show();
  }
}
void level2() {
  if (hasTarget == false) {
    rand = (int)(Math.random()*2);
    if (rand == 0) { 
      TargetID = bol2[(int)(Math.random()*bol2.length)].myID;
    }
    if (rand == 1) { 
      TargetID = rect1[(int)(Math.random()*rect1.length)].myID;
    }
    hasTarget = true;
  }
  for (int i = 0; i < bol2.length; i++) {
    bol2[i].checker();
    bol2[i].move();
    bol2[i].show();
  }
  for (int i = 0; i < rect1.length; i++) {
    rect1[i].checker();
    rect1[i].move();
    rect1[i].show();
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
    if (myX < 0 || myX > 1200) {
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
    mySpeed = (float)(Math.random()*10);
    myColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
    mySize = 20;
    myID = (float)(Math.random()*100000);
  }
  public void checker() {
    if (mousePressed) {
      if (mouseX > myX - 15 && mouseX < myX + 15 && mouseY > myY - 15 && mouseY < myY + 15) {
        if (TargetID == myID) {
          level++;
        }
      }
    }
  }
  public void move() {
    if (myX < 10 || myX > 1190) { 
      myRun = -myRun;
    }
    if (myY < 10 || myY > 790) { 
      myRise = -myRise;
    }
    myX += myRun * mySpeed;
    myY += myRise * mySpeed;
  }
  public void show() {
    fill(myColor);
    rectMode(CENTER);
    rect(myX, myY, mySize, mySize);
  }
}

class triangle extends parent {
  triangle(float rad) {
    super(rad);
  }
}
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
