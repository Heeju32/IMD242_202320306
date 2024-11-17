class Particle {
  PVector position;
  PVector velocity;
  float size;
  float maxDistance;
  int shape; // 0: 원, 1: 별
  int starPoints;

  //생성될 파티클들의 랜덤값을 설정한다._퍼져나갈 각도, 퍼져나가는 속도, 크기, 모양(원 / 랜덤꼭짓점의 별)
  Particle(float x, float y, float minSize, float maxSize, float minSpeed, float maxSpeed) {
    position = new PVector(x, y);
    float angle = random(TWO_PI);
    float speed = random(15, 28);
    velocity = new PVector(cos(angle) * speed, sin(angle) * speed);
    size = random(13, 68);
    maxDistance = random(300, 1000);
    shape = int(random(0, 2)); //0은 원을 생성시키고 1은 별모양을 생성시킨다.
    starPoints = int(random(5, 8));
  }

  void update(float friction) {
    velocity.mult(friction);
    position.add(velocity); //속도값에 위치값이 더해져서 파티클이 속도만큼 이동한다.
  }
  
    //(AI로생성됨)_파티클이 랜덤값만큼 퍼졌다가 돌아오고 마우스 위치에 닿으면 다시 튕겨나가게할 수 있는 코드를 요청하였다.
    void checkBoundaries(float targetX, float targetY) {
    float distToMouse = dist(position.x, position.y, targetX, targetY);
    if (distToMouse > maxDistance) {
      PVector directionToMouse = PVector.sub(new PVector(targetX, targetY), position);
      directionToMouse.normalize();
      directionToMouse.mult(velocity.mag());
      velocity = directionToMouse;
    } else if (distToMouse < 10) {
      velocity.mult(-1); //반대 방향으로 튕기게하기 
    }
  }

  void bounceEdges() {
    // 화면 경계에서 튕기도록 설정
    if (position.x <= 0 || position.x >= width) {
      velocity.x *= -1; // x축 반전
    }
    if (position.y <= 0 || position.y >= height) {
      velocity.y *= -1; // y축 반전
    }
  }

  void display() {
    noStroke();
    colorMode(HSB);
    float hue = map(position.x, 0, width, 30, 255); 
    float saturation = random(220, 255);
    float brightness = random(80, 225); //랜덤값의 범위가 커질수록 더 번쩍거리는 효과를 줄 수 있다. 
    fill(hue, saturation, brightness, 220);

    if (shape == 0) {
      ellipse(position.x, position.y, size, size);
    } else if (shape == 1) {
      drawStar(position.x, position.y, size / 2, size, starPoints);
    }
  }

  //(AI로 생성됨)_랜덤값에따라 꼭짓점의 갯수가 다르게 별모양이 생성되도록하는 코드를 요청하였다.
  void drawStar(float x, float y, float radius1, float radius2, int npoints) {
    float angle = TWO_PI / starPoints;
    float halfAngle = angle / 2.0;
    beginShape();
    for (float a = 0; a < TWO_PI; a += angle) {
      float sx = x + cos(a) * radius2;
      float sy = y + sin(a) * radius2;
      vertex(sx, sy);
      sx = x + cos(a + halfAngle) * radius1;
      sy = y + sin(a + halfAngle) * radius1;
      vertex(sx, sy);
    }
    endShape(CLOSE);
  }
}
