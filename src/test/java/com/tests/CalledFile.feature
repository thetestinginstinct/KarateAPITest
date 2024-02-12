@ignore
Feature: Called Feature

  Scenario: Token creation end point
    Given url 'https://restful-booker.herokuapp.com/auth'
    #used embedded expressions to pass payload. Data will be provided from
    #calling feature file as a json
    And request {username: '#(username)',password: '#(password)'}
    When method post
    Then status 200

   
