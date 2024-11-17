ArrayList<Particle> particles;
float friction = 0.983;
PFont font;

void setup() {
  fullScreen();
  particles = new ArrayList<Particle>();
  font = createFont("Burn", 60, true);
}

//마우스를 누르면 이전의 파티클을 지우고 랜덤으로 파티클의 수를 설정한다.
void mousePressed() {
  particles.clear();
  int cnt = int(random(12, 80)); 
  for (int n = 0; n < cnt; n++) {
    Particle aNewParticle = new Particle(mouseX, mouseY, 40, 80, 15, 25); //(위치, 크기범위, 속도범위)
    particles.add(aNewParticle);
  }
}

void draw() {
  background(0);

  //좌측 상단에 현재 파티클의 갯수가 몇개인지 알려주는 텍스트를 띄운다.
  fill(255);
  textFont(font);
  text("yoyo fireworks! " + particles.size(), 40, 90);

  //마우스포인트와 파티클들을 연결하는 선
  for (Particle p : particles) {
    stroke(255);
    strokeWeight(0.45);
    line(mouseX, mouseY, p.position.x, p.position.y);
  } 

  //파티클 업데이트 및 경계 처리_(AI로 생성)_화면 끝을 경계로 경계에 닿으면 파티클이 돌아오는 코드를 만들어달라고 요청하였다. 
  for (Particle p : particles) {
    p.update(friction);
    p.checkBoundaries(mouseX, mouseY);
    p.bounceEdges(); 
  }

  for (Particle p : particles) {
    p.display();
  }
}
