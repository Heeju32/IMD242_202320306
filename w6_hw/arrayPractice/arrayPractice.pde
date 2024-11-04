int[] fruitAmts;
String[] fruitNames = {"mango", "strawberry", "kiwi", "plum", "blueberry"};
color[] barColors = {
  color(255, 205, 118),    
  color(255, 186, 201),  
  color(159, 223, 134),  
  color(159, 96, 141),   
  color(130, 116, 231),
};

float barGap;
float barWidth;
float x;

int total = 0;
float average = 0;

void setup() {
  size(1280, 720);
  
  barGap = width / (fruitNames.length + 1); 
  barWidth = barGap * 0.2; 
  x = barGap; 

  float totalGraphWidth = barGap * (fruitNames.length - 1);
  x = (width - totalGraphWidth) / 2;

  fruitAmts = new int[fruitNames.length];

  for (int n = 0; n < fruitAmts.length; n++) {
    if (n == 0) {
      fruitAmts[n] = 50;
    } else {
      fruitAmts[n] = int(random(5, 100));
    }
    total += fruitAmts[n];
  }
  
  average = total / (float)fruitAmts.length;
}

void draw() {
  background(235);

  strokeWeight(barWidth);

  for (int n = 0; n < fruitNames.length; n++) {
    stroke(barColors[n]);
    strokeCap(SQUARE);
    textAlign(CENTER);
    textSize(width * 0.02);
    
    line(x + barGap * n, height * 0.65,
      x + barGap * n, height * 0.6 - 2 * fruitAmts[n]);

    fill(0);
    text(fruitNames[n], x + barGap * n, height * 0.2 + height * 0.5);
    text(fruitAmts[n], x + barGap * n, height * 0.6 - 2 * fruitAmts[n] - height * 0.05);
  }

  fill(0);
  textAlign(CENTER);
  textSize(width * 0.02);
  text("Total: " + total, width/2 - 432, height - 600);
  text("Average: " + nf(average, 1, 2), width/2 - 405, height - 640);
}