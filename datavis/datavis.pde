float[] values;

void setup() {
  size(600, 600);
  values = new float[width];
  
  for (int i = 0; i < values.length; i++) {
    values[i] = random(height);
  }
}

void sort(float[] arr) {
  
}

void draw() {
  background(0);
  
  for (int i = 0; i < values.length; i++) {
     stroke(255);
     line(i, height, i, height - values[i]);
  }
  
}
