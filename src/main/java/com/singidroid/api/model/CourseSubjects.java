package com.singidroid.api.model;


import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

import java.util.List;


public class CourseSubjects{

    @SerializedName("children")
    @Expose
    private List<Child> children = null;

    /**
     * No args constructor for use in serialization
     */
    public CourseSubjects() {
    }


    public CourseSubjects(List<Child> children) {
        super();
        this.children = children;
    }

    public List<Child> getChildren() {
        return children;
    }

    public void setChildren(List<Child> children) {
        this.children = children;
    }

    public CourseSubjects withChildren(List<Child> children) {
        this.children = children;
        return this;
    }

}


class Child{

    @SerializedName("name")
    @Expose
    private String name;
    @SerializedName("type")
    @Expose
    private Integer type;
    @SerializedName("key")
    @Expose
    private String key;

    /**
     * No args constructor for use in serialization
     */
    public Child() {
    }


    public Child(String name, Integer type, String key) {
        super();
        this.name = name;
        this.type = type;
        this.key = key;
    }

    public String getName() {
        return name.trim(); //Remove leading and trailing spaces because some subject have that for some reason....
    }

    public void setName(String name) {
        this.name = name;
    }

    public Child withName(String name) {
        this.name = name;
        return this;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Child withType(Integer type) {
        this.type = type;
        return this;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public Child withKey(String key) {
        this.key = key;
        return this;
    }
}
