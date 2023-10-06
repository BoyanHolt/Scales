// global variables
int rows = 4;
int cols = 10;
int mult = 100;  //  pixel coordinate scale for x and y
int off = 50;    // offset between rows and cols
float wid = 10;  // width of shape
float hgt = 10;  // height of shape
float increment = 1;   // amount of increment for each frame
float min = 10.0;    // min size when breathing
float max = 100.0;    //  max size when breathing
boolean grow = true;  // breathe in first!
float r, g, b, a;  //red, green, blue, alpha
int boarderHeight = mult*cols;
int boarderWidth = mult*rows;

void mouseClicked() { //mouseclick changes color when clicked
  changeColor();
}

void setup() { //window size and color + opacity at startup
  size(1000, 400);
  changeColor();
  a = 0;
}
void changeColor() {
  r = (int)(Math.random()*256); //color change
  g = (int)(Math.random()*256);
  b = (int)(Math.random()*256);
}

void draw() {
  background(255);
  for (int x = 0; x < cols; x++) {    // x coordinate for rows loop
    for (int y = 0; y < rows; y++) {  // y coordinate for cols loop
      scale(x, y);  // draw shapes in rows and cols
      if (wid == 10.0) {
        changeColor();
      }
    }
  }

  incrementr_size_color();
  {

    if (wid >= max||wid <= min) {   // toggle phases
      grow = !grow;
    }
    // if (row == odd) {
  }
}

void incrementr_size_color() {
  if (grow) {     // grow phase
    wid += increment;
    hgt += increment;
    a += 255/(max-min);
  } else {        // shrink phase
    wid -= increment;
    hgt -= increment;
    a -= 255/(max-min);
  }
}

void scale(float x, float y) { //shapes
  rectMode(CENTER);
  fill(r, g, b, a);
  stroke(2);
  rect(x*mult+off, y*mult+off, wid, hgt);  // draw shapes in rows and cols}
  ellipse(x*mult+off, y*mult+off-(wid/2), wid, hgt);
  noStroke();
  ellipse(x*mult+off, y*mult+off-(wid/2)+5, wid, hgt);

  stroke(0);
  rect(x*mult+off+50, y*mult+off+50, wid, hgt);  // draw shapes in rows and cols}
  ellipse(x*mult+off+50, y*mult+off-(wid/2)+50, wid, hgt);
  noStroke();
  ellipse(x*mult+off+50, y*mult+off-(wid/2)+55, wid, hgt);
}
