boolean showCheeks = false;
float leftIrisX, leftIrisY;
float rightIrisX, rightIrisY;
float irisSpeed = 0.1;

void setup() {
  size(640, 640);
  background(255, 229, 227);
  
  //안광위치설정
  
  leftIrisX = 0;
  leftIrisY = 0;
  rightIrisX = 0;
  rightIrisY = 0;
}

void draw() {
  
  background(255, 229, 227);
  
  //얼굴
  stroke(129, 43, 63);
  fill(246, 177, 195);
  strokeWeight(26);
  ellipse(320, 310, 400, 400);
  
  //눈
  noStroke();
  fill(129, 43, 63);
  
  // x값으로부터 동일한 거리에 눈 배치
  float eyeOffsetX = 50;
  
  //왼쪽눈
  ellipse(320 - eyeOffsetX, 265, 60, 130);
  
  //오른쪽눈
  ellipse(320 + eyeOffsetX, 265, 60, 130);
  
  float targetIrisX = constrain(mouseX - 320, -15, 15);
  float targetIrisY = constrain(mouseY - 300 , 30, 0);
  
  // 부드러운 이동
  leftIrisX += (targetIrisX - leftIrisX) * irisSpeed;
  leftIrisY += (targetIrisY - leftIrisY) * irisSpeed;
  
  rightIrisX += (targetIrisX - rightIrisX) * irisSpeed;
  rightIrisY += (targetIrisY - rightIrisY) * irisSpeed;
  
  // 안광
  fill(255);
  ellipse(320 - eyeOffsetX + leftIrisX, 240 + leftIrisY, 30, 55);
  ellipse(320 + eyeOffsetX + rightIrisX, 240 + rightIrisY, 30, 55);
  
  //볼터치1
  fill(245, 156, 175);
  ellipse(320 - eyeOffsetX - 42, 330, 70, 40);
  ellipse(320 + eyeOffsetX + 42, 330, 70, 40);
  //볼터치2
  fill(242, 117, 139);
  ellipse(320 - eyeOffsetX - 42, 330, 57, 30);
  ellipse(320 + eyeOffsetX + 42, 330, 57, 30);
  
  //입
  noFill();
  stroke(129, 43, 63);
  strokeWeight(7);
  float mouthWidth = ((320 + eyeOffsetX) - (320 - eyeOffsetX)) / 2;
  arc(320, 275 + 60, mouthWidth, 70, 0.5, PI-0.5);  // 눈 아래에 입 추가
  
  if (showCheeks){
    stroke(129, 43, 63);
    fill(246, 177, 195); 
    strokeWeight(26);

    float ballSize = 100; 
    float offsetX = 140; 
    float offsetY = 50;  

    // 왼쪽 반구 볼
    arc(300 - offsetX, 330 + offsetY, ballSize+120, ballSize+120, 1.05, PI+1.3, OPEN);

    // 오른쪽 반구 볼
    arc(310 + offsetX, 330 + offsetY, ballSize+125, ballSize+125, -1.03, PI-1.2, OPEN);
  }
}

void mousePressed() {
    showCheeks = true;
    redraw();
  }

void mouseReleased() {
  showCheeks = false;
  redraw();
}
