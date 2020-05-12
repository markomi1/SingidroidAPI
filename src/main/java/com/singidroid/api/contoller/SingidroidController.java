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
    //Don't need repo for jackshit but will leave it as i'm too lazy to clean it up, it works, somehow.


    //TODO Implement some more security in the API itself, add news parsing and that should be it.

    @GetMapping("/appInit/getYears")
    public List<Object> getYears() { //Returns years 1-4

        return singidroidService.getYearsForFaculty();
    }

    @GetMapping("/appInit/getCourse")
    public List<Object> getCourses(@RequestParam(name = "faks", required = false, defaultValue = "") String faks,
                                   @RequestParam(name = "year", required = false, defaultValue = "0") Integer year) {
        int faksLen = faks.length();
        if (faks.isEmpty() || year == 0) {
            List<Object> errorObject = new ArrayList<Object>(); //If it's greater than 3 and isn't empty it'll pass, if not error message below will be shown
            errorObject.add("ERROR: faks or year isn't set, please set and  try again");
            return errorObject;
        }

        if (!(faksLen >= 3 && faksLen <= 12) && faks.isEmpty()) { //Check to see if the faks var is over 3 or less than 12 and isn't empty
            List<Object> errorObject = new ArrayList<Object>(); //If it's greater than 3 and isn't empty it'll pass, if not error message below will be shown
            errorObject.add("ERROR: No Faculty ID lesser than 3 or greater than 12 exists");
            return errorObject;
        } else if (!(year >= 1 && year <= 4) && year != 0) {
            List<Object> errorObject = new ArrayList<Object>();
            errorObject.add("ERROR: Year is only from 1-4");
            return errorObject;
        }

        return singidroidService.getCoursesForGivenYearAndFaculty(faks, year);
    }

    @GetMapping("/appInit/getFaculties") //Used to fetch Faculty,Year and Course data, returns JSON Object
    public List<Object> getAppInit(@RequestParam(name = "faks", required = false, defaultValue = "") String faks) { //Int 1-4
        int faksLen = faks.length();

        //Inverted state
        if (!(faksLen >= 3 && faksLen <= 12) && !faks.isEmpty()) { //Check to see if the faks var is over 3 or less than 12 and isn't empty
            List<Object> errorObject = new ArrayList<Object>(); //If it's greater than 3 and isn't empty it'll pass, if not error message below will be shown
            errorObject.add("ERROR: No Faculty ID lesser than 3 or greater than 12 exists");
            return errorObject;
        } else {
            return singidroidService.getAllFaculties();
        }


    }

}
