package com.singidroid.api.contoller;


import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.singidroid.api.service.SubjectsService;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
public class PredmetiController{

    private final SubjectsService subjectsService;

    @Autowired
    public PredmetiController(SubjectsService subjectsService) {
        this.subjectsService = subjectsService;
    }


    @RequestMapping(value = "/predmeti/{id}", method = RequestMethod.GET)
    public String index(@PathVariable String id, Model model) {
        final long startTime = System.currentTimeMillis();
        Document doc = null;
        List<Object> subjects = null;
        Gson gson = new Gson();
        if (id.length() > 3 || id.isEmpty()) {
            return "error";
        }
        String url = "http://predmet.singidunum.ac.rs/course/index.php?categoryid=" + id;
        List<Object> cachedSubjects = subjectsService.checkIfCachedVersionExists(id, false);
        //index
        if (cachedSubjects.get(0).equals("0")) {
            try {
                //Note this is in a try catch because it can timeout sometimes
                doc = Jsoup.connect(url).get();
            } catch (Exception e) {
                //NOTE Fallback to cached version if the doc above timeouts or something, it falls back to the cached version
                System.out.println("Timeout or error while trying to load the page for ID: " + id);
                //Note overriding the "if days has passed" check just get the cached version, doesn't matter if it's old, what matters is that i get it
                //Note i still have to check if i get 0 back, because maybe i don't have that page cached yet, in that case i just return an error page
                cachedSubjects = subjectsService.checkIfCachedVersionExists(id, true);
                if (cachedSubjects.get(0).equals("0")) {
                    return "error";
                }
                //Note if there exists a cached version of that page then i add it to the template
                JsonObject obj = gson.fromJson(gson.toJson(cachedSubjects.get(0)), JsonObject.class);
                subjects = gson.fromJson(obj.get("cachedCourse").getAsJsonArray(), List.class);
                model.addAttribute("subjects", subjects);
                model.addAttribute("courseid", id);
                long errorTime = System.currentTimeMillis();
                System.out.println("Total execution time with error in index: " + (errorTime - startTime));
                return "index";
            }
            //Note this is ran when it doesn't get a timeout or some error, it parses the subjects, makes the list, then sends it to the 'cacheSubjects' to be cached.
            subjects = subjectsService.getSubject(doc);
            subjectsService.cacheSubjects(id, subjects);
            model.addAttribute("subjects", subjects);
            model.addAttribute("courseid", id);
            final long endTime = System.currentTimeMillis();
            System.out.println("Total execution time of index uncached page: " + (endTime - startTime));
        } else {
            //Note this is ran when the cached version is not older than a day
            JsonObject obj = gson.fromJson(gson.toJson(cachedSubjects.get(0)), JsonObject.class);
            subjects = gson.fromJson(obj.get("cachedCourse").getAsJsonArray(), List.class);
            model.addAttribute("subjects", subjects);
            model.addAttribute("courseid", id);
            final long endTime = System.currentTimeMillis();
            System.out.println("Total execution time of index cached page: " + (endTime - startTime));
        }
        return "index";
    }


}
