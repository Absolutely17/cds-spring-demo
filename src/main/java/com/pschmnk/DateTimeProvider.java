package com.pschmnk;

import java.time.LocalDateTime;
import org.springframework.stereotype.Component;

@Component
public class DateTimeProvider {

  public LocalDateTime getCurrentDateTime() {
    return LocalDateTime.now();
  }

}
