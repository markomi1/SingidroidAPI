package com.singidroid.api.service;


import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.singidroid.api.dao.NewsDataAccess;
import com.singidroid.api.model.News;
import okhttp3.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service
public class NewsService{

    private final NewsDataAccess newsDataAccess;


    @Autowired
    public NewsService(NewsDataAccess newsDataAccess) {
        this.newsDataAccess = newsDataAccess;
    }


    public List<Object> getNewsRepo() {
        return newsDataAccess.getNewsSources();
    }


    public List<Object> getNews(String url) throws IOException { //Good lord
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
        Gson gson = new Gson(); //Google Gson
        String jsonData = response.body().string(); //Saving response as string here
        JsonArray temp = gson.fromJson(jsonData, JsonArray.class); //Converting the response to JsonArray so it can be easier manipulated with
        for (int i = 0; i < temp.size(); i++) {
            News newsModel = new News(); //We make new instance of News for each FOR pass, then later we add that new instance to the ArrayList
            JsonObject t = temp.get(i).getAsJsonObject(); //We get Json object from the JsonArray and save it to t variable
            newsModel.setPost_id(t.get("post_id").getAsString()); //Post ID, idk if i'll need it
            newsModel.setPost_title(t.get("post_title").getAsString()); //Post title
            newsModel.setPost_description(t.get("post_description").getAsString() + "..."); //Short post description
            newsModel.setPost_date(t.get("post_datetime").getAsString()); //When the post was made
            newsModel.setCover_image_path("https://repository.singidunum.ac.rs/images/" + t.get("image_pre_path").getAsString() + "/thumb/" + t.get("image_path").getAsString()); //Cover image path, half of it that is
            newsModel.setPost_images(image_extractor(t.get("post_content").getAsString())); //Post images
            newsModel.setPlain_text(t.get("plain_text").getAsString().replaceAll("\\s*\\.$", "")); //Post text
            newsModel.setPost_permalink("http://singidunum.ac.rs/news/" + t.get("post_permalink").getAsString()); //Post perm link, used in the app to open the post in the browser
            news.add(newsModel); //Pushing the newly created News onto the ArrayList
        }
        return news; //Returning list of news
    }


    public List<String> image_extractor(String content) { //Used to extract https://repository.singidunum.ac.rs image links, ignores everything else
        // make it capture repository but ignore img.youtube etc, but in another method make it ignore repository but capture everything else
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
        return matched; //
    }
}
