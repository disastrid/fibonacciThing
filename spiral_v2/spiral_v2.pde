// Calculate the golden angle. This is value is equal to 1.618034.
float phi = (sqrt(5)+1) / 2;
int fibNums[] = new int[100];
// Start out with our origin in the middle of the screen.
int originX = 0;
int originY = 0;
// number of elements in our spiral:
int numberOfElements = 20;
// length of the square's side to start with:
int side=0;
int lastSide;
int counter = 0;
int colour=255;
int spiralElementsAntiClockwise = 5;
int spiralElementsClockwise;
int j = 1;
int arcCentreX, arcCentreY;
float startArc, stopArc;
 
void setup() {
  size(1000, 800);
  background(255);
  
  // This draws rectangles with their top LEFT corner at
  // the given x and y coordinates (first two rect() arguments).
  rectMode(CORNER);
  
  // This draws ellipses with their CENTER at the given x and y 
  // coordinates (first two ellipse() or arc() arguments).
  ellipseMode(CENTER);
}

void draw() {
  int totalRotations = 8;
 translate(500,400);
  while (counter < 1) {
  // First, draw a clockwise spiral.
   noFill();
   pushMatrix();
   for (int k=0; k<totalRotations; k++){
     rotate(2*PI*(float)1/totalRotations);
    drawSpiralArm();
   }
   popMatrix();
   scale(-1, 1);
   int moreRotations = 13;
   for (int k=0; k<moreRotations; k++){
     rotate(2*PI*(float)1/moreRotations);
    drawSpiralArm();
   }
    counter++;

} // end while loop that controls the number of times we execute the spiral
}

// Function to find our next fibonacci number in the sequence:
int fib(int num) {
  fibNums[0] = 0;
  fibNums[1] = 1;
  if (num < 2) {
     return fibNums[num];
  } else {
     int result = fibNums[num-1]+fibNums[num-2];
     fibNums[num] = result;
     return result;
  }
}

void drawSpiralArm() {
  originX = 0;
  originY = 0;
  side = 0;
  for (int i = 0; i < numberOfElements; i++) {
      // First, remember what the last side was before we update it:
        lastSide = side;
        // Then, update the side length with the next fibonacci number:
        side = fib(i);
        if (i%4 == 0) { 
            originX += lastSide;
            originY = originY - (side - lastSide);
            arcCentreX = originX;
            arcCentreY = originY;
            startArc = 0;
            stopArc = PI - HALF_PI;
            //startArc = PI + HALF_PI;
            //stopArc = TWO_PI;
            stroke(0, 0, colour);
        } else if (i%4 == 1) { 
            originX = originX - (side - lastSide);
            originY = originY - side;
            arcCentreX = originX;
            arcCentreY = originY + side;
            startArc = PI+HALF_PI;
            stopArc = TWO_PI;
            //startArc = 0;
            //stopArc = HALF_PI;
            stroke(colour, 0, 0);
        } else if (i%4 == 2) {
            originX -= side;
            originY = originY; // originY unchanged
            arcCentreX = originX + side;
            arcCentreY = originY + side;
            startArc = PI;
            stopArc = PI + HALF_PI;
            //startArc = HALF_PI;
            //stopArc = PI;
            stroke(0, colour, 0);
      } else if (i%4 == 3) {
            originX = originX;
            originY += lastSide;
            arcCentreX = originX + side;
            arcCentreY = originY;
            startArc = HALF_PI;
            stopArc = PI;
            //startArc = PI;
            //stopArc = PI + HALF_PI;
            stroke(0);
        }
          
        noFill();
        //stroke(150);
        //rect(originX, originY, side, side);
        arc(arcCentreX, arcCentreY, 2*side, 2*side, startArc, stopArc); 
 
  }// end inner for loop, i


}
