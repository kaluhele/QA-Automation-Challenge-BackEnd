Feature: Create User with dynamic data

  Background:
    * url baseUrl
    * def utils = call read('classpath:utils/common.js')
    * def baseUser = read('classpath:data/user-create.json')
    * def userCreateSchema = read('classpath:schemas/userCreateResponse.json')

  Scenario: Create user and store ID

    # DYNAMIC DATA
    * def email = utils.randomEmail()
    * def name = utils.randomName()

    * set baseUser.nome = name
    * set baseUser.email = email

    # CREATE USER
    Given path '/usuarios'
    And request baseUser
    When method POST
    Then status 201

    # SCHEMA VALIDATION
    And match response == userCreateSchema

    # STORE RESPONSE DATA
    * def userId = response._id
    * karate.set('userId', userId)

    # VALIDATIONS
    And match userId == '#string'

    # DEBUG
    * print 'USER CREATED ID:', userId
    * print 'EMAIL:', email
    * print 'NAME:', name