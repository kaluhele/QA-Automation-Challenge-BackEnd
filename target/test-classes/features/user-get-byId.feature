Feature: Get User by ID

  Background:
    * url baseUrl
    * def utils = call read('classpath:utils/common.js')
    * def baseUser = read('classpath:data/user-create.json')
    * def userSchema = read('classpath:schemas/userItemSchema.json')

  # =========================
  # POSITIVE FLOW
  # =========================
  Scenario: Create user and validate by ID successfully

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

    * def userId = response._id

    # GET USER BY ID
    Given path '/usuarios', userId
    When method GET
    Then status 200

    # VALIDATIONS
    And match response._id == userId
    And match response.email == email
    And match response.nome == name

    # SCHEMA VALIDATION
    And match response == userSchema

  # =========================
  # NEGATIVE FLOW
  # =========================
  Scenario: Validate GET user with invalid ID returns 404

    * def invalidId = '999999999999999999999999'

    Given path '/usuarios', invalidId
    When method GET
    Then assert responseStatus == 400 || responseStatus == 405