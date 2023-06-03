Feature: Json server crud test

  Background: api end point url
    * url 'http://localhost:3000/posts'

  Scenario: create a new post
    #Given url 'http://localhost:3000/posts'
    Given request {"title": "json-server","author": "typicode"}
    When method post
    Then status 201
    Then match $ == {title: "json-server",author: "typicode",id: #notnull}
    Then match response == {"title": "json-server","author": "typicode","id": #ignore}
    Then match response $ == {"title": "json-server","author": "typicode","id": #notnull}
    Then assert responseTime < 100

  Scenario: get created post details
    # Hitting post request
    #Given url 'http://localhost:3000/posts'
    Given request {"title": "json-server","author": "typicode"}
    When method post
    Then status 201
    # Printing response of post request
    And print 'response is:', response
    # Defining variable postId and storing value of id from response in it
    And def postId = response.id
    # Hitting get request
    Given url 'http://localhost:3000/posts'
    # using variable postId as path parameter
    And path postId
    When method get
    Then status 200
    # Printing response of get request
    And print 'response is:', response
    Then match $ == {title: "json-server",author: "typicode",id: #notnull}
    Then assert responseTime < 3000

  Scenario: update created post details
    # Hitting post request
    #Given url 'http://localhost:3000/posts'
    Given request {"title": "json-server","author": "typicode"}
    When method post
    Then status 201
    # Printing response of post request
    And print 'response is:', response
    # Defining variable postId and storing value of id from response in it
    And def postId = response.id
    # Hitting put request
    Given url 'http://localhost:3000/posts'
    # using variable postId as path parameter
    And path postId
    # updating post details by passing new json payload
    And request {"title": "json-server new","author": "typicode new"}
    When method put
    Then status 200
    # Printing response of put request
    And print 'response is:', response
    Then match $ == {title: "json-server new",author: "typicode new",id: #notnull}
    Then assert responseTime < 3000

  Scenario: partial update of created post details
    # Hitting post request
    #Given url 'http://localhost:3000/posts'
    Given request {"title": "json-server","author": "typicode"}
    When method post
    Then status 201
    # Printing response of post request
    And print 'response is:', response
    # Defining variable postId and storing value of id from response in it
    And def postId = response.id
    # Hitting patch request
    Given url 'http://localhost:3000/posts'
    # using variable postId as path parameter
    And path postId
    # updating post details by passing payload with partial change
    And request {"title": "json-server new","author": "typicode"}
    When method patch
    Then status 200
    # Printing response of patch request
    And print 'response is:', response
    Then match $ == {title: "json-server new",author: "typicode",id: #notnull}
    Then assert responseTime < 3000

  Scenario: deleting created post details
    # Hitting post request
    #Given url 'http://localhost:3000/posts'
    Given request {"title": "json-server","author": "typicode"}
    When method post
    Then status 201
    # Printing response of post request
    And print 'response is:', response
    # Defining variable postId and storing value of id from response in it
    And def postId = response.id
    # Hitting delete request
    Given url 'http://localhost:3000/posts'
    # using variable postId as path parameter
    And path postId
    # removing created post details using delete method
    When method delete
    Then status 200
    # Printing response of delete request
    And print 'response is:', response
    Then assert responseTime < 3000
