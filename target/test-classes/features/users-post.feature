Feature: Create User with dynamic data

  Background:
    * url baseUrl
    * def baseUser = read('classpath:data/user-create.json')
    * def userCreateSchema = read('classpath:schemas/userCreateResponse.json')


  Scenario: Create user and store ID

    # DYNAMIC DATA
    * def randomEmail = randomEmail()
    * def randomName = randomName()
    * set baseUser.nome = randomName
    * set baseUser.email = randomEmail

    # CREATE USER
    Given path '/usuarios'
    And request baseUser
    When method POST
    Then status 201

    # SCHEMA VALIDATION (NEW)
    And match response == userCreateSchema

    # STORE RESPONSE DATA
    * def userId = response._id
    * karate.set('userId', userId)

    # VALIDATIONS
    And match userId == '#string'

    # DEBUG
    * print 'USER CREATED ID:', userId
    * print 'EMAIL:', randomEmail
    * print 'NAME:', randomName