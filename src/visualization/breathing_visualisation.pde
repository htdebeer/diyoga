// Visualising a Breathing
class BreathingVisualisation {
  Breathing br;
  
  int x = 0;
  int y = 0;
  int line_width;
  int line_height;
  
  
  MeasurementBar[] mbs;
  int current_measurement = 0;
  color current_color;
  
  int compute_y(int y) {
    return height - y + line_height;
  }

  
  BreathingVisualisation(Breathing breathing, int l_width, int l_height, int fade_time) {
    br = breathing;
    line_width = l_width;
    line_height = l_height;
    mbs = new MeasurementBar[fade_time];
  }
  
  void draw() {
    clear();
    
    if (mbs[current_measurement] != null) {
     mbs[current_measurement] = null;
    }
 
    current_color = set_color();
    mbs[current_measurement] = new MeasurementBar(0,compute_y(br.depth),line_width, line_height, current_color);
    current_measurement = (current_measurement + 1) % mbs.length;
    
    for (int i = 0; i < mbs.length; i++) {
      if (mbs[i] != null) mbs[i].draw();
    }
  }
  
  private 
  
  color set_color() {
    int speed = abs(br.speed());
    if (br.breathing_in()) {
      return color(0,0,255,speed);
    } else if (br.breathing_out()) {
      return color(0,255,0,speed);
    } else {
      // keep
      return current_color;
    }
  }
}
