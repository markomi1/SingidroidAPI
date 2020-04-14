package com.singidroid.api.contoller;


import okhttp3.*;
import org.json.JSONArray;
import org.json.JSONException;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;

@RestController
public class SingidroidController { //TODO HTTPS is disabled for now as it need to be implemented on Android.

    @GetMapping("/")
    @Cacheable("response")
    public String getHello(@RequestParam("id") int id) throws IOException, JSONException {
        OkHttpClient client = new OkHttpClient().newBuilder()
                .build();
        MediaType mediaType = MediaType.parse("text/plain");
        RequestBody body = RequestBody.create(mediaType, "");
        Request request = new Request.Builder()
                .url("https://api.singidunum.rs/key:SD03-A1K8-1033-0001-3355/module:system/method:getFaculties")
                .method("POST", body)
                .addHeader("Cache-Control", "max-age=2592000, public")
                .build();
        Response response = null;
        try {
            response = client.newCall(request).execute();
        } catch (IOException e) {
            e.printStackTrace();
        }

        String jsonData = response.body().string();
        JSONArray jArray = new JSONArray(jsonData);
        String test = jArray.getJSONObject(id).getString("faculty_title");

        return test;
    }

    @GetMapping("/getFaculties")
    @Cacheable("response2")
    public String getFaculties() throws IOException, JSONException {
        OkHttpClient client = new OkHttpClient().newBuilder()
                .build();
        MediaType mediaType = MediaType.parse("text/plain");
        RequestBody body = RequestBody.create(mediaType, "");
        Request request = new Request.Builder()
                .url("https://api.singidunum.rs/key:SD03-A1K8-1033-0001-3355/module:system/method:getFaculties")
                .method("POST", body)
                .addHeader("Cache-Control", "max-age=2592000, public")
                .build();
        Response response = null;
        try {
            response = client.newCall(request).execute();
        } catch (IOException e) {
            e.printStackTrace();
        }

        String jsonData = response.body().string();
        JSONArray jArray = new JSONArray(jsonData);
        String test = jArray.toString();

        return test;
    }



}
