package com.singidroid.api.dao;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
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
        String actualID = getSubjectActualIDFromDataBase(coursename.get(i).attr("data-courseid")).replace("[", "").replace("]", "");
        ArrayList title = getTeachersForGivenSubject(coursename, i); //Teachers
        JsonObject test = getLinkIDsForGivenSubjectID(actualID);
        map.put("courseName", courseName);

        for (int b = 0; b < test.size(); b++) {
            String[] keys = test.keySet().toArray(new String[0]);
            map.put(keys[b], test.get(keys[b]).getAsString());
        }


        map.put("title", title);
        return map;
    }


    public JsonObject getLinkIDsForGivenSubjectID(String subjectId) { //Returns subject link ID's if given ACTUAL LINK, not pre redirected one
        String sql = "select sections.obavestenja,\n" +
                "sections.rezultati,\n" +
                "sections.\"kol1Pre\",\n" +
                "sections.\"kol2Pre\",\n" +
                "sections.\"ispitPre\",\n" +
                "sections.\"dmPre\",\n" +
                "sections.\"kol1Vez\",\n" +
                "sections.\"kol2Vez\",\n" +
                "sections.\"ispitVez\",\n" +
                "sections.\"dmVez\"\n" +
                "from sections where sections.\"subjectID\" = ? LIMIT 1";
        Object[] arguments = {subjectId};
        List<Object> query = jdbcTemplate.query(sql, arguments, (resultSet, i) -> {

            String obavestenja = resultSet.getString("obavestenja");
            String rezultati = resultSet.getString("rezultati");

            String kol1Pre = resultSet.getString("kol1Pre");
            String kol2Pre = resultSet.getString("kol2Pre");
            String ispitPre = resultSet.getString("ispitPre");
            String dmPre = resultSet.getString("dmPre");

            String kol1Vez = resultSet.getString("kol1Vez");
            String kol2Vez = resultSet.getString("kol2Vez");
            String ispitVez = resultSet.getString("ispitVez");
            String dmVez = resultSet.getString("dmVez");

            Map<String, String> map = new LinkedHashMap<>();

            map.put("obavestenja", obavestenja);
            map.put("rezultati", rezultati);
            map.put("kol1Pre", kol1Pre);
            map.put("kol2Pre", kol2Pre);
            map.put("ispitPre", ispitPre);
            map.put("dmPre", dmPre);
            map.put("kol1Vez", kol1Vez);
            map.put("kol2Vez", kol2Vez);
            map.put("ispitVez", ispitVez);
            map.put("dmVez", dmVez);
            return map;
        });
        Gson gson = new Gson();
        JsonObject jsonQuery = gson.fromJson(query.get(0).toString(), JsonObject.class);
        if (jsonQuery.isJsonNull()) {
            jsonQuery.addProperty(String.valueOf(0), 0);
        }
        return jsonQuery;
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
