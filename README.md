# QA Automation Challenge BackEnd

This project is an API test automation framework built using Karate DSL.

It validates CRUD operations on the Users endpoint:
- POST (Create User)
- GET (Get User and User by ID)
- PUT (Update User)
- DELETE (Delete User)

---

# Requirements

- Java 17 
- Maven 3.6+

---

# Project Structure

src/test/java
└── TestRunner.java

src/test/resources
├── features/
│   ├── user-post.feature
│   ├── user-get-byId.feature
│   ├── user-get.feature
│   ├── user-put-byId.feature
│   ├── user-delete-byId.feature
│
├── data/
│   └── user-create.json
│
├── schemas/
│   ├── usersResponseSchema.json
│   └── userSchema.json

---

# Installation

Clone the repository:
https://github.com/kaluhele/QA-Automation-Challenge-BackEnd.git

Install dependencies:
mvn clean install

---

# Execution

Run tests:
.\run-tests.bat

Generate Spark Report (Karate built-in):
The Spark HTML report will be generated automatically in: `target/karate-reports/karate-summary.html`

Generate Allure Report:
mvn allure:serve

(This command will generate and open the Allure report in your browser)

Or to just generate the report without opening:
mvn allure:report

The Allure report will be available at: `target/site/allure-maven/index.html`

---

# Reporting

This project is configured with two powerful reporting tools:

## 1. Spark Reports (Built-in with Karate)
- **Location:** `target/karate-reports/karate-summary.html`
- **Auto-generated:** After every test run
- **Features:** Test timeline, execution statistics, failed test details

## 2. Allure Reports
- **Location:** `target/site/allure-maven/index.html`
- **Features:** Beautiful UI, test history, attachments, analytics, trends

### How to generate Allure Reports:
```bash
# Generate and open report automatically
mvn allure:serve

# Or just generate without opening
mvn allure:report
```

---

- Dynamic test data (UUID generation)
- Schema validation
- CRUD lifecycle testing
- Reusable payload files
- Clean separation of test layers

---

# Automation Strategy & Design Patterns

The automation strategy for this project is based on validating the full lifecycle of REST API services using Karate DSL. 
The approach focuses on ensuring functional correctness, data integrity, and contract compliance across all user-related endpoints.

The testing strategy follows a **CRUD-based flow (Create, Read, Update, Delete)** to simulate real-world user behavior and validate the stability of the API under sequential operations.

## Strategy Highlights

- End-to-end API validation using real HTTP requests.
- Dynamic test data generation to avoid data collisions and ensure test independence.
- Schema validation to ensure API contract compliance.
- Separation of concerns between test logic, test data, and schemas.
- Reusable test components for maintainability and scalability.

---
## Design Patterns Used

- **AAA (Arrange–Act–Assert):** Clear structure for each test (setup, execution, validation)
- **Data-Driven Testing:** Dynamic data using UUIDs and external JSON files
- **Test Data Separation:** Separation of features, data, and schemas for better maintenance
- **Schema Validation:** API response structure validation using JSON schemas
- **CRUD Lifecycle Testing:** Full resource flow validation (Create, Read, Update, Delete)

# 