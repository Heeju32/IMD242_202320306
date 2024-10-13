void setup() {
  size(800, 800); 
}

void draw() {
  background(255, 255, 0);  
  translate(width / 2, height / 2); 
  fill(237, 24, 106);  
  stroke(255);  
  strokeWeight(0); 
  ellipse(0, 0, 600, 600); 
  
  for (int i = 0; i < 60; i++) {
    pushMatrix();
    rotate(i * (PI / 30)); 
    strokeWeight(2);
    stroke(255);
    line(0, -290, 0, -280);
    popMatrix();
  }
 
  for (int i = 0; i < 12; i++) {
    pushMatrix();
    strokeWeight(4);
    stroke(255);
    rotate(i * (PI / 6)); 
    line(0, -290, 0, -270);  
    popMatrix();
  }
  
  int h = hour() % 12;  
  int m = minute();     
  int s = second();    
  
  pushMatrix();
  rotate(map(h + m / 60.0, 0, 12, 0, TWO_PI)); 
  stroke(255);
  strokeWeight(8);
  line(0, 30, 0, -120);  
  popMatrix();
  
  pushMatrix();
  rotate(map(m + s / 60.0, 0, 60, 0, TWO_PI)); 
  stroke(255);
  strokeWeight(6);
  line(0, 30, 0, -180);  
  popMatrix();
  
 
  pushMatrix();
  rotate(map(s, 0, 60, 0, TWO_PI)); 
  stroke(0, 92, 255);
  strokeWeight(4);
  line(0, 30, 0, -200); 
  popMatrix();
  

  fill(255, 255, 0);
  noStroke();
  ellipse(0, 0, 15, 15);  
}
