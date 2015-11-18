//declare variables
int count = 5000;
//PVector loc, vel;



PVector[] loc = new PVector[count];
PVector[] vel = new PVector[count];
float[] diam = new float[count];
float r, g, b;


void setup() {
  frameRate(5);
  //set size of canvas
  size(800, 600);
  r= random(255);
  g= random(255);
  b= random(255);

  for (int i = 0; i < count; i++) {
    loc[i] = new PVector(width/2, height /2);
    diam[i] = 5;
    vel[i] = PVector.random2D();
    vel[i].mult(10);
  }
  ////initialize variables
  //loc = new PVector(width/2, height/2);
  //diam = 80;
  //vel = PVector.random2D();
  //vel.mult(50);
}




//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~








void draw() {
  //draw background to cover previous frame
  background(0);

  for (int i = 0; i < count; i ++) {

fill(r,g,b);
    //draw ball
    ellipse(loc[i].x, loc[i].y, diam[i], diam[i]);

    //add velocity to position

    loc[i].add(vel[i]);

    //bounce ball if it hits walls
    if (loc[i].x + diam[i]/2 >= width) {
      r+=3;
      g+=3;
      b+=3;
      vel[i].x = -abs(vel[i].x);    //if the ball hits the right wall, assign x velocity the negative version of itself
    } else if (loc[i].x - diam[i]/2 <= 0) {
      vel[i].x = abs(vel[i].x);     //if the ball hits the left wall, assign x velocity the positive version of itself
    }
    if (loc[i].y + diam[i]/2 >= height) {
      vel[i].y = -abs(vel[i].y);
    } else if (loc[i].y - diam[i]/2 <= 0) {
      vel[i].y = abs(vel[i].y);
    }
  }
}