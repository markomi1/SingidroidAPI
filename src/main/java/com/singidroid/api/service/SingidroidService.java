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

    public List<Object> getCoursesForGivenYearsAndFaculty(String faks, Integer year, String course) {
        return coursesDataAccess.getCoursesForGivenYearsAndFaculty(faks, year, course);
    }

    public List<Object> getSelectedFaculty(String faks) {
        return coursesDataAccess.getSelectedFaculty(faks);
    }
}
