package com.singidroid.api.service;


import com.singidroid.api.dao.SubjectsPageDataAccess;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class SubjectsService{

    private final SubjectsPageDataAccess subjectsPageDataAccess;

    @Autowired
    public SubjectsService(SubjectsPageDataAccess subjectsPageDataAccess) {
        this.subjectsPageDataAccess = subjectsPageDataAccess;
    }

    public String getSubjectActualID(String id) {
        return subjectsPageDataAccess.getSubjectActualIDFromDataBase(id);
    }


    public List<Object> getSubject(Document elem) {
        Elements allSubjects = elem.getElementsByClass("coursebox");
        List<Object> subjects = new ArrayList<>();
        for (int i = 0; i < allSubjects.size(); i++) {
            subjects.add(subjectsPageDataAccess.getSubjects(allSubjects, i));
        }
        return subjects;
    }
}
