package com.singidroid.api.service;

import com.singidroid.api.dao.CoursesDataAccess;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SingidroidService {

    private final CoursesDataAccess coursesDataAccess;


    @Autowired
    public SingidroidService(CoursesDataAccess coursesDataAccess) {
        this.coursesDataAccess = coursesDataAccess;
    }


    public void testService() {

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
    } //For all faculties it's 4 years max, so no need to pass anything, there will never be < 4 years
}
