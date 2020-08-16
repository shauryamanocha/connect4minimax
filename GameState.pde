public class GameState {
  Player[][] board;
  Player currentPlayer = Player.Red;
  public int moveCount = 0;
  public GameState(int boardWidth, int boardHeight) {
    board = new Player[boardHeight][boardWidth];
    for (int y = 0; y<boardHeight; y++) {
      for (int x = 0; x<boardWidth; x++) {
        board[y][x] = Player.None;
      }
    }
  }
  public boolean gameIsOver(){
    //check vertical lines
    int maxLength = 0;
    for(int y = 0;y<board.length;y++){
      maxLength = 0;
      for(int x = 0;x<board[0].length;x++){
        
      }
    }
  }
}
