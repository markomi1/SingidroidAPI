package com.singidroid.api.service;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.singidroid.api.dao.CoursesDataAccess;
import com.singidroid.api.model.CourseSubjects;
import okhttp3.*;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.*;

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



    public List<Object> getCourseSubjects(Integer courseid) throws IOException {

        String url = "http://predmet.singidunum.ac.rs/lib/ajax/getnavbranch.php";

        List<CourseSubjects> news = new ArrayList<>(); //Where all the posts are stored at

        OkHttpClient client = new OkHttpClient().newBuilder()
                .build();
        MediaType mediaType = MediaType.parse("application/x-www-form-urlencoded; charset=UTF-8,application/x-www-form-urlencoded");
        RequestBody body = RequestBody.create(mediaType, "elementid=expandable_branch_10_" + courseid + "&id=" + courseid + "&type=10");
        Request request = new Request.Builder()
                .url(url)
                .method("POST", body)
                .addHeader("Content-Type", "application/x-www-form-urlencoded")
                .addHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8")
                .build();
        Response response = null;
        try {
            response = client.newCall(request).execute(); //It has a tendency to fail sometimes, so yea...
        } catch (IOException e) {
            e.printStackTrace();
        }

        Gson gson = new Gson(); //Google Gson, papa bless
        String jsonData = new String(response.body().string().getBytes(StandardCharsets.UTF_8)); //Saving response as string here


        CourseSubjects course = gson.fromJson(jsonData, CourseSubjects.class);

        return Collections.singletonList(course.getChildren());
    }


    public List<Object> getStudentBalance(String index, String jmbg) throws IOException {
        String blogUrl = "https://sync.singidunum.ac.rs/singidroid/sync/stanje_racuna/index.php?KEY=SingiDroid2013";
        Document doc = Jsoup.connect(blogUrl).data("indeks", index, "jmbg", jmbg).header("Accept-Language", "en-US,en;q=0.5").post();
        Elements el = doc.getElementsByTag("b");
        List<Object> toRet = new ArrayList<>();
        for (int i = 0; i < el.size(); i++) {
            String elText = el.get(i).text();
            String money = el.get(i).nextSibling().toString();
            toRet.add(elText + " " + money);
        }
        return toRet;
    }

    public List<Object> getExchangeRate() throws IOException {
        Gson gson = new Gson();
        List<Object> toReturn = new ArrayList<>();
        OkHttpClient client = new OkHttpClient().newBuilder()
                .build();
        MediaType mediaType = MediaType.parse("text/plain");
        RequestBody body = RequestBody.create(mediaType, "");
        Request request = new Request.Builder()
                .url("https://api.singidunum.rs/key:SD03-A1K8-1033-0001-3355/module:system/method:getExchangeRate/:/")
                .method("POST", body)
                .build();
        Response response = client.newCall(request).execute();
        JsonArray obj = gson.fromJson(response.body().string(), JsonArray.class);
        Map<String, Object> map = new LinkedHashMap<>();
        map.put("date_from", obj.get(0).getAsJsonObject().get("datum_od").getAsString());
        map.put("date_till", obj.get(0).getAsJsonObject().get("datum_do").getAsString());
        map.put("on_date", obj.get(0).getAsJsonObject().get("datum_na").getAsString());
        map.put("exchangeRate", obj.get(0).getAsJsonObject().get("datum_kurs").getAsString());
        toReturn.add(map);
        return toReturn;
    }


}
