package db.lab5.common.model;

public class Data {
    public String sal;
    public String hiredate;
    public String ename;
    public String job;

    public Data(String sal, String hiredate, String ename, String job) {
        this.sal = sal;
        this.hiredate = hiredate;
        this.ename = ename;
        this.job = job;
    }

    public String getSal() {
        return sal;
    }

    public void setSal(String sal) {
        this.sal = sal;
    }

    public String getHiredate() {
        return hiredate;
    }

    public void setHiredate(String hiredate) {
        this.hiredate = hiredate;
    }

    public String getEname() {
        return ename;
    }

    public void setEname(String ename) {
        this.ename = ename;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }
}
