Feature: Get User by ID

  Background:
    * url baseUrl
    * def baseUser = read('classpath:data/user-create.json')

  Scenario: Create user and validate by ID

    * def randomEmail = 'user_' + java.util.UUID.randomUUID() + '@test.com'
    * def randomName = 'User_' + java.util.UUID.randomUUID()

    * set baseUser.nome = randomName
    * set baseUser.email = randomEmail

  # =========================
  # POST USER
  # =========================
    Given path '/usuarios'
    And request baseUser
    When method POST
    Then status 201

    * def userId = response._id

  # =========================
  # GET USER BY ID
  # =========================
    Given path '/usuarios', userId
    When method GET
    Then status 200

  # =========================
  # VALIDATIONS
  # =========================
    And match response._id == userId
    And match response.email == randomEmail
    And match response.nome == randomName