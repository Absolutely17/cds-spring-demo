package com.pschmnk;

import java.time.LocalDateTime;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Controller {

  public Controller(DateTimeProvider dateTimeProvider) {
    this.dateTimeProvider = dateTimeProvider;
  }

  private final DateTimeProvider dateTimeProvider;

  @GetMapping
  public String hello() {
    return "Hello, World!";
  }

  @GetMapping("/current-date-time")
  public LocalDateTime getCurrentDateTime() {
    return dateTimeProvider.getCurrentDateTime();
  }

}
