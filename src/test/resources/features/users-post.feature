Feature: Create User

  Background:
    * url baseUrl
    * def utils = read('classpath:utils/common.js')
    * def baseUser = read('classpath:data/user-create.json')
    * def userCreateSchema = read('classpath:schemas/userCreateResponse.json')
    * def allure = read('classpath:utils/allure.js')

  Scenario: Create user successfully

    # DYNAMIC DATA
    * def email = utils.randomEmail()
    * def name = utils.randomName()
    * def password = utils.randomPassword()
    * set baseUser.nome = name
    * set baseUser.email = email
    * set baseUser.password = password

    # CREATE USER
    Given path '/usuarios'
    And request baseUser
    When method POST
    Then status 201
    * allure.attachRequest('POST /usuarios - Request', baseUser)
    * allure.attachResponse('POST /usuarios - Response', response)

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