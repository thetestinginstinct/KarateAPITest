Feature: Conditional Logic Feature

  Scenario: If else conditional logic with single condition using ternary operator
    Given url 'https://reqres.in/api/users'
    And request {"name": "morpheus","job": "leader"}
    When method post
    * match responseStatus == 201
    * def filename = responseStatus == 201 ? 'QueryAndPathParameter.feature' : 'ResponseKeywords.feature'
    * def result = call read(filename)

  Scenario: If else conditional logic with multiple and condition using ternary operator
    Given url 'https://reqres.in/api/users'
    And request {"name": "morpheus","job": "leader"}
    When method post
    * match responseStatus == 201
    * def filename = responseStatus == 201 && response.name == 'morpheus'? 'QueryAndPathParameter.feature' : 'ResponseKeywords.feature'
    * def result = call read(filename)

  Scenario: If else conditional logic with multiple and condition using ternary operator where one condition is made wrong intentionaly
    Given url 'https://reqres.in/api/users'
    And request {"name": "morpheus","job": "leader"}
    When method post
    * match responseStatus == 201
    * def filename = responseStatus == 201 && response.name == 'morph'? 'QueryAndPathParameter.feature' : 'ResponseKeywords.feature'
    * def result = call read(filename)

  Scenario: If else conditional logic with multiple or condition using ternary operator where one condition is made wrong intentionaly
    Given url 'https://reqres.in/api/users'
    And request {"name": "morpheus","job": "leader"}
    When method post
    * match responseStatus == 201
    * def filename = responseStatus == 201 || response.name == 'morph'? 'QueryAndPathParameter.feature' : 'ResponseKeywords.feature'
    * def result = call read(filename)

  Scenario: If else conditional logic with single condition using ternary operator and karate.call
    Given url 'https://reqres.in/api/users'
    And request {"name": "morpheus","job": "leader"}
    When method post
    * match responseStatus == 201
    * def result = responseStatus == 201 ? karate.call('QueryAndPathParameter.feature') : karate.call('ResponseKeywords.feature')

  Scenario: If else conditional logic with single condition using ternary operator with if body empty and karate.call
    Given url 'https://reqres.in/api/users'
    And request {"name": "morpheus","job": "leader"}
    When method post
    * match responseStatus == 201
    * def result = responseStatus == 200 ? {} : karate.call('ResponseKeywords.feature')

  Scenario: If else conditional logic with single condition without using ternary operator and karate.call
    Given url 'https://reqres.in/api/users'
    And request {"name": "morpheus","job": "leader"}
    When method post
    * match responseStatus == 201
    * if(responseStatus == 201) karate.call('QueryAndPathParameter.feature')

  Scenario: If else conditional logic using ternary operator to check json response
    Given url 'https://reqres.in/api/users'
    And request {"name": "morpheus","job": "leader"}
    When method post
    * def expected = responseStatus == 201 ? {"name": "morpheus","job": "leader","id": '#notnull',"createdAt": '#notnull'} : { bar: '#number' }
    * match response == expected
