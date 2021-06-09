package com.singidroid.api.contoller;

import com.singidroid.api.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@RestController
public class NewsController{

    private final NewsService newsService;

    @Autowired
    public NewsController(NewsService NewsService) {
        this.newsService = NewsService;
    }


    @GetMapping("news/getNews") //TODO Change later to POST Mapping not GET Mapping
    public List<Object> getNews(@RequestParam(name = "newsSourceCategories", required = false, defaultValue = "") String newsSourceCategories,
                                @RequestParam(name = "page", required = false, defaultValue = "0") Integer page) throws IOException {                                               //This should return NewsJSON for given sources, or given faculty Acronyms
        List<Object> errorObject = new ArrayList<>(); //Error Object
        if (newsSourceCategories.isEmpty()) { //Just normal input "sanitization"
            errorObject.add("ERROR: newsSourceCategories cannot be empty");
            return errorObject;
        } else if (newsSourceCategories.length() > 12) {
            errorObject.add("ERROR: newsSourceCategories is over 12 char");
            return errorObject;
        } else if (page >= 50 || page < 0) {
            errorObject.add("ERROR: over 50 pages or under 0, yea that's the limit");
            return errorObject;
        }

        String url = "http://api.singidunum.rs/key:SD03-A1K8-1033-0001-3355/module:posts/method:getCategoryPosts/categories:" + newsSourceCategories + "/page:" + page + "/count:15/";

        return newsService.getNews(url); //All the ugly stuff happens in that method call
    }


    @GetMapping("news/getSources")
    @Cacheable("response1")
    public List<Object> getNewsRepo() { //Returns news sources
        return newsService.getNewsRepo();
    }


}
