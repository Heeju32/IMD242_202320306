let capture;

function setup() {
  createCanvas(400, 400);
  capture = createCapture(VIDEO);
  capture.size(60, 60);
  capture.hide();
}

function draw() {
  background(220);
  image(capture, 0, 0, width, height);
}
