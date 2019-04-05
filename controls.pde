void controlSetup() {
  cp5 = new ControlP5(this);
  int xoff = 10;
  int yoff = 10;

  field_cw = cp5.addTextfield("field_cw")
    .setPosition(xoff, yoff)
    .setSize(100, 20)
    .setAutoClear(false)
    .setText(Integer.toString(cw))
    .setLabel("canvas width")
    ;

  xoff += 120;
  field_ch = cp5.addTextfield("field_ch")
    .setPosition(xoff, yoff)
    .setSize(100, 20)
    .setAutoClear(false)
    .setText(Integer.toString(ch))
    .setLabel("canvas height")
    ;

  xoff = 10;
  yoff = 300;
  cp5.addSlider("n")
    .setPosition(xoff, yoff)
    .setSize(100, 15)
    .setRange(1, 30)
    .setValue(10)
    ;

  yoff += 30;
  cp5.addSlider("speed1")
    .setPosition(xoff, yoff)
    .setSize(100, 15)
    .setRange(-.5, .5)
    .setValue(.02)
    ;
  yoff += 20;
  cp5.addSlider("x1_range1")
    .setPosition(xoff, yoff)
    .setSize(100, 15)
    .setRange(0., 1.)
    .setValue(.25)
    ;
  yoff += 20;
  cp5.addSlider("x1_range2")
    .setPosition(xoff, yoff)
    .setSize(100, 15)
    .setRange(0., 1.)
    .setValue(.25)
    ;  
  yoff += 20;
  cp5.addSlider("y1_range1")
    .setPosition(xoff, yoff)
    .setSize(100, 15)
    .setRange(0., 1.)
    .setValue(.25)
    ;
  yoff += 20;
  cp5.addSlider("y1_range2")
    .setPosition(xoff, yoff)
    .setSize(100, 15)
    .setRange(0., 1.)
    .setValue(.25)
    ;

  yoff = 330;
  xoff += 150;

  cp5.addSlider("speed2")
    .setPosition(xoff, yoff)
    .setSize(100, 15)
    .setRange(-.5, .5)
    .setValue(.02)
    ;
  yoff += 20;
  cp5.addSlider("x2_range1")
    .setPosition(xoff, yoff)
    .setSize(100, 15)
    .setRange(0., 1.)
    .setValue(.25)
    ;
  yoff += 20;
  cp5.addSlider("x2_range2")
    .setPosition(xoff, yoff)
    .setSize(100, 15)
    .setRange(0., 1.)
    .setValue(.25)
    ;  
  yoff += 20;
  cp5.addSlider("y2_range1")
    .setPosition(xoff, yoff)
    .setSize(100, 15)
    .setRange(0., 1.)
    .setValue(.25)
    ;
  yoff += 20;
  cp5.addSlider("y2_range2")
    .setPosition(xoff, yoff)
    .setSize(100, 15)
    .setRange(0., 1.)
    .setValue(.25)
    ;
}

int evalCanvasInputValue(String in, int current, Controller con) {
  int out = -1;
  char[] ints = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9'};
  char[] input = in.toCharArray();

  String txt = "value not int between 1 and 9999";
  if (input.length < 5) {
    int check = 0;
    for (char ch : input) {
      for (char i : ints) {
        if (ch == i) check++;
      }
    }

    if (input.length == check) {
      int verified_int = Integer.parseInt(in);
      txt = "value changed from " + current + " to " + verified_int;
      if (verified_int < 1) { 
        verified_int = 1;
        txt = "value was lower than 0 and defaults to " + verified_int;
      }
      if (verified_int == current) txt = "value is not different from " + current;
      else {
        out = verified_int;
      }
    }
  }
  //con.setLabel(txt);

  return out;
}

public void field_cw(String theText) {
  int value = evalCanvasInputValue(theText, cw, cp5.getController("field_cw"));
  if (value > 0) {
    cw = value;
    updateCanvas();
  }
}
public void field_ch(String theText) {
  int value = evalCanvasInputValue(theText, ch, cp5.getController("field_ch"));
  if (value > 0) {
    ch = value;
    updateCanvas();
  }
}
