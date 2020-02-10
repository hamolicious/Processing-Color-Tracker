
void setup() {
  fullScreen();

  initCam();
}

void draw() {
  background(51);

  readCam();
  cam.resize(width/2, height/2);
  PImage simpleImg = simpleMask();
  PImage colorMask = colorMask(simpleImg);

  // draw views
  image(cam, 0, 0);
  image(colorMask, cam.width, 0);
  avrgDistrib(colorMask);
  pxlDensity(colorMask);
}

void keyPressed() {
  if (key == 'p') {
    exit();
  }
}
