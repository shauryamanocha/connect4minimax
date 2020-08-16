enum ConnectionDirection{
  Horizontal,
  Vertical,
  Negative,
  Positive
};

public class Connection {
  public ArrayList<int[]> indexes;
  public Connection() {
    indexes = new ArrayList<int[]>();
  }
}
