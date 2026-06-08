package com.katherine.tests;

import com.intuit.karate.junit5.Karate;
import io.qameta.allure.Epic;
import io.qameta.allure.Feature;
import org.junit.jupiter.api.DisplayName;

@Epic("API Testing")
@Feature("User Management")
@DisplayName("QA Automation Challenge - User API Tests")
public class TestRunner {

    @Karate.Test
    Karate testAll() {
        return Karate.run("classpath:features")
                .outputCucumberJson(true);
    }
}
