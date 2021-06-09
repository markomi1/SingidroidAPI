package com.singidroid.api.contoller;


import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.singidroid.api.service.SubjectsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

@RestController
public class SubjectAPIController{ //NOTE Serves the API for the web page.


    private final SubjectsService subjectsService;

    @Autowired
    public SubjectAPIController(SubjectsService subjectsService) {
        this.subjectsService = subjectsService;
    }


    @PostMapping(value = "/api/getSubjectContent")
    public List<Object> getSubjectContent(@RequestParam(name = "contentid", required = false, defaultValue = "") String contentid) throws IOException, ParseException {
        final long startTime = System.currentTimeMillis();
        List<Object> errorObject = new ArrayList<>(); //Error Object
        if (contentid.equals("")) {
            errorObject.add("ERROR: contentid is empty");
            return errorObject;
        }
        if (subjectsService.checkIfPostsIdExists(contentid)) { //Checking to see if the supplied contentID actually exists in my DB, if not return error, if yes proceed to parsing it
            errorObject.add("ERROR: invalid contentID");
            return errorObject;
        }
        List<Object> toReturn = new ArrayList<>();

        if (subjectsService.checkIfPostListIsCached(contentid)) {

            toReturn.add(subjectsService.getCachedPostsList(contentid, false).get(0));

        } else {
            List<Object> freshPosts = subjectsService.getFreshPosts(contentid);
            toReturn.add(freshPosts);
            subjectsService.cachePostList(contentid, freshPosts);
        }

        final long endTime = System.currentTimeMillis();
        System.out.println("Total execution time of getSubjectContent: " + (endTime - startTime) + " ms");

        return toReturn;
    }

    @PostMapping(value = "/api/getTestFolder")
    public List<Object> getTests(@RequestParam(name = "contentid", required = false, defaultValue = "") String contentid) {
        List<Object> errorObject = new ArrayList<>(); //Error Object
        if (contentid.equals("")) {
            errorObject.add("ERROR: contentid is empty");
            return errorObject;
        }
        List<Object> toReturn = new ArrayList<>();
        try {
            toReturn.add(subjectsService.getTests(contentid));
        } catch (Exception e) {
            System.out.println("Error processing getTest given: " + contentid);
            toReturn.add("There was an error processing the request"); //If something breaks this gets returned
        }
        return toReturn;
    }


    @PostMapping(value = "api/getPost")
    public List<Object> getPostsByGivenId(@RequestParam(name = "postId", required = false, defaultValue = "0") Integer postId) throws ParseException {
        final long startTime = System.currentTimeMillis();
        List<Object> errorObject = new ArrayList<>(); //Error Object
        if (postId == 0 || postId < 0) {
            errorObject.add("ERROR: postId is empty or negative");
            return errorObject;
        }

        //TODO Make it cache the posts for 30-45 mins
        List<Object> post = subjectsService.lookupIfPostWasAlreadyScraped(postId); //If the entry in DB exist then i'll return the full thing, if not i'll return 0
        if (post.get(0).equals("0")) { //If i get back 0 then that ID doesn't exist in DB
            post = subjectsService.fetchAndInsertPost(postId);

        }

        final long endTime = System.currentTimeMillis();
        System.out.println("Total execution time of getPostsByGivenId: " + (endTime - startTime));
        return post;

    }

    //Name needs to be precisely the same or it won't find it, aka, čćšđ itd matters
    @PostMapping(value = "/api/schedule")
    public List<Object> getSchedule(@RequestParam(name = "name", required = false, defaultValue = "") String name) throws IOException {
        if (!name.isEmpty()) {
            List<Object> toFilter = subjectsService.getSchedule(); //We get the list of schedules
            List<Object> found = new ArrayList<>();
            Gson gson = new Gson();
            String temp = gson.toJson(toFilter); //Turn the list into JSON as List<Object> can be filtered but it's complicated
            JsonArray arr = gson.fromJson(temp, JsonArray.class); //Turn it into JsonArray
            for (int i = 0; i < arr.size(); i++) { //Loop over it till we find the name that was given
                String arrName = arr.get(i).getAsJsonObject().get("teacher").getAsString();
                if (arrName.equals(name)) { //This is so so so bad, but it works and it's 5AM so i can't be bothered to improve it for now
                    found.add(toFilter.get(i));
                }
            }
            if (found.isEmpty()) {
                found.add("Didn't find teacher with given name");
                return found;
            }
            return found;
        } else {
            return subjectsService.getSchedule();
        }
    }
}
