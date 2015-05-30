// Breathing keeps track of current breath and total number of breaths.
// Feed it new measurements through the measure method, which accepts 
// one integer measurement, the expansion.

class Breathing {
  int depth = 0; // current expansion
  int delta_depth = 0; // positive delta = breathe in; negative delta = breathe out
  int number_of_breaths = 0;
  int max_depth = 0;
  
  Breathing() {
  }
  
  int measure(int expansion) {
    int new_delta_depth = expansion - depth;
    if ((breathing_out() || holding_breath()) && new_delta_depth > 0) {
      // started to breathe in: this is the start of a new breathing cycle
      number_of_breaths++;
    }
    
    delta_depth = new_delta_depth;
    
    depth = expansion;
    
    if (depth > max_depth) {
      max_depth = depth;
    }  
    
    return depth;
  }
  
  int number_of_breaths() {
    return number_of_breaths;
  }
  
  int depth() {
    return depth;
  }
  
  int speed() {
    return delta_depth;
  }
  
  boolean breathing_in() {
    return delta_depth > 0;
  }
  
  boolean breathing_out() {
    return delta_depth < 0;
  }
  
  boolean holding_breath() {
    return delta_depth == 0;
  }
  
}
