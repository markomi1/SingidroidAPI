package com.singidroid.api.repository;


public class Faculties {
    private String id;
    private String title;
    private int exception;

    public Faculties(String id, String title, int exception) {
        this.id = id;
        this.title = title;
        this.exception = exception;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getException() {
        return exception;
    }

    public void setException(int exception) {
        this.exception = exception;
    }
}