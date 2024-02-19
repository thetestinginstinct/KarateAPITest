Feature: Dynamic Scenario Outline with @setup tag feature

  @setup
  Scenario: 
    * def register = read('classpath:testdata/register_payload.json')

  Scenario Outline: Dynamic Scenario Outline with @setup scenario1
    Given url 'https://reqres.in/api/register'
    And request { email: '#(email)', password: '#(password)' }
    When method post
    Then status 400
    * match response == '#(errorResponse)'

    Examples: 
      | karate.setupOnce().register |

  Scenario Outline: Dynamic Scenario Outline with @setup scenario2
    Given url 'https://reqres.in/api/register'
    And request { email: '#(email)', password: '#(password)' }
    When method post
    Then status 400
    * match response == '#(errorResponse)'

    Examples: 
      | karate.setupOnce().register |
