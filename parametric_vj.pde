import codeanticode.syphon.*;
import controlP5.*;
import themidibus.*;

MidiBus myBus;

ControlP5 cp5;

Textfield field_cw, field_ch;

int n;
float t1, 
      t2, 
      speed1, 
      speed2, 
      x1_range1,
      x1_range2,
      y1_range1,
      y1_range2,
      x2_range1,
      x2_range2,
      y2_range1,
      y2_range2
      ;

PGraphics c, echo;
int cw = 1280, ch = 720;
int c_view_w;
int c_view_h;
int c_view = 400;
int c_view_off_w = 0, c_view_off_h = 0;

SyphonServer server;

void settings() {
  size(500, 500, P3D);
}

void setup() {
  background(0);
  MidiBus.list();
  myBus = new MidiBus(this, "Conspiracy", 1);
  controlSetup();
  c = createGraphics(cw, ch, P3D);
  
  clearEcho();
  
  server = new SyphonServer(this, "parametric_vj");
  resizeView();
}

void draw() {
  background(127);
  drawGraphics();
  view(50, 50);
  server.sendImage(c);
}

void view(int x, int y) {
  pushMatrix();
  translate(x, y);
  fill(100);
  noStroke();
  rect(c_view_off_w, c_view_off_h, c_view_w, c_view_h);
  image(c, c_view_off_w, c_view_off_h, c_view_w, c_view_h);
  popMatrix();
}

void clearEcho() {
  echo = c;
  echo.beginDraw();
  echo.clear();
  echo.endDraw();
}

void drawGraphics() {  
  c.beginDraw();
  c.clear();
  c.tint(255, 250);
  c.image(echo, c.width, c.height);
  c.tint(255, 255);
  c.stroke(255);
  c.strokeWeight(5);
  c.translate (c.width/2, c.height/2);

  for (int i = 0; i < n; i++) {
    c.line(x1(t1 + i), y1(t1 + i), x2(t2 + i), y2(t2 + i));
  }
  c.endDraw();
  t1+=speed1;
  t2+=speed2;
}

void resizeView() {
  float aspect = 1.;
  c_view_w = c_view;
  c_view_h = c_view;
  c_view_off_w = 0;
  c_view_off_h = 0;
  aspect = float( min(c.width, c.height)) / float( max(c.width, c.height)); 
  if (c.width > c.height) {
    c_view_h *= aspect;
    c_view_off_h = (c_view-c_view_h)/2;
  } else if (c.height > c.width) { 
    c_view_w *= aspect;
    c_view_off_w = (c_view-c_view_w)/2;
  }
}

void updateCanvas() {
  c = createGraphics(cw, ch, P3D);
  clearEcho();
  resizeView();
}

void updateCanvas(int w, int h) {
  c = createGraphics(w, h, P3D);
  clearEcho();
  resizeView();
}

float x1(float t) {
  return sin(t / 10) * c.width/2 * x1_range1 + sin(t / 3) * c.width/2 * x1_range2;
}

float y1(float t) {
  return cos(t / 10) * c.height/2 * y1_range1 + cos(t /3) * c.height/2 *y1_range2;
}

float x2(float t) {
  return sin(t / 10) * c.width/2 * x2_range1 + sin(t / 3) * c.width/2 * x2_range2;
}

float y2(float t) {
  return cos(t / 10) * c.height/2 * y2_range1 + cos(t /3) * c.height/2 *y2_range2;
}
