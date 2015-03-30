float phi = (sqrt(5) + 1) / 2 - 1;

float originX = 400;
float originY = 400;
int ticker = 1;
int numberOfCircles = 8;
int[] a = new int[100];
float side;
float baseAngle = PI/4;
float setAngle;
float radius;
float newX;
float newY;
float offsetX;
float offsetY;

void setup() {
  size(800, 800);
  background(255);
  smooth();
  rectMode(CENTER);
}

void draw() {
  while (ticker < 2) {
    for (int i = 1; i <= numberOfCircles; i++) {
    // FIND THE LENGTH OF THE SIDE:
    side = fib(i) * 10; // scale the fib number to fit spiral on screen
    // FIND THE ANGLE WE NEED TO USE ON THE UNIT CIRCLE:
    
    int angleNumber = i%4;
    if (angleNumber == 0) {
      setAngle = 1*baseAngle; // PI/4
    }
    if (angleNumber == 1) { 
      setAngle = 3*baseAngle; // 3*PI/4
    }
    if (angleNumber == 2) {
      setAngle = 5*baseAngle; // 5*PI/4
    }
    if (angleNumber == 3) {
      setAngle = 7*baseAngle; // 7*PI/4
    }
    
    // FIND THE RADIUS:
    radius = sqrt(side*side+side*side);
    
    // ROTATE THAT SHIT:
    newX = originX + radius * cos(setAngle);
    newY = originY + radius * sin(setAngle);

    
    // DRAW THAT ARC:
    // 1. x of centre point = originX + (radius/2) * cos(setAngle)
    // 2. y of centre point = originY + (radius/2) * sin(setAngle)
    // 3. width of arc's ellipse = radius
    // 4. height of arc's ellipse = side
    // 5. angle to start the arc = setAngle - PI
    // 6. angle to end the arc = setAngle
    /*
    I DON'T EVEN KNOW WHAT THIS DOES. GET RID OF IT.
    if (angleNumber == 0){
      offsetX = newX;
      offsetY = newX - side;
    }
    if (angleNumber == 1) {
      offsetX = newX;
      offsetY =  newX - side;
    }
    if (angleNumber == 2) {
      offsetX = newX;
      offsetY =  newX + side;
    }
    if (angleNumber == 3) {
      offsetX = newX - side;
      offsetY =  newX;
    }
    */
    
    float centreX = originX + radius/2 * cos(setAngle);
    float centreY = originY + radius/2 * sin(setAngle);
    float arcWidth = side;
    float arcHeight = side;
    float arcStart = setAngle - PI;
    float arcEnd = setAngle;

    stroke(0);
    
    
    arc(centreX, centreY, radius, radius, arcStart, arcEnd);
    noFill();
    
        
    // DRAW THAT RECTANGLE:
    rect(centreX, centreY, side, side);
    
    // DRAW THAT LINE:
    line(newX, newY, originX, originY);
    
    // UPDATE THE STARTING POINTS:
    originX = newX;
    originY = newY;


    }
    ticker++;
  }

}

int fib(int n) {
  a[0] = 0;
  a[1] = 1;
  if (n < 2) {
    return 1;
  } else {
    int result = a[n-1]+a[n-2];
    a[n] = result;
    return result;
  }
}


