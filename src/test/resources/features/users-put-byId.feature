Feature: Update User by ID

  Background:
    * url baseUrl
    * def baseUser = read('classpath:data/user-create.json')

  Scenario: Create user and update it

  # =========================
  # 1. CREATE USER (POST)
  # =========================
    * def randomEmail = 'user_' + java.util.UUID.randomUUID() + '@test.com'
    * def randomName = 'User_' + java.util.UUID.randomUUID()

    * set baseUser.nome = randomName
    * set baseUser.email = randomEmail

    Given path '/usuarios'
    And request baseUser
    When method POST
    Then status 201

    * def userId = response._id

  # =========================
  # 2. UPDATE USER (PUT)
  # =========================
    * def updatedName = 'Updated_' + randomName
    * def updatedEmail = 'updated_' + randomEmail

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

  # =========================
  # 3. VERIFY UPDATE (GET)
  # =========================
    Given path '/usuarios', userId
    When method GET
    Then status 200

    And match response._id == userId
    And match response.nome == updatedName
    And match response.email == updatedEmail