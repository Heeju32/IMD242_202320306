ArrayList<Particle> particles;
float friction = 0.98; // 마찰력

void setup() {
  fullScreen();
  particles = new ArrayList<Particle>();
}

void mousePressed() {
  particles.clear(); // 기존 파티클 제거
}

void mouseReleased() {
  int cnt = int(random(10, 30)); // 생성할 파티클 수를 랜덤 설정
  for (int n = 0; n < cnt; n++) {
    Particle aNewParticle = new Particle(mouseX, mouseY, 40, 80, 10, 15);
    particles.add(aNewParticle);
  }
}

void draw() {
  background(0);

  // 마우스와 각 파티클을 연결하는 선
  for (Particle p : particles) {
    stroke(150, 150, 255, 150); // 연한 파란색 선
    line(mouseX, mouseY, p.position.x, p.position.y);
  }

  // 파티클 업데이트 및 화면에서 벗어나면 제거
  for (int i = particles.size() - 1; i >= 0; i--) {
    Particle p = particles.get(i);
    p.update(friction);
    p.checkBoundaries(mouseX, mouseY); // 마우스 위치로 되돌아오는지 확인

    if (p.isOutOfScreen()) {
      particles.remove(i);
    }
  }

  // 파티클 그리기
  for (Particle p : particles) {
    p.display();
  }
}

// Particle 클래스
class Particle {
  PVector position;
  PVector velocity;
  float size;
  float maxDistance;

  Particle(float x, float y, float minSize, float maxSize, float minSpeed, float maxSpeed) {
    position = new PVector(x, y);
    float angle = random(TWO_PI);
    float speed = random(minSpeed, maxSpeed);
    velocity = new PVector(cos(angle) * speed, sin(angle) * speed);
    size = random(minSize, maxSize);
    maxDistance = random(300, 500); // 더 넓은 범위로 퍼짐
  }

  void update(float friction) {
    velocity.mult(friction); // 마찰로 인해 속도 감소
    position.add(velocity);
  }

  void checkBoundaries(float targetX, float targetY) {
    float distToMouse = dist(position.x, position.y, targetX, targetY);
    if (distToMouse > maxDistance) {
      // 마우스 위치로 되돌아가기 위해 속도 벡터 설정
      PVector directionToMouse = PVector.sub(new PVector(targetX, targetY), position);
      directionToMouse.normalize();
      directionToMouse.mult(velocity.mag()); // 원래 퍼져나갈 때의 속도 유지
      velocity = directionToMouse;
    } else if (distToMouse < 10) {
      // 마우스에 도달했을 때 다른 방향으로 튕겨 나가도록 설정
      velocity.mult(-1); // 반대 방향으로 튕김
    }
  }

  void display() {
    fill(100, 100, 255, 200); // 연한 파란색 사각형
    noStroke();
    rectMode(CENTER);
    pushMatrix();
    translate(position.x, position.y);
    rotate(velocity.heading()); // 이동 방향에 따라 회전
    rect(0, 0, size, size);
    popMatrix();
  }

  boolean isOutOfScreen() {
    return (position.x < -size || position.x > width + size || 
            position.y < -size || position.y > height + size);
  }
}
