CA ca;

void setup() {
  size(100, 800);
  frameRate(30);
  background(255);
  //int[] ruleset = {0,1,1,1,1,0,1,1};           // Rule 222  
  //int[] ruleset = {0,1,1,1,1,1,0,1};           // Rule 190  
  int[] ruleset = {0,1,1,1,1,0,0,0};           // Rule 30  
  //int[] ruleset = {0,1,1,1,0,1,1,0};             // Rule 110  
  
  ca = new CA(ruleset); // Initialize CA
}  

void draw() {
   ca.display();          // Draw the CA
  ca.generate();
}


class CA {

  int[] cells;     // An array of 0s and 1s 
  int[][] generations;
  int generation;  // How many generations?
  int num_gen;

  int[] ruleset;     // An array to store the ruleset, for example {0,1,1,0,1,1,0,1}

  int w = 1;

  CA(int[] r) {
    ruleset = r;
    cells = new int[width/w];
    generation = 0;
    num_gen = height/w;
    generations = new int[num_gen][width/w];
    restart();
  }

  // Make a random ruleset
  void randomize() {
    for (int i = 0; i < 8; i++) {
      ruleset[i] = int(random(2));
    }
  }

  // Reset to generation 0
  void restart() {
    for (int i = 0; i < cells.length; i++) {
      cells[i] = 0;
    }
    cells[cells.length/2] = 1;    // We arbitrarily start with just the middle cell having a state of "1"
    generations[0] = cells;
  }


  // The process of creating the new generation
  void generate() {
    // First we create an empty array for the new values
    int[] nextgen = new int[cells.length];
    // For every spot, determine new state by examing current state, and neighbor states
    // Ignore edges that only have one neighor
    for (int i = 1; i < cells.length-1; i++) {
      int left = cells[i-1];   // Left neighbor state
      int me = cells[i];       // Current state
      int right = cells[i+1];  // Right neighbor state
      nextgen[i] = rules(left, me, right); // Compute next generation state based on ruleset
    }
    // The current generation is the new generation
    cells = nextgen;
    
    if (generation < num_gen) {
      generations[generation] = cells;
      generation++;
    } else {
      for (int i = 0; i < num_gen-1; i++) {
        generations[i] = generations[i+1];
      }
      generations[num_gen - 1] = cells;
    }
    
   
  }

  // This is the easy part, just draw the cells, fill 255 for '1', fill 0 for '0'
  void display() {    for (int k = 0; k < num_gen; k++) {
    for (int i = 0; i < cells.length; i++) {
      if (generations[k][i] == 1) fill(0);
      else               fill(255);
      noStroke();
      rect(i*w, k*w, w, w);
    }
    }
    
     if ((generation+1) % 11 == 0) {
      randomize();
    }
    
  }

  // Implementing the Wolfram rules
  // This is the concise conversion to binary way
  int rules (int a, int b, int c) {
   String s = "" + a + b + c;
   int index = Integer.parseInt(s, 2);
   return ruleset[index];
   }
 

  // The CA is done if it reaches the bottom of the screen
 
}
