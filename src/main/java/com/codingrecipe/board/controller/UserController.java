package com.codingrecipe.board.controller;

import java.util.List;

import com.codingrecipe.board.dto.user;
import com.codingrecipe.board.service.UserService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class UserController {
    private final UserService userService;

    @GetMapping("/hello")
    public String hello() {
        return "Hello World";
    }

    @GetMapping("/user")
    public List<user> user() {
        return userService.getUserList();
    }

}