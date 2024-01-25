Feature: Headers feature

  Background: 
    #To disable charset:
    #* configure charset = null
    #Single header:
    #* configure headers = { Accept: 'application/json'}
    #Multiple headers:
    #* configure headers = { Accept: 'application/json', 'Content-Type': 'application/xml'}

  Scenario: create user using post and inline json payload
    Given url 'https://reqres.in/api'
    And path '/users'
    And request {"name": "morpheus","job": "leader"}
    And header Accept = 'application/json'
    When method post
    Then status 201

  Scenario: list single user get request
    Given url 'https://reqres.in/api'
    And path '/users/2'
    And header Accept = 'application/json'
    When method get
    Then status 200
