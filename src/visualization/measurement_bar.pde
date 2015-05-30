// Visualisation of one measurement; it fades over time
class MeasurementBar {
  
  int LIFESPAN = 10;
  int bar_x;
  int bar_y;
  int bar_width;
  int bar_height;
  color bar_color;
  int alpha_step;
  
  int life;
  
 
  MeasurementBar(int b_x, int b_y, int b_width, int b_height, color b_color) {
    bar_x = b_x;
    bar_y = b_y;
    bar_width = b_width;
    bar_height = b_height;
    bar_color = b_color;
    alpha_step = round(alpha(b_color) / LIFESPAN);
    life = LIFESPAN;
  }
  
  void draw() {
    fill(bar_color);
    rect(bar_x, bar_y, bar_width, bar_height);
    if (is_alive()) {
      life--;
      update_color();
    } 
  }
  
  boolean is_alive() {
    return life > 0;
  }
  
  private
  
  void update_color() {
    float red = red(bar_color);
    float green = green(bar_color);
    float blue = blue(bar_color);
    float alpha = alpha(bar_color);
    bar_color = color(red, green, blue, alpha - alpha_step); 
  }
  
  
}
