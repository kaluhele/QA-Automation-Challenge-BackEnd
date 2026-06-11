Feature: Update User by ID

  Background:
    * url baseUrl
    * def utils = call read('classpath:utils/common.js')
    * def baseUser = read('classpath:data/user-create.json')

  Scenario: Update User by ID successfully

    # 1. RANDOM DATA
    * def email = utils.randomEmail()
    * def name = utils.randomName()

    * set baseUser.nome = name
    * set baseUser.email = email

    # 2. CREATE USER
    Given path '/usuarios'
    And request baseUser
    When method POST
    Then status 201

    * def userId = response._id

    # 3. UPDATE USER (PUT)
    * def updatedName = 'Updated_' + utils.randomName()
    * def updatedEmail = 'updated_' + utils.randomEmail()

    * def updatePayload =
      """
      {
        "nome": "#(updatedName)",
        "email": "#(updatedEmail)",
        "password": "123456",
        "administrador": "true"
      }
      """

    Given path '/usuarios', userId
    And request updatePayload
    When method PUT
    Then status 200

    # 4. VERIFY UPDATE
    Given path '/usuarios', userId
    When method GET
    Then status 200

    And match response._id == userId
    And match response.nome == updatedName
    And match response.email == updatedEmail