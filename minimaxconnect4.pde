enum Player {
  Red, 
    Blue, 
    None
};
private int nx = 5, ny = 4, ns = 100;
//nx-> board width
//ny-> board height
//ns->board scale
private GameState state;

void setup() {
  size(800, 600);
  state = new GameState(nx, ny);
}

void draw() {
  background(51);
  drawBoard();
  displayMove();
}

int getMoveIndex() {
  return (mouseX-((width-(nx*ns))/2))/ns;
}

void mousePressed() {
  int index = getMoveIndex();
  if (state.board[0][index] == Player.None) {
    insertMove(getMoveIndex(), state.currentPlayer);
    state.currentPlayer = state.currentPlayer==Player.Red?Player.Blue:Player.Red;
    state.moveCount++;
  }
}
boolean insertMove(int index, Player p) {
  for (int y = 0; y<ny; y++) {
    if (y == ny-1) {
      state.board[y][index] = p;
      return true;
    }
    if (state.board[y][index] == Player.None && state.board[y+1][index]!=Player.None) {
      state.board[y][index] = p;
      return true;
    }
  }
  return false;
}


void displayMove() {
  noStroke();
  switch(state.currentPlayer) {
  case Red:
    fill(255, 0, 0, 128);
    break;
  case Blue:
    fill(0, 0, 255, 128);
    break;
  }
  int index = getMoveIndex();
  if (0<=index && index<nx) {
    int x = (index*ns)+((width-(nx*ns))/2)+ns/2;
    int y = (height-(ny*ns))-3-ns/2;
    if (state.board[0][index] == Player.None) {
      ellipse(x, y, ns*0.75, ns*0.75);
    } else {
      textSize(ns);
      text("X", x, y);
    }
  }
}


void drawBoard() {
  strokeWeight(3);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  for (int y = 0; y<ny; y++) {
    for (int x = 0; x<nx; x++) {
      int cx = (x*ns)+((width-(nx*ns))/2)+ns/2;
      int cy = (height-(y*ns))-3-ns/2;
      noFill();
      stroke(255);
      rect(cx, cy, ns, ns);
      switch(state.board[ny-1-y][x]) {
      case Red:
        fill(255, 0, 0);
        break;
      case Blue:
        fill(0, 0, 255);
        break;
      }
      noStroke();
      ellipse(cx, cy, ns*0.75, ns*0.75);
    }
  }
}
