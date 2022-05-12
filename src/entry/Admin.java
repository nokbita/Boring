package entry;


public class Admin {

  private int id;
  private String no;
  private String password;
  private String name;
  private String sex;
  private String address;

  public Admin(int id, String no, String password, String name, String sex, String address) {
    this.id = id;
    this.no = no;
    this.password = password;
    this.name = name;
    this.sex = sex;
    this.address = address;
  }


  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }


  public String getNo() {
    return no;
  }

  public void setNo(String no) {
    this.no = no;
  }


  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }


  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }


  public String getSex() {
    return sex;
  }

  public void setSex(String sex) {
    this.sex = sex;
  }


  public String getAddress() {
    return address;
  }

  public void setAddress(String address) {
    this.address = address;
  }

  @Override
  public String toString() {
    return "{" +
            "\"id\":\"" + id + "\"," +
            "\"no\":\"" + no  + "\"," +
            "\"password\":\"" + password  + "\"," +
            "\"name\":\"" + name  + "\"," +
            "\"sex\":\"" + sex + "\"," +
            "\"address\":\"" + address + "\"" +
            "}";
  }

}
