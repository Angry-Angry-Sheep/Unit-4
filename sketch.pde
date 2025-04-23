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
  drawCoronavirus(300, 300, 50, 0);
  drawCoronavirus(-300, 300, 50, 100);
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

void drawCoronavirus(float x, float y, float r, int seed) {
  pushMatrix();
  translate(x, y, 0);

  randomSeed(seed);

  fill(150, 0, 0);
  stroke(100, 0, 0);
  strokeWeight(1);
  sphere(r);

  int numSpikes = 40;
  for (int i = 0; i < numSpikes; i++) {
    float theta = random(TWO_PI);
    float phi = random(PI);

    float spikeLength = random(r * 0.3, r * 0.6);

    float sx = r * sin(phi) * cos(theta);
    float sy = r * sin(phi) * sin(theta);
    float sz = r * cos(phi);

    float ex = (r + spikeLength) * sin(phi) * cos(theta);
    float ey = (r + spikeLength) * sin(phi) * sin(theta);
    float ez = (r + spikeLength) * cos(phi);

    stroke(80, 0, 0);
    line(sx, sy, sz, ex, ey, ez);

    pushMatrix();
    translate(ex, ey, ez);
    noStroke();
    fill(180, 0, 0);
    sphere(6);
    popMatrix();
  }

  popMatrix();
}
