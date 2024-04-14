package com.example.test.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HelloController {
    @Value("${test.env:test}")
    private String testEnv;

    @GetMapping("/hello")
    @ResponseBody
    public String test() {

        return (testEnv == null || "".equals(testEnv)) ? "empty": testEnv;
    }
}
