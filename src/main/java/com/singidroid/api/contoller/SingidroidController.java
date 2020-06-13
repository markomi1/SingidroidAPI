package com.singidroid.api.contoller;


import com.singidroid.api.service.SingidroidService;
import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import java.io.IOException;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.List;

@RestController
public class SingidroidController{  //NOTE HTTPS is working now on both the android and the API

    private final SingidroidService singidroidService;
    private final RestTemplate restTemplate;

    @Autowired
    public SingidroidController(SingidroidService singidroidService, RestTemplateBuilder restTemplate) {
        this.singidroidService = singidroidService;
        this.restTemplate = restTemplate.build();
    }


    @GetMapping("courses/getSubjects")
    public List<Object> getSubjectsForGivenCourse(@RequestParam(name = "courseId", required = false, defaultValue = "") Integer courseId) throws IOException {

        List<Object> errorObject = new ArrayList<Object>(); //Error Object
        if (courseId <= 0 || courseId >= 200) {
            errorObject.add("ERROR: courseId can't be 0 or greater than 200");
            return errorObject;
        }

        return singidroidService.getCourseSubjects(courseId); //Given courseId(example 120) it returns list of given courseId subjects, if not found it returns [ null ]
    }


    @GetMapping("news/getNews") //TODO Change later to POST Mapping not GET Mapping
    public List<Object> getNews(@RequestParam(name = "newsSourceCategories", required = false, defaultValue = "") String newsSourceCategories,
                                @RequestParam(name = "page", required = false, defaultValue = "0") Integer page) throws URISyntaxException, JSONException, IOException { //This should return NewsJSON for given sources, or given faculty Acronyms
        List<Object> errorObject = new ArrayList<Object>(); //Error Object
        if (newsSourceCategories.isEmpty()) { //Just normal input "sanitization"
            errorObject.add("ERROR: newsSourceCategories cannot be empty");
            return errorObject;
        } else if (newsSourceCategories.length() > 12) {
            errorObject.add("ERROR: newsSourceCategories is over 12 char limit boi");
            return errorObject;
        } else if (page >= 50 || page < 0) {
            errorObject.add("ERROR: over 50 pages or under 0, yea that's the limit");
            return errorObject;
        }

        //Hard coded limit of 15 posts per page, maybe i'll add an optional request header to increase the limit
        String url = "http://api.singidunum.rs/key:SD03-A1K8-1033-0001-3355/module:posts/method:getCategoryPosts/categories:" + newsSourceCategories + "/page:" + page + "/count:15/";


        return singidroidService.getNews(url); //All the ugly stuff happens in that method call
    }


    @GetMapping("news/getSources")
    @Cacheable("response1") //This doesn't change at all, so i can set it to be cached so i don't hit the DB that often
    public List<Object> getNewsRepo() { //Returns news sources

        return singidroidService.getNewsRepo();
    }


    //TODO figure out how tf am i gonna parse the shitty json file and whatnot, maybe consider using DB for this shit
    //TODO moved to DB, it's same shit or maybe worse than json fml
    //Figured out the DB thing, now to figure out how to pass arguments etc.
    //Caching is also disabled from now on, not needed.
    //I also don't need the repo things as i can use plain old java Object to make JSONs out of.
    //Don't need repo for jackshit but will leave it as i'm too lazy to clean it up, it works, somehow.



    @GetMapping("/appInit/getYears")
    @Cacheable("response2") //This doesn't change at all, so i can set it to be cached so i don't hit the DB that often
    public List<Object> getYears() { //Returns years 1-4

        return singidroidService.getYearsForFaculty();
    }


    @GetMapping("/appInit/getCourse") //Used  to return courses for given faksID and year
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
    public List<Object> getFaks(@RequestParam(name = "faks", required = false, defaultValue = "") String faks) { //Int 1-4
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
