package com.singidroid.api.contoller;


import com.singidroid.api.service.SubjectsService;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

@Controller
public class PredmetiController{

    private final SubjectsService subjectsService;

    @Autowired
    public PredmetiController(SubjectsService subjectsService) {
        this.subjectsService = subjectsService;
    }

    @RequestMapping(value = "/predmeti", method = RequestMethod.GET)
    public String index(HttpServletRequest request, Model model) throws IOException {
        final long startTime = System.currentTimeMillis();

        String actualID = subjectsService.getSubjectActualID(request.getParameter("id")).replace("[", "").replace("]", "");

        String url = "http://predmet.singidunum.ac.rs/course/index.php?categoryid=" + actualID;
        Document doc = Jsoup.connect(url).get();

        List<Object> subjects = subjectsService.getSubject(doc);
        model.addAttribute("subjects", subjects);

        final long endTime = System.currentTimeMillis();
        System.out.println("Total execution time: " + (endTime - startTime));
        return "index";
    }


}
