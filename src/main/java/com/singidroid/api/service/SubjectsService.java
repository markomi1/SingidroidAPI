package com.singidroid.api.service;


import com.google.gson.Gson;
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
            Map<String, Object> map = new LinkedHashMap<>();
            Elements nameAndDate = toExtract.get(i).getElementsByClass("lastpost").select("a");
            SimpleDateFormat sdf = new SimpleDateFormat("E, dd MMM yyyy, hh:mm a", Locale.US);
            Date parsedDate = sdf.parse(nameAndDate.get(1).text());
            map.put("title", toExtract.get(i).getElementsByClass("topic").text());
            map.put("postlinkid", linkExtractor(toExtract.get(i).getElementsByClass("topic").select("a").attr("href")));
            map.put("teacherName", nameAndDate.get(0).text());
            map.put("datetime", parsedDate.getTime() / 1000);
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
        treeContentText = treeContentText.replace("http://predmet.singidunum.ac.rs/theme/image.php/clean/core/1589271127/f/spreadsheet", "/images/file_excel.svg");
        Document docc = Jsoup.parse(treeContentText);
        map.put("title", title);
        map.put("content", treeContentText);
        return map;
    }

    public List<Object> lookupIfPostWasAlreadyScraped(Integer postId) {
        return subjectsPageDataAccess.lookupIfPostExistsInDB(postId);
    }


    public List<Object> fetchAndInsertPost(Integer postId) throws ParseException {
        List<Object> toReturn = new ArrayList<>();
        String blogUrl = "http://predmet.singidunum.ac.rs/mod/forum/discuss.php?d=" + postId;
        Document doc = null;
        try {
            doc = Jsoup.connect(blogUrl).header("Accept-Language", "en-US,en;q=0.5").get();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Something went wrong trying to get post with ID:" + postId);
            toReturn.add(0, "0");
            return toReturn;
        }

        Map<String, Object> posts = new LinkedHashMap<>();
        String title, teacher, date;
        Date parsedDate;
        try {
            title = doc.getElementsByClass("subject").text(); //Get post title
            teacher = doc.getElementsByClass("author").get(0).select("a").text(); //Get who posted the stuff
            date = doc.getElementsByClass("author").get(0).childNode(2).toString().replace("-", "").trim(); //Get the date, remove the '-' and trailing whitespaces
            SimpleDateFormat sdf = new SimpleDateFormat("E, dd MMM yyyy, hh:mm a", Locale.US); //Setup date parser
            parsedDate = sdf.parse(date); //Parse the date
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Something went wrong trying to process header section of ID:" + postId);
            toReturn.add(0, "0"); //Return 0
            return toReturn;
        }
        //Header section


        posts.put("title", title); //Put title in Map
        posts.put("teacher", teacher);//Put teacher in Map
        posts.put("datetime", String.valueOf(parsedDate.getTime()));//Put datetime in UNIX format in Map


        //Main content section

        //It's an HTML with some classes removed
        String mainContent;
        try {
            mainContent = doc.getElementsByClass("fullpost").get(0).selectFirst("div").toString().replace("class=\"posting fullpost\"", "");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Something went wrong trying to process mainContent of ID:" + postId);
            toReturn.add(0, "0"); //Return 0
            return toReturn;
        }

        posts.put("content", mainContent);

        //Attachments section
        Element attachmentsElement = null;

        try {
            attachmentsElement = doc.getElementsByClass("attachments").get(0); // Can throw and error if there's no attachments in the post
        } catch (IndexOutOfBoundsException e) {
            //Set an empty map if there's no attachments
        }

        List<Object> attachmentsList = new ArrayList<>();
        Gson gson = new Gson();


        if (attachmentsElement != null) {//Check to see if there are any attachments at all to begin with, by default we assume there's none
            int attachmentsLenght = attachmentsElement.select("a").size(); //List of all the <a> tags, they're usually in pairs, aka if there's 1 attachment there are 2 <a> tags
            //One is for the file type image (first one) and 2nd one is the filename
            Elements toGoThru = attachmentsElement.select("a"); //To iterate thru

            for (int i = 0; i < attachmentsLenght; i++) {
                Map<String, Object> attachmentsMap = new LinkedHashMap<>();

                if (i % 2 == 0) { //If it's even then we're at the <a> tag that has a child, if not then we're at <a> tag with no children nodes
                    String toReplace = toGoThru.get(i).childNode(0).attr("src");
                    //toReplace = toReplace.replace("http://predmet.singidunum.ac.rs/theme/image.php/clean/core/1589271127/f/spreadsheet", "/images/file_word.svg");
                    toReplace = toReplace.replace("http://predmet.singidunum.ac.rs/theme/image.php/clean/core/1589271127/f/pdf", "/images/file_pdf.svg");
                    toReplace = toReplace.replace("http://predmet.singidunum.ac.rs/theme/image.php/clean/core/1589271127/f/text", "/images/file_document.svg");
                    toReplace = toReplace.replace("http://predmet.singidunum.ac.rs/theme/image.php/clean/core/1589271127/f/powerpoint", "/images/file_powerpoint.svg");
                    toReplace = toReplace.replace("http://predmet.singidunum.ac.rs/theme/image.php/clean/core/1589271127/f/spreadsheet", "/images/file_excel.svg");
                    attachmentsMap.put("type", toReplace); //If true then we get the download link
                    attachmentsMap.put("attachmentLink", toGoThru.get(i + 1).attr("href")); //If true then we get the download link
                    attachmentsMap.put("attachmentTitle", toGoThru.get(i + 1).childNode(0).toString()); //And we get the title as well
                    attachmentsList.add(attachmentsMap);
                }
            }
        }

        posts.put("attachments", attachmentsList);

        subjectsPageDataAccess.insertPostsIntoDb(postId, title, teacher, parsedDate.getTime(), mainContent, gson.toJson(attachmentsList));
        toReturn.add(posts);
        return toReturn;
    }
}
