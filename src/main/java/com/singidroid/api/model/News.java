package com.singidroid.api.model;


public class News {
    private String post_id;

    private String post_title;

    private String post_content;

    private String post_permalink;

    private String post_keywords;

    private String post_description;

    private String post_date;

    private String post_modified;

    private String image_pre_path;

    private String cover_image_path;

    private String post_images;

    private String image_added;

    private String plain_text;

    public String getPost_id() {
        return this.post_id;
    }

    public void setPost_id(String post_id) {
        this.post_id = post_id;
    }

    public String getPost_title() {
        return this.post_title;
    }

    public void setPost_title(String post_title) {
        this.post_title = post_title;
    }

    public String getPost_permalink() {
        return this.post_permalink;
    }

    public void setPost_permalink(String post_permalink) {
        this.post_permalink = post_permalink;
    }

    public String getPost_description() {
        return this.post_description;
    }

    public void setPost_description(String post_description) {
        this.post_description = post_description;
    }

    public String getPost_date() {
        return this.post_date;
    }

    public void setPost_date(String post_String) {
        this.post_date = post_String;
    }

    public String getCover_image_path() {
        return this.cover_image_path;
    }

    public void setCover_image_path(String cover_image_path) {
        this.cover_image_path = cover_image_path;
    }

    public String getPost_images() {
        return this.post_images;
    }

    public void setPost_images(String post_images) {
        this.post_images = post_images;
    }

    public String getPlain_text() {
        return this.plain_text;
    }

    public void setPlain_text(String plain_text) {
        this.plain_text = plain_text;
    }
}
