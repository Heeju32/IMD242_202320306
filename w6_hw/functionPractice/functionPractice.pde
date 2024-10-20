int randomSeed = int(random(10000));

void setup() {
  size(800, 800);
}

void mousePressed() {
  randomSeed = int(random(10000));
}

void draw() {
  randomSeed(randomSeed);
  drawBackground();
  
  for (int n = 1; n < 6; n++) {
    float scale = random(0.5, 1.5); 
    house(random(0.1 * width, 0.9 * width), height * 0.9 - 300 * scale, scale);
  }
}

void drawBackground() {
  noStroke();
  fill(255, 174, 20);  
  rect(0, 0, width, height * 0.8);  
  fill(70, 90, 41); 
  rect(0, height * 0.6, width, height * 0.9);
}

void house(float x, float y, float scale) {
  pushStyle();
  pushMatrix();
  translate(x, y);
  scale(scale);

  colorMode(HSB, 360, 100, 100);

  float roofHue = random(0, 70);  
  fill(roofHue, 80, 90);
  arc(0, 0, 230, 220, PI, TWO_PI); 

 
  fill(0, 0, 100);  
  for (int i = 0; i < 4; i++) {
    float dotX = random(-70, 70); 
    float dotY = random(-80, 0);  
    float dotSize = random(10, 30);  
    ellipse(dotX, dotY, dotSize, dotSize);
  }

 
  float bodyHue = random(10, 70);  
  fill(bodyHue, 30, 90);
  rect(-70, 0, 140, 150);
 
  fill(179, 23, 100);
  rect(-50, 40, 40, 40);  

  fill(30, 20, 20);
  rect(-20, 100, 40, 50);  
 
  ellipse(5, 125, 5, 5);  

  popMatrix();
  popStyle();
}
