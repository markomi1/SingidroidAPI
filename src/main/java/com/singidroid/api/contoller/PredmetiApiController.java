package com.singidroid.api.contoller;

import com.singidroid.api.service.SubjectsService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

@RestController
public class PredmetiApiController{

    private final SubjectsService subjectsService;

    public PredmetiApiController(SubjectsService subjectsService) {
        this.subjectsService = subjectsService;
    }

    @PostMapping(value = "/api/getSubjectContent")
    public List<Object> getSubjectContent(@RequestParam(name = "contentid", required = false, defaultValue = "") String contentid,
                                          @RequestParam(name = "option", required = false, defaultValue = "0") Integer option) throws IOException, ParseException {
        List<Object> errorObject = new ArrayList<Object>(); //Error Object
        if (contentid.equals("")) {
            errorObject.add("ERROR: contentid is empty");
            return errorObject;
        } else if (option < 0 || option > 2) {
            errorObject.add("ERROR: option is below 0");
            return errorObject;
        }
        List<Object> toReturn = new ArrayList<>();
        switch (option) {
            case 1:
                toReturn.add(subjectsService.getPosts(contentid));
                break;
            case 2:
                toReturn.add(subjectsService.getTests(contentid));
                break;
            default:
                errorObject.add("ERROR: how did you end up here? No really...");
                return errorObject;
        }

        return toReturn;
    }
}
