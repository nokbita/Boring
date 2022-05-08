package entry;


public class Student {

  private int id;
  private String no;
  private String password;
  private String name;
  private int sex;
  private float grade;

  public Student() {
  }

  public Student(String no, String password, String name, int sex, float grade) {
    this.no = no;
    this.password = password;
    this.name = name;
    this.sex = sex;
    this.grade = grade;
  }

  public Student(int id, String no, String password, String name, int sex, float grade) {
    this.id = id;
    this.no = no;
    this.password = password;
    this.name = name;
    this.sex = sex;
    this.grade = grade;
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


  public int getSex() {
    return sex;
  }

  public void setSex(int sex) {
    this.sex = sex;
  }


  public float getGrade() {
    return grade;
  }

  public void setGrade(float grade) {
    this.grade = grade;
  }

  @Override
  public String toString() {
    return "{" +
            "\"id\":\"" + id + "\"," +
            "\"no\":\"" + no  + "\"," +
            "\"password\":\"" + password  + "\"," +
            "\"name\":\"" + name  + "\"," +
            "\"sex\":\"" + sex + "\"," +
            "\"grade\":\"" + grade + "\"" +
            "}";
  }
}
