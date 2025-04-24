PImage stem1;
PImage stem2;
float angle = 0;

void setup() {
  size(1000, 800, P3D);
  stem1 = loadImage("stem1.png");
  stem2 = loadImage("stem2.png");
}

void draw() {
  background(200);
  lights();

  translate(width/2, height/2, -200);
  rotateX(PI/6);
  rotateY(frameCount * 0.01);

  drawDNA();
}

void drawDNA() {
  int helixLength = 200;
  float radius = 100;
  int steps = 100;

  for (int i = 0; i < steps; i++) {
    float t = map(i, 0, steps, 0, TWO_PI * 4);
    float y = map(i, 0, steps, -helixLength, helixLength);

    float x1 = cos(t) * radius;
    float z1 = sin(t) * radius;

    float x2 = cos(t + PI) * radius;
    float z2 = sin(t + PI) * radius;

    pushMatrix();
    translate(x1, y, z1);
    rotateY(t + PI/2);
    image(stem1, 0, 0, 40, 10);
    popMatrix();

    pushMatrix();
    translate(x2, y, z2);
    rotateY(t + PI/2);
    image(stem2, 0, 0, 40, 10);
    popMatrix();

    stroke(50);
    strokeWeight(2);
    line(x1, y, z1, x2, y, z2);
  }
}
