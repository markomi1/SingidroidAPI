package com.singidroid.api.service;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.singidroid.api.dao.CoursesDataAccess;
import com.singidroid.api.model.News;
import okhttp3.*;
import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service
public class SingidroidService {

    private final CoursesDataAccess coursesDataAccess;


    @Autowired
    public SingidroidService(CoursesDataAccess coursesDataAccess) {
        this.coursesDataAccess = coursesDataAccess;
    }





    public List<Object> getAllFaculties() {
        return coursesDataAccess.getFaculties();
    }

    public List<Object> getYearsForFaculty(String faks, Integer year) {
        return coursesDataAccess.getYearsForSelectedFaculty(faks, year);
    }

    public List<Object> getCoursesForGivenYearAndFaculty(String faks, Integer year) {
        return coursesDataAccess.getCoursesForGivenYearAndFaculty(faks, year);
    }

    public List<Object> getSelectedFaculty(String faks) {
        return coursesDataAccess.getSelectedFaculty(faks);
    }

    public List<Object> getYearsForFaculty() {
        return coursesDataAccess.getyears();
    } //For all faculties it's 4 years max, so no need to pass anything, there will never be more than 4 years or less than 4 years

    public List<Object> getNewsRepo() {
        return coursesDataAccess.getNewsSources();
    }


    public List<Object> getNews(String url) throws IOException, JSONException { //Good lord

        List<Object> news = new ArrayList<>(); //Where all the posts are stored at


        OkHttpClient client = new OkHttpClient().newBuilder()
                .build();
        okhttp3.MediaType mediaType = MediaType.parse("text/plain"); //they send JSON like a plain text for some reason ?????
        RequestBody body = RequestBody.create(mediaType, "");
        Request request = new Request.Builder()
                .url(url)
                .method("POST", body) //Using post as it doesn't have the GET request limits(char limit)
                .addHeader("Cache-Control", "max-age=2592000, public") //Just but just in case it has some sort of caching
                .build();
        Response response = null;
        try {
            response = client.newCall(request).execute(); //It has a tendency to fail sometimes, so yea...
        } catch (IOException e) {
            e.printStackTrace();
        }

        Gson gson = new Gson(); //Google Gson, papa bless
        String jsonData = response.body().string(); //Saving response as string here


        JsonArray temp = gson.fromJson(jsonData, JsonArray.class); //Saving the response as JsonArray so it can be easier manipulated with


        for (int i = 0; i < temp.size(); i++) {
            News newsModel = new News(); //We make new instance of News for each FOR pass, then later we add that new instance to the ArrayList
            JsonObject t = temp.get(i).getAsJsonObject(); //We get Json object from the JsonArray and save it to t variable

            newsModel.setPost_id(t.get("post_id").getAsString()); //Post ID, idk if i'll need it
            newsModel.setPost_title(t.get("post_title").getAsString()); //Post title
            newsModel.setPost_description(t.get("post_description").getAsString() + "..."); //Short post description
            newsModel.setPost_date(t.get("post_datetime").getAsString()); //When the post was made

            newsModel.setCover_image_path("https://repository.singidunum.ac.rs/images/" + t.get("image_pre_path").getAsString() + "/thumb/" + t.get("image_path").getAsString()); //Cover image path, half of it that is


            newsModel.setPost_images(image_extractor(t.get("post_content").getAsString())); //Post images
            newsModel.setPlain_text(t.get("plain_text").getAsString()); //Post text

            newsModel.setPost_permalink("http://singidunum.ac.rs/news/" + t.get("post_permalink").getAsString()); //Post perm link, used in the app to open the post in the browser

            news.add(newsModel); //Pushing the newly created News onto the ArrayList
        }

        return news;
    }


    public String image_extractor(String content) { //Used to extract https://repository.singidunum.ac.rs image links, ignores everything else
        //TODO make it capture repository but ignore img.youtube etc, but in another method make it ignore repository but capture everything else
        final String regex = "<img[^>]+src=\\\"(https:\\/\\/repository[^\">]+)\\\"";
        final Pattern pattern = Pattern.compile(regex, Pattern.MULTILINE);
        final Matcher matcher = pattern.matcher(content);
        List<String> matched = new ArrayList<>();
        while (matcher.find()) {
            //System.out.println("Full match: " + matcher.group(0));
            for (int i = 1; i <= matcher.groupCount(); i++) {
                //System.out.println("Group " + i + ": " + matcher.group(i));
                matched.add(matcher.group(i));
            }
        }
        if (matched == null) {
            return null; //Some post don't have pics at all, so in that case we just return null
        }
        return matched.toString(); //
    }
}
