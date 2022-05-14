package entry;


public class Warehouse {

  private int wno;  // 仓库号
  private String wname;  // 仓库名
  private String location;  // 位置
  private double square;  // 面积
  private String manager;  // 管理员

  public Warehouse(int wno, String wname, String location, double square, String manager) {
    this.wno = wno;
    this.wname = wname;
    this.location = location;
    this.square = square;
    this.manager = manager;
  }

  public int getWno() {
    return wno;
  }

  public void setWno(int wno) {
    this.wno = wno;
  }


  public String getWname() {
    return wname;
  }

  public void setWname(String wname) {
    this.wname = wname;
  }


  public String getLocation() {
    return location;
  }

  public void setLocation(String location) {
    this.location = location;
  }


  public double getSquare() {
    return square;
  }

  public void setSquare(double square) {
    this.square = square;
  }


  public String getManager() {
    return manager;
  }

  public void setManager(String manager) {
    this.manager = manager;
  }


  @Override
  public String toString() {
    return "{" +
            "\"wno\":\"" + wno + "\"," +
            "\"wname\":\"" + wname  + "\"," +
            "\"location\":\"" + location  + "\"," +
            "\"square\":\"" + square  + "\"," +
            "\"manager\":\"" + manager + "\"" +
            "}";
  }

}
