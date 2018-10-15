Particle[] spark;

void setup(){
  size(500,500);
  spark = new Particle[500];
  for(int i = 0; i < spark.length; i++){
    spark[i] = new NormalParticle();
  }
  spark[0] = new OddballParticle();
  for(int i = 1; i < 21; i++){
    spark[i] = new JumboParticle();
  }
}

void draw(){
  background(0);
  for(int i = 0; i < spark.length; i++){
    spark[i].move();
    spark[i].show();
  }
}

class NormalParticle implements Particle{
  double myX, myY, mySpeed, myAngle;
  int myColor;

  NormalParticle(){
    myX = 250;
    myY = 250;
    mySpeed = Math.random()*2;
    myAngle = Math.PI*2*Math.random();
    myColor = color(255, 182, 193);
  }
  
  public void move(){
    myX = Math.cos(myAngle)*mySpeed + myX;
    myY = Math.sin(myAngle)*mySpeed + myY;
  }
  
  public void show(){
    fill(myColor);
    noStroke();
    ellipse((float)myX, (float)myY, 6, 6);
  }
}

interface Particle{
  public void show();
  public void move();
}

class OddballParticle implements Particle{ //uses an interface
  double myX, myY, myAngle, mySpeed;
  OddballParticle(){
    myX = 0;
    myY = 250;
  }
  
  public void show(){
    fill(255);
    ellipse((float)myX, (float)myY, 10, 10);
  }
  public void move(){
    myX = myX + 1;
  }
}

class JumboParticle extends NormalParticle{ //uses inheritance
  public void show(){
    fill(30, 144, 255);
    ellipse((float)myX, (float)myY, 10, 10);
  }
}