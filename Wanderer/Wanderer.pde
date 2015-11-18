//declare variables
float  diam = 40;
PVector loc, vel, acc ;



void setup() {
  //set size of canvas
  size(800, 600);
  background(100);
  //initialize variables
  loc = new PVector (width/2, height/2);

  vel = PVector.random2D();
  vel.mult(0);

}

void draw() {
    acc = PVector.random2D();
  acc.mult(.1);
  //draw background to cover previous frame

  //draw ball
  vel.add(acc);
  vel.limit(5);
  ellipse(loc.x, loc.y, diam, diam);

  //add velocity to position
  loc.x += vel.x;
  loc.y += vel.y;

  //wrap the ball's position
  if (loc.x >= width) {
    loc.x = 0;
  } else if (loc.x <= 0) {
    loc.x = width ;
  }
  if (loc.y  >= height) {
    loc.y =0;
  } else if (loc.y<= 0) {
    loc.y = height ;
  }
}