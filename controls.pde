void controlSetup() {
  cp5 = new ControlP5(this);
  float xoff = 10;
  float yoff = 10;

  field_cw = cp5.addTextfield("field_cw")
  .setPosition(xoff, yoff)
  .setSize(30, 20)
  .setAutoClear(false)
  .setText(Integer.toString(cw))
  .setLabel("width")
  .setId(-1)
  ;

  xoff += field_cw.getWidth() + 10;
  field_ch = cp5.addTextfield("field_ch")
  .setPosition(xoff, yoff)
  .setSize(30, 20)
  .setAutoClear(false)
  .setText(Integer.toString(ch))
  .setLabel("height")
  .setId(-1)
  ;

  xoff += field_ch.getWidth() + 10;
  field_syphon_name = cp5.addTextfield("field_syphon_name")
  .setPosition(xoff, yoff)
  .setSize(60, 20)
  .setAutoClear(false)
  .setText(syphon_name)
  .setLabel("syphon name")
  .setId(-1)
  ;

  xoff += field_syphon_name.getWidth() + 10;
  toggle_view_bg = cp5.addToggle("viewport_show_alpha")
  .setPosition(xoff, yoff)
  .setSize(50, 20)
  .setValue(viewport_show_alpha)
  .setLabel("alpha / none")
  .setMode(ControlP5.SWITCH)
  .setId(-1)
  ;

  xoff += toggle_view_bg.getWidth() + 10;
  button_ip = cp5.addButton("button_ip")
  .setPosition(xoff, yoff)
  .setSize(70, 20)
  .setLabel("ip: " + ip)
  .setSwitch(false)
  .setId(-1)
  ;

  xoff += button_ip.getWidth() + 10;
  field_osc_port = cp5.addTextfield("field_osc_port")
  .setPosition(xoff, yoff)
  .setSize(30, 20)
  .setAutoClear(false)
  .setText(Integer.toString(port))
  .setLabel("osc port")
  .setId(-1)
  ;

  xoff += field_osc_port.getWidth() + 10;
  field_osc_address = cp5.addTextfield("field_osc_address")
  .setPosition(xoff, yoff)
  .setSize(50, 20)
  .setAutoClear(false)
  .setText(syphon_name)
  .setLabel("osc address")
  .setId(-1)
  ;

  xoff += field_osc_address.getWidth() + 10;
  toggle_log_osc = cp5.addToggle("log_osc")
  .setPosition(xoff, yoff)
  .setSize(30, 20)
  .setLabel("log osc")
  .setValue(true)
  .setId(-1)
  ;

  xoff = (int)button_ip.getPosition()[0];
  yoff += 40;
  dropdown_midi = cp5.addScrollableList("dropdown_midi")
  .setPosition(xoff, yoff)
  .setSize(100, 100)
  .setOpen(false)
  .setBarHeight(20)
  .setItemHeight(20)
  .addItems(Arrays.asList(midi_devices))
  .setLabel("MIDI INPUT")
  .setId(-1)
  // .setType(ScrollableList.LIST) // currently supported DROPDOWN and LIST
  ;

  xoff += dropdown_midi.getWidth() + 10;
  toggle_log_midi = cp5.addToggle("log_midi")
  .setPosition(xoff, yoff)
  .setSize(30, 20)
  .setLabel("log midi")
  .setValue(true)
  .setId(-1)
  ;

  // VJ CONTROLS
  xoff = 10;
  yoff = 410;
  cp5.addKnob("n")
  .setPosition(xoff, yoff)
  .setSize(40, 40)
  .setRange(1, 30)
  .setValue(10)
  .setColorForeground(color(#FFAABB))
  ;
  yoff += cp5.getController("n").getHeight()+20;
  cp5.addKnob("linewidth")
  .setPosition(xoff, yoff)
  .setSize(40, 40)
  .setRange(1, 30)
  .setValue(10)
  ;

  xoff += cp5.getController("linewidth").getWidth()+10;
  yoff = cp5.getController("n").getPosition()[1];
  cp5.addKnob("speed1")
  .setPosition(xoff, yoff)
  .setSize(40, 40)
  .setRange(-.5, .5)
  .setValue(.02)
  .setId(0)
  ;

  yoff += cp5.getController("speed1").getHeight()+20;
  cp5.addKnob("x1_range1")
  .setPosition(xoff, yoff)
  .setSize(40, 40)
  .setRange(0., 1.)
  .setValue(.25)
  .setId(0)
  ;
  xoff += cp5.getController("x1_range1").getWidth()+10;
  cp5.addKnob("y1_range1")
  .setPosition(xoff, yoff)
  .setSize(40, 40)
  .setRange(0., 1.)
  .setValue(.25)
  .setId(0)
  ;
  xoff = cp5.getController("x1_range1").getPosition()[0];
  yoff += cp5.getController("y1_range1").getHeight()+20;
  cp5.addKnob("x1_range2")
  .setPosition(xoff, yoff)
  .setSize(40, 40)
  .setRange(0., 1.)
  .setValue(.25)
  .setId(0)
  ;

  xoff += cp5.getController("x1_range2").getWidth()+10;
  yoff = cp5.getController("x1_range2").getPosition()[1];
  cp5.addKnob("y1_range2")
  .setPosition(xoff, yoff)
  .setSize(40, 40)
  .setRange(0., 1.)
  .setValue(.25)
  .setId(0)
  ;

  xoff += cp5.getController("y1_range2").getWidth()+10;
  yoff = cp5.getController("n").getPosition()[1];
  cp5.addKnob("speed2")
  .setPosition(xoff, yoff)
  .setSize(40, 40)
  .setRange(-.5, .5)
  .setValue(.02)
  .setId(1)
  ;

  yoff += cp5.getController("speed2").getHeight()+20;
  cp5.addKnob("x2_range1")
  .setPosition(xoff, yoff)
  .setSize(40, 40)
  .setRange(0., 1.)
  .setValue(.25)
  .setId(1)
  ;
  xoff += cp5.getController("x2_range1").getWidth()+10;
  cp5.addKnob("y2_range1")
  .setPosition(xoff, yoff)
  .setSize(40, 40)
  .setRange(0., 1.)
  .setValue(.25)
  .setId(1)
  ;
  xoff = cp5.getController("x2_range1").getPosition()[0];
  yoff += cp5.getController("y2_range1").getHeight()+20;
  cp5.addKnob("x2_range2")
  .setPosition(xoff, yoff)
  .setSize(40, 40)
  .setRange(0., 1.)
  .setValue(.25)
  .setId(1)
  ;

  xoff += cp5.getController("x2_range2").getWidth()+10;
  yoff = cp5.getController("x2_range2").getPosition()[1];
  cp5.addKnob("y2_range2")
  .setPosition(xoff, yoff)
  .setSize(40, 40)
  .setRange(0., 1.)
  .setValue(.25)
  .setId(1)
  ;

  cp5.setColorForeground(color(#6C6C6C));
  cp5.setColorBackground(color(#3C3C3C));
  cp5.setColorActive(color(#9C9C9C));
  List list = cp5.getAll();
  for (int i = 0; i<list.size(); i++) {
    Controller con = (Controller)list.get(i);
    switch(con.getId()) {
      case 0:
      con.setColorForeground(color(#6C0000));
      con.setColorBackground(color(#3C0000));
      con.setColorActive(color(#9C0000));
      break;
      case 1:
      con.setColorForeground(color(#006C00));
      con.setColorBackground(color(#003C00));
      con.setColorActive(color(#009C00));
      break;
    }
  }


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
