Feature: Dynamic Scenario Outline feature

  Scenario Outline: Dynamic Scenario Outline scenario
    Given url 'https://reqres.in/api/register'
    And request { email: '#(email)', password: '#(password)' }
    When method post
    Then status 400
    * match response == '#(errorResponse)'

    Examples: 
      | read('classpath:testdata/register_payload.json') |
