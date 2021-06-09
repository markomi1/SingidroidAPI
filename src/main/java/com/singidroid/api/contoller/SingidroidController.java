package com.singidroid.api.contoller;


import com.singidroid.api.service.SingidroidService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


@RestController
public class SingidroidController{  //NOTE This Controller serves Uni years/courses/Faculties/StudentBalance and Exchange Rate

    private final SingidroidService singidroidService;
    private final RestTemplate restTemplate;

    @Autowired
    public SingidroidController(SingidroidService singidroidService, RestTemplateBuilder restTemplate) {
        this.singidroidService = singidroidService;
        this.restTemplate = restTemplate.build();
    }

    @GetMapping("/appInit/getYears")
    @Cacheable("response2") //This doesn't change at all, so i can set it to be cached so i don't pool the DB that often
    public List<Object> getYears() { //Returns years 1-4
        return singidroidService.getYearsForFaculty();
    }


    @GetMapping("/appInit/getCourse") //Used  to return courses for given faksID and year
    public List<Object> getCourses(@RequestParam(name = "faculty", required = false, defaultValue = "") String faculty,
                                   @RequestParam(name = "year", required = false, defaultValue = "1") Integer year) {
        int facultyLen = faculty.length();
        List<Object> errorObject = new ArrayList<Object>();
        if (faculty.isEmpty()) {
            errorObject.add("ERROR: faculty or year isn't set");//If it's greater than 3 and isn't empty it'll pass, if not error message below will be shown
            return errorObject;
        }
        if (!(facultyLen >= 3 && facultyLen <= 12) && faculty.isEmpty()) { //Check to see if the faculty var is over 3 or less than 12 and isn't empty
            errorObject.add("ERROR: No Faculty ID lesser than 3 or greater than 12 exists"); //If it's greater than 3 and isn't empty it'll pass, if not error message below will be shown

            return errorObject;
        } else if (!(year >= 1 && year <= 4) && year != 0) {
            errorObject.add("ERROR: Year is only from 1-4");
            return errorObject;
        }
        return singidroidService.getCoursesForGivenYearAndFaculty(faculty, year);
    }

    @GetMapping("/appInit/getFaculties") //Used to fetch Faculty data, returns JSON Object
    public List<Object> getFaculties() {
        return singidroidService.getAllFaculties();
    }


    @PostMapping("/api/getStudentBalance")
    public List<Object> getStudentBalance(@RequestParam(name = "index", required = false, defaultValue = "") String index,
                                          @RequestParam(name = "jmbg", required = false, defaultValue = "1") String jmbg) throws IOException {
        List<Object> errorObject = new ArrayList<Object>();
        if (index.length() != 10) {
            errorObject.add("ERROR: Index can be only 10 digits long");
            return errorObject;
        } else if (jmbg.length() != 13) {
            errorObject.add("ERROR: JMBG can be only 13 digits long");
            return errorObject;
        }
        List<Object> toReturn = singidroidService.getStudentBalance(index, jmbg);
        if (toReturn.isEmpty()) {
            toReturn.add("ERROR: Bad index or jmbg submitted");
        }
        return toReturn;
    }

    @PostMapping("/api/getExchangeRate")
    public List<Object> getExchangeRate() throws IOException {
        return singidroidService.getExchangeRate();
    }
}
