// measuring and visualizing breathing 

int width = 400;
int height = 400;
// sets size to cover whole screen; have a boolean sketchFullScreen return true to 
// start in fullscreen mode automatically  
//size(displayWidth, displayHeight);
int LINE_HEIGHT = 20;
int LINE_WIDTH = width;
int HISTORY = 10;

Breathing br;
BreathingVisualisation vis;
Table breathing_data;

void setup() {
  size(width,height);
  //size(displayWidth, displayHeight);
  //LINE_WIDTH = displayWidth;
  int[] expansion_domain = {0, 500};
  int[] expansion_range = {0, height};
  br = new Breathing(expansion_domain, expansion_range );
  vis = new BreathingVisualisation(br, LINE_WIDTH, LINE_HEIGHT, HISTORY );
}


//int[] test_measurements = {2, 4, 6, 12, 34, 56, 78, 56, 34, 14, 2};
//int ti = 0;

void draw() {
  // use test "measurments"
  //int measurement = test_measurements[ti] * round(random(1,4));
  //ti = (ti+1) % test_measurements.length;

  breathing_data = loadTable("../../serial-data", "csv");
  if (breathing_data.getRowCount() > 0) {
    int measurement = breathing_data.getInt(0, 4);
    br.measure(measurement);
    vis.draw();
  } else {
    println("Error reading data file");
  }    
  sleep(100); // set to match frequency of measurements 
}

void sleep(int duration) {
  int now = millis();
  while (millis()-now < duration) {
  }
}

// return true to automatically start full screen
boolean sketchFullScreen() {
  return false;
}
