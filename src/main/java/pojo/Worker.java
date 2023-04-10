package pojo;

import DBOperation.GoodsOperation;
import DBOperation.SqlSessionFactoryUtil;
import DBOperation.WarehouseOperation;
import org.apache.ibatis.session.SqlSession;

public class Worker {
    private Integer uuid;
    private String accountName;
    private String password;
    private String workerName;
    private String gender;
    private String tel;
    private String email;
    private Integer salary;
    private Integer workingPlace;

    public Worker(){}

    public Worker(String accountName,String password,int workingPlace){
        this.setAccountName(accountName);
        this.setPassword(password);
        this.setSalary(3000);
        this.setWorkingPlace(workingPlace);
    }

    public Integer getUuid() {
        return uuid;
    }

    public void setUuid(Integer uuid) {
        this.uuid = uuid;
    }

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getSalary() {
        return salary;
    }

    public void setSalary(Integer salary) {
        this.salary = salary;
    }

    public Integer getWorkingPlace() {
        return this.workingPlace;
    }

    public void setWorkingPlace(Integer workingPlace) {
        this.workingPlace = workingPlace;
    }

    public String getWorkerName() {
        return workerName;
    }

    public void setWorkerName(String workerName) {
        this.workerName = workerName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "Worker{" +
                "uuid=" + uuid +
                ", accountName='" + accountName + '\'' +
                ", password='" + password + '\'' +
                ", workerName='" + workerName + '\'' +
                ", tel='" + tel + '\'' +
                ", email='" + email + '\'' +
                ", salary=" + salary +
                ", workingPlace=" + workingPlace +
                '}';
    }
}
