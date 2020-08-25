class Viewport {
  int w;
  int h;
  int size;
  int off_w = 0, off_h = 0;
  PGraphics bg;

  Viewport(PGraphics pg, int _size) {
    size = _size;
  }

  void display(PGraphics pg, int x, int y) {
    pushMatrix();
    translate(x, y);
    noStroke();
    fill(255);
    drawPointers();
    fill(100);

    if (viewport_show_alpha) image(bg, off_w, off_h, w, h);
    image(pg, off_w, off_h, w, h);
    popMatrix();
  }

  void resize(PGraphics pg) {
    float aspect = 1.;
    w = size;
    h = size;
    off_w = 0;
    off_h = 0;

    aspect = float( min(pg.width, pg.height)) / float( max(pg.width, pg.height));
    if (pg.width > pg.height) {
      h *= aspect;
      off_h = (size-h)/2;
    } else if (pg.height > pg.width) {
      w *= aspect;
      off_w = (size-w)/2;
    }
    bg = createAlphaBackground(w, h);
  }

  PGraphics createAlphaBackground(int _w, int _h) {

    PGraphics abg = createGraphics(_w, _h, P2D);
    int s = 10; // size of square
    abg.beginDraw();
    abg.background(127+50);
    abg.noStroke();
    abg.fill(127-50);
    for (int x = 0; x < _w; x+=s+s) {
      for (int y = 0; y < _h; y+=s+s) {
        abg.rect(x, y, s, s);
      }
    }
    for (int x = s; x < _w; x+=s+s) {
      for (int y = s; y < _h; y+=s+s) {
        abg.rect(x, y, s, s);
      }
    }
    abg.endDraw();
    return abg;
  }

  void drawPointers() {
    int x = off_w;
    int y = off_h;
    triangle(x, y, x-5, y, x, y-5);
    x += bg.width;
    triangle(x, y, x+5, y, x, y-5);
    y += bg.height;
    triangle(x, y, x+5, y, x, y+5);
    x = off_w;
    triangle(x, y, x-5, y, x, y+5);
  }
}

void updateCanvas() {
  c = createGraphics(cw, ch, P3D);
  view.resize(c);
}

void updateCanvas(int _w, int _h) {
  c = createGraphics(_w, _h, P3D);
  view.resize(c);
}
