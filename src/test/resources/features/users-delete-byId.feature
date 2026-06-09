Feature: Delete User by ID

  Background:
    * url baseUrl
    * def baseUser = read('classpath:data/user-create.json')

  Scenario: Delete User by ID successfully

    * def randomEmail = randomEmail()
    * def randomName = randomName()
    * set baseUser.nome = randomName
    * set baseUser.email = randomEmail

    # CREATE USER
    Given path '/usuarios'
    And request baseUser
    When method POST
    Then status 201

    * def userId = response._id

    # DELETE USER
    Given path '/usuarios', userId
    When method DELETE
    Then status 200

    # VERIFY DELETION
    Given path '/usuarios', userId
    When method GET
    Then assert responseStatus == 404 || responseStatus == 400