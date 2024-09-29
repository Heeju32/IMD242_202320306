void setup() {
  size(640, 360);
  rectMode(CENTER);
}

void draw() {
  background(0);

  if (mouseY > height / 4 * 3 ) {
    rect(width/2, height / 4 * 3.5, 60, 40);
  } else if (mouseY > height / 4 * 2) {
    square(width / 2, height / 4 * 2.5, 50);
  } else if (mouseY > height / 4) {
    circle(width / 2, height / 4 * 1.5, 50);
  } else
    line(width / 2 - 30, height /4 -70, width / 2 + 30, height / 4 -20);

  stroke(127);
  strokeWeight(4);
  line(0, height / 4, width, height / 4 );
  line(0, 2 * height / 4, width, 2 * height / 4);
  line(0, 3 * height / 4, width, 3 * height / 4);
}
