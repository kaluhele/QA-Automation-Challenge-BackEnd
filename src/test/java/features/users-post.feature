Feature: Create User with dynamic data

  Background:
    * url baseUrl
    * def baseUser = read('classpath:data/user-create.json')

  Scenario: Create user and store ID

    * def randomEmail = 'user_' + java.util.UUID.randomUUID() + '@test.com'
    * def randomName = 'User_' + java.util.UUID.randomUUID()

    * set baseUser.nome = randomName
    * set baseUser.email = randomEmail

    Given path '/usuarios'
    And request baseUser
    When method POST
    Then status 201

  # =========================
  # STORE RESPONSE DATA (FIX REAL)
  # =========================
    * def userId = response._id
    * karate.set('userId', userId)

  # VALIDATIONS
    And match userId == '#string'

  # PRINT DEBUG
    * print 'USER CREATED ID:', userId