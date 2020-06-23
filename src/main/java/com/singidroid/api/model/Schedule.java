package com.singidroid.api.model;

import java.util.List;

public class Schedule{

    private String teacher;
    private List<String> subjects = null;
    private String day;
    private String from;
    private String till;
    private String room;


    public String getTeacher() {
        return teacher;
    }

    public void setTeacher(String teacher) {
        this.teacher = teacher;
    }

    public Schedule withTeacher(String teacher) {
        this.teacher = teacher;
        return this;
    }

    public List<String> getSubjects() {
        return subjects;
    }

    public void setSubjects(List<String> subjects) {
        this.subjects = subjects;
    }

    public Schedule withSubjects(List<String> subjects) {
        this.subjects = subjects;
        return this;
    }

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
    }

    public Schedule withDay(String day) {
        this.day = day;
        return this;
    }

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public Schedule withFrom(String from) {
        this.from = from;
        return this;
    }

    public String getTill() {
        return till;
    }

    public void setTill(String till) {
        this.till = till;
    }

    public Schedule withTill(String till) {
        this.till = till;
        return this;
    }

    public String getRoom() {
        return room;
    }

    public void setRoom(String room) {
        this.room = room;
    }

    public Schedule withRoom(String room) {
        this.room = room;
        return this;
    }
}