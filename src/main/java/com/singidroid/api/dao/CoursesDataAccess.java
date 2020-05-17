package com.singidroid.api.dao;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Repository
public class CoursesDataAccess {
    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public CoursesDataAccess(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }


    public List<Object> getFaculties() { // Returns all available faculties
        String sql = "SELECT faculties.id,faculties.title FROM faculties";
        List<Object> query = jdbcTemplate.query(sql, (resultSet, i) -> {
            String id = resultSet.getString("id");
            String title = resultSet.getString("title");
            Map<String, String> map = new LinkedHashMap<>();
            map.put("id", id);
            map.put("title", title);
            return map;
        });
        if (query.isEmpty()) {
            query.add(0, "Not Found");
        }
        return query;
    }

    public List<Object> getyears() {
        String sql = "SELECT years.year,years.year_title FROM years";
        List<Object> query = jdbcTemplate.query(sql, (resultSet, i) -> {
            String year = resultSet.getString("year");
            String year_title = resultSet.getString("year_title");
            Map<String, String> map = new LinkedHashMap<>();
            map.put("id", year);
            map.put("title", year_title);
            return map;
        });
        if (query.isEmpty()) {
            query.add(0, "Not Found");
        }
        return query;
    }

    public List<Object> getYearsForSelectedFaculty(String faks, Integer year) { //Returns courses for specified year and faculty
        String sql = "SELECT faculties.id," +
                "years_id," +
                "courses_id," +
                "elementid," +
                "courses.title" +
                " FROM courses,faculties WHERE" +
                " faculties.internal_id = courses.faculties_id and faculties.id = ? and years_id = ?";
        Object[] arguments = {faks, year};
        List<Object> query = jdbcTemplate.query(sql, arguments, (resultSet, i) -> {

            String id = resultSet.getString("id");
            int years_id = resultSet.getInt("years_id");
            int courses_id = resultSet.getInt("courses_id");
            String elementid = resultSet.getString("elementid");
            String title = resultSet.getString("title");
            Map<String, String> map = new LinkedHashMap<>();
            map.put("id", id);
            map.put("years_id", String.valueOf(years_id));
            map.put("courses_id", String.valueOf(courses_id));
            map.put("elementid", elementid);
            map.put("title", title);
            return map;
        });
        if (query.isEmpty()) {
            query.add(0, "Not Found");
        }
        return query;
    }

    public List<Object> getCoursesForGivenYearAndFaculty(String faks, Integer year) {
        String sql = "SELECT faculties.id," +
                "years_id," +
                "courses_id," +
                "elementid," +
                "courses.title" +
                " FROM courses,faculties WHERE" +
                " faculties.internal_id = courses.faculties_id and faculties.id = ? and years_id = ?";
        Object[] arguments = {faks, year};
        List<Object> query = jdbcTemplate.query(sql, arguments, (resultSet, i) -> {
            String id = resultSet.getString("id");
            int years_id = resultSet.getInt("years_id");
            int courses_id = resultSet.getInt("courses_id");
            String elementid = resultSet.getString("elementid");
            String title = resultSet.getString("title");
            Map<String, String> map = new LinkedHashMap<>();
            map.put("id", id);
            map.put("years_id", String.valueOf(years_id));
            map.put("courses_id", String.valueOf(courses_id));
            map.put("elementid", elementid);
            map.put("title", title);
            return map;
        });
        if (query.isEmpty()) {
            query.add(0, "Not Found");
        }
        return query;
    }

    public List<Object> getSelectedFaculty(String faks) { //Returns courses for given

        String sql = "SELECT faculties.id," +
                "years_id," +
                "courses_id," +
                "elementid," +
                "courses.title" +
                " FROM courses,faculties WHERE" +
                " faculties.internal_id = courses.faculties_id and faculties.id = ?";
        Object[] arguments = {faks};
        List<Object> query = jdbcTemplate.query(sql, arguments, (resultSet, i) -> {
            String id = resultSet.getString("id");
            int years_id = resultSet.getInt("years_id");
            int courses_id = resultSet.getInt("courses_id");
            String elementid = resultSet.getString("elementid");
            String title = resultSet.getString("title");
            Map<String, String> map = new LinkedHashMap<>();
            map.put("id", id);
            map.put("years_id", String.valueOf(years_id));
            map.put("courses_id", String.valueOf(courses_id));
            map.put("elementid", elementid);
            map.put("title", title);
            return map;//new Object[] {id,years_id,courses_id,elementid,title};
        });
        if (query.isEmpty()) {
            query.add(0, "Not Found");
        }
        return query;
    }

    public List<Object> getNewsSources() {
        String sql = "SELECT faculty_id," +
                "faculty_title," +
                "faculty_short," +
                "categories," + " " +
                "text_background_hex" +
                " FROM \"newsSources\"";
        List<Object> query = jdbcTemplate.query(sql, (resultSet, i) -> {
            int faculty_id = resultSet.getInt("faculty_id");
            String faculty_title = resultSet.getString("faculty_title");
            String faculty_short = resultSet.getString("faculty_short");
            String categories = resultSet.getString("categories");
            String color = resultSet.getString("text_background_hex");
            Map<String, String> map = new LinkedHashMap<>();
            map.put("faculty_id", String.valueOf(faculty_id));
            map.put("faculty_title", faculty_title);
            map.put("faculty_short", faculty_short);
            map.put("categories", categories);
            map.put("color", color);
            return map;//new Object[] {id,years_id,courses_id,elementid,title};
        });
        if (query.isEmpty()) {
            query.add(0, "Not Found");
        }
        return query;
    }
}
