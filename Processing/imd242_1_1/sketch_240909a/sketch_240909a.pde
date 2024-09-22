//size(640, 480);
////fullScreen();
////point(320,240);
//background(255);
////line(320, 240, 480, 120);
////ellipseMode(CORNER);
//circle(150, 240, 100);
//rectMode(CENTER);
//square(640-150, 240, 100);
//line(150, 240, 640-150, 240);

//size(640, 480);
//colorMode(HSB, 255);
//background(160, 100, 180);
//fill(10, 30, 80);
//stroke(100, 130, 100);
//strokeWeight(8);
//circle(150, 240, 100);
//fill(180, 80, 100, 127);
////stroke(0, 100, 130, 127);
//noStroke();
//rectMode(CENTER);
//square(200, 240, 100);

//size();
//background();
//circle();

void setup() {
  size(640, 480);
  background(0);
}

void draw() {
  //background(0);
  noStroke();
  fill(200, 0, 120,20);
  circle(mouseX-50,mouseY,100);
  circle(mouseX+50,mouseY,100);
}

void mousePressed() {
  background(mouseX, mouseY, 0);
}
