package com.microbank.transaction;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class Application {
  public static void main(String[] args) {
    System.out.println("Transaction Service starting...");
    SpringApplication.run(Application.class, args);
  }
}
