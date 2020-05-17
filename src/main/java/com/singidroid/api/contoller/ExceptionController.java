package com.singidroid.api.contoller;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
public class ExceptionController implements ErrorController {

    private static final String PATH = "/error";

    @RequestMapping(value = PATH)
    public List<Object> error() { //Custom error message
        List<Object> errorObject = new ArrayList<Object>(); //Error Object
        errorObject.add("ERROR: wrong endpoint or something broke");
        return errorObject;
    }

    @Override
    public String getErrorPath() {
        return PATH;
    }
}