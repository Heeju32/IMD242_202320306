float r = random(255);
float g = random(255);
float b = random(255);
int shape = 0;

void setup() {
  size(640, 480);
  background(0);
}
void draw() {
  noStroke();

  if (shape == 0) {
    circle(mouseX, mouseY, 30);
  } else if (shape == 1) {
    triangle(mouseX, mouseY - 15, mouseX-15, mouseY + 15, mouseX + 15, mouseY + 15);
  } else if (shape == 2) {
    rect(mouseX-15, mouseY -15, 30, 30);
  }
}

void mousePressed() {
  r = random(200, 255);
  g = random(200, 255);
  b = random(150, 200);
  background(b, r, g);

  shape = int(random(3));
  fill(r, g, b);
}
