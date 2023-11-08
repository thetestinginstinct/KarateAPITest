Feature: query and path parameter Feature

  Scenario: query parameter
    Given url 'https://reqres.in/api/users'
    And param page = '2'
    When method get
    Then status 200

  Scenario: path parameter
    Given url 'https://reqres.in/api/users/'
    And path '/2'
    When method get
    Then status 200
