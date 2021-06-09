package com.singidroid.api.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Repository
public class NewsDataAccess{

    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public NewsDataAccess(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<Object> getNewsSources() {
        String sql = "SELECT " +
                "faculty_title," +
                "faculty_short," +
                "categories," +
                "text_background_hex" +
                " FROM \"newsSources\"";
        List<Object> query = jdbcTemplate.query(sql, (resultSet, i) -> {
            String faculty_title = resultSet.getString("faculty_title");
            String faculty_short = resultSet.getString("faculty_short");
            String categories = resultSet.getString("categories");
            String color = resultSet.getString("text_background_hex");
            Map<String, String> map = new LinkedHashMap<>();
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
