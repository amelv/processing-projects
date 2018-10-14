// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// A basic implementation of John Conway's Game of Life CA
// how could this be improved to use object oriented programming?
// think of it as similar to our particle system, with a "cell" class
// to describe each individual cell and a "cellular automata" class
// to describe a collection of cells

GOL gol;

void setup() {
  size(640, 360);
  frameRate(24);
  gol = new GOL();
}

void draw() {
  background(255);

  gol.generate();
  gol.display();
}

// reset board when mouse is pressed
void mousePressed() {
  gol.init();
}

class GOL {

  int w = 8;
  int columns, rows;
  int currentArray;

  // Game of life board
  int[][] board1;
  int[][] board2;


  GOL() {
    // Initialize rows, columns and set-up arrays
    columns = width/w;
    rows = height/w;
    currentArray = 1;
    board1 = new int[columns][rows];
    board2 = new int[columns][rows];
    temp1 = new int[columns][rows];
    //next = new int[columns][rows];
    // Call function to fill array with random values 0 or 1
    init();
  }

  void init() {
    for (int i =1;i < columns-1;i++) {
      for (int j =1;j < rows-1;j++) {
        board1[i][j] = int(random(2));
      }
    }
  }

  // The process of creating the new generation
  void generate() {

    // Loop through every spot in our 2D array and check spots neighbors
    for (int x = 1; x < columns-1; x++) {
      for (int y = 1; y < rows-1; y++) {

        // Add up all the states in a 3x3 surrounding grid
        int neighbors = 0;
        for (int i = -1; i <= 1; i++) {
          for (int j = -1; j <= 1; j++) {
            if (currentArray == 1) {
              neighbors += board1[x+i][y+j];
            } else {
              neighbors += board2[x+i][y+j];
            }
          }
        }

        // A little trick to subtract the current cell's state since
        // we added it in the above loop
        if (currentArray == 1) {
              neighbors -= board1[x][y];
            } else {
              neighbors -= board2[x][y];
            }
        

        // Rules of Life
        if      ((board[x][y] == 1) && (neighbors <  2)) next[x][y] = 0;           // Loneliness
        else if ((board[x][y] == 1) && (neighbors >  3)) next[x][y] = 0;           // Overpopulation
        else if ((board[x][y] == 0) && (neighbors == 3)) next[x][y] = 1;           // Reproduction
        else                                            next[x][y] = board[x][y];  // Stasis
      }
    }

    // Next is now our board
    board = next;
  }

  // This is the easy part, just draw the cells, fill 255 for '1', fill 0 for '0'
  void display() {
    for ( int i = 0; i < columns;i++) {
      for ( int j = 0; j < rows;j++) {
        if ((board[i][j] == 1)) fill(0);
        else fill(255); 
        stroke(0);
        rect(i*w, j*w, w, w);
      }
    }
  }
}
