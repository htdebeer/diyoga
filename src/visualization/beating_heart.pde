
class BeatingHeart {
  
  int[] DOMAIN;
  int[] RANGE;
  
  BeatingHeart(int[] domain, int[] range) {
    DOMAIN = domain;
    RANGE = range;
  }
  
  int map(beat) {
    return beat * ((DOMAIN[MAX] - DOMAIN[MIN]) / (RANGE[MAX] - RANGE[MIN]) );
  }
  
  int measure(beat) {
    
    return beat
  }
  
}
