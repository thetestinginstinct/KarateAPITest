Feature: Data Driven Testing using Scenario Outline & Examples feature

  Scenario Outline: Data Driven Testing using Scenario Outline & Examples scenario
    Given url 'https://reqres.in/api/register'
    And request { email: '#(email)', password: '#(password)' }
    When method post
    Then status 400
    * match response == '#(errorResponse)'

    Examples: 
      | email!            | password! | errorResponse!                         |
      | null              | null      | {"error": "Missing email or username"} |
      | true              | false     | {"error": "Missing password"}          |
      | ""                | ""        | {"error": "Missing email or username"} |
      | test123@gmail.com | ""        | {"error": "Missing password"}          |
      | ""                | password  | {"error": "Missing email or username"} |
