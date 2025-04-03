void setup() {
  size(400, 400);
  background(255);

  drawRobotFace(200, 200, 150);
  drawRobotFace(300, 300, 250);
}

void drawRobotFace(float x, float y, float size) {

  drawHead(x, y, size);

  drawEyes(x, y, size);

  drawNose(x, y, size);

  drawMouth(x, y, size);
}

void drawHead(float x, float y, float size) {
  fill(180);
  stroke(0);
  ellipse(x, y, size, size);
}

void drawEyes(float x, float y, float size) {
  float eyeSize = size / 6;
  float eyeOffset = size / 4;
  
  fill(0);
  ellipse(x - eyeOffset, y - eyeOffset, eyeSize, eyeSize);  // Left eye
  ellipse(x + eyeOffset, y - eyeOffset, eyeSize, eyeSize);  // Right eye
}

void drawNose(float x, float y, float size) {
  float noseWidth = size / 8;
  float noseHeight = size / 10;
  
  fill(0);
  triangle(x - noseWidth / 2, y, x + noseWidth / 2, y, x, y + noseHeight);
}

void drawMouth(float x, float y, float size) {
  float mouthWidth = size / 2;
  float mouthHeight = size / 10;
  
  noFill();
  stroke(0);
  arc(x, y + size / 4, mouthWidth, mouthHeight, 0, PI);
}
