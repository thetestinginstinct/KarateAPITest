Feature: Tags feature

  @smoke @regression
  Scenario: create user using post and inline json payload
    Given url 'https://reqres.in/api'
    And path '/users'
    And request {"name": "morpheus","job": "leader"}
    When method post
    Then status 201
    * match response.name == "morpheus"
    * match response.job == "leader"
    * print 'Tags feature:@smoke @regression, method post'

  @sanity
  Scenario: list single user get request
    Given url 'https://reqres.in/api'
    And path '/users/2'
    When method get
    Then status 200
    * match response == {"data":{"id":2,"email":"janet.weaver@reqres.in","first_name":"Janet","last_name":"Weaver","avatar":"https://reqres.in/img/faces/2-image.jpg"},"support":{"url":"https://reqres.in/#support-heading","text":"To keep ReqRes free, contributions towards server costs are appreciated!"}}
    * print 'Tags feature:@sanity, method get'

  @regression
  Scenario: update user using put and inline json payload
    Given url 'https://reqres.in/api'
    And path '/users/2'
    And request {"name": "steve","job": "zion resident"}
    When method put
    Then status 200
    * match response.name == "steve"
    * match response.job == "zion resident"
    * print 'Tags feature:@regression, method put'

  @regression
  Scenario: delete user using delete http method
    Given url 'https://reqres.in/api'
    And path '/users/2'
    When method delete
    Then status 204
    * print 'Tags feature:@regression, method delete'
