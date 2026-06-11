Feature: Get User by ID

  Background:
    * url baseUrl
    * def utils = read('classpath:utils/common.js')
    * def baseUser = read('classpath:data/user-create.json')
    * def userSchema = read('classpath:schemas/userItemSchema.json')
    * def allure = read('classpath:utils/allure.js')

  # =========================
  # POSITIVE FLOW
  # =========================
  Scenario: Get User by ID successfully

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

    * def userId = response._id

    # GET USER BY ID
    Given path '/usuarios', userId
    When method GET
    Then status 200
    * allure.attachResponse('GET /usuarios/:id - Response', response)

    # VALIDATIONS
    And match response._id == userId
    And match response.email == email
    And match response.nome == name

    # SCHEMA VALIDATION
    And match response == userSchema

  # =========================
  # NEGATIVE FLOW
  # =========================
  Scenario: Get User by ID with invalid ID

    * def invalidId = '999999999999999999999999'

    Given path '/usuarios', invalidId
    When method GET
    * allure.attachResponse('GET invalid ID - Response', response)
    Then assert responseStatus == 400 || responseStatus == 404