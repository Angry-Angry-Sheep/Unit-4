void setup() {
  size(800, 400);
  background(135, 206, 235);

  drawClouds(5);

  drawGround();

  drawHouse(100, 250, 100, 100);
  drawHouse(250, 230, 120, 120);
  drawHouse(420, 240, 90, 90);
  drawHouse(560, 250, 110, 100);
  drawHouse(680, 235, 100, 110);
}

void drawGround() {
  fill(34, 139, 34);
  rect(0, height * 2 / 3, width, height / 3);
}

void drawHouse(float x, float y, float w, float h) {
  fill(210, 180, 140);
  rect(x, y, w, h);

  fill(139, 69, 19);
  triangle(x, y, x + w / 2, y - h / 2, x + w, y);

  fill(101, 67, 33);
  rect(x + w / 3, y + h / 2, w / 4, h / 2);

  fill(173, 216, 230);
  rect(x + 10, y + 20, 20, 20);
  rect(x + w - 30, y + 20, 20, 20);
}

void drawClouds(int count) {
  for (int i = 0; i < count; i++) {
    float x = random(width);
    float y = random(50, 150);
    drawCloud(x, y);
  }
}

void drawCloud(float x, float y) {
  fill(255);
  noStroke();
  float size = random(40, 70);
  ellipse(x, y, size, size);
  ellipse(x + 20, y - 10, size * 0.8, size * 0.8);
  ellipse(x + 40, y, size, size);
  ellipse(x + 20, y + 10, size * 0.7, size * 0.7);
}
