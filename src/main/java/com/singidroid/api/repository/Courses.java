package com.singidroid.api.repository;


public class Courses {
    private int faculties_id;
    private int years_id;
    private int courses_id;
    private String elementid;
    private String title;

    public Courses(int faculties_id, int years_id, int courses_id, String elementid, String title) {
        this.faculties_id = faculties_id;
        this.years_id = years_id;
        this.courses_id = courses_id;
        this.elementid = elementid;
        this.title = title;
    }

    public int getFaculties_id() {
        return faculties_id;
    }

    public void setFaculties_id(int faculties_id) {
        this.faculties_id = faculties_id;
    }

    public int getYears_id() {
        return years_id;
    }

    public void setYears_id(int years_id) {
        this.years_id = years_id;
    }

    public int getCourses_id() {
        return courses_id;
    }

    public void setCourses_id(int courses_id) {
        this.courses_id = courses_id;
    }

    public String getElementid() {
        return elementid;
    }

    public void setElementid(String elementid) {
        this.elementid = elementid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}