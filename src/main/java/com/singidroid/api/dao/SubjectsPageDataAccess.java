package com.singidroid.api.dao;

import org.jsoup.select.Elements;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Repository
public class SubjectsPageDataAccess{
    private final JdbcTemplate jdbcTemplate;

    public SubjectsPageDataAccess(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }


    public Map<String, Object> getSubjects(Elements coursename, int i) {

        Map<String, Object> map = new LinkedHashMap<>();
        String courseName = coursename.get(i).getElementsByClass("coursename").text();
        String courseID = coursename.get(i).attr("data-courseid");
        ArrayList title = getTeachersForGivenSubject(coursename, i);
        map.put("courseName", courseName);
        map.put("courseid", "http://localhost/getSubject?id=" + courseID);
        map.put("title", title);
        return map;
    }

    public ArrayList getTeachersForGivenSubject(Elements elem, int position) {
        int size = elem.get(position).getElementsByClass("teachers").select("li").size();
        Elements toFind = elem.get(position).getElementsByClass("teachers").select("li");
        ArrayList arr = new ArrayList<String>();
        for (int i = 0; i < size; i++) {
            arr.add(toFind.get(i).text());
        }
        return arr;
    }

    public String getSubjectActualIDFromDataBase(String id) {
        String sql = "SELECT redirect_table.id,actual_id FROM redirect_table where redirect_table.id = ?";
        Object[] arguments = {id};
        List<Object> query = jdbcTemplate.query(sql, arguments, (resultSet, i) -> {
            int actual_id = resultSet.getInt("actual_id");
            List<String> toReturn = new ArrayList<>();
            toReturn.add(String.valueOf(actual_id));
            return toReturn;
        });
        if (query.isEmpty()) {
            query.add(0, id);
        }
        return query.get(0).toString();
    }
}
