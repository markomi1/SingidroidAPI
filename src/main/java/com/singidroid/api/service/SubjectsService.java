package com.singidroid.api.service;


import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.singidroid.api.dao.SubjectsPageDataAccess;
import com.singidroid.api.model.Schedule;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.nodes.Node;
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
    private final int SUBJECT_CACHE_TIME = 86400; //Unix secons, day is 86400
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

    public Map<String, String> getTests(String contentid) throws IOException {
        Map<String, String> map = new LinkedHashMap<>();
        String blogUrl = "http://predmet.singidunum.ac.rs/mod/folder/view.php?id=" + contentid;
        Document doc = Jsoup.connect(blogUrl).get();
        Element treeName = doc.getElementById("folder_tree0").selectFirst("ul");
        String title = doc.getElementById("intro").text(); //Replacing their image sources with mine down below
        String treeContentText = "<ul class='tree'>" + treeName.html().replaceAll("http:\\/\\/predmet\\.singidunum\\.ac\\.rs\\/theme\\/image\\.php\\/clean\\/core\\/\\d*\\/f\\/folder-24", "/images/folder_open-black.svg") + "</ul>";
        treeContentText = treeContentText.replaceAll("http:\\/\\/predmet\\.singidunum\\.ac\\.rs\\/theme\\/image\\.php\\/clean\\/core\\/\\d*\\/f\\/document-24", "/images/file_word.svg");
        treeContentText = treeContentText.replaceAll("http:\\/\\/predmet\\.singidunum\\.ac\\.rs\\/theme\\/image\\.php\\/clean\\/core\\/\\d*\\/f\\/pdf-24", "/images/file_pdf.svg");
        treeContentText = treeContentText.replaceAll("http:\\/\\/predmet\\.singidunum\\.ac\\.rs\\/theme\\/image\\.php\\/clean\\/core\\/\\d*\\/f\\/archive-24", "/images/zip_box.svg");
        treeContentText = treeContentText.replaceAll("http:\\/\\/predmet\\.singidunum\\.ac\\.rs\\/theme\\/image\\.php\\/clean\\/core\\/\\d*\\/f\\/text-24", "/images/file_document.svg");
        treeContentText = treeContentText.replaceAll("http:\\/\\/predmet\\.singidunum\\.ac\\.rs\\/theme\\/image\\.php\\/clean\\/core\\/\\d*\\/f\\/mpeg-24", "/images/file_video.svg");
        treeContentText = treeContentText.replaceAll("http:\\/\\/predmet\\.singidunum\\.ac\\.rs\\/theme\\/image\\.php\\/clean\\/core\\/\\d*\\/f\\/powerpoint-24", "/images/file_powerpoint.svg");
        treeContentText = treeContentText.replaceAll("http:\\/\\/predmet\\.singidunum\\.ac\\.rs\\/theme\\/image\\.php\\/clean\\/core\\/\\d*\\/f\\/unknown-24", "/images/file_question.svg");
        treeContentText = treeContentText.replaceAll("http:\\/\\/predmet\\.singidunum\\.ac\\.rs\\/theme\\/image\\.php\\/clean\\/core\\/\\d*\\/f\\/sourcecode-24", "/images/file_cog.svg");
        treeContentText = treeContentText.replaceAll("http:\\/\\/predmet\\.singidunum\\.ac\\.rs\\/theme\\/image\\.php\\/clean\\/core\\/\\d*\\/f\\/spreadsheet-24", "/images/file_excel.svg");
        treeContentText = treeContentText.replaceAll("http:\\/\\/predmet\\.singidunum\\.ac\\.rs\\/theme\\/image\\.php\\/clean\\/core\\/\\d*\\/f\\/html-24", "/images/file_html5.svg");
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
                    //toReplace = toReplace.replaceAll("http:\\/\\/predmet\\.singidunum\\.ac\\.rs\\/theme\\/image\\.php\\/clean\\/core\\/\\d*\\/f\\/spreadsheet", "/images/file_word.svg");
                    toReplace = toReplace.replaceAll("http:\\/\\/predmet\\.singidunum\\.ac\\.rs\\/theme\\/image\\.php\\/clean\\/core\\/\\d*\\/f\\/pdf", "/images/file_pdf.svg");
                    toReplace = toReplace.replaceAll("http:\\/\\/predmet\\.singidunum\\.ac\\.rs\\/theme\\/image\\.php\\/clean\\/core\\/\\d*\\/f\\/text", "/images/file_document.svg");
                    toReplace = toReplace.replaceAll("http:\\/\\/predmet\\.singidunum\\.ac\\.rs\\/theme\\/image\\.php\\/clean\\/core\\/\\d*\\/f\\/powerpoint", "/images/file_powerpoint.svg");
                    toReplace = toReplace.replaceAll("http:\\/\\/predmet\\.singidunum\\.ac\\.rs\\/theme\\/image\\.php\\/clean\\/core\\/\\d*\\/f\\/spreadsheet", "/images/file_excel.svg");
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

    public void cacheSubjects(String actualID, List<Object> subjects) {

        List<Object> cache = subjectsPageDataAccess.getChachedVersionIfItExists(actualID);

        if (cache.get(0).equals("0")) {
            subjectsPageDataAccess.cacheToDBSubjects(actualID, subjects);
        } else {
            Gson gson = new Gson();
            String toJson = gson.toJson(cache.get(0));
            JsonObject jsonQuery = gson.fromJson(toJson, JsonObject.class);
            int currentTime = Math.round(System.currentTimeMillis() / 1000);
            int cacheTime = jsonQuery.get("timestamp").getAsInt();
            int passedTime = currentTime - cacheTime;
            if (passedTime > SUBJECT_CACHE_TIME) {
                System.out.println("A day has passed, updating course with ID: " + actualID);
                subjectsPageDataAccess.updateCachedSubject(actualID, subjects);
            }
        }
    }

    public List<Object> checkIfCachedVersionExists(String actualID, boolean OverrideDayCheck) {
        Gson gson = new Gson();
        List<Object> toReturn = new ArrayList<>();
        List<Object> cachedSubjects = subjectsPageDataAccess.getChachedVersionIfItExists(actualID);

        if (cachedSubjects.get(0).equals("0")) {
            toReturn.add("0");
            return toReturn;
        }

        String toJson = gson.toJson(cachedSubjects.get(0));
        JsonObject jsonQuery = gson.fromJson(toJson, JsonObject.class);
        int currentTime = Math.round(System.currentTimeMillis() / 1000);
        int cacheTime = jsonQuery.get("timestamp").getAsInt();
        int passedTime = currentTime - cacheTime;
        if (passedTime > SUBJECT_CACHE_TIME && !OverrideDayCheck) {
            System.out.println("A day has passed, updating course with ID: " + actualID);
            toReturn.add("0");
            return toReturn;
        }

        return cachedSubjects;
    }

    public boolean checkIfPostsIdExists(String contentid) {
        return subjectsPageDataAccess.checkIfPostsIdExits(contentid);
    }

    public List<Object> getSchedule() throws IOException {
        String blogUrl = "http://raspored.singidunum.ac.rs/raspored_po_predavacima.php";
        Document doc = Jsoup.connect(blogUrl).ignoreContentType(true).header("Accept-Language", "en-US,en;q=0.5").get();
        Elements rows = doc.getElementsByClass("zapis");
        List<Object> toReturn = new ArrayList<>();
        final long startTime = System.currentTimeMillis();
        for (Element row : rows) {
            try {
                Schedule schedule = new Schedule();
                schedule.setTeacher(row.getElementsByClass("nastavnik").text());
                schedule.setSubjects(getPredmeti(row.getElementsByClass("predmeti")));
                schedule.setDay(row.getElementsByClass("dan").text());
                schedule.setFrom(row.getElementsByClass("od").text());
                schedule.setTill(row.getElementsByClass("do").text());
                schedule.setRoom(row.getElementsByClass("prostorija").text());
                toReturn.add(schedule);
            } catch (Exception e) {
                System.out.println("Special case found, skipping");
            }
        }
        final long endTime = System.currentTimeMillis();
        System.out.println("Total execution time of getPostsByGivenId: " + (endTime - startTime));
        return toReturn;
    }

    public List<String> getPredmeti(Elements toFind) {
        List<Node> te = toFind.get(0).childNodes();
        List<String> toReturn = new ArrayList<>();
        for (Node node : te) {
            String vv = node.toString();
            if (!vv.equals("<br>") && !vv.equals(" ")) {
                toReturn.add(vv);
            }
        }
        return toReturn;
    }

}
