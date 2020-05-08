package com.singidroid.api.contoller;


import com.singidroid.api.service.SingidroidService;
import okhttp3.*;
import org.json.JSONArray;
import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@RestController
public class SingidroidController { //TODO HTTPS is disabled for now as it need to be implemented on Android.

    private final SingidroidService singidroidService;

    @Autowired
    public SingidroidController(SingidroidService singidroidService) {
        this.singidroidService = singidroidService;
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


    //TODO figure out how tf am i gonna parse the shitty json file and whatnot, maybe consider using DB for this shit
    //TODO moved to DB, it's same shit or maybe worse than json fml
    //Figured out the DB thing, now to figure out how to pass arguments etc.
    //Caching is also disabled from now on, not needed.
    //I also don't need the repo things as i can use plain old java Object to make JSONs out of.


    //TODO Implement some more security in the API itself, add news parsing and that should be it.

    @GetMapping("/appInit/")

    public List<Object> getCustomSQL(@RequestParam(name = "faks", required = false, defaultValue = "") String faks, //String
                                     @RequestParam(name = "course", required = false, defaultValue = "") String courseid, // String
                                     @RequestParam(name = "year", required = false, defaultValue = "0") Integer year) { //Int 1-4
        int faksLen = faks.length();
        int courseLen = courseid.length();


        if (!(faksLen >= 3 && faksLen <= 12)) {
            List<Object> errorObject = new ArrayList<Object>();
            errorObject.add("ERROR: No Faculty ID lesser than 3 or greater than 12 exists");
            return errorObject;
        }
        if (!(year >= 1 && year <= 4)) {
            List<Object> errorObject = new ArrayList<Object>();
            errorObject.add("ERROR: Year is only from 1-4");
            return errorObject;
        }


        if (year == 0) { //Should just return all faculties
            return singidroidService.getSelectedFaculty(faks);
        } else if (year != 0 && courseid.isEmpty()) { // Should only return years that belong to the specified faculty
            return singidroidService.getYearsForFaculty(faks, year);
        } else if (!courseid.isEmpty()) { // Should return only available courses that belong to the specified year of selected faculty
            return singidroidService.getCoursesForGivenYearsAndFaculty(faks, year, courseid);
        } else {
            return singidroidService.getAllFaculties();
        }


    }

}
