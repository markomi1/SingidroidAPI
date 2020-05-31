package com.singidroid.api.model;

import java.util.ArrayList;

public class Subjects{
    private String subjectName;
    private ArrayList<String> teacherName;

    public String getSubjectName() {
        return subjectName;
    }

    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }

    public ArrayList<String> getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(ArrayList<String> teacherName) {
        this.teacherName = teacherName;
    }
}
