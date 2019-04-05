void noteOn(int channel, int pitch, int velocity) {
  // Receive a noteOn
  println();
  println("Note On:");
  println("--------");
  println("Channel:"+channel);
  println("Pitch:"+pitch);
  println("Velocity:"+velocity);
}

void noteOff(int channel, int pitch, int velocity) {
  // Receive a noteOff
  println();
  println("Note Off:");
  println("--------");
  println("Channel:"+channel);
  println("Pitch:"+pitch);
  println("Velocity:"+velocity);
}

void controllerChange(int channel, int number, int value) {
  // Receive a controllerChange
  println();
  println("Controller Change:");
  println("--------");
  println("Channel:"+channel);
  println("Number:"+number);
  println("Value:"+value);
  
  if (channel == 4 && number == 7) changeSlider("speed1", value);
  else if (channel == 5 && number == 7) changeSlider("speed2", value);
  else if (channel == 10 && number == 7) changeSlider("n", value);
  else if (channel == 0 && number == 16) changeSlider("x1_range1", value);
  else if (channel == 0 && number == 17) changeSlider("x1_range2", value);
  else if (channel == 0 && number == 20) changeSlider("y1_range1", value);
  else if (channel == 0 && number == 21) changeSlider("y1_range2", value);
  else if (channel == 0 && number == 18) changeSlider("x2_range1", value);
  else if (channel == 0 && number == 19) changeSlider("x2_range2", value);
  else if (channel == 0 && number == 22) changeSlider("y2_range1", value);
  else if (channel == 0 && number == 23) changeSlider("y2_range2", value);
}

void changeSlider(String name, int value) {
  Controller con = cp5.getController(name);
  con.setValue(map(value, 0, 127, con.getMin(), con.getMax()));
}
