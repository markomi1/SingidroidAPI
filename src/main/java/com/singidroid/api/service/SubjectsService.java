package com.singidroid.api.service;


import com.singidroid.api.dao.SubjectsPageDataAccess;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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

    public List<Object> getPosts(String id) throws ParseException, IOException {
        List<Object> toReturn = new ArrayList<>();
        String blogUrl = "http://predmet.singidunum.ac.rs/mod/forum/view.php?id=" + id;
        Document doc = Jsoup.connect(blogUrl).header("Accept-Language", "en-US,en;q=0.5").get();
        Elements toExtract = doc.getElementsByClass("discussion");
        int toExtactLenth = toExtract.size();

        for (int i = 0; i < toExtactLenth; i++) {
            Map<String, String> map = new LinkedHashMap<>();
            Elements nameAndDate = toExtract.get(i).getElementsByClass("lastpost").select("a");
            SimpleDateFormat sdf = new SimpleDateFormat("E, dd MMM yyyy, hh:mm a", Locale.US);
            Date parsedDate = sdf.parse(nameAndDate.get(1).text());
            map.put("title", toExtract.get(i).getElementsByClass("topic").text());
            map.put("postlinkid", linkExtractor(toExtract.get(i).getElementsByClass("topic").select("a").attr("href")));
            map.put("teacherName", nameAndDate.get(0).text());
            map.put("datetime", String.valueOf(parsedDate.getTime()));
            toReturn.add(map);
        }

        return toReturn;
    }

    public String linkExtractor(String link) {
        final String regex = "=\\d*";

        final Pattern pattern = Pattern.compile(regex, Pattern.MULTILINE);
        final Matcher matcher = pattern.matcher(link);

        while (matcher.find()) {
            String temp = matcher.group(0).replace("=", "");
            return temp;
        }
        return null;
    }

    public Boolean searchDBwithGivenContentId(String contentId) {

        return false;
    }


    public Map<String, String> getTests(String contentid) throws IOException {

        Map<String, String> map = new LinkedHashMap<>();

        String blogUrl = "http://predmet.singidunum.ac.rs/mod/folder/view.php?id=" + contentid;
        Document doc = Jsoup.connect(blogUrl).get();
        Element treeName = doc.getElementById("folder_tree0").selectFirst("ul");
        String title = doc.getElementById("intro").text();
        String treeContentText = "<ul class='tree'>" + treeName.html().replace("http://predmet.singidunum.ac.rs/theme/image.php/clean/core/1589271127/f/folder-24", "/images/folder_open-black.svg") + "</ul>";
        treeContentText = treeContentText.replace("http://predmet.singidunum.ac.rs/theme/image.php/clean/core/1589271127/f/document-24", "/images/file_word.svg");
        treeContentText = treeContentText.replace("http://predmet.singidunum.ac.rs/theme/image.php/clean/core/1589271127/f/pdf-24", "/images/file_pdf.svg");
        treeContentText = treeContentText.replace("http://predmet.singidunum.ac.rs/theme/image.php/clean/core/1589271127/f/archive-24", "/images/zip_box.svg");
        treeContentText = treeContentText.replace("http://predmet.singidunum.ac.rs/theme/image.php/clean/core/1589271127/f/text-24", "/images/file_document.svg");
        treeContentText = treeContentText.replace("http://predmet.singidunum.ac.rs/theme/image.php/clean/core/1589271127/f/mpeg-24", "/images/file_video.svg");
        treeContentText = treeContentText.replace("http://predmet.singidunum.ac.rs/theme/image.php/clean/core/1589271127/f/powerpoint-24", "/images/file_powerpoint.svg");
        treeContentText = treeContentText.replace("http://predmet.singidunum.ac.rs/theme/image.php/clean/core/1589271127/f/unknown-24", "/images/file_question.svg");
        treeContentText = treeContentText.replace("http://predmet.singidunum.ac.rs/theme/image.php/clean/core/1589271127/f/sourcecode-24", "/images/file_cog.svg");
        Document docc = Jsoup.parse(treeContentText);
        map.put("title", title);
        map.put("content", treeContentText);
        return map;
    }
}
