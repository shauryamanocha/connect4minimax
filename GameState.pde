public class GameState {
  Player[][] board;
  Player currentPlayer = Player.Maximizing;
  ArrayList<Connection> connections;
  public int moveCount = 0;
  public int boardWidth, boardHeight;
  public GameState(int boardWidth, int boardHeight) {
    this.boardWidth = boardWidth;
    this.boardHeight = boardHeight;
    board = new Player[boardHeight][boardWidth];
    for (int y = 0; y<boardHeight; y++) {
      for (int x = 0; x<boardWidth; x++) {
        board[y][x] = Player.None;
      }
    }
  }
  public boolean gameIsOver() {
    for (Connection c : connections) {
      if (c.indexes.size()>=4) {
        return true;
      }
    }
    return false;
  }
}