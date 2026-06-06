Feature: Get Users API Validation

  Background:
    * url baseUrl
    * def usersSchema = read('classpath:schemas/usersResponseSchema.json')
    * def userSchema = read('classpath:schemas/userItemSchema.json')

  Scenario: Validate GET /usuarios response

    Given path '/usuarios'
    When method GET
    Then status 200

  # STRUCTURE
    And match response contains usersSchema

  # TYPE VALIDATION
    And match response.usuarios == '#array'

  # BUSINESS RULES
    And assert response.quantidade > 0
    And assert response.usuarios.length > 0

  # DATA VALIDATION
    And match each response.usuarios == userSchema