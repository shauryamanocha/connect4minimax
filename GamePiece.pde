enum Player {
  Minimizing, //ai
    Maximizing, //human player
    None//empty space
};

class GamePiece {
  Player player;
  int[] position;
  ArrayList<Connection> connections;
  public GamePiece(Player p) {
    this.player = p;
    this.connections = new ArrayList<Connection>();
  }
}
