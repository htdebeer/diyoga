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

void setup() {
  size(width,height);
  //size(displayWidth, displayHeight);
  //LINE_WIDTH = displayWidth
  br = new Breathing();
  vis = new BreathingVisualisation(br, LINE_WIDTH, LINE_HEIGHT, HISTORY );
}


int[] test_measurements = {2, 4, 6, 12, 34, 56, 78, 56, 34, 14, 2};
int ti = 0;

void draw() {
  // use test "measurments"
  int measurement = test_measurements[ti] * round(random(1,4));
  br.measure(measurement);
  ti = (ti+1) % test_measurements.length;
  vis.draw();      
  sleep(200); // set to match frequency of measurements 
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
