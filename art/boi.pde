static final int NUM_LINES = 10;

float t;
int numFrames = 1260/10;
float startx1, startx2, starty1, starty2;

void setup () {
  background(20);
  size(800, 800);
}

void draw() {
 
  background(255);
  
  strokeWeight(5);
  
  
  translate(width/2, height/2);
  
  for (int i = 0; i < NUM_LINES; i++) {
    stroke(5*i*i, 10*i, 20*i);
    line (x1(t+i), y1(t+i), x2(t+i), y2(t+i));
  }
  
  for (int i = 0; i < NUM_LINES; i++) {
    stroke(5*i*i, 10*i, 20*i);
    line (x1(t+i), -y1(t+i), x2(t+i), -y2(t+i));
  }
  
  
  for (int i = 0; i < NUM_LINES; i++) {
    stroke(20*i, 10*i, 5*i*i);
    line (-x1(t+i), y1(t+i), -x2(t+i), y2(t+i));
  }
  
  for (int i = 0; i < NUM_LINES; i++) {
    stroke(20*i, 10*i, 5*i*i);
    line (-x1(t+i), -y1(t+i), -x2(t+i), -y2(t+i));
  }
  
  saveFrame("f####.gif");
  if (frameCount == numFrames) exit();
  
  t += 10*.09973;
  
}

float x1(float t) {
 return 100*sin(t/10) + 100*sin(t/20); 
}

float y1(float t) {
 return 100 * cos(t/10) + 100*sin(t/2); 
}


float x2(float t) {
 return 100*sin(t/20) + 100*sin(t/20); 
}

float y2(float t) {
 return 100 * cos(t/20) + 100*sin(t/2); 
}
