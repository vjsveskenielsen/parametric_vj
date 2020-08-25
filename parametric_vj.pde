/*
This is a boilerplate for creating VJ apps with Processing
It creates a PGraphics "canvas" named c that you can draw graphics onto,
and outputs that canvas via Syphon.
The canvas is rescalable and renamable.

It relies on:
The Syphon library by Andres Colubri
The Midibus library by Severin Smith
oscP5 and controlP5 by Andreas Schlegel
*/
import codeanticode.syphon.*;
import controlP5.*;
import themidibus.*;
import oscP5.*;
import netP5.*;
import processing.net.*;
import java.util.*;

MidiBus midi;
String[] midi_devices;
OscP5 oscP5;
ControlP5 cp5;
Textfield field_cw, field_ch, field_syphon_name, field_osc_port, field_osc_address;
Button button_ip;
ScrollableList dropdown_midi;
Toggle toggle_log_osc, toggle_log_midi, toggle_view_bg;
Viewport view;
boolean viewport_show_alpha = false;
boolean log_midi = true, log_osc = true;

int port = 9999;
String ip;

PGraphics c;
int cw = 1280, ch = 720;

SyphonServer syphonserver;
String syphon_name = "parametric_vj", osc_address = syphon_name;
Log log;

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

void settings() {
  size(500, 700, P3D);
}

void setup() {
  log = new Log();

  midi_devices = midi.availableInputs();
  controlSetup();
  updateOSC(port);

  c = createGraphics(cw, ch, P3D);
  view = new Viewport(c, 400);
  syphonserver = new SyphonServer(this, syphon_name);
  view.resize(c);
}

void draw() {
  background(127);
  drawGraphics();
  view.display(c, 50, 50);

  pushMatrix();
  translate(50 + view.size/2, 50 + view.size/2);
  fill(color(#6C0000));
  ellipse(x1(t1) * view.w/2, y1(t1)*view.h/2, 10, 10);
  fill(color(#006C00));
  ellipse(x2(t2) * view.w/2, y2(t2)*view.h/2, 10, 10);
  popMatrix();


  syphonserver.sendImage(c);
  log.update();
}

void drawGraphics() {
  t1+=speed1;
  t2+=speed2;
  c.beginDraw();
  c.clear();
  c.stroke(255);
  c.strokeWeight(5);
  c.translate(c.width/2, c.height/2);
  for (int i = 0; i < n; i++) {
    c.line(x1(t1 - i) * c.width/2,
    y1(t1 - i) * c.height/2,
    x2(t2 - i) * c.width/2,
    y2(t2 - i) * c.height/2);
  }
  c.endDraw();

}

float x1(float t) {
  return sin(t / 10) * x1_range1 + sin(t / 3) * x1_range2;
}

float y1(float t) {
  return cos(t / 10) * y1_range1 + cos(t /3) * y1_range2;
}

float x2(float t) {
  return sin(t / 10) * x2_range1 + sin(t / 3) * x2_range2;
}

float y2(float t) {
  return cos(t / 10) * y2_range1 + cos(t /3) *y2_range2;
}
