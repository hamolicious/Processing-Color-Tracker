
PImage simpleMask() {
  PImage img = cam.copy();

  for (int i = 0; i < img.height; i++) {
    for (int j = 0; j < img.width; j++) {
      color c = img.get(j, i);

      float r = int(red(c) / 50) * 50;
      float g = int(green(c) / 50) * 50;
      float b = int(blue(c) / 50) * 50;

      img.set(j, i, color(r, g, b));
    }
  }

  return img;
}

PImage colorMask(PImage img) {

  for (int i = 0; i < img.height; i++) {
    for (int j = 0; j < img.width; j++) {
      color c = img.get(j, i);

      color set;
      if (dist(red(tracking), green(tracking), blue(tracking), red(c), green(c), blue(c)) < sensitivity) {
        set = color(255);
      } else {
        set = color(0);
      }

      img.set(j, i, set);
    }
  }

  return img;
}

void avrgDistrib(PImage img) {
  float avrgX = 0;
  float avrgY = 0;
  float count = 0;

  for (int i = 0; i < img.height; i++) {
    for (int j = 0; j < img.width; j++) {
      color c = img.get(j, i);

      if (c == color(255)) {
        avrgX += j;
        avrgY += i;
        count++;
      }
    }
  }

  avrgX /= count;
  avrgY /= count;

  PGraphics toadd = createGraphics(100, 100);
  toadd.beginDraw();
  toadd.image(cam.get(int(avrgX) - 50, int(avrgY) - 50, int(avrgX) + 50, int(avrgY) + 50), 0, 0);
  toadd.endDraw();
  image(toadd, 0, cam.height);

  fill(255);
  noStroke();
  textSize(20);
  textAlign(LEFT, CENTER);
  text("Average Distribution", 105, cam.height + 50);

  noFill();
  stroke(255);
  strokeWeight(2);
  circle(avrgX, avrgY, 5);
}

void pxlDensity(PImage img) {
  float count = 0;

  for (int i = 0; i < img.height; i++) {
    for (int j = 0; j < img.width; j++) {
      color c = img.get(j, i);

      if (c == color(255)) {
        count++;
      }
    }
  }
  
  float density = count / (img.height + img.width);
  text("Density: " + density + " per pixel", cam.width + 5, cam.height + 10);
}
