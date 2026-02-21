package com.example.profilingdemo.controller;


import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

import com.example.profilingdemo.service.MessageService;

@RestController
//MC
public class MessageController {

    private final MessageService messageService;

    @Value("${message.environment}")
    private String currentEnv;

    public MessageController(MessageService messageService) {
        this.messageService = messageService;
    }

    @GetMapping("/message")
    public String getMessage() {
        return messageService.getMessage() + " | " + currentEnv;
    }
}
