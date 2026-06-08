Feature: Delete User by ID

  Background:
    * url baseUrl
    * def baseUser = read('classpath:data/user-create.json')

  Scenario: Create user and delete it

  # =========================
  # 1. CREATE USER
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
  # 2. DELETE USER
  # =========================
    Given path '/usuarios', userId
    When method DELETE
    Then status 200

  # =========================
  # 3. VERIFY DELETION
  # =========================
    Given path '/usuarios', userId
    When method GET
    Then status 400 || 404