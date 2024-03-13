Feature: Basic Authentication Feature

Background:
   * header Authorization = call read('basic-auth.js') { username: 'postman', password: 'password' }

  Scenario: Basic Authentication Scenario1
    Given url 'https://postman-echo.com/basic-auth'
    When method get
    Then status 200
    And print 'response is:', response
    * match response.authenticated == true
