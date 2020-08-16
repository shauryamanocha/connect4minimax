//import processing.dxf.*;


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
  if (state.board[0][index].player == Player.None) {
    insertMove(getMoveIndex(), state.currentPlayer);
    state.currentPlayer = state.currentPlayer==Player.Minimizing?Player.Maximizing:Player.Minimizing;
    state.moveCount++;
  }
}
boolean insertMove(int index, Player p) {
  for (int y = 0; y<state.boardHeight; y++) {
    if (y == state.boardHeight-1) {//landed at the bottom
      state.board[y][index] = new GamePiece(p); 
      updateConnections(y, index,p);
      return true;
    }
    if (state.board[y][index].player == Player.None && state.board[y+1][index].player!=Player.None) { //landed on another piece
      state.board[y][index] = new GamePiece(p); 
      updateConnections(y, index,p);
      return true;
    }
  }
  return false;//invalid position
}

void updateConnections(int yPos, int xPos, Player p) {
  int[][] positionOffsets = new int[][]{
    {-1, -1}, 
    {-1, 0}, 
    {-1, 1}, 
    {0, -1}, 
    //{0,0},
    {0, 1}, 
    {1, -1}, 
    {1, 0}, 
    {1, 1}, 
  };

  for (int[] pos : positionOffsets) {
    int newY = yPos+pos[0];
    int newX = xPos+pos[1];
    if (
      0<newX && newX<state.boardWidth &&
      0<newY && newY<state.boardHeight
      ) {
      if (state.board[newY][newX].player==p) {
        for(Connection c : state.board[newY][newX].connections){
          
        }
      }
    }
  }
}


void displayMove() {
  noStroke();
  switch(state.currentPlayer) {
  case Minimizing:
    fill(255, 0, 0, 128);
    break;
  case Maximizing:
    fill(0, 0, 255, 128);
    break;
  }
  int index = getMoveIndex();
  if (0<=index && index<nx) {
    int x = (index*ns)+((width-(nx*ns))/2)+ns/2;
    int y = (height-(ny*ns))-3-ns/2;
    if (state.board[0][index].player == Player.None) {
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
      switch(state.board[ny-1-y][x].player) {
      case Minimizing:
        fill(255, 0, 0);
        break;
      case Maximizing:
        fill(0, 0, 255);
        break;
      }
      noStroke();
      ellipse(cx, cy, ns*0.75, ns*0.75);
    }
  }
}
