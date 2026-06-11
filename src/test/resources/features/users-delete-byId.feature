Feature: Delete User by ID

  Background:
    * url baseUrl
    * def utils = read('classpath:utils/common.js')
    * def baseUser = read('classpath:data/user-create.json')
    * def allure = read('classpath:utils/allure.js')

  Scenario: Delete User by ID successfully

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

    # DELETE USER
    Given path '/usuarios', userId
    When method DELETE
    Then status 200
    * allure.attachRequest('DELETE /usuarios - Request', baseUser)
    * allure.attachResponse('DELETE /usuarios - Response', response)

    # VERIFY DELETION
    Given path '/usuarios', userId
    When method GET
    Then assert responseStatus == 404 || responseStatus == 400
    * allure.attachResponse('GET after DELETE - Response', response)
